.class public final Lokio/e;
.super Ljava/lang/Object;
.source "Buffer.kt"

# interfaces
.implements Lokio/g;
.implements Lokio/f;
.implements Ljava/lang/Cloneable;
.implements Ljava/nio/channels/ByteChannel;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lokio/e$a;
    }
.end annotation


# instance fields
.field public g:Lokio/w;

.field private h:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final A(J)B
    .locals 6

    .line 1
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v4, 0x1

    .line 6
    .line 7
    move-wide v2, p1

    .line 8
    invoke-static/range {v0 .. v5}, Lokio/b;->b(JJJ)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lokio/e;->g:Lokio/w;

    .line 12
    .line 13
    if-eqz p1, :cond_3

    .line 14
    .line 15
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    sub-long/2addr v0, v2

    .line 20
    cmp-long p2, v0, v2

    .line 21
    .line 22
    if-gez p2, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 25
    .line 26
    .line 27
    move-result-wide v0

    .line 28
    :goto_0
    cmp-long p0, v0, v2

    .line 29
    .line 30
    if-lez p0, :cond_0

    .line 31
    .line 32
    iget-object p1, p1, Lokio/w;->g:Lokio/w;

    .line 33
    .line 34
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    iget p0, p1, Lokio/w;->c:I

    .line 38
    .line 39
    iget p2, p1, Lokio/w;->b:I

    .line 40
    .line 41
    sub-int/2addr p0, p2

    .line 42
    int-to-long v4, p0

    .line 43
    sub-long/2addr v0, v4

    .line 44
    goto :goto_0

    .line 45
    :cond_0
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p1, Lokio/w;->a:[B

    .line 49
    .line 50
    iget p1, p1, Lokio/w;->b:I

    .line 51
    .line 52
    int-to-long p1, p1

    .line 53
    add-long/2addr p1, v2

    .line 54
    sub-long/2addr p1, v0

    .line 55
    long-to-int p1, p1

    .line 56
    aget-byte p0, p0, p1

    .line 57
    .line 58
    return p0

    .line 59
    :cond_1
    const-wide/16 v0, 0x0

    .line 60
    .line 61
    :goto_1
    iget p0, p1, Lokio/w;->c:I

    .line 62
    .line 63
    iget p2, p1, Lokio/w;->b:I

    .line 64
    .line 65
    sub-int/2addr p0, p2

    .line 66
    int-to-long v4, p0

    .line 67
    add-long/2addr v4, v0

    .line 68
    cmp-long p0, v4, v2

    .line 69
    .line 70
    if-gtz p0, :cond_2

    .line 71
    .line 72
    iget-object p1, p1, Lokio/w;->f:Lokio/w;

    .line 73
    .line 74
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    move-wide v0, v4

    .line 78
    goto :goto_1

    .line 79
    :cond_2
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    iget-object p0, p1, Lokio/w;->a:[B

    .line 83
    .line 84
    iget p1, p1, Lokio/w;->b:I

    .line 85
    .line 86
    int-to-long p1, p1

    .line 87
    add-long/2addr p1, v2

    .line 88
    sub-long/2addr p1, v0

    .line 89
    long-to-int p1, p1

    .line 90
    aget-byte p0, p0, p1

    .line 91
    .line 92
    return p0

    .line 93
    :cond_3
    const/4 p0, 0x0

    .line 94
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    throw p0
.end method

.method public B(BJJ)J
    .locals 9

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v2, v0, p2

    .line 4
    .line 5
    if-gtz v2, :cond_c

    .line 6
    .line 7
    cmp-long v2, p2, p4

    .line 8
    .line 9
    if-gtz v2, :cond_c

    .line 10
    .line 11
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 12
    .line 13
    .line 14
    move-result-wide v2

    .line 15
    cmp-long v2, p4, v2

    .line 16
    .line 17
    if-lez v2, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 20
    .line 21
    .line 22
    move-result-wide p4

    .line 23
    :cond_0
    cmp-long v2, p2, p4

    .line 24
    .line 25
    const-wide/16 v3, -0x1

    .line 26
    .line 27
    if-nez v2, :cond_1

    .line 28
    .line 29
    return-wide v3

    .line 30
    :cond_1
    iget-object v2, p0, Lokio/e;->g:Lokio/w;

    .line 31
    .line 32
    if-nez v2, :cond_2

    .line 33
    .line 34
    return-wide v3

    .line 35
    :cond_2
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 36
    .line 37
    .line 38
    move-result-wide v5

    .line 39
    sub-long/2addr v5, p2

    .line 40
    cmp-long v5, v5, p2

    .line 41
    .line 42
    if-gez v5, :cond_7

    .line 43
    .line 44
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 45
    .line 46
    .line 47
    move-result-wide v0

    .line 48
    :goto_0
    cmp-long p0, v0, p2

    .line 49
    .line 50
    if-lez p0, :cond_3

    .line 51
    .line 52
    iget-object v2, v2, Lokio/w;->g:Lokio/w;

    .line 53
    .line 54
    invoke-static {v2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    iget p0, v2, Lokio/w;->c:I

    .line 58
    .line 59
    iget v5, v2, Lokio/w;->b:I

    .line 60
    .line 61
    sub-int/2addr p0, v5

    .line 62
    int-to-long v5, p0

    .line 63
    sub-long/2addr v0, v5

    .line 64
    goto :goto_0

    .line 65
    :cond_3
    :goto_1
    cmp-long p0, v0, p4

    .line 66
    .line 67
    if-gez p0, :cond_6

    .line 68
    .line 69
    iget-object p0, v2, Lokio/w;->a:[B

    .line 70
    .line 71
    iget v5, v2, Lokio/w;->c:I

    .line 72
    .line 73
    int-to-long v5, v5

    .line 74
    iget v7, v2, Lokio/w;->b:I

    .line 75
    .line 76
    int-to-long v7, v7

    .line 77
    add-long/2addr v7, p4

    .line 78
    sub-long/2addr v7, v0

    .line 79
    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->min(JJ)J

    .line 80
    .line 81
    .line 82
    move-result-wide v5

    .line 83
    long-to-int v5, v5

    .line 84
    iget v6, v2, Lokio/w;->b:I

    .line 85
    .line 86
    int-to-long v6, v6

    .line 87
    add-long/2addr v6, p2

    .line 88
    sub-long/2addr v6, v0

    .line 89
    long-to-int p2, v6

    .line 90
    :goto_2
    if-ge p2, v5, :cond_5

    .line 91
    .line 92
    aget-byte p3, p0, p2

    .line 93
    .line 94
    if-ne p3, p1, :cond_4

    .line 95
    .line 96
    :goto_3
    iget p0, v2, Lokio/w;->b:I

    .line 97
    .line 98
    sub-int/2addr p2, p0

    .line 99
    int-to-long p0, p2

    .line 100
    add-long/2addr p0, v0

    .line 101
    return-wide p0

    .line 102
    :cond_4
    add-int/lit8 p2, p2, 0x1

    .line 103
    .line 104
    goto :goto_2

    .line 105
    :cond_5
    iget p0, v2, Lokio/w;->c:I

    .line 106
    .line 107
    iget p2, v2, Lokio/w;->b:I

    .line 108
    .line 109
    sub-int/2addr p0, p2

    .line 110
    int-to-long p2, p0

    .line 111
    add-long/2addr v0, p2

    .line 112
    iget-object v2, v2, Lokio/w;->f:Lokio/w;

    .line 113
    .line 114
    invoke-static {v2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 115
    .line 116
    .line 117
    move-wide p2, v0

    .line 118
    goto :goto_1

    .line 119
    :cond_6
    return-wide v3

    .line 120
    :cond_7
    :goto_4
    iget p0, v2, Lokio/w;->c:I

    .line 121
    .line 122
    iget v5, v2, Lokio/w;->b:I

    .line 123
    .line 124
    sub-int/2addr p0, v5

    .line 125
    int-to-long v5, p0

    .line 126
    add-long/2addr v5, v0

    .line 127
    cmp-long p0, v5, p2

    .line 128
    .line 129
    if-gtz p0, :cond_8

    .line 130
    .line 131
    iget-object v2, v2, Lokio/w;->f:Lokio/w;

    .line 132
    .line 133
    invoke-static {v2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 134
    .line 135
    .line 136
    move-wide v0, v5

    .line 137
    goto :goto_4

    .line 138
    :cond_8
    :goto_5
    cmp-long p0, v0, p4

    .line 139
    .line 140
    if-gez p0, :cond_b

    .line 141
    .line 142
    iget-object p0, v2, Lokio/w;->a:[B

    .line 143
    .line 144
    iget v5, v2, Lokio/w;->c:I

    .line 145
    .line 146
    int-to-long v5, v5

    .line 147
    iget v7, v2, Lokio/w;->b:I

    .line 148
    .line 149
    int-to-long v7, v7

    .line 150
    add-long/2addr v7, p4

    .line 151
    sub-long/2addr v7, v0

    .line 152
    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->min(JJ)J

    .line 153
    .line 154
    .line 155
    move-result-wide v5

    .line 156
    long-to-int v5, v5

    .line 157
    iget v6, v2, Lokio/w;->b:I

    .line 158
    .line 159
    int-to-long v6, v6

    .line 160
    add-long/2addr v6, p2

    .line 161
    sub-long/2addr v6, v0

    .line 162
    long-to-int p2, v6

    .line 163
    :goto_6
    if-ge p2, v5, :cond_a

    .line 164
    .line 165
    aget-byte p3, p0, p2

    .line 166
    .line 167
    if-ne p3, p1, :cond_9

    .line 168
    .line 169
    goto :goto_3

    .line 170
    :cond_9
    add-int/lit8 p2, p2, 0x1

    .line 171
    .line 172
    goto :goto_6

    .line 173
    :cond_a
    iget p0, v2, Lokio/w;->c:I

    .line 174
    .line 175
    iget p2, v2, Lokio/w;->b:I

    .line 176
    .line 177
    sub-int/2addr p0, p2

    .line 178
    int-to-long p2, p0

    .line 179
    add-long/2addr v0, p2

    .line 180
    iget-object v2, v2, Lokio/w;->f:Lokio/w;

    .line 181
    .line 182
    invoke-static {v2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 183
    .line 184
    .line 185
    move-wide p2, v0

    .line 186
    goto :goto_5

    .line 187
    :cond_b
    return-wide v3

    .line 188
    :cond_c
    new-instance p1, Ljava/lang/StringBuilder;

    .line 189
    .line 190
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 191
    .line 192
    .line 193
    const-string v0, "size="

    .line 194
    .line 195
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 199
    .line 200
    .line 201
    move-result-wide v0

    .line 202
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    const-string p0, " fromIndex="

    .line 206
    .line 207
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 208
    .line 209
    .line 210
    invoke-virtual {p1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    const-string p0, " toIndex="

    .line 214
    .line 215
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    invoke-virtual {p1, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object p0

    .line 225
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 226
    .line 227
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object p0

    .line 231
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 232
    .line 233
    .line 234
    throw p1
.end method

.method public C(Lokio/h;J)J
    .locals 20
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    move-wide/from16 v0, p2

    .line 2
    .line 3
    const-string v2, "bytes"

    .line 4
    .line 5
    move-object/from16 v3, p1

    .line 6
    .line 7
    invoke-static {v3, v2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v3}, Lokio/h;->z()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-lez v2, :cond_c

    .line 15
    .line 16
    const-wide/16 v4, 0x0

    .line 17
    .line 18
    cmp-long v2, v0, v4

    .line 19
    .line 20
    if-ltz v2, :cond_b

    .line 21
    .line 22
    move-object/from16 v2, p0

    .line 23
    .line 24
    iget-object v6, v2, Lokio/e;->g:Lokio/w;

    .line 25
    .line 26
    const-wide/16 v7, -0x1

    .line 27
    .line 28
    if-nez v6, :cond_0

    .line 29
    .line 30
    return-wide v7

    .line 31
    :cond_0
    invoke-virtual {v2}, Lokio/e;->size()J

    .line 32
    .line 33
    .line 34
    move-result-wide v9

    .line 35
    sub-long/2addr v9, v0

    .line 36
    cmp-long v9, v9, v0

    .line 37
    .line 38
    const-wide/16 v10, 0x1

    .line 39
    .line 40
    const/4 v12, 0x0

    .line 41
    const/4 v13, 0x1

    .line 42
    if-gez v9, :cond_5

    .line 43
    .line 44
    invoke-virtual {v2}, Lokio/e;->size()J

    .line 45
    .line 46
    .line 47
    move-result-wide v4

    .line 48
    :goto_0
    cmp-long v9, v4, v0

    .line 49
    .line 50
    if-lez v9, :cond_1

    .line 51
    .line 52
    iget-object v6, v6, Lokio/w;->g:Lokio/w;

    .line 53
    .line 54
    invoke-static {v6}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    iget v9, v6, Lokio/w;->c:I

    .line 58
    .line 59
    iget v14, v6, Lokio/w;->b:I

    .line 60
    .line 61
    sub-int/2addr v9, v14

    .line 62
    int-to-long v14, v9

    .line 63
    sub-long/2addr v4, v14

    .line 64
    goto :goto_0

    .line 65
    :cond_1
    invoke-virtual {v3}, Lokio/h;->o()[B

    .line 66
    .line 67
    .line 68
    move-result-object v9

    .line 69
    aget-byte v12, v9, v12

    .line 70
    .line 71
    invoke-virtual {v3}, Lokio/h;->z()I

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    invoke-virtual {v2}, Lokio/e;->size()J

    .line 76
    .line 77
    .line 78
    move-result-wide v14

    .line 79
    move-wide/from16 v16, v7

    .line 80
    .line 81
    int-to-long v7, v3

    .line 82
    sub-long/2addr v14, v7

    .line 83
    add-long/2addr v14, v10

    .line 84
    :goto_1
    cmp-long v2, v4, v14

    .line 85
    .line 86
    if-gez v2, :cond_4

    .line 87
    .line 88
    iget-object v2, v6, Lokio/w;->a:[B

    .line 89
    .line 90
    iget v7, v6, Lokio/w;->c:I

    .line 91
    .line 92
    iget v8, v6, Lokio/w;->b:I

    .line 93
    .line 94
    int-to-long v10, v8

    .line 95
    add-long/2addr v10, v14

    .line 96
    sub-long/2addr v10, v4

    .line 97
    int-to-long v7, v7

    .line 98
    invoke-static {v7, v8, v10, v11}, Ljava/lang/Math;->min(JJ)J

    .line 99
    .line 100
    .line 101
    move-result-wide v7

    .line 102
    long-to-int v7, v7

    .line 103
    iget v8, v6, Lokio/w;->b:I

    .line 104
    .line 105
    int-to-long v10, v8

    .line 106
    add-long/2addr v10, v0

    .line 107
    sub-long/2addr v10, v4

    .line 108
    long-to-int v0, v10

    .line 109
    :goto_2
    if-ge v0, v7, :cond_3

    .line 110
    .line 111
    aget-byte v1, v2, v0

    .line 112
    .line 113
    if-ne v1, v12, :cond_2

    .line 114
    .line 115
    add-int/lit8 v1, v0, 0x1

    .line 116
    .line 117
    invoke-static {v6, v1, v9, v13, v3}, LP4/a;->c(Lokio/w;I[BII)Z

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    if-eqz v1, :cond_2

    .line 122
    .line 123
    :goto_3
    iget v1, v6, Lokio/w;->b:I

    .line 124
    .line 125
    sub-int/2addr v0, v1

    .line 126
    int-to-long v0, v0

    .line 127
    add-long/2addr v0, v4

    .line 128
    return-wide v0

    .line 129
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 130
    .line 131
    goto :goto_2

    .line 132
    :cond_3
    iget v0, v6, Lokio/w;->c:I

    .line 133
    .line 134
    iget v1, v6, Lokio/w;->b:I

    .line 135
    .line 136
    sub-int/2addr v0, v1

    .line 137
    int-to-long v0, v0

    .line 138
    add-long/2addr v4, v0

    .line 139
    iget-object v6, v6, Lokio/w;->f:Lokio/w;

    .line 140
    .line 141
    invoke-static {v6}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 142
    .line 143
    .line 144
    move-wide v0, v4

    .line 145
    goto :goto_1

    .line 146
    :cond_4
    return-wide v16

    .line 147
    :cond_5
    move-wide/from16 v16, v7

    .line 148
    .line 149
    :goto_4
    iget v7, v6, Lokio/w;->c:I

    .line 150
    .line 151
    iget v8, v6, Lokio/w;->b:I

    .line 152
    .line 153
    sub-int/2addr v7, v8

    .line 154
    int-to-long v7, v7

    .line 155
    add-long/2addr v7, v4

    .line 156
    cmp-long v9, v7, v0

    .line 157
    .line 158
    if-gtz v9, :cond_6

    .line 159
    .line 160
    iget-object v6, v6, Lokio/w;->f:Lokio/w;

    .line 161
    .line 162
    invoke-static {v6}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 163
    .line 164
    .line 165
    move-wide v4, v7

    .line 166
    goto :goto_4

    .line 167
    :cond_6
    invoke-virtual {v3}, Lokio/h;->o()[B

    .line 168
    .line 169
    .line 170
    move-result-object v7

    .line 171
    aget-byte v8, v7, v12

    .line 172
    .line 173
    invoke-virtual {v3}, Lokio/h;->z()I

    .line 174
    .line 175
    .line 176
    move-result v3

    .line 177
    invoke-virtual {v2}, Lokio/e;->size()J

    .line 178
    .line 179
    .line 180
    move-result-wide v14

    .line 181
    move-wide/from16 v18, v10

    .line 182
    .line 183
    int-to-long v10, v3

    .line 184
    sub-long/2addr v14, v10

    .line 185
    add-long v14, v14, v18

    .line 186
    .line 187
    :goto_5
    cmp-long v2, v4, v14

    .line 188
    .line 189
    if-gez v2, :cond_a

    .line 190
    .line 191
    iget-object v2, v6, Lokio/w;->a:[B

    .line 192
    .line 193
    iget v9, v6, Lokio/w;->c:I

    .line 194
    .line 195
    iget v10, v6, Lokio/w;->b:I

    .line 196
    .line 197
    int-to-long v10, v10

    .line 198
    add-long/2addr v10, v14

    .line 199
    sub-long/2addr v10, v4

    .line 200
    move-wide/from16 p0, v14

    .line 201
    .line 202
    int-to-long v13, v9

    .line 203
    invoke-static {v13, v14, v10, v11}, Ljava/lang/Math;->min(JJ)J

    .line 204
    .line 205
    .line 206
    move-result-wide v9

    .line 207
    long-to-int v9, v9

    .line 208
    iget v10, v6, Lokio/w;->b:I

    .line 209
    .line 210
    int-to-long v10, v10

    .line 211
    add-long/2addr v10, v0

    .line 212
    sub-long/2addr v10, v4

    .line 213
    long-to-int v0, v10

    .line 214
    :goto_6
    if-ge v0, v9, :cond_9

    .line 215
    .line 216
    aget-byte v1, v2, v0

    .line 217
    .line 218
    if-ne v1, v8, :cond_7

    .line 219
    .line 220
    add-int/lit8 v1, v0, 0x1

    .line 221
    .line 222
    const/4 v12, 0x1

    .line 223
    invoke-static {v6, v1, v7, v12, v3}, LP4/a;->c(Lokio/w;I[BII)Z

    .line 224
    .line 225
    .line 226
    move-result v1

    .line 227
    if-eqz v1, :cond_8

    .line 228
    .line 229
    goto :goto_3

    .line 230
    :cond_7
    const/4 v12, 0x1

    .line 231
    :cond_8
    add-int/lit8 v0, v0, 0x1

    .line 232
    .line 233
    goto :goto_6

    .line 234
    :cond_9
    const/4 v12, 0x1

    .line 235
    iget v0, v6, Lokio/w;->c:I

    .line 236
    .line 237
    iget v1, v6, Lokio/w;->b:I

    .line 238
    .line 239
    sub-int/2addr v0, v1

    .line 240
    int-to-long v0, v0

    .line 241
    add-long/2addr v4, v0

    .line 242
    iget-object v6, v6, Lokio/w;->f:Lokio/w;

    .line 243
    .line 244
    invoke-static {v6}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 245
    .line 246
    .line 247
    move-wide/from16 v14, p0

    .line 248
    .line 249
    move-wide v0, v4

    .line 250
    move v13, v12

    .line 251
    goto :goto_5

    .line 252
    :cond_a
    return-wide v16

    .line 253
    :cond_b
    new-instance v2, Ljava/lang/StringBuilder;

    .line 254
    .line 255
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 256
    .line 257
    .line 258
    const-string v3, "fromIndex < 0: "

    .line 259
    .line 260
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 261
    .line 262
    .line 263
    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 264
    .line 265
    .line 266
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object v0

    .line 270
    new-instance v1, Ljava/lang/IllegalArgumentException;

    .line 271
    .line 272
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object v0

    .line 276
    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 277
    .line 278
    .line 279
    throw v1

    .line 280
    :cond_c
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 281
    .line 282
    const-string v1, "bytes is empty"

    .line 283
    .line 284
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 285
    .line 286
    .line 287
    throw v0
.end method

.method public D(Lokio/h;J)J
    .locals 11

    .line 1
    const-string v0, "targetBytes"

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
    if-ltz v2, :cond_13

    .line 11
    .line 12
    iget-object v2, p0, Lokio/e;->g:Lokio/w;

    .line 13
    .line 14
    const-wide/16 v3, -0x1

    .line 15
    .line 16
    if-nez v2, :cond_0

    .line 17
    .line 18
    return-wide v3

    .line 19
    :cond_0
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 20
    .line 21
    .line 22
    move-result-wide v5

    .line 23
    sub-long/2addr v5, p2

    .line 24
    cmp-long v5, v5, p2

    .line 25
    .line 26
    const/4 v6, 0x2

    .line 27
    const/4 v7, 0x0

    .line 28
    const/4 v8, 0x1

    .line 29
    if-gez v5, :cond_a

    .line 30
    .line 31
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 32
    .line 33
    .line 34
    move-result-wide v0

    .line 35
    :goto_0
    cmp-long v5, v0, p2

    .line 36
    .line 37
    if-lez v5, :cond_1

    .line 38
    .line 39
    iget-object v2, v2, Lokio/w;->g:Lokio/w;

    .line 40
    .line 41
    invoke-static {v2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    iget v5, v2, Lokio/w;->c:I

    .line 45
    .line 46
    iget v9, v2, Lokio/w;->b:I

    .line 47
    .line 48
    sub-int/2addr v5, v9

    .line 49
    int-to-long v9, v5

    .line 50
    sub-long/2addr v0, v9

    .line 51
    goto :goto_0

    .line 52
    :cond_1
    invoke-virtual {p1}, Lokio/h;->z()I

    .line 53
    .line 54
    .line 55
    move-result v5

    .line 56
    if-ne v5, v6, :cond_5

    .line 57
    .line 58
    invoke-virtual {p1, v7}, Lokio/h;->g(I)B

    .line 59
    .line 60
    .line 61
    move-result v5

    .line 62
    invoke-virtual {p1, v8}, Lokio/h;->g(I)B

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    :goto_1
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 67
    .line 68
    .line 69
    move-result-wide v6

    .line 70
    cmp-long v6, v0, v6

    .line 71
    .line 72
    if-gez v6, :cond_9

    .line 73
    .line 74
    iget-object v6, v2, Lokio/w;->a:[B

    .line 75
    .line 76
    iget v7, v2, Lokio/w;->b:I

    .line 77
    .line 78
    int-to-long v7, v7

    .line 79
    add-long/2addr v7, p2

    .line 80
    sub-long/2addr v7, v0

    .line 81
    long-to-int p2, v7

    .line 82
    iget p3, v2, Lokio/w;->c:I

    .line 83
    .line 84
    :goto_2
    if-ge p2, p3, :cond_4

    .line 85
    .line 86
    aget-byte v7, v6, p2

    .line 87
    .line 88
    if-eq v7, v5, :cond_3

    .line 89
    .line 90
    if-ne v7, p1, :cond_2

    .line 91
    .line 92
    goto :goto_3

    .line 93
    :cond_2
    add-int/lit8 p2, p2, 0x1

    .line 94
    .line 95
    goto :goto_2

    .line 96
    :cond_3
    :goto_3
    iget p0, v2, Lokio/w;->b:I

    .line 97
    .line 98
    :goto_4
    sub-int/2addr p2, p0

    .line 99
    int-to-long p0, p2

    .line 100
    add-long/2addr p0, v0

    .line 101
    return-wide p0

    .line 102
    :cond_4
    iget p2, v2, Lokio/w;->c:I

    .line 103
    .line 104
    iget p3, v2, Lokio/w;->b:I

    .line 105
    .line 106
    sub-int/2addr p2, p3

    .line 107
    int-to-long p2, p2

    .line 108
    add-long/2addr v0, p2

    .line 109
    iget-object v2, v2, Lokio/w;->f:Lokio/w;

    .line 110
    .line 111
    invoke-static {v2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 112
    .line 113
    .line 114
    move-wide p2, v0

    .line 115
    goto :goto_1

    .line 116
    :cond_5
    invoke-virtual {p1}, Lokio/h;->o()[B

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    :goto_5
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 121
    .line 122
    .line 123
    move-result-wide v5

    .line 124
    cmp-long v5, v0, v5

    .line 125
    .line 126
    if-gez v5, :cond_9

    .line 127
    .line 128
    iget-object v5, v2, Lokio/w;->a:[B

    .line 129
    .line 130
    iget v6, v2, Lokio/w;->b:I

    .line 131
    .line 132
    int-to-long v8, v6

    .line 133
    add-long/2addr v8, p2

    .line 134
    sub-long/2addr v8, v0

    .line 135
    long-to-int p2, v8

    .line 136
    iget p3, v2, Lokio/w;->c:I

    .line 137
    .line 138
    :goto_6
    if-ge p2, p3, :cond_8

    .line 139
    .line 140
    aget-byte v6, v5, p2

    .line 141
    .line 142
    array-length v8, p1

    .line 143
    move v9, v7

    .line 144
    :goto_7
    if-ge v9, v8, :cond_7

    .line 145
    .line 146
    aget-byte v10, p1, v9

    .line 147
    .line 148
    if-ne v6, v10, :cond_6

    .line 149
    .line 150
    :goto_8
    iget p0, v2, Lokio/w;->b:I

    .line 151
    .line 152
    goto :goto_4

    .line 153
    :cond_6
    add-int/lit8 v9, v9, 0x1

    .line 154
    .line 155
    goto :goto_7

    .line 156
    :cond_7
    add-int/lit8 p2, p2, 0x1

    .line 157
    .line 158
    goto :goto_6

    .line 159
    :cond_8
    iget p2, v2, Lokio/w;->c:I

    .line 160
    .line 161
    iget p3, v2, Lokio/w;->b:I

    .line 162
    .line 163
    sub-int/2addr p2, p3

    .line 164
    int-to-long p2, p2

    .line 165
    add-long/2addr v0, p2

    .line 166
    iget-object v2, v2, Lokio/w;->f:Lokio/w;

    .line 167
    .line 168
    invoke-static {v2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 169
    .line 170
    .line 171
    move-wide p2, v0

    .line 172
    goto :goto_5

    .line 173
    :cond_9
    return-wide v3

    .line 174
    :cond_a
    :goto_9
    iget v5, v2, Lokio/w;->c:I

    .line 175
    .line 176
    iget v9, v2, Lokio/w;->b:I

    .line 177
    .line 178
    sub-int/2addr v5, v9

    .line 179
    int-to-long v9, v5

    .line 180
    add-long/2addr v9, v0

    .line 181
    cmp-long v5, v9, p2

    .line 182
    .line 183
    if-gtz v5, :cond_b

    .line 184
    .line 185
    iget-object v2, v2, Lokio/w;->f:Lokio/w;

    .line 186
    .line 187
    invoke-static {v2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 188
    .line 189
    .line 190
    move-wide v0, v9

    .line 191
    goto :goto_9

    .line 192
    :cond_b
    invoke-virtual {p1}, Lokio/h;->z()I

    .line 193
    .line 194
    .line 195
    move-result v5

    .line 196
    if-ne v5, v6, :cond_e

    .line 197
    .line 198
    invoke-virtual {p1, v7}, Lokio/h;->g(I)B

    .line 199
    .line 200
    .line 201
    move-result v5

    .line 202
    invoke-virtual {p1, v8}, Lokio/h;->g(I)B

    .line 203
    .line 204
    .line 205
    move-result p1

    .line 206
    :goto_a
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 207
    .line 208
    .line 209
    move-result-wide v6

    .line 210
    cmp-long v6, v0, v6

    .line 211
    .line 212
    if-gez v6, :cond_12

    .line 213
    .line 214
    iget-object v6, v2, Lokio/w;->a:[B

    .line 215
    .line 216
    iget v7, v2, Lokio/w;->b:I

    .line 217
    .line 218
    int-to-long v7, v7

    .line 219
    add-long/2addr v7, p2

    .line 220
    sub-long/2addr v7, v0

    .line 221
    long-to-int p2, v7

    .line 222
    iget p3, v2, Lokio/w;->c:I

    .line 223
    .line 224
    :goto_b
    if-ge p2, p3, :cond_d

    .line 225
    .line 226
    aget-byte v7, v6, p2

    .line 227
    .line 228
    if-eq v7, v5, :cond_3

    .line 229
    .line 230
    if-ne v7, p1, :cond_c

    .line 231
    .line 232
    goto/16 :goto_3

    .line 233
    .line 234
    :cond_c
    add-int/lit8 p2, p2, 0x1

    .line 235
    .line 236
    goto :goto_b

    .line 237
    :cond_d
    iget p2, v2, Lokio/w;->c:I

    .line 238
    .line 239
    iget p3, v2, Lokio/w;->b:I

    .line 240
    .line 241
    sub-int/2addr p2, p3

    .line 242
    int-to-long p2, p2

    .line 243
    add-long/2addr v0, p2

    .line 244
    iget-object v2, v2, Lokio/w;->f:Lokio/w;

    .line 245
    .line 246
    invoke-static {v2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 247
    .line 248
    .line 249
    move-wide p2, v0

    .line 250
    goto :goto_a

    .line 251
    :cond_e
    invoke-virtual {p1}, Lokio/h;->o()[B

    .line 252
    .line 253
    .line 254
    move-result-object p1

    .line 255
    :goto_c
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 256
    .line 257
    .line 258
    move-result-wide v5

    .line 259
    cmp-long v5, v0, v5

    .line 260
    .line 261
    if-gez v5, :cond_12

    .line 262
    .line 263
    iget-object v5, v2, Lokio/w;->a:[B

    .line 264
    .line 265
    iget v6, v2, Lokio/w;->b:I

    .line 266
    .line 267
    int-to-long v8, v6

    .line 268
    add-long/2addr v8, p2

    .line 269
    sub-long/2addr v8, v0

    .line 270
    long-to-int p2, v8

    .line 271
    iget p3, v2, Lokio/w;->c:I

    .line 272
    .line 273
    :goto_d
    if-ge p2, p3, :cond_11

    .line 274
    .line 275
    aget-byte v6, v5, p2

    .line 276
    .line 277
    array-length v8, p1

    .line 278
    move v9, v7

    .line 279
    :goto_e
    if-ge v9, v8, :cond_10

    .line 280
    .line 281
    aget-byte v10, p1, v9

    .line 282
    .line 283
    if-ne v6, v10, :cond_f

    .line 284
    .line 285
    goto/16 :goto_8

    .line 286
    .line 287
    :cond_f
    add-int/lit8 v9, v9, 0x1

    .line 288
    .line 289
    goto :goto_e

    .line 290
    :cond_10
    add-int/lit8 p2, p2, 0x1

    .line 291
    .line 292
    goto :goto_d

    .line 293
    :cond_11
    iget p2, v2, Lokio/w;->c:I

    .line 294
    .line 295
    iget p3, v2, Lokio/w;->b:I

    .line 296
    .line 297
    sub-int/2addr p2, p3

    .line 298
    int-to-long p2, p2

    .line 299
    add-long/2addr v0, p2

    .line 300
    iget-object v2, v2, Lokio/w;->f:Lokio/w;

    .line 301
    .line 302
    invoke-static {v2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 303
    .line 304
    .line 305
    move-wide p2, v0

    .line 306
    goto :goto_c

    .line 307
    :cond_12
    return-wide v3

    .line 308
    :cond_13
    new-instance p0, Ljava/lang/StringBuilder;

    .line 309
    .line 310
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 311
    .line 312
    .line 313
    const-string p1, "fromIndex < 0: "

    .line 314
    .line 315
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 316
    .line 317
    .line 318
    invoke-virtual {p0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 319
    .line 320
    .line 321
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 322
    .line 323
    .line 324
    move-result-object p0

    .line 325
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 326
    .line 327
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 328
    .line 329
    .line 330
    move-result-object p0

    .line 331
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 332
    .line 333
    .line 334
    throw p1
.end method

.method public E()Ljava/io/OutputStream;
    .locals 1

    .line 1
    new-instance v0, Lokio/e$c;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lokio/e$c;-><init>(Lokio/e;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final F(Lokio/e$a;)Lokio/e$a;
    .locals 1

    .line 1
    const-string v0, "unsafeCursor"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, p1}, LP4/a;->a(Lokio/e;Lokio/e$a;)Lokio/e$a;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public G(J)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-wide v0, p0, Lokio/e;->h:J

    .line 2
    .line 3
    cmp-long p0, v0, p1

    .line 4
    .line 5
    if-ltz p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance p0, Ljava/io/EOFException;

    .line 9
    .line 10
    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    .line 11
    .line 12
    .line 13
    throw p0
.end method

.method public bridge synthetic H(J)Lokio/f;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lokio/e;->h0(J)Lokio/e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public I()Lokio/h;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-virtual {p0, v0, v1}, Lokio/e;->K(J)Lokio/h;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public J()I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lokio/e;->readInt()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Lokio/b;->e(I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public K(J)Lokio/h;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-ltz v0, :cond_2

    .line 6
    .line 7
    const-wide/32 v0, 0x7fffffff

    .line 8
    .line 9
    .line 10
    cmp-long v0, p1, v0

    .line 11
    .line 12
    if-gtz v0, :cond_2

    .line 13
    .line 14
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    cmp-long v0, v0, p1

    .line 19
    .line 20
    if-ltz v0, :cond_1

    .line 21
    .line 22
    const-wide/16 v0, 0x1000

    .line 23
    .line 24
    cmp-long v0, p1, v0

    .line 25
    .line 26
    if-ltz v0, :cond_0

    .line 27
    .line 28
    long-to-int v0, p1

    .line 29
    invoke-virtual {p0, v0}, Lokio/e;->b0(I)Lokio/h;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p0, p1, p2}, Lokio/e;->skip(J)V

    .line 34
    .line 35
    .line 36
    return-object v0

    .line 37
    :cond_0
    new-instance v0, Lokio/h;

    .line 38
    .line 39
    invoke-virtual {p0, p1, p2}, Lokio/e;->y(J)[B

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-direct {v0, p0}, Lokio/h;-><init>([B)V

    .line 44
    .line 45
    .line 46
    return-object v0

    .line 47
    :cond_1
    new-instance p0, Ljava/io/EOFException;

    .line 48
    .line 49
    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    .line 50
    .line 51
    .line 52
    throw p0

    .line 53
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 56
    .line 57
    .line 58
    const-string v0, "byteCount: "

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 71
    .line 72
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    throw p1
.end method

.method public L()S
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lokio/e;->readShort()S

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Lokio/b;->f(S)S

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public M(JLjava/nio/charset/Charset;)Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const-string v0, "charset"

    .line 2
    .line 3
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    cmp-long v0, p1, v0

    .line 9
    .line 10
    if-ltz v0, :cond_4

    .line 11
    .line 12
    const-wide/32 v1, 0x7fffffff

    .line 13
    .line 14
    .line 15
    cmp-long v1, p1, v1

    .line 16
    .line 17
    if-gtz v1, :cond_4

    .line 18
    .line 19
    iget-wide v1, p0, Lokio/e;->h:J

    .line 20
    .line 21
    cmp-long v1, v1, p1

    .line 22
    .line 23
    if-ltz v1, :cond_3

    .line 24
    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    const-string p0, ""

    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_0
    iget-object v0, p0, Lokio/e;->g:Lokio/w;

    .line 31
    .line 32
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    iget v1, v0, Lokio/w;->b:I

    .line 36
    .line 37
    int-to-long v1, v1

    .line 38
    add-long/2addr v1, p1

    .line 39
    iget v3, v0, Lokio/w;->c:I

    .line 40
    .line 41
    int-to-long v3, v3

    .line 42
    cmp-long v1, v1, v3

    .line 43
    .line 44
    if-lez v1, :cond_1

    .line 45
    .line 46
    new-instance v0, Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {p0, p1, p2}, Lokio/e;->y(J)[B

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-direct {v0, p0, p3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 53
    .line 54
    .line 55
    return-object v0

    .line 56
    :cond_1
    new-instance v1, Ljava/lang/String;

    .line 57
    .line 58
    iget-object v2, v0, Lokio/w;->a:[B

    .line 59
    .line 60
    iget v3, v0, Lokio/w;->b:I

    .line 61
    .line 62
    long-to-int v4, p1

    .line 63
    invoke-direct {v1, v2, v3, v4, p3}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 64
    .line 65
    .line 66
    iget p3, v0, Lokio/w;->b:I

    .line 67
    .line 68
    add-int/2addr p3, v4

    .line 69
    iput p3, v0, Lokio/w;->b:I

    .line 70
    .line 71
    iget-wide v2, p0, Lokio/e;->h:J

    .line 72
    .line 73
    sub-long/2addr v2, p1

    .line 74
    iput-wide v2, p0, Lokio/e;->h:J

    .line 75
    .line 76
    iget p1, v0, Lokio/w;->c:I

    .line 77
    .line 78
    if-ne p3, p1, :cond_2

    .line 79
    .line 80
    invoke-virtual {v0}, Lokio/w;->b()Lokio/w;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    iput-object p1, p0, Lokio/e;->g:Lokio/w;

    .line 85
    .line 86
    invoke-static {v0}, Lokio/x;->b(Lokio/w;)V

    .line 87
    .line 88
    .line 89
    :cond_2
    return-object v1

    .line 90
    :cond_3
    new-instance p0, Ljava/io/EOFException;

    .line 91
    .line 92
    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    .line 93
    .line 94
    .line 95
    throw p0

    .line 96
    :cond_4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 99
    .line 100
    .line 101
    const-string p3, "byteCount: "

    .line 102
    .line 103
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 114
    .line 115
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    throw p1
.end method

.method public N()[B
    .locals 2

    .line 1
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-virtual {p0, v0, v1}, Lokio/e;->y(J)[B

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public O()Z
    .locals 4

    .line 1
    iget-wide v0, p0, Lokio/e;->h:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public P()Ljava/lang/String;
    .locals 3

    .line 1
    iget-wide v0, p0, Lokio/e;->h:J

    .line 2
    .line 3
    sget-object v2, LD4/d;->b:Ljava/nio/charset/Charset;

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1, v2}, Lokio/e;->M(JLjava/nio/charset/Charset;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public R(Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 2

    .line 1
    const-string v0, "charset"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-wide v0, p0, Lokio/e;->h:J

    .line 7
    .line 8
    invoke-virtual {p0, v0, v1, p1}, Lokio/e;->M(JLjava/nio/charset/Charset;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public bridge synthetic S(J)Lokio/f;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lokio/e;->i0(J)Lokio/e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public T(J)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    sget-object v0, LD4/d;->b:Ljava/nio/charset/Charset;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, v0}, Lokio/e;->M(JLjava/nio/charset/Charset;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final U(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lokio/e;->h:J

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic V(Lokio/h;)Lokio/f;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lokio/e;->d0(Lokio/h;)Lokio/e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public W(Lokio/z;)J
    .locals 4
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
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    const-wide/16 v2, 0x0

    .line 11
    .line 12
    cmp-long v2, v0, v2

    .line 13
    .line 14
    if-lez v2, :cond_0

    .line 15
    .line 16
    invoke-interface {p1, p0, v0, v1}, Lokio/z;->write(Lokio/e;J)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-wide v0
.end method

.method public X()J
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-eqz v0, :cond_9

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    move v1, v0

    .line 13
    move-wide v4, v2

    .line 14
    :cond_0
    iget-object v6, p0, Lokio/e;->g:Lokio/w;

    .line 15
    .line 16
    invoke-static {v6}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    iget-object v7, v6, Lokio/w;->a:[B

    .line 20
    .line 21
    iget v8, v6, Lokio/w;->b:I

    .line 22
    .line 23
    iget v9, v6, Lokio/w;->c:I

    .line 24
    .line 25
    :goto_0
    if-ge v8, v9, :cond_6

    .line 26
    .line 27
    aget-byte v10, v7, v8

    .line 28
    .line 29
    const/16 v11, 0x30

    .line 30
    .line 31
    if-lt v10, v11, :cond_1

    .line 32
    .line 33
    const/16 v11, 0x39

    .line 34
    .line 35
    if-gt v10, v11, :cond_1

    .line 36
    .line 37
    add-int/lit8 v11, v10, -0x30

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    const/16 v11, 0x61

    .line 41
    .line 42
    if-lt v10, v11, :cond_2

    .line 43
    .line 44
    const/16 v11, 0x66

    .line 45
    .line 46
    if-gt v10, v11, :cond_2

    .line 47
    .line 48
    add-int/lit8 v11, v10, -0x57

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_2
    const/16 v11, 0x41

    .line 52
    .line 53
    if-lt v10, v11, :cond_4

    .line 54
    .line 55
    const/16 v11, 0x46

    .line 56
    .line 57
    if-gt v10, v11, :cond_4

    .line 58
    .line 59
    add-int/lit8 v11, v10, -0x37

    .line 60
    .line 61
    :goto_1
    const-wide/high16 v12, -0x1000000000000000L    # -3.105036184601418E231

    .line 62
    .line 63
    and-long/2addr v12, v4

    .line 64
    cmp-long v12, v12, v2

    .line 65
    .line 66
    if-nez v12, :cond_3

    .line 67
    .line 68
    const/4 v10, 0x4

    .line 69
    shl-long/2addr v4, v10

    .line 70
    int-to-long v10, v11

    .line 71
    or-long/2addr v4, v10

    .line 72
    add-int/lit8 v8, v8, 0x1

    .line 73
    .line 74
    add-int/lit8 v0, v0, 0x1

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_3
    new-instance p0, Lokio/e;

    .line 78
    .line 79
    invoke-direct {p0}, Lokio/e;-><init>()V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0, v4, v5}, Lokio/e;->i0(J)Lokio/e;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p0, v10}, Lokio/e;->g0(I)Lokio/e;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    new-instance v0, Ljava/lang/NumberFormatException;

    .line 91
    .line 92
    new-instance v1, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 95
    .line 96
    .line 97
    const-string v2, "Number too large: "

    .line 98
    .line 99
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0}, Lokio/e;->P()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-direct {v0, p0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    throw v0

    .line 117
    :cond_4
    if-eqz v0, :cond_5

    .line 118
    .line 119
    const/4 v1, 0x1

    .line 120
    goto :goto_2

    .line 121
    :cond_5
    new-instance p0, Ljava/lang/NumberFormatException;

    .line 122
    .line 123
    new-instance v0, Ljava/lang/StringBuilder;

    .line 124
    .line 125
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 126
    .line 127
    .line 128
    const-string v1, "Expected leading [0-9a-fA-F] character but was 0x"

    .line 129
    .line 130
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-static {v10}, Lokio/b;->g(B)Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    invoke-direct {p0, v0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    throw p0

    .line 148
    :cond_6
    :goto_2
    if-ne v8, v9, :cond_7

    .line 149
    .line 150
    invoke-virtual {v6}, Lokio/w;->b()Lokio/w;

    .line 151
    .line 152
    .line 153
    move-result-object v7

    .line 154
    iput-object v7, p0, Lokio/e;->g:Lokio/w;

    .line 155
    .line 156
    invoke-static {v6}, Lokio/x;->b(Lokio/w;)V

    .line 157
    .line 158
    .line 159
    goto :goto_3

    .line 160
    :cond_7
    iput v8, v6, Lokio/w;->b:I

    .line 161
    .line 162
    :goto_3
    if-nez v1, :cond_8

    .line 163
    .line 164
    iget-object v6, p0, Lokio/e;->g:Lokio/w;

    .line 165
    .line 166
    if-nez v6, :cond_0

    .line 167
    .line 168
    :cond_8
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 169
    .line 170
    .line 171
    move-result-wide v1

    .line 172
    int-to-long v6, v0

    .line 173
    sub-long/2addr v1, v6

    .line 174
    invoke-virtual {p0, v1, v2}, Lokio/e;->U(J)V

    .line 175
    .line 176
    .line 177
    return-wide v4

    .line 178
    :cond_9
    new-instance p0, Ljava/io/EOFException;

    .line 179
    .line 180
    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    .line 181
    .line 182
    .line 183
    throw p0
.end method

.method public Y()Ljava/io/InputStream;
    .locals 1

    .line 1
    new-instance v0, Lokio/e$b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lokio/e$b;-><init>(Lokio/e;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public Z(Lokio/r;)I
    .locals 3

    .line 1
    const-string v0, "options"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-static {p0, p1, v2, v0, v1}, LP4/a;->f(Lokio/e;Lokio/r;ZILjava/lang/Object;)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, -0x1

    .line 14
    if-ne v0, v1, :cond_0

    .line 15
    .line 16
    return v1

    .line 17
    :cond_0
    invoke-virtual {p1}, Lokio/r;->m()[Lokio/h;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    aget-object p1, p1, v0

    .line 22
    .line 23
    invoke-virtual {p1}, Lokio/h;->z()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    int-to-long v1, p1

    .line 28
    invoke-virtual {p0, v1, v2}, Lokio/e;->skip(J)V

    .line 29
    .line 30
    .line 31
    return v0
.end method

.method public a()Lokio/e;
    .locals 0

    .line 1
    return-object p0
.end method

.method public final a0()Lokio/h;
    .locals 4

    .line 1
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/32 v2, 0x7fffffff

    .line 6
    .line 7
    .line 8
    cmp-long v0, v0, v2

    .line 9
    .line 10
    if-gtz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    long-to-int v0, v0

    .line 17
    invoke-virtual {p0, v0}, Lokio/e;->b0(I)Lokio/h;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    const-string v1, "size > Int.MAX_VALUE: "

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 33
    .line 34
    .line 35
    move-result-wide v1

    .line 36
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 44
    .line 45
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    throw v0
.end method

.method public final b()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-virtual {p0, v0, v1}, Lokio/e;->skip(J)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final b0(I)Lokio/h;
    .locals 7

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    sget-object p0, Lokio/h;->k:Lokio/h;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    const-wide/16 v2, 0x0

    .line 11
    .line 12
    int-to-long v4, p1

    .line 13
    invoke-static/range {v0 .. v5}, Lokio/b;->b(JJJ)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lokio/e;->g:Lokio/w;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    move v2, v1

    .line 20
    move v3, v2

    .line 21
    :goto_0
    if-ge v2, p1, :cond_2

    .line 22
    .line 23
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    iget v4, v0, Lokio/w;->c:I

    .line 27
    .line 28
    iget v5, v0, Lokio/w;->b:I

    .line 29
    .line 30
    if-eq v4, v5, :cond_1

    .line 31
    .line 32
    sub-int/2addr v4, v5

    .line 33
    add-int/2addr v2, v4

    .line 34
    add-int/lit8 v3, v3, 0x1

    .line 35
    .line 36
    iget-object v0, v0, Lokio/w;->f:Lokio/w;

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    new-instance p0, Ljava/lang/AssertionError;

    .line 40
    .line 41
    const-string p1, "s.limit == s.pos"

    .line 42
    .line 43
    invoke-direct {p0, p1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    throw p0

    .line 47
    :cond_2
    new-array v0, v3, [[B

    .line 48
    .line 49
    mul-int/lit8 v2, v3, 0x2

    .line 50
    .line 51
    new-array v2, v2, [I

    .line 52
    .line 53
    iget-object p0, p0, Lokio/e;->g:Lokio/w;

    .line 54
    .line 55
    move v4, v1

    .line 56
    :goto_1
    if-ge v1, p1, :cond_3

    .line 57
    .line 58
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    iget-object v5, p0, Lokio/w;->a:[B

    .line 62
    .line 63
    aput-object v5, v0, v4

    .line 64
    .line 65
    iget v5, p0, Lokio/w;->c:I

    .line 66
    .line 67
    iget v6, p0, Lokio/w;->b:I

    .line 68
    .line 69
    sub-int/2addr v5, v6

    .line 70
    add-int/2addr v1, v5

    .line 71
    invoke-static {v1, p1}, Ljava/lang/Math;->min(II)I

    .line 72
    .line 73
    .line 74
    move-result v5

    .line 75
    aput v5, v2, v4

    .line 76
    .line 77
    add-int v5, v4, v3

    .line 78
    .line 79
    iget v6, p0, Lokio/w;->b:I

    .line 80
    .line 81
    aput v6, v2, v5

    .line 82
    .line 83
    const/4 v5, 0x1

    .line 84
    iput-boolean v5, p0, Lokio/w;->d:Z

    .line 85
    .line 86
    add-int/2addr v4, v5

    .line 87
    iget-object p0, p0, Lokio/w;->f:Lokio/w;

    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_3
    new-instance p0, Lokio/y;

    .line 91
    .line 92
    invoke-direct {p0, v0, v2}, Lokio/y;-><init>([[B[I)V

    .line 93
    .line 94
    .line 95
    return-object p0
.end method

.method public c()Lokio/e;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lokio/e;->n()Lokio/e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final c0(I)Lokio/w;
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-lt p1, v0, :cond_3

    .line 3
    .line 4
    const/16 v0, 0x2000

    .line 5
    .line 6
    if-gt p1, v0, :cond_3

    .line 7
    .line 8
    iget-object v1, p0, Lokio/e;->g:Lokio/w;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    invoke-static {}, Lokio/x;->c()Lokio/w;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Lokio/e;->g:Lokio/w;

    .line 17
    .line 18
    iput-object p1, p1, Lokio/w;->g:Lokio/w;

    .line 19
    .line 20
    iput-object p1, p1, Lokio/w;->f:Lokio/w;

    .line 21
    .line 22
    return-object p1

    .line 23
    :cond_0
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, v1, Lokio/w;->g:Lokio/w;

    .line 27
    .line 28
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    iget v1, p0, Lokio/w;->c:I

    .line 32
    .line 33
    add-int/2addr v1, p1

    .line 34
    if-gt v1, v0, :cond_2

    .line 35
    .line 36
    iget-boolean p1, p0, Lokio/w;->e:Z

    .line 37
    .line 38
    if-nez p1, :cond_1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    return-object p0

    .line 42
    :cond_2
    :goto_0
    invoke-static {}, Lokio/x;->c()Lokio/w;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p0, p1}, Lokio/w;->c(Lokio/w;)Lokio/w;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0

    .line 51
    :cond_3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 52
    .line 53
    const-string p1, "unexpected capacity"

    .line 54
    .line 55
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    throw p0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lokio/e;->c()Lokio/e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public close()V
    .locals 0

    .line 1
    return-void
.end method

.method public final d()J
    .locals 5

    .line 1
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long v4, v0, v2

    .line 8
    .line 9
    if-nez v4, :cond_0

    .line 10
    .line 11
    return-wide v2

    .line 12
    :cond_0
    iget-object p0, p0, Lokio/e;->g:Lokio/w;

    .line 13
    .line 14
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lokio/w;->g:Lokio/w;

    .line 18
    .line 19
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    iget v2, p0, Lokio/w;->c:I

    .line 23
    .line 24
    const/16 v3, 0x2000

    .line 25
    .line 26
    if-ge v2, v3, :cond_1

    .line 27
    .line 28
    iget-boolean v3, p0, Lokio/w;->e:Z

    .line 29
    .line 30
    if-eqz v3, :cond_1

    .line 31
    .line 32
    iget p0, p0, Lokio/w;->b:I

    .line 33
    .line 34
    sub-int/2addr v2, p0

    .line 35
    int-to-long v2, v2

    .line 36
    sub-long/2addr v0, v2

    .line 37
    :cond_1
    return-wide v0
.end method

.method public d0(Lokio/h;)Lokio/e;
    .locals 2

    .line 1
    const-string v0, "byteString"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lokio/h;->z()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {p1, p0, v1, v0}, Lokio/h;->E(Lokio/e;II)V

    .line 12
    .line 13
    .line 14
    return-object p0
.end method

.method public e0([B)Lokio/e;
    .locals 2

    .line 1
    const-string v0, "source"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    array-length v0, p1

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, p1, v1, v0}, Lokio/e;->f0([BII)Lokio/e;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    return v2

    .line 9
    :cond_0
    instance-of v3, v1, Lokio/e;

    .line 10
    .line 11
    const/4 v4, 0x0

    .line 12
    if-nez v3, :cond_1

    .line 13
    .line 14
    return v4

    .line 15
    :cond_1
    invoke-virtual {v0}, Lokio/e;->size()J

    .line 16
    .line 17
    .line 18
    move-result-wide v5

    .line 19
    check-cast v1, Lokio/e;

    .line 20
    .line 21
    invoke-virtual {v1}, Lokio/e;->size()J

    .line 22
    .line 23
    .line 24
    move-result-wide v7

    .line 25
    cmp-long v3, v5, v7

    .line 26
    .line 27
    if-eqz v3, :cond_2

    .line 28
    .line 29
    return v4

    .line 30
    :cond_2
    invoke-virtual {v0}, Lokio/e;->size()J

    .line 31
    .line 32
    .line 33
    move-result-wide v5

    .line 34
    const-wide/16 v7, 0x0

    .line 35
    .line 36
    cmp-long v3, v5, v7

    .line 37
    .line 38
    if-nez v3, :cond_3

    .line 39
    .line 40
    return v2

    .line 41
    :cond_3
    iget-object v3, v0, Lokio/e;->g:Lokio/w;

    .line 42
    .line 43
    invoke-static {v3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    iget-object v1, v1, Lokio/e;->g:Lokio/w;

    .line 47
    .line 48
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    iget v5, v3, Lokio/w;->b:I

    .line 52
    .line 53
    iget v6, v1, Lokio/w;->b:I

    .line 54
    .line 55
    move-wide v9, v7

    .line 56
    :goto_0
    invoke-virtual {v0}, Lokio/e;->size()J

    .line 57
    .line 58
    .line 59
    move-result-wide v11

    .line 60
    cmp-long v11, v9, v11

    .line 61
    .line 62
    if-gez v11, :cond_8

    .line 63
    .line 64
    iget v11, v3, Lokio/w;->c:I

    .line 65
    .line 66
    sub-int/2addr v11, v5

    .line 67
    iget v12, v1, Lokio/w;->c:I

    .line 68
    .line 69
    sub-int/2addr v12, v6

    .line 70
    invoke-static {v11, v12}, Ljava/lang/Math;->min(II)I

    .line 71
    .line 72
    .line 73
    move-result v11

    .line 74
    int-to-long v11, v11

    .line 75
    move-wide v13, v7

    .line 76
    :goto_1
    cmp-long v15, v13, v11

    .line 77
    .line 78
    if-gez v15, :cond_5

    .line 79
    .line 80
    iget-object v15, v3, Lokio/w;->a:[B

    .line 81
    .line 82
    add-int/lit8 v16, v5, 0x1

    .line 83
    .line 84
    aget-byte v5, v15, v5

    .line 85
    .line 86
    iget-object v15, v1, Lokio/w;->a:[B

    .line 87
    .line 88
    add-int/lit8 v17, v6, 0x1

    .line 89
    .line 90
    aget-byte v6, v15, v6

    .line 91
    .line 92
    if-eq v5, v6, :cond_4

    .line 93
    .line 94
    return v4

    .line 95
    :cond_4
    const-wide/16 v5, 0x1

    .line 96
    .line 97
    add-long/2addr v13, v5

    .line 98
    move/from16 v5, v16

    .line 99
    .line 100
    move/from16 v6, v17

    .line 101
    .line 102
    goto :goto_1

    .line 103
    :cond_5
    iget v13, v3, Lokio/w;->c:I

    .line 104
    .line 105
    if-ne v5, v13, :cond_6

    .line 106
    .line 107
    iget-object v3, v3, Lokio/w;->f:Lokio/w;

    .line 108
    .line 109
    invoke-static {v3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 110
    .line 111
    .line 112
    iget v5, v3, Lokio/w;->b:I

    .line 113
    .line 114
    :cond_6
    iget v13, v1, Lokio/w;->c:I

    .line 115
    .line 116
    if-ne v6, v13, :cond_7

    .line 117
    .line 118
    iget-object v1, v1, Lokio/w;->f:Lokio/w;

    .line 119
    .line 120
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 121
    .line 122
    .line 123
    iget v6, v1, Lokio/w;->b:I

    .line 124
    .line 125
    :cond_7
    add-long/2addr v9, v11

    .line 126
    goto :goto_0

    .line 127
    :cond_8
    return v2
.end method

.method public bridge synthetic f()Lokio/f;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lokio/e;->v()Lokio/e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public f0([BII)Lokio/e;
    .locals 7

    .line 1
    const-string v0, "source"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    array-length v0, p1

    .line 7
    int-to-long v1, v0

    .line 8
    int-to-long v3, p2

    .line 9
    int-to-long v5, p3

    .line 10
    invoke-static/range {v1 .. v6}, Lokio/b;->b(JJJ)V

    .line 11
    .line 12
    .line 13
    add-int/2addr p3, p2

    .line 14
    :goto_0
    if-ge p2, p3, :cond_0

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    invoke-virtual {p0, v0}, Lokio/e;->c0(I)Lokio/w;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sub-int v1, p3, p2

    .line 22
    .line 23
    iget v2, v0, Lokio/w;->c:I

    .line 24
    .line 25
    rsub-int v2, v2, 0x2000

    .line 26
    .line 27
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    iget-object v2, v0, Lokio/w;->a:[B

    .line 32
    .line 33
    iget v3, v0, Lokio/w;->c:I

    .line 34
    .line 35
    add-int v4, p2, v1

    .line 36
    .line 37
    invoke-static {p1, v2, v3, p2, v4}, Li4/g;->d([B[BIII)[B

    .line 38
    .line 39
    .line 40
    iget p2, v0, Lokio/w;->c:I

    .line 41
    .line 42
    add-int/2addr p2, v1

    .line 43
    iput p2, v0, Lokio/w;->c:I

    .line 44
    .line 45
    move p2, v4

    .line 46
    goto :goto_0

    .line 47
    :cond_0
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 48
    .line 49
    .line 50
    move-result-wide p1

    .line 51
    add-long/2addr p1, v5

    .line 52
    invoke-virtual {p0, p1, p2}, Lokio/e;->U(J)V

    .line 53
    .line 54
    .line 55
    return-object p0
.end method

.method public flush()V
    .locals 0

    .line 1
    return-void
.end method

.method public g0(I)Lokio/e;
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lokio/e;->c0(I)Lokio/w;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    iget-object v1, v0, Lokio/w;->a:[B

    .line 7
    .line 8
    iget v2, v0, Lokio/w;->c:I

    .line 9
    .line 10
    add-int/lit8 v3, v2, 0x1

    .line 11
    .line 12
    iput v3, v0, Lokio/w;->c:I

    .line 13
    .line 14
    int-to-byte p1, p1

    .line 15
    aput-byte p1, v1, v2

    .line 16
    .line 17
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    const-wide/16 v2, 0x1

    .line 22
    .line 23
    add-long/2addr v0, v2

    .line 24
    invoke-virtual {p0, v0, v1}, Lokio/e;->U(J)V

    .line 25
    .line 26
    .line 27
    return-object p0
.end method

.method public h(Lokio/h;)J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const-string v0, "bytes"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    invoke-virtual {p0, p1, v0, v1}, Lokio/e;->C(Lokio/h;J)J

    .line 9
    .line 10
    .line 11
    move-result-wide p0

    .line 12
    return-wide p0
.end method

.method public h0(J)Lokio/e;
    .locals 12

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v2, p1, v0

    .line 4
    .line 5
    if-nez v2, :cond_0

    .line 6
    .line 7
    const/16 p1, 0x30

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lokio/e;->g0(I)Lokio/e;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 v3, 0x1

    .line 15
    if-gez v2, :cond_2

    .line 16
    .line 17
    neg-long p1, p1

    .line 18
    cmp-long v2, p1, v0

    .line 19
    .line 20
    if-gez v2, :cond_1

    .line 21
    .line 22
    const-string p1, "-9223372036854775808"

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lokio/e;->o0(Ljava/lang/String;)Lokio/e;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0

    .line 29
    :cond_1
    move v2, v3

    .line 30
    goto :goto_0

    .line 31
    :cond_2
    const/4 v2, 0x0

    .line 32
    :goto_0
    const-wide/32 v4, 0x5f5e100

    .line 33
    .line 34
    .line 35
    cmp-long v4, p1, v4

    .line 36
    .line 37
    const/16 v5, 0xa

    .line 38
    .line 39
    if-gez v4, :cond_a

    .line 40
    .line 41
    const-wide/16 v6, 0x2710

    .line 42
    .line 43
    cmp-long v4, p1, v6

    .line 44
    .line 45
    if-gez v4, :cond_6

    .line 46
    .line 47
    const-wide/16 v6, 0x64

    .line 48
    .line 49
    cmp-long v4, p1, v6

    .line 50
    .line 51
    if-gez v4, :cond_4

    .line 52
    .line 53
    const-wide/16 v6, 0xa

    .line 54
    .line 55
    cmp-long v4, p1, v6

    .line 56
    .line 57
    if-gez v4, :cond_3

    .line 58
    .line 59
    goto/16 :goto_1

    .line 60
    .line 61
    :cond_3
    const/4 v3, 0x2

    .line 62
    goto/16 :goto_1

    .line 63
    .line 64
    :cond_4
    const-wide/16 v3, 0x3e8

    .line 65
    .line 66
    cmp-long v3, p1, v3

    .line 67
    .line 68
    if-gez v3, :cond_5

    .line 69
    .line 70
    const/4 v3, 0x3

    .line 71
    goto/16 :goto_1

    .line 72
    .line 73
    :cond_5
    const/4 v3, 0x4

    .line 74
    goto/16 :goto_1

    .line 75
    .line 76
    :cond_6
    const-wide/32 v3, 0xf4240

    .line 77
    .line 78
    .line 79
    cmp-long v3, p1, v3

    .line 80
    .line 81
    if-gez v3, :cond_8

    .line 82
    .line 83
    const-wide/32 v3, 0x186a0

    .line 84
    .line 85
    .line 86
    cmp-long v3, p1, v3

    .line 87
    .line 88
    if-gez v3, :cond_7

    .line 89
    .line 90
    const/4 v3, 0x5

    .line 91
    goto/16 :goto_1

    .line 92
    .line 93
    :cond_7
    const/4 v3, 0x6

    .line 94
    goto/16 :goto_1

    .line 95
    .line 96
    :cond_8
    const-wide/32 v3, 0x989680

    .line 97
    .line 98
    .line 99
    cmp-long v3, p1, v3

    .line 100
    .line 101
    if-gez v3, :cond_9

    .line 102
    .line 103
    const/4 v3, 0x7

    .line 104
    goto/16 :goto_1

    .line 105
    .line 106
    :cond_9
    const/16 v3, 0x8

    .line 107
    .line 108
    goto/16 :goto_1

    .line 109
    .line 110
    :cond_a
    const-wide v3, 0xe8d4a51000L

    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    cmp-long v3, p1, v3

    .line 116
    .line 117
    if-gez v3, :cond_e

    .line 118
    .line 119
    const-wide v3, 0x2540be400L

    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    cmp-long v3, p1, v3

    .line 125
    .line 126
    if-gez v3, :cond_c

    .line 127
    .line 128
    const-wide/32 v3, 0x3b9aca00

    .line 129
    .line 130
    .line 131
    cmp-long v3, p1, v3

    .line 132
    .line 133
    if-gez v3, :cond_b

    .line 134
    .line 135
    const/16 v3, 0x9

    .line 136
    .line 137
    goto :goto_1

    .line 138
    :cond_b
    move v3, v5

    .line 139
    goto :goto_1

    .line 140
    :cond_c
    const-wide v3, 0x174876e800L

    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    cmp-long v3, p1, v3

    .line 146
    .line 147
    if-gez v3, :cond_d

    .line 148
    .line 149
    const/16 v3, 0xb

    .line 150
    .line 151
    goto :goto_1

    .line 152
    :cond_d
    const/16 v3, 0xc

    .line 153
    .line 154
    goto :goto_1

    .line 155
    :cond_e
    const-wide v3, 0x38d7ea4c68000L

    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    cmp-long v3, p1, v3

    .line 161
    .line 162
    if-gez v3, :cond_11

    .line 163
    .line 164
    const-wide v3, 0x9184e72a000L

    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    cmp-long v3, p1, v3

    .line 170
    .line 171
    if-gez v3, :cond_f

    .line 172
    .line 173
    const/16 v3, 0xd

    .line 174
    .line 175
    goto :goto_1

    .line 176
    :cond_f
    const-wide v3, 0x5af3107a4000L

    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    cmp-long v3, p1, v3

    .line 182
    .line 183
    if-gez v3, :cond_10

    .line 184
    .line 185
    const/16 v3, 0xe

    .line 186
    .line 187
    goto :goto_1

    .line 188
    :cond_10
    const/16 v3, 0xf

    .line 189
    .line 190
    goto :goto_1

    .line 191
    :cond_11
    const-wide v3, 0x16345785d8a0000L

    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    cmp-long v3, p1, v3

    .line 197
    .line 198
    if-gez v3, :cond_13

    .line 199
    .line 200
    const-wide v3, 0x2386f26fc10000L

    .line 201
    .line 202
    .line 203
    .line 204
    .line 205
    cmp-long v3, p1, v3

    .line 206
    .line 207
    if-gez v3, :cond_12

    .line 208
    .line 209
    const/16 v3, 0x10

    .line 210
    .line 211
    goto :goto_1

    .line 212
    :cond_12
    const/16 v3, 0x11

    .line 213
    .line 214
    goto :goto_1

    .line 215
    :cond_13
    const-wide v3, 0xde0b6b3a7640000L

    .line 216
    .line 217
    .line 218
    .line 219
    .line 220
    cmp-long v3, p1, v3

    .line 221
    .line 222
    if-gez v3, :cond_14

    .line 223
    .line 224
    const/16 v3, 0x12

    .line 225
    .line 226
    goto :goto_1

    .line 227
    :cond_14
    const/16 v3, 0x13

    .line 228
    .line 229
    :goto_1
    if-eqz v2, :cond_15

    .line 230
    .line 231
    add-int/lit8 v3, v3, 0x1

    .line 232
    .line 233
    :cond_15
    invoke-virtual {p0, v3}, Lokio/e;->c0(I)Lokio/w;

    .line 234
    .line 235
    .line 236
    move-result-object v4

    .line 237
    iget-object v6, v4, Lokio/w;->a:[B

    .line 238
    .line 239
    iget v7, v4, Lokio/w;->c:I

    .line 240
    .line 241
    add-int/2addr v7, v3

    .line 242
    :goto_2
    cmp-long v8, p1, v0

    .line 243
    .line 244
    if-eqz v8, :cond_16

    .line 245
    .line 246
    int-to-long v8, v5

    .line 247
    rem-long v10, p1, v8

    .line 248
    .line 249
    long-to-int v10, v10

    .line 250
    add-int/lit8 v7, v7, -0x1

    .line 251
    .line 252
    invoke-static {}, LP4/a;->b()[B

    .line 253
    .line 254
    .line 255
    move-result-object v11

    .line 256
    aget-byte v10, v11, v10

    .line 257
    .line 258
    aput-byte v10, v6, v7

    .line 259
    .line 260
    div-long/2addr p1, v8

    .line 261
    goto :goto_2

    .line 262
    :cond_16
    if-eqz v2, :cond_17

    .line 263
    .line 264
    add-int/lit8 v7, v7, -0x1

    .line 265
    .line 266
    const/16 p1, 0x2d

    .line 267
    .line 268
    aput-byte p1, v6, v7

    .line 269
    .line 270
    :cond_17
    iget p1, v4, Lokio/w;->c:I

    .line 271
    .line 272
    add-int/2addr p1, v3

    .line 273
    iput p1, v4, Lokio/w;->c:I

    .line 274
    .line 275
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 276
    .line 277
    .line 278
    move-result-wide p1

    .line 279
    int-to-long v0, v3

    .line 280
    add-long/2addr p1, v0

    .line 281
    invoke-virtual {p0, p1, p2}, Lokio/e;->U(J)V

    .line 282
    .line 283
    .line 284
    return-object p0
.end method

.method public hashCode()I
    .locals 5

    .line 1
    iget-object v0, p0, Lokio/e;->g:Lokio/w;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 v1, 0x1

    .line 8
    :cond_1
    iget v2, v0, Lokio/w;->b:I

    .line 9
    .line 10
    iget v3, v0, Lokio/w;->c:I

    .line 11
    .line 12
    :goto_0
    if-ge v2, v3, :cond_2

    .line 13
    .line 14
    mul-int/lit8 v1, v1, 0x1f

    .line 15
    .line 16
    iget-object v4, v0, Lokio/w;->a:[B

    .line 17
    .line 18
    aget-byte v4, v4, v2

    .line 19
    .line 20
    add-int/2addr v1, v4

    .line 21
    add-int/lit8 v2, v2, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_2
    iget-object v0, v0, Lokio/w;->f:Lokio/w;

    .line 25
    .line 26
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    iget-object v2, p0, Lokio/e;->g:Lokio/w;

    .line 30
    .line 31
    if-ne v0, v2, :cond_1

    .line 32
    .line 33
    return v1
.end method

.method public i()Lokio/e;
    .locals 0

    .line 1
    return-object p0
.end method

.method public i0(J)Lokio/e;
    .locals 12

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/16 p1, 0x30

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lokio/e;->g0(I)Lokio/e;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 v0, 0x1

    .line 15
    ushr-long v1, p1, v0

    .line 16
    .line 17
    or-long/2addr v1, p1

    .line 18
    const/4 v3, 0x2

    .line 19
    ushr-long v4, v1, v3

    .line 20
    .line 21
    or-long/2addr v1, v4

    .line 22
    const/4 v4, 0x4

    .line 23
    ushr-long v5, v1, v4

    .line 24
    .line 25
    or-long/2addr v1, v5

    .line 26
    const/16 v5, 0x8

    .line 27
    .line 28
    ushr-long v6, v1, v5

    .line 29
    .line 30
    or-long/2addr v1, v6

    .line 31
    const/16 v6, 0x10

    .line 32
    .line 33
    ushr-long v7, v1, v6

    .line 34
    .line 35
    or-long/2addr v1, v7

    .line 36
    const/16 v7, 0x20

    .line 37
    .line 38
    ushr-long v8, v1, v7

    .line 39
    .line 40
    or-long/2addr v1, v8

    .line 41
    ushr-long v8, v1, v0

    .line 42
    .line 43
    const-wide v10, 0x5555555555555555L    # 1.1945305291614955E103

    .line 44
    .line 45
    .line 46
    .line 47
    .line 48
    and-long/2addr v8, v10

    .line 49
    sub-long/2addr v1, v8

    .line 50
    ushr-long v8, v1, v3

    .line 51
    .line 52
    const-wide v10, 0x3333333333333333L    # 4.667261458395856E-62

    .line 53
    .line 54
    .line 55
    .line 56
    .line 57
    and-long/2addr v8, v10

    .line 58
    and-long/2addr v1, v10

    .line 59
    add-long/2addr v8, v1

    .line 60
    ushr-long v1, v8, v4

    .line 61
    .line 62
    add-long/2addr v1, v8

    .line 63
    const-wide v8, 0xf0f0f0f0f0f0f0fL    # 3.815736827118017E-236

    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    and-long/2addr v1, v8

    .line 69
    ushr-long v8, v1, v5

    .line 70
    .line 71
    add-long/2addr v1, v8

    .line 72
    ushr-long v5, v1, v6

    .line 73
    .line 74
    add-long/2addr v1, v5

    .line 75
    const-wide/16 v5, 0x3f

    .line 76
    .line 77
    and-long v8, v1, v5

    .line 78
    .line 79
    ushr-long/2addr v1, v7

    .line 80
    and-long/2addr v1, v5

    .line 81
    add-long/2addr v8, v1

    .line 82
    const/4 v1, 0x3

    .line 83
    int-to-long v1, v1

    .line 84
    add-long/2addr v8, v1

    .line 85
    int-to-long v1, v4

    .line 86
    div-long/2addr v8, v1

    .line 87
    long-to-int v1, v8

    .line 88
    invoke-virtual {p0, v1}, Lokio/e;->c0(I)Lokio/w;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    iget-object v3, v2, Lokio/w;->a:[B

    .line 93
    .line 94
    iget v5, v2, Lokio/w;->c:I

    .line 95
    .line 96
    add-int v6, v5, v1

    .line 97
    .line 98
    sub-int/2addr v6, v0

    .line 99
    :goto_0
    if-lt v6, v5, :cond_1

    .line 100
    .line 101
    invoke-static {}, LP4/a;->b()[B

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    const-wide/16 v7, 0xf

    .line 106
    .line 107
    and-long/2addr v7, p1

    .line 108
    long-to-int v7, v7

    .line 109
    aget-byte v0, v0, v7

    .line 110
    .line 111
    aput-byte v0, v3, v6

    .line 112
    .line 113
    ushr-long/2addr p1, v4

    .line 114
    add-int/lit8 v6, v6, -0x1

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_1
    iget p1, v2, Lokio/w;->c:I

    .line 118
    .line 119
    add-int/2addr p1, v1

    .line 120
    iput p1, v2, Lokio/w;->c:I

    .line 121
    .line 122
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 123
    .line 124
    .line 125
    move-result-wide p1

    .line 126
    int-to-long v0, v1

    .line 127
    add-long/2addr p1, v0

    .line 128
    invoke-virtual {p0, p1, p2}, Lokio/e;->U(J)V

    .line 129
    .line 130
    .line 131
    return-object p0
.end method

.method public isOpen()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public j0(I)Lokio/e;
    .locals 7

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-virtual {p0, v0}, Lokio/e;->c0(I)Lokio/w;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    iget-object v2, v1, Lokio/w;->a:[B

    .line 7
    .line 8
    iget v3, v1, Lokio/w;->c:I

    .line 9
    .line 10
    add-int/lit8 v4, v3, 0x1

    .line 11
    .line 12
    ushr-int/lit8 v5, p1, 0x18

    .line 13
    .line 14
    and-int/lit16 v5, v5, 0xff

    .line 15
    .line 16
    int-to-byte v5, v5

    .line 17
    aput-byte v5, v2, v3

    .line 18
    .line 19
    add-int/lit8 v5, v3, 0x2

    .line 20
    .line 21
    ushr-int/lit8 v6, p1, 0x10

    .line 22
    .line 23
    and-int/lit16 v6, v6, 0xff

    .line 24
    .line 25
    int-to-byte v6, v6

    .line 26
    aput-byte v6, v2, v4

    .line 27
    .line 28
    add-int/lit8 v4, v3, 0x3

    .line 29
    .line 30
    ushr-int/lit8 v6, p1, 0x8

    .line 31
    .line 32
    and-int/lit16 v6, v6, 0xff

    .line 33
    .line 34
    int-to-byte v6, v6

    .line 35
    aput-byte v6, v2, v5

    .line 36
    .line 37
    add-int/2addr v3, v0

    .line 38
    and-int/lit16 p1, p1, 0xff

    .line 39
    .line 40
    int-to-byte p1, p1

    .line 41
    aput-byte p1, v2, v4

    .line 42
    .line 43
    iput v3, v1, Lokio/w;->c:I

    .line 44
    .line 45
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 46
    .line 47
    .line 48
    move-result-wide v0

    .line 49
    const-wide/16 v2, 0x4

    .line 50
    .line 51
    add-long/2addr v0, v2

    .line 52
    invoke-virtual {p0, v0, v1}, Lokio/e;->U(J)V

    .line 53
    .line 54
    .line 55
    return-object p0
.end method

.method public k(Lokio/e;J)V
    .locals 2
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
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    cmp-long v0, v0, p2

    .line 11
    .line 12
    if-ltz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1, p0, p2, p3}, Lokio/e;->write(Lokio/e;J)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 19
    .line 20
    .line 21
    move-result-wide p2

    .line 22
    invoke-virtual {p1, p0, p2, p3}, Lokio/e;->write(Lokio/e;J)V

    .line 23
    .line 24
    .line 25
    new-instance p0, Ljava/io/EOFException;

    .line 26
    .line 27
    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    .line 28
    .line 29
    .line 30
    throw p0
.end method

.method public k0(J)Lokio/e;
    .locals 11

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lokio/e;->c0(I)Lokio/w;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v2, v1, Lokio/w;->a:[B

    .line 8
    .line 9
    iget v3, v1, Lokio/w;->c:I

    .line 10
    .line 11
    add-int/lit8 v4, v3, 0x1

    .line 12
    .line 13
    const/16 v5, 0x38

    .line 14
    .line 15
    ushr-long v5, p1, v5

    .line 16
    .line 17
    const-wide/16 v7, 0xff

    .line 18
    .line 19
    and-long/2addr v5, v7

    .line 20
    long-to-int v5, v5

    .line 21
    int-to-byte v5, v5

    .line 22
    aput-byte v5, v2, v3

    .line 23
    .line 24
    add-int/lit8 v5, v3, 0x2

    .line 25
    .line 26
    const/16 v6, 0x30

    .line 27
    .line 28
    ushr-long v9, p1, v6

    .line 29
    .line 30
    and-long/2addr v9, v7

    .line 31
    long-to-int v6, v9

    .line 32
    int-to-byte v6, v6

    .line 33
    aput-byte v6, v2, v4

    .line 34
    .line 35
    add-int/lit8 v4, v3, 0x3

    .line 36
    .line 37
    const/16 v6, 0x28

    .line 38
    .line 39
    ushr-long v9, p1, v6

    .line 40
    .line 41
    and-long/2addr v9, v7

    .line 42
    long-to-int v6, v9

    .line 43
    int-to-byte v6, v6

    .line 44
    aput-byte v6, v2, v5

    .line 45
    .line 46
    add-int/lit8 v5, v3, 0x4

    .line 47
    .line 48
    const/16 v6, 0x20

    .line 49
    .line 50
    ushr-long v9, p1, v6

    .line 51
    .line 52
    and-long/2addr v9, v7

    .line 53
    long-to-int v6, v9

    .line 54
    int-to-byte v6, v6

    .line 55
    aput-byte v6, v2, v4

    .line 56
    .line 57
    add-int/lit8 v4, v3, 0x5

    .line 58
    .line 59
    const/16 v6, 0x18

    .line 60
    .line 61
    ushr-long v9, p1, v6

    .line 62
    .line 63
    and-long/2addr v9, v7

    .line 64
    long-to-int v6, v9

    .line 65
    int-to-byte v6, v6

    .line 66
    aput-byte v6, v2, v5

    .line 67
    .line 68
    add-int/lit8 v5, v3, 0x6

    .line 69
    .line 70
    const/16 v6, 0x10

    .line 71
    .line 72
    ushr-long v9, p1, v6

    .line 73
    .line 74
    and-long/2addr v9, v7

    .line 75
    long-to-int v6, v9

    .line 76
    int-to-byte v6, v6

    .line 77
    aput-byte v6, v2, v4

    .line 78
    .line 79
    add-int/lit8 v4, v3, 0x7

    .line 80
    .line 81
    ushr-long v9, p1, v0

    .line 82
    .line 83
    and-long/2addr v9, v7

    .line 84
    long-to-int v6, v9

    .line 85
    int-to-byte v6, v6

    .line 86
    aput-byte v6, v2, v5

    .line 87
    .line 88
    add-int/2addr v3, v0

    .line 89
    and-long/2addr p1, v7

    .line 90
    long-to-int p1, p1

    .line 91
    int-to-byte p1, p1

    .line 92
    aput-byte p1, v2, v4

    .line 93
    .line 94
    iput v3, v1, Lokio/w;->c:I

    .line 95
    .line 96
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 97
    .line 98
    .line 99
    move-result-wide p1

    .line 100
    const-wide/16 v0, 0x8

    .line 101
    .line 102
    add-long/2addr p1, v0

    .line 103
    invoke-virtual {p0, p1, p2}, Lokio/e;->U(J)V

    .line 104
    .line 105
    .line 106
    return-object p0
.end method

.method public l(Lokio/h;)J
    .locals 2

    .line 1
    const-string v0, "targetBytes"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    invoke-virtual {p0, p1, v0, v1}, Lokio/e;->D(Lokio/h;J)J

    .line 9
    .line 10
    .line 11
    move-result-wide p0

    .line 12
    return-wide p0
.end method

.method public l0(I)Lokio/e;
    .locals 6

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, v0}, Lokio/e;->c0(I)Lokio/w;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    iget-object v2, v1, Lokio/w;->a:[B

    .line 7
    .line 8
    iget v3, v1, Lokio/w;->c:I

    .line 9
    .line 10
    add-int/lit8 v4, v3, 0x1

    .line 11
    .line 12
    ushr-int/lit8 v5, p1, 0x8

    .line 13
    .line 14
    and-int/lit16 v5, v5, 0xff

    .line 15
    .line 16
    int-to-byte v5, v5

    .line 17
    aput-byte v5, v2, v3

    .line 18
    .line 19
    add-int/2addr v3, v0

    .line 20
    and-int/lit16 p1, p1, 0xff

    .line 21
    .line 22
    int-to-byte p1, p1

    .line 23
    aput-byte p1, v2, v4

    .line 24
    .line 25
    iput v3, v1, Lokio/w;->c:I

    .line 26
    .line 27
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 28
    .line 29
    .line 30
    move-result-wide v0

    .line 31
    const-wide/16 v2, 0x2

    .line 32
    .line 33
    add-long/2addr v0, v2

    .line 34
    invoke-virtual {p0, v0, v1}, Lokio/e;->U(J)V

    .line 35
    .line 36
    .line 37
    return-object p0
.end method

.method public bridge synthetic m()Lokio/f;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lokio/e;->w()Lokio/e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public m0(Ljava/lang/String;IILjava/nio/charset/Charset;)Lokio/e;
    .locals 1

    .line 1
    const-string v0, "string"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "charset"

    .line 7
    .line 8
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    if-ltz p2, :cond_3

    .line 12
    .line 13
    if-lt p3, p2, :cond_2

    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-gt p3, v0, :cond_1

    .line 20
    .line 21
    sget-object v0, LD4/d;->b:Ljava/nio/charset/Charset;

    .line 22
    .line 23
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0, p1, p2, p3}, Lokio/e;->p0(Ljava/lang/String;II)Lokio/e;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0

    .line 34
    :cond_0
    invoke-virtual {p1, p2, p3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const-string p2, "this as java.lang.String\u2026ing(startIndex, endIndex)"

    .line 39
    .line 40
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1, p4}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    const-string p2, "this as java.lang.String).getBytes(charset)"

    .line 48
    .line 49
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    array-length p2, p1

    .line 53
    const/4 p3, 0x0

    .line 54
    invoke-virtual {p0, p1, p3, p2}, Lokio/e;->f0([BII)Lokio/e;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0

    .line 59
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 62
    .line 63
    .line 64
    const-string p2, "endIndex > string.length: "

    .line 65
    .line 66
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string p2, " > "

    .line 73
    .line 74
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 89
    .line 90
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    throw p1

    .line 98
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 99
    .line 100
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 101
    .line 102
    .line 103
    const-string p1, "endIndex < beginIndex: "

    .line 104
    .line 105
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    const-string p1, " < "

    .line 112
    .line 113
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 124
    .line 125
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    throw p1

    .line 133
    :cond_3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 134
    .line 135
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 136
    .line 137
    .line 138
    const-string p1, "beginIndex < 0: "

    .line 139
    .line 140
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 151
    .line 152
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    throw p1
.end method

.method public final n()Lokio/e;
    .locals 6

    .line 1
    new-instance v0, Lokio/e;

    .line 2
    .line 3
    invoke-direct {v0}, Lokio/e;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    const-wide/16 v3, 0x0

    .line 11
    .line 12
    cmp-long v1, v1, v3

    .line 13
    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    return-object v0

    .line 17
    :cond_0
    iget-object v1, p0, Lokio/e;->g:Lokio/w;

    .line 18
    .line 19
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Lokio/w;->d()Lokio/w;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    iput-object v2, v0, Lokio/e;->g:Lokio/w;

    .line 27
    .line 28
    iput-object v2, v2, Lokio/w;->g:Lokio/w;

    .line 29
    .line 30
    iput-object v2, v2, Lokio/w;->f:Lokio/w;

    .line 31
    .line 32
    iget-object v3, v1, Lokio/w;->f:Lokio/w;

    .line 33
    .line 34
    :goto_0
    if-eq v3, v1, :cond_1

    .line 35
    .line 36
    iget-object v4, v2, Lokio/w;->g:Lokio/w;

    .line 37
    .line 38
    invoke-static {v4}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v3}, Lokio/w;->d()Lokio/w;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    invoke-virtual {v4, v5}, Lokio/w;->c(Lokio/w;)Lokio/w;

    .line 49
    .line 50
    .line 51
    iget-object v3, v3, Lokio/w;->f:Lokio/w;

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 55
    .line 56
    .line 57
    move-result-wide v1

    .line 58
    invoke-virtual {v0, v1, v2}, Lokio/e;->U(J)V

    .line 59
    .line 60
    .line 61
    return-object v0
.end method

.method public n0(Ljava/lang/String;Ljava/nio/charset/Charset;)Lokio/e;
    .locals 2

    .line 1
    const-string v0, "string"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "charset"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {p0, p1, v1, v0, p2}, Lokio/e;->m0(Ljava/lang/String;IILjava/nio/charset/Charset;)Lokio/e;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public o(J)Ljava/lang/String;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-ltz v0, :cond_3

    .line 6
    .line 7
    const-wide v0, 0x7fffffffffffffffL

    .line 8
    .line 9
    .line 10
    .line 11
    .line 12
    cmp-long v2, p1, v0

    .line 13
    .line 14
    const-wide/16 v6, 0x1

    .line 15
    .line 16
    if-nez v2, :cond_0

    .line 17
    .line 18
    :goto_0
    move-wide v4, v0

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    add-long v0, p1, v6

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :goto_1
    const/16 v1, 0xa

    .line 24
    .line 25
    const-wide/16 v2, 0x0

    .line 26
    .line 27
    move-object v0, p0

    .line 28
    invoke-virtual/range {v0 .. v5}, Lokio/e;->B(BJJ)J

    .line 29
    .line 30
    .line 31
    move-result-wide v1

    .line 32
    const-wide/16 v8, -0x1

    .line 33
    .line 34
    cmp-long v3, v1, v8

    .line 35
    .line 36
    if-eqz v3, :cond_1

    .line 37
    .line 38
    invoke-static {p0, v1, v2}, LP4/a;->d(Lokio/e;J)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    return-object v0

    .line 43
    :cond_1
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 44
    .line 45
    .line 46
    move-result-wide v1

    .line 47
    cmp-long v1, v4, v1

    .line 48
    .line 49
    if-gez v1, :cond_2

    .line 50
    .line 51
    sub-long v1, v4, v6

    .line 52
    .line 53
    invoke-virtual {p0, v1, v2}, Lokio/e;->A(J)B

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    const/16 v2, 0xd

    .line 58
    .line 59
    if-ne v1, v2, :cond_2

    .line 60
    .line 61
    invoke-virtual {p0, v4, v5}, Lokio/e;->A(J)B

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    const/16 v2, 0xa

    .line 66
    .line 67
    if-ne v1, v2, :cond_2

    .line 68
    .line 69
    invoke-static {p0, v4, v5}, LP4/a;->d(Lokio/e;J)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    return-object v0

    .line 74
    :cond_2
    new-instance v1, Lokio/e;

    .line 75
    .line 76
    invoke-direct {v1}, Lokio/e;-><init>()V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 80
    .line 81
    .line 82
    move-result-wide v2

    .line 83
    const/16 v4, 0x20

    .line 84
    .line 85
    int-to-long v4, v4

    .line 86
    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->min(JJ)J

    .line 87
    .line 88
    .line 89
    move-result-wide v4

    .line 90
    const-wide/16 v2, 0x0

    .line 91
    .line 92
    move-object v0, p0

    .line 93
    invoke-virtual/range {v0 .. v5}, Lokio/e;->t(Lokio/e;JJ)Lokio/e;

    .line 94
    .line 95
    .line 96
    new-instance v0, Ljava/io/EOFException;

    .line 97
    .line 98
    new-instance v2, Ljava/lang/StringBuilder;

    .line 99
    .line 100
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 101
    .line 102
    .line 103
    const-string v3, "\\n not found: limit="

    .line 104
    .line 105
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 109
    .line 110
    .line 111
    move-result-wide v3

    .line 112
    invoke-static {v3, v4, p1, p2}, Ljava/lang/Math;->min(JJ)J

    .line 113
    .line 114
    .line 115
    move-result-wide v3

    .line 116
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    const-string v3, " content="

    .line 120
    .line 121
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {v1}, Lokio/e;->I()Lokio/h;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    invoke-virtual {v1}, Lokio/h;->n()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    const/16 v1, 0x2026

    .line 136
    .line 137
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    invoke-direct {v0, v1}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    throw v0

    .line 148
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 149
    .line 150
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 151
    .line 152
    .line 153
    const-string v1, "limit < 0: "

    .line 154
    .line 155
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    new-instance v1, Ljava/lang/IllegalArgumentException;

    .line 166
    .line 167
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    throw v1
.end method

.method public o0(Ljava/lang/String;)Lokio/e;
    .locals 2

    .line 1
    const-string v0, "string"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {p0, p1, v1, v0}, Lokio/e;->p0(Ljava/lang/String;II)Lokio/e;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public p0(Ljava/lang/String;II)Lokio/e;
    .locals 9

    .line 1
    const-string v0, "string"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    if-ltz p2, :cond_a

    .line 7
    .line 8
    if-lt p3, p2, :cond_9

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-gt p3, v0, :cond_8

    .line 15
    .line 16
    :goto_0
    if-ge p2, p3, :cond_7

    .line 17
    .line 18
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/16 v1, 0x80

    .line 23
    .line 24
    if-ge v0, v1, :cond_1

    .line 25
    .line 26
    const/4 v2, 0x1

    .line 27
    invoke-virtual {p0, v2}, Lokio/e;->c0(I)Lokio/w;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    iget-object v3, v2, Lokio/w;->a:[B

    .line 32
    .line 33
    iget v4, v2, Lokio/w;->c:I

    .line 34
    .line 35
    sub-int/2addr v4, p2

    .line 36
    rsub-int v5, v4, 0x2000

    .line 37
    .line 38
    invoke-static {p3, v5}, Ljava/lang/Math;->min(II)I

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    add-int/lit8 v6, p2, 0x1

    .line 43
    .line 44
    add-int/2addr p2, v4

    .line 45
    int-to-byte v0, v0

    .line 46
    aput-byte v0, v3, p2

    .line 47
    .line 48
    :goto_1
    move p2, v6

    .line 49
    if-ge p2, v5, :cond_0

    .line 50
    .line 51
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-ge v0, v1, :cond_0

    .line 56
    .line 57
    add-int/lit8 v6, p2, 0x1

    .line 58
    .line 59
    add-int/2addr p2, v4

    .line 60
    int-to-byte v0, v0

    .line 61
    aput-byte v0, v3, p2

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_0
    add-int/2addr v4, p2

    .line 65
    iget v0, v2, Lokio/w;->c:I

    .line 66
    .line 67
    sub-int/2addr v4, v0

    .line 68
    add-int/2addr v0, v4

    .line 69
    iput v0, v2, Lokio/w;->c:I

    .line 70
    .line 71
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 72
    .line 73
    .line 74
    move-result-wide v0

    .line 75
    int-to-long v2, v4

    .line 76
    add-long/2addr v0, v2

    .line 77
    invoke-virtual {p0, v0, v1}, Lokio/e;->U(J)V

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_1
    const/16 v2, 0x800

    .line 82
    .line 83
    if-ge v0, v2, :cond_2

    .line 84
    .line 85
    const/4 v2, 0x2

    .line 86
    invoke-virtual {p0, v2}, Lokio/e;->c0(I)Lokio/w;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    iget-object v4, v3, Lokio/w;->a:[B

    .line 91
    .line 92
    iget v5, v3, Lokio/w;->c:I

    .line 93
    .line 94
    shr-int/lit8 v6, v0, 0x6

    .line 95
    .line 96
    or-int/lit16 v6, v6, 0xc0

    .line 97
    .line 98
    int-to-byte v6, v6

    .line 99
    aput-byte v6, v4, v5

    .line 100
    .line 101
    add-int/lit8 v6, v5, 0x1

    .line 102
    .line 103
    and-int/lit8 v0, v0, 0x3f

    .line 104
    .line 105
    or-int/2addr v0, v1

    .line 106
    int-to-byte v0, v0

    .line 107
    aput-byte v0, v4, v6

    .line 108
    .line 109
    add-int/2addr v5, v2

    .line 110
    iput v5, v3, Lokio/w;->c:I

    .line 111
    .line 112
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 113
    .line 114
    .line 115
    move-result-wide v0

    .line 116
    const-wide/16 v2, 0x2

    .line 117
    .line 118
    add-long/2addr v0, v2

    .line 119
    invoke-virtual {p0, v0, v1}, Lokio/e;->U(J)V

    .line 120
    .line 121
    .line 122
    :goto_2
    add-int/lit8 p2, p2, 0x1

    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_2
    const v2, 0xd800

    .line 126
    .line 127
    .line 128
    const/16 v3, 0x3f

    .line 129
    .line 130
    if-lt v0, v2, :cond_6

    .line 131
    .line 132
    const v2, 0xdfff

    .line 133
    .line 134
    .line 135
    if-le v0, v2, :cond_3

    .line 136
    .line 137
    goto :goto_4

    .line 138
    :cond_3
    add-int/lit8 v2, p2, 0x1

    .line 139
    .line 140
    if-ge v2, p3, :cond_4

    .line 141
    .line 142
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    .line 143
    .line 144
    .line 145
    move-result v4

    .line 146
    goto :goto_3

    .line 147
    :cond_4
    const/4 v4, 0x0

    .line 148
    :goto_3
    const v5, 0xdbff

    .line 149
    .line 150
    .line 151
    if-gt v0, v5, :cond_5

    .line 152
    .line 153
    const v5, 0xdc00

    .line 154
    .line 155
    .line 156
    if-gt v5, v4, :cond_5

    .line 157
    .line 158
    const v5, 0xe000

    .line 159
    .line 160
    .line 161
    if-ge v4, v5, :cond_5

    .line 162
    .line 163
    and-int/lit16 v0, v0, 0x3ff

    .line 164
    .line 165
    shl-int/lit8 v0, v0, 0xa

    .line 166
    .line 167
    and-int/lit16 v2, v4, 0x3ff

    .line 168
    .line 169
    or-int/2addr v0, v2

    .line 170
    const/high16 v2, 0x10000

    .line 171
    .line 172
    add-int/2addr v0, v2

    .line 173
    const/4 v2, 0x4

    .line 174
    invoke-virtual {p0, v2}, Lokio/e;->c0(I)Lokio/w;

    .line 175
    .line 176
    .line 177
    move-result-object v4

    .line 178
    iget-object v5, v4, Lokio/w;->a:[B

    .line 179
    .line 180
    iget v6, v4, Lokio/w;->c:I

    .line 181
    .line 182
    shr-int/lit8 v7, v0, 0x12

    .line 183
    .line 184
    or-int/lit16 v7, v7, 0xf0

    .line 185
    .line 186
    int-to-byte v7, v7

    .line 187
    aput-byte v7, v5, v6

    .line 188
    .line 189
    add-int/lit8 v7, v6, 0x1

    .line 190
    .line 191
    shr-int/lit8 v8, v0, 0xc

    .line 192
    .line 193
    and-int/2addr v8, v3

    .line 194
    or-int/2addr v8, v1

    .line 195
    int-to-byte v8, v8

    .line 196
    aput-byte v8, v5, v7

    .line 197
    .line 198
    add-int/lit8 v7, v6, 0x2

    .line 199
    .line 200
    shr-int/lit8 v8, v0, 0x6

    .line 201
    .line 202
    and-int/2addr v8, v3

    .line 203
    or-int/2addr v8, v1

    .line 204
    int-to-byte v8, v8

    .line 205
    aput-byte v8, v5, v7

    .line 206
    .line 207
    add-int/lit8 v7, v6, 0x3

    .line 208
    .line 209
    and-int/2addr v0, v3

    .line 210
    or-int/2addr v0, v1

    .line 211
    int-to-byte v0, v0

    .line 212
    aput-byte v0, v5, v7

    .line 213
    .line 214
    add-int/2addr v6, v2

    .line 215
    iput v6, v4, Lokio/w;->c:I

    .line 216
    .line 217
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 218
    .line 219
    .line 220
    move-result-wide v0

    .line 221
    const-wide/16 v2, 0x4

    .line 222
    .line 223
    add-long/2addr v0, v2

    .line 224
    invoke-virtual {p0, v0, v1}, Lokio/e;->U(J)V

    .line 225
    .line 226
    .line 227
    add-int/lit8 p2, p2, 0x2

    .line 228
    .line 229
    goto/16 :goto_0

    .line 230
    .line 231
    :cond_5
    invoke-virtual {p0, v3}, Lokio/e;->g0(I)Lokio/e;

    .line 232
    .line 233
    .line 234
    move p2, v2

    .line 235
    goto/16 :goto_0

    .line 236
    .line 237
    :cond_6
    :goto_4
    const/4 v2, 0x3

    .line 238
    invoke-virtual {p0, v2}, Lokio/e;->c0(I)Lokio/w;

    .line 239
    .line 240
    .line 241
    move-result-object v4

    .line 242
    iget-object v5, v4, Lokio/w;->a:[B

    .line 243
    .line 244
    iget v6, v4, Lokio/w;->c:I

    .line 245
    .line 246
    shr-int/lit8 v7, v0, 0xc

    .line 247
    .line 248
    or-int/lit16 v7, v7, 0xe0

    .line 249
    .line 250
    int-to-byte v7, v7

    .line 251
    aput-byte v7, v5, v6

    .line 252
    .line 253
    add-int/lit8 v7, v6, 0x1

    .line 254
    .line 255
    shr-int/lit8 v8, v0, 0x6

    .line 256
    .line 257
    and-int/2addr v3, v8

    .line 258
    or-int/2addr v3, v1

    .line 259
    int-to-byte v3, v3

    .line 260
    aput-byte v3, v5, v7

    .line 261
    .line 262
    add-int/lit8 v3, v6, 0x2

    .line 263
    .line 264
    and-int/lit8 v0, v0, 0x3f

    .line 265
    .line 266
    or-int/2addr v0, v1

    .line 267
    int-to-byte v0, v0

    .line 268
    aput-byte v0, v5, v3

    .line 269
    .line 270
    add-int/2addr v6, v2

    .line 271
    iput v6, v4, Lokio/w;->c:I

    .line 272
    .line 273
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 274
    .line 275
    .line 276
    move-result-wide v0

    .line 277
    const-wide/16 v2, 0x3

    .line 278
    .line 279
    add-long/2addr v0, v2

    .line 280
    invoke-virtual {p0, v0, v1}, Lokio/e;->U(J)V

    .line 281
    .line 282
    .line 283
    goto/16 :goto_2

    .line 284
    .line 285
    :cond_7
    return-object p0

    .line 286
    :cond_8
    new-instance p0, Ljava/lang/StringBuilder;

    .line 287
    .line 288
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 289
    .line 290
    .line 291
    const-string p2, "endIndex > string.length: "

    .line 292
    .line 293
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 294
    .line 295
    .line 296
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 297
    .line 298
    .line 299
    const-string p2, " > "

    .line 300
    .line 301
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 302
    .line 303
    .line 304
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 305
    .line 306
    .line 307
    move-result p1

    .line 308
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 309
    .line 310
    .line 311
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 312
    .line 313
    .line 314
    move-result-object p0

    .line 315
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 316
    .line 317
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 318
    .line 319
    .line 320
    move-result-object p0

    .line 321
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 322
    .line 323
    .line 324
    throw p1

    .line 325
    :cond_9
    new-instance p0, Ljava/lang/StringBuilder;

    .line 326
    .line 327
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 328
    .line 329
    .line 330
    const-string p1, "endIndex < beginIndex: "

    .line 331
    .line 332
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 333
    .line 334
    .line 335
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 336
    .line 337
    .line 338
    const-string p1, " < "

    .line 339
    .line 340
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 341
    .line 342
    .line 343
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 344
    .line 345
    .line 346
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 347
    .line 348
    .line 349
    move-result-object p0

    .line 350
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 351
    .line 352
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 353
    .line 354
    .line 355
    move-result-object p0

    .line 356
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 357
    .line 358
    .line 359
    throw p1

    .line 360
    :cond_a
    new-instance p0, Ljava/lang/StringBuilder;

    .line 361
    .line 362
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 363
    .line 364
    .line 365
    const-string p1, "beginIndex < 0: "

    .line 366
    .line 367
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 368
    .line 369
    .line 370
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 371
    .line 372
    .line 373
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 374
    .line 375
    .line 376
    move-result-object p0

    .line 377
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 378
    .line 379
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 380
    .line 381
    .line 382
    move-result-object p0

    .line 383
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 384
    .line 385
    .line 386
    throw p1
.end method

.method public peek()Lokio/g;
    .locals 1

    .line 1
    new-instance v0, Lokio/t;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lokio/t;-><init>(Lokio/g;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lokio/o;->d(Lokio/B;)Lokio/g;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public bridge synthetic q(Ljava/lang/String;)Lokio/f;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lokio/e;->o0(Ljava/lang/String;)Lokio/e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public q0(I)Lokio/e;
    .locals 8

    .line 1
    const/16 v0, 0x80

    .line 2
    .line 3
    if-ge p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lokio/e;->g0(I)Lokio/e;

    .line 6
    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    const/16 v1, 0x800

    .line 10
    .line 11
    const/16 v2, 0x3f

    .line 12
    .line 13
    if-ge p1, v1, :cond_1

    .line 14
    .line 15
    const/4 v1, 0x2

    .line 16
    invoke-virtual {p0, v1}, Lokio/e;->c0(I)Lokio/w;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    iget-object v4, v3, Lokio/w;->a:[B

    .line 21
    .line 22
    iget v5, v3, Lokio/w;->c:I

    .line 23
    .line 24
    shr-int/lit8 v6, p1, 0x6

    .line 25
    .line 26
    or-int/lit16 v6, v6, 0xc0

    .line 27
    .line 28
    int-to-byte v6, v6

    .line 29
    aput-byte v6, v4, v5

    .line 30
    .line 31
    add-int/lit8 v6, v5, 0x1

    .line 32
    .line 33
    and-int/2addr p1, v2

    .line 34
    or-int/2addr p1, v0

    .line 35
    int-to-byte p1, p1

    .line 36
    aput-byte p1, v4, v6

    .line 37
    .line 38
    add-int/2addr v5, v1

    .line 39
    iput v5, v3, Lokio/w;->c:I

    .line 40
    .line 41
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 42
    .line 43
    .line 44
    move-result-wide v0

    .line 45
    const-wide/16 v2, 0x2

    .line 46
    .line 47
    add-long/2addr v0, v2

    .line 48
    invoke-virtual {p0, v0, v1}, Lokio/e;->U(J)V

    .line 49
    .line 50
    .line 51
    return-object p0

    .line 52
    :cond_1
    const v1, 0xd800

    .line 53
    .line 54
    .line 55
    if-gt v1, p1, :cond_2

    .line 56
    .line 57
    const v1, 0xe000

    .line 58
    .line 59
    .line 60
    if-ge p1, v1, :cond_2

    .line 61
    .line 62
    invoke-virtual {p0, v2}, Lokio/e;->g0(I)Lokio/e;

    .line 63
    .line 64
    .line 65
    return-object p0

    .line 66
    :cond_2
    const/high16 v1, 0x10000

    .line 67
    .line 68
    if-ge p1, v1, :cond_3

    .line 69
    .line 70
    const/4 v1, 0x3

    .line 71
    invoke-virtual {p0, v1}, Lokio/e;->c0(I)Lokio/w;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    iget-object v4, v3, Lokio/w;->a:[B

    .line 76
    .line 77
    iget v5, v3, Lokio/w;->c:I

    .line 78
    .line 79
    shr-int/lit8 v6, p1, 0xc

    .line 80
    .line 81
    or-int/lit16 v6, v6, 0xe0

    .line 82
    .line 83
    int-to-byte v6, v6

    .line 84
    aput-byte v6, v4, v5

    .line 85
    .line 86
    add-int/lit8 v6, v5, 0x1

    .line 87
    .line 88
    shr-int/lit8 v7, p1, 0x6

    .line 89
    .line 90
    and-int/2addr v7, v2

    .line 91
    or-int/2addr v7, v0

    .line 92
    int-to-byte v7, v7

    .line 93
    aput-byte v7, v4, v6

    .line 94
    .line 95
    add-int/lit8 v6, v5, 0x2

    .line 96
    .line 97
    and-int/2addr p1, v2

    .line 98
    or-int/2addr p1, v0

    .line 99
    int-to-byte p1, p1

    .line 100
    aput-byte p1, v4, v6

    .line 101
    .line 102
    add-int/2addr v5, v1

    .line 103
    iput v5, v3, Lokio/w;->c:I

    .line 104
    .line 105
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 106
    .line 107
    .line 108
    move-result-wide v0

    .line 109
    const-wide/16 v2, 0x3

    .line 110
    .line 111
    add-long/2addr v0, v2

    .line 112
    invoke-virtual {p0, v0, v1}, Lokio/e;->U(J)V

    .line 113
    .line 114
    .line 115
    return-object p0

    .line 116
    :cond_3
    const v1, 0x10ffff

    .line 117
    .line 118
    .line 119
    if-gt p1, v1, :cond_4

    .line 120
    .line 121
    const/4 v1, 0x4

    .line 122
    invoke-virtual {p0, v1}, Lokio/e;->c0(I)Lokio/w;

    .line 123
    .line 124
    .line 125
    move-result-object v3

    .line 126
    iget-object v4, v3, Lokio/w;->a:[B

    .line 127
    .line 128
    iget v5, v3, Lokio/w;->c:I

    .line 129
    .line 130
    shr-int/lit8 v6, p1, 0x12

    .line 131
    .line 132
    or-int/lit16 v6, v6, 0xf0

    .line 133
    .line 134
    int-to-byte v6, v6

    .line 135
    aput-byte v6, v4, v5

    .line 136
    .line 137
    add-int/lit8 v6, v5, 0x1

    .line 138
    .line 139
    shr-int/lit8 v7, p1, 0xc

    .line 140
    .line 141
    and-int/2addr v7, v2

    .line 142
    or-int/2addr v7, v0

    .line 143
    int-to-byte v7, v7

    .line 144
    aput-byte v7, v4, v6

    .line 145
    .line 146
    add-int/lit8 v6, v5, 0x2

    .line 147
    .line 148
    shr-int/lit8 v7, p1, 0x6

    .line 149
    .line 150
    and-int/2addr v7, v2

    .line 151
    or-int/2addr v7, v0

    .line 152
    int-to-byte v7, v7

    .line 153
    aput-byte v7, v4, v6

    .line 154
    .line 155
    add-int/lit8 v6, v5, 0x3

    .line 156
    .line 157
    and-int/2addr p1, v2

    .line 158
    or-int/2addr p1, v0

    .line 159
    int-to-byte p1, p1

    .line 160
    aput-byte p1, v4, v6

    .line 161
    .line 162
    add-int/2addr v5, v1

    .line 163
    iput v5, v3, Lokio/w;->c:I

    .line 164
    .line 165
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 166
    .line 167
    .line 168
    move-result-wide v0

    .line 169
    const-wide/16 v2, 0x4

    .line 170
    .line 171
    add-long/2addr v0, v2

    .line 172
    invoke-virtual {p0, v0, v1}, Lokio/e;->U(J)V

    .line 173
    .line 174
    .line 175
    return-object p0

    .line 176
    :cond_4
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 177
    .line 178
    new-instance v0, Ljava/lang/StringBuilder;

    .line 179
    .line 180
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 181
    .line 182
    .line 183
    const-string v1, "Unexpected code point: 0x"

    .line 184
    .line 185
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-static {p1}, Lokio/b;->h(I)Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    throw p0
.end method

.method public read(Ljava/nio/ByteBuffer;)I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    const-string v0, "sink"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    iget-object v0, p0, Lokio/e;->g:Lokio/w;

    if-nez v0, :cond_0

    const/4 p0, -0x1

    return p0

    .line 2
    :cond_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    iget v2, v0, Lokio/w;->c:I

    iget v3, v0, Lokio/w;->b:I

    sub-int/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 3
    iget-object v2, v0, Lokio/w;->a:[B

    iget v3, v0, Lokio/w;->b:I

    invoke-virtual {p1, v2, v3, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 4
    iget p1, v0, Lokio/w;->b:I

    add-int/2addr p1, v1

    iput p1, v0, Lokio/w;->b:I

    .line 5
    iget-wide v2, p0, Lokio/e;->h:J

    int-to-long v4, v1

    sub-long/2addr v2, v4

    iput-wide v2, p0, Lokio/e;->h:J

    .line 6
    iget v2, v0, Lokio/w;->c:I

    if-ne p1, v2, :cond_1

    .line 7
    invoke-virtual {v0}, Lokio/w;->b()Lokio/w;

    move-result-object p1

    iput-object p1, p0, Lokio/e;->g:Lokio/w;

    .line 8
    invoke-static {v0}, Lokio/x;->b(Lokio/w;)V

    :cond_1
    return v1
.end method

.method public read([BII)I
    .locals 7

    const-string v0, "sink"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    array-length v0, p1

    int-to-long v1, v0

    int-to-long v3, p2

    int-to-long v5, p3

    invoke-static/range {v1 .. v6}, Lokio/b;->b(JJJ)V

    .line 10
    iget-object v0, p0, Lokio/e;->g:Lokio/w;

    if-nez v0, :cond_0

    const/4 p0, -0x1

    return p0

    .line 11
    :cond_0
    iget v1, v0, Lokio/w;->c:I

    iget v2, v0, Lokio/w;->b:I

    sub-int/2addr v1, v2

    invoke-static {p3, v1}, Ljava/lang/Math;->min(II)I

    move-result p3

    .line 12
    iget-object v1, v0, Lokio/w;->a:[B

    .line 13
    iget v2, v0, Lokio/w;->b:I

    add-int v3, v2, p3

    .line 14
    invoke-static {v1, p1, p2, v2, v3}, Li4/g;->d([B[BIII)[B

    .line 15
    iget p1, v0, Lokio/w;->b:I

    add-int/2addr p1, p3

    iput p1, v0, Lokio/w;->b:I

    .line 16
    invoke-virtual {p0}, Lokio/e;->size()J

    move-result-wide p1

    int-to-long v1, p3

    sub-long/2addr p1, v1

    invoke-virtual {p0, p1, p2}, Lokio/e;->U(J)V

    .line 17
    iget p1, v0, Lokio/w;->b:I

    iget p2, v0, Lokio/w;->c:I

    if-ne p1, p2, :cond_1

    .line 18
    invoke-virtual {v0}, Lokio/w;->b()Lokio/w;

    move-result-object p1

    iput-object p1, p0, Lokio/e;->g:Lokio/w;

    .line 19
    invoke-static {v0}, Lokio/x;->b(Lokio/w;)V

    :cond_1
    return p3
.end method

.method public read(Lokio/e;J)J
    .locals 4

    const-string v0, "sink"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-ltz v2, :cond_2

    .line 20
    invoke-virtual {p0}, Lokio/e;->size()J

    move-result-wide v2

    cmp-long v0, v2, v0

    if-nez v0, :cond_0

    const-wide/16 p0, -0x1

    return-wide p0

    .line 21
    :cond_0
    invoke-virtual {p0}, Lokio/e;->size()J

    move-result-wide v0

    cmp-long v0, p2, v0

    if-lez v0, :cond_1

    invoke-virtual {p0}, Lokio/e;->size()J

    move-result-wide p2

    .line 22
    :cond_1
    invoke-virtual {p1, p0, p2, p3}, Lokio/e;->write(Lokio/e;J)V

    return-wide p2

    .line 23
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "byteCount < 0: "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public readByte()B
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lokio/e;->g:Lokio/w;

    .line 12
    .line 13
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iget v1, v0, Lokio/w;->b:I

    .line 17
    .line 18
    iget v2, v0, Lokio/w;->c:I

    .line 19
    .line 20
    iget-object v3, v0, Lokio/w;->a:[B

    .line 21
    .line 22
    add-int/lit8 v4, v1, 0x1

    .line 23
    .line 24
    aget-byte v1, v3, v1

    .line 25
    .line 26
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 27
    .line 28
    .line 29
    move-result-wide v5

    .line 30
    const-wide/16 v7, 0x1

    .line 31
    .line 32
    sub-long/2addr v5, v7

    .line 33
    invoke-virtual {p0, v5, v6}, Lokio/e;->U(J)V

    .line 34
    .line 35
    .line 36
    if-ne v4, v2, :cond_0

    .line 37
    .line 38
    invoke-virtual {v0}, Lokio/w;->b()Lokio/w;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    iput-object v2, p0, Lokio/e;->g:Lokio/w;

    .line 43
    .line 44
    invoke-static {v0}, Lokio/x;->b(Lokio/w;)V

    .line 45
    .line 46
    .line 47
    return v1

    .line 48
    :cond_0
    iput v4, v0, Lokio/w;->b:I

    .line 49
    .line 50
    return v1

    .line 51
    :cond_1
    new-instance p0, Ljava/io/EOFException;

    .line 52
    .line 53
    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    .line 54
    .line 55
    .line 56
    throw p0
.end method

.method public readFully([B)V
    .locals 3
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
    const/4 v0, 0x0

    .line 7
    :goto_0
    array-length v1, p1

    .line 8
    if-ge v0, v1, :cond_1

    .line 9
    .line 10
    array-length v1, p1

    .line 11
    sub-int/2addr v1, v0

    .line 12
    invoke-virtual {p0, p1, v0, v1}, Lokio/e;->read([BII)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/4 v2, -0x1

    .line 17
    if-eq v1, v2, :cond_0

    .line 18
    .line 19
    add-int/2addr v0, v1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    new-instance p0, Ljava/io/EOFException;

    .line 22
    .line 23
    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    .line 24
    .line 25
    .line 26
    throw p0

    .line 27
    :cond_1
    return-void
.end method

.method public readInt()I
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x4

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-ltz v0, :cond_2

    .line 10
    .line 11
    iget-object v0, p0, Lokio/e;->g:Lokio/w;

    .line 12
    .line 13
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iget v1, v0, Lokio/w;->b:I

    .line 17
    .line 18
    iget v4, v0, Lokio/w;->c:I

    .line 19
    .line 20
    sub-int v5, v4, v1

    .line 21
    .line 22
    int-to-long v5, v5

    .line 23
    cmp-long v5, v5, v2

    .line 24
    .line 25
    if-gez v5, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0}, Lokio/e;->readByte()B

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    and-int/lit16 v0, v0, 0xff

    .line 32
    .line 33
    shl-int/lit8 v0, v0, 0x18

    .line 34
    .line 35
    invoke-virtual {p0}, Lokio/e;->readByte()B

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    and-int/lit16 v1, v1, 0xff

    .line 40
    .line 41
    shl-int/lit8 v1, v1, 0x10

    .line 42
    .line 43
    or-int/2addr v0, v1

    .line 44
    invoke-virtual {p0}, Lokio/e;->readByte()B

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    and-int/lit16 v1, v1, 0xff

    .line 49
    .line 50
    shl-int/lit8 v1, v1, 0x8

    .line 51
    .line 52
    or-int/2addr v0, v1

    .line 53
    invoke-virtual {p0}, Lokio/e;->readByte()B

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    and-int/lit16 p0, p0, 0xff

    .line 58
    .line 59
    or-int/2addr p0, v0

    .line 60
    return p0

    .line 61
    :cond_0
    iget-object v5, v0, Lokio/w;->a:[B

    .line 62
    .line 63
    add-int/lit8 v6, v1, 0x1

    .line 64
    .line 65
    aget-byte v7, v5, v1

    .line 66
    .line 67
    and-int/lit16 v7, v7, 0xff

    .line 68
    .line 69
    shl-int/lit8 v7, v7, 0x18

    .line 70
    .line 71
    add-int/lit8 v8, v1, 0x2

    .line 72
    .line 73
    aget-byte v6, v5, v6

    .line 74
    .line 75
    and-int/lit16 v6, v6, 0xff

    .line 76
    .line 77
    shl-int/lit8 v6, v6, 0x10

    .line 78
    .line 79
    or-int/2addr v6, v7

    .line 80
    add-int/lit8 v7, v1, 0x3

    .line 81
    .line 82
    aget-byte v8, v5, v8

    .line 83
    .line 84
    and-int/lit16 v8, v8, 0xff

    .line 85
    .line 86
    shl-int/lit8 v8, v8, 0x8

    .line 87
    .line 88
    or-int/2addr v6, v8

    .line 89
    add-int/lit8 v1, v1, 0x4

    .line 90
    .line 91
    aget-byte v5, v5, v7

    .line 92
    .line 93
    and-int/lit16 v5, v5, 0xff

    .line 94
    .line 95
    or-int/2addr v5, v6

    .line 96
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 97
    .line 98
    .line 99
    move-result-wide v6

    .line 100
    sub-long/2addr v6, v2

    .line 101
    invoke-virtual {p0, v6, v7}, Lokio/e;->U(J)V

    .line 102
    .line 103
    .line 104
    if-ne v1, v4, :cond_1

    .line 105
    .line 106
    invoke-virtual {v0}, Lokio/w;->b()Lokio/w;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    iput-object v1, p0, Lokio/e;->g:Lokio/w;

    .line 111
    .line 112
    invoke-static {v0}, Lokio/x;->b(Lokio/w;)V

    .line 113
    .line 114
    .line 115
    return v5

    .line 116
    :cond_1
    iput v1, v0, Lokio/w;->b:I

    .line 117
    .line 118
    return v5

    .line 119
    :cond_2
    new-instance p0, Ljava/io/EOFException;

    .line 120
    .line 121
    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    .line 122
    .line 123
    .line 124
    throw p0
.end method

.method public readLong()J
    .locals 15
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x8

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-ltz v0, :cond_2

    .line 10
    .line 11
    iget-object v0, p0, Lokio/e;->g:Lokio/w;

    .line 12
    .line 13
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iget v1, v0, Lokio/w;->b:I

    .line 17
    .line 18
    iget v4, v0, Lokio/w;->c:I

    .line 19
    .line 20
    sub-int v5, v4, v1

    .line 21
    .line 22
    int-to-long v5, v5

    .line 23
    cmp-long v5, v5, v2

    .line 24
    .line 25
    const/16 v6, 0x20

    .line 26
    .line 27
    if-gez v5, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0}, Lokio/e;->readInt()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    int-to-long v0, v0

    .line 34
    const-wide v2, 0xffffffffL

    .line 35
    .line 36
    .line 37
    .line 38
    .line 39
    and-long/2addr v0, v2

    .line 40
    shl-long/2addr v0, v6

    .line 41
    invoke-virtual {p0}, Lokio/e;->readInt()I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    int-to-long v4, p0

    .line 46
    and-long/2addr v2, v4

    .line 47
    or-long/2addr v0, v2

    .line 48
    return-wide v0

    .line 49
    :cond_0
    iget-object v5, v0, Lokio/w;->a:[B

    .line 50
    .line 51
    add-int/lit8 v7, v1, 0x1

    .line 52
    .line 53
    aget-byte v8, v5, v1

    .line 54
    .line 55
    int-to-long v8, v8

    .line 56
    const-wide/16 v10, 0xff

    .line 57
    .line 58
    and-long/2addr v8, v10

    .line 59
    const/16 v12, 0x38

    .line 60
    .line 61
    shl-long/2addr v8, v12

    .line 62
    add-int/lit8 v12, v1, 0x2

    .line 63
    .line 64
    aget-byte v7, v5, v7

    .line 65
    .line 66
    int-to-long v13, v7

    .line 67
    and-long/2addr v13, v10

    .line 68
    const/16 v7, 0x30

    .line 69
    .line 70
    shl-long/2addr v13, v7

    .line 71
    or-long v7, v8, v13

    .line 72
    .line 73
    add-int/lit8 v9, v1, 0x3

    .line 74
    .line 75
    aget-byte v12, v5, v12

    .line 76
    .line 77
    int-to-long v12, v12

    .line 78
    and-long/2addr v12, v10

    .line 79
    const/16 v14, 0x28

    .line 80
    .line 81
    shl-long/2addr v12, v14

    .line 82
    or-long/2addr v7, v12

    .line 83
    add-int/lit8 v12, v1, 0x4

    .line 84
    .line 85
    aget-byte v9, v5, v9

    .line 86
    .line 87
    int-to-long v13, v9

    .line 88
    and-long/2addr v13, v10

    .line 89
    shl-long/2addr v13, v6

    .line 90
    or-long v6, v7, v13

    .line 91
    .line 92
    add-int/lit8 v8, v1, 0x5

    .line 93
    .line 94
    aget-byte v9, v5, v12

    .line 95
    .line 96
    int-to-long v12, v9

    .line 97
    and-long/2addr v12, v10

    .line 98
    const/16 v9, 0x18

    .line 99
    .line 100
    shl-long/2addr v12, v9

    .line 101
    or-long/2addr v6, v12

    .line 102
    add-int/lit8 v9, v1, 0x6

    .line 103
    .line 104
    aget-byte v8, v5, v8

    .line 105
    .line 106
    int-to-long v12, v8

    .line 107
    and-long/2addr v12, v10

    .line 108
    const/16 v8, 0x10

    .line 109
    .line 110
    shl-long/2addr v12, v8

    .line 111
    or-long/2addr v6, v12

    .line 112
    add-int/lit8 v8, v1, 0x7

    .line 113
    .line 114
    aget-byte v9, v5, v9

    .line 115
    .line 116
    int-to-long v12, v9

    .line 117
    and-long/2addr v12, v10

    .line 118
    const/16 v9, 0x8

    .line 119
    .line 120
    shl-long/2addr v12, v9

    .line 121
    or-long/2addr v6, v12

    .line 122
    add-int/2addr v1, v9

    .line 123
    aget-byte v5, v5, v8

    .line 124
    .line 125
    int-to-long v8, v5

    .line 126
    and-long/2addr v8, v10

    .line 127
    or-long v5, v6, v8

    .line 128
    .line 129
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 130
    .line 131
    .line 132
    move-result-wide v7

    .line 133
    sub-long/2addr v7, v2

    .line 134
    invoke-virtual {p0, v7, v8}, Lokio/e;->U(J)V

    .line 135
    .line 136
    .line 137
    if-ne v1, v4, :cond_1

    .line 138
    .line 139
    invoke-virtual {v0}, Lokio/w;->b()Lokio/w;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    iput-object v1, p0, Lokio/e;->g:Lokio/w;

    .line 144
    .line 145
    invoke-static {v0}, Lokio/x;->b(Lokio/w;)V

    .line 146
    .line 147
    .line 148
    return-wide v5

    .line 149
    :cond_1
    iput v1, v0, Lokio/w;->b:I

    .line 150
    .line 151
    return-wide v5

    .line 152
    :cond_2
    new-instance p0, Ljava/io/EOFException;

    .line 153
    .line 154
    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    .line 155
    .line 156
    .line 157
    throw p0
.end method

.method public readShort()S
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x2

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-ltz v0, :cond_2

    .line 10
    .line 11
    iget-object v0, p0, Lokio/e;->g:Lokio/w;

    .line 12
    .line 13
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iget v1, v0, Lokio/w;->b:I

    .line 17
    .line 18
    iget v4, v0, Lokio/w;->c:I

    .line 19
    .line 20
    sub-int v5, v4, v1

    .line 21
    .line 22
    const/4 v6, 0x2

    .line 23
    if-ge v5, v6, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Lokio/e;->readByte()B

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    and-int/lit16 v0, v0, 0xff

    .line 30
    .line 31
    shl-int/lit8 v0, v0, 0x8

    .line 32
    .line 33
    invoke-virtual {p0}, Lokio/e;->readByte()B

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    and-int/lit16 p0, p0, 0xff

    .line 38
    .line 39
    or-int/2addr p0, v0

    .line 40
    int-to-short p0, p0

    .line 41
    return p0

    .line 42
    :cond_0
    iget-object v5, v0, Lokio/w;->a:[B

    .line 43
    .line 44
    add-int/lit8 v7, v1, 0x1

    .line 45
    .line 46
    aget-byte v8, v5, v1

    .line 47
    .line 48
    and-int/lit16 v8, v8, 0xff

    .line 49
    .line 50
    shl-int/lit8 v8, v8, 0x8

    .line 51
    .line 52
    add-int/2addr v1, v6

    .line 53
    aget-byte v5, v5, v7

    .line 54
    .line 55
    and-int/lit16 v5, v5, 0xff

    .line 56
    .line 57
    or-int/2addr v5, v8

    .line 58
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 59
    .line 60
    .line 61
    move-result-wide v6

    .line 62
    sub-long/2addr v6, v2

    .line 63
    invoke-virtual {p0, v6, v7}, Lokio/e;->U(J)V

    .line 64
    .line 65
    .line 66
    if-ne v1, v4, :cond_1

    .line 67
    .line 68
    invoke-virtual {v0}, Lokio/w;->b()Lokio/w;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    iput-object v1, p0, Lokio/e;->g:Lokio/w;

    .line 73
    .line 74
    invoke-static {v0}, Lokio/x;->b(Lokio/w;)V

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_1
    iput v1, v0, Lokio/w;->b:I

    .line 79
    .line 80
    :goto_0
    int-to-short p0, v5

    .line 81
    return p0

    .line 82
    :cond_2
    new-instance p0, Ljava/io/EOFException;

    .line 83
    .line 84
    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    .line 85
    .line 86
    .line 87
    throw p0
.end method

.method public request(J)Z
    .locals 2

    .line 1
    iget-wide v0, p0, Lokio/e;->h:J

    .line 2
    .line 3
    cmp-long p0, v0, p1

    .line 4
    .line 5
    if-ltz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public bridge synthetic s(Ljava/lang/String;II)Lokio/f;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lokio/e;->p0(Ljava/lang/String;II)Lokio/e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final size()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lokio/e;->h:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public skip(J)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    :cond_0
    :goto_0
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-lez v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Lokio/e;->g:Lokio/w;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget v1, v0, Lokio/w;->c:I

    .line 12
    .line 13
    iget v2, v0, Lokio/w;->b:I

    .line 14
    .line 15
    sub-int/2addr v1, v2

    .line 16
    int-to-long v1, v1

    .line 17
    invoke-static {p1, p2, v1, v2}, Ljava/lang/Math;->min(JJ)J

    .line 18
    .line 19
    .line 20
    move-result-wide v1

    .line 21
    long-to-int v1, v1

    .line 22
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 23
    .line 24
    .line 25
    move-result-wide v2

    .line 26
    int-to-long v4, v1

    .line 27
    sub-long/2addr v2, v4

    .line 28
    invoke-virtual {p0, v2, v3}, Lokio/e;->U(J)V

    .line 29
    .line 30
    .line 31
    sub-long/2addr p1, v4

    .line 32
    iget v2, v0, Lokio/w;->b:I

    .line 33
    .line 34
    add-int/2addr v2, v1

    .line 35
    iput v2, v0, Lokio/w;->b:I

    .line 36
    .line 37
    iget v1, v0, Lokio/w;->c:I

    .line 38
    .line 39
    if-ne v2, v1, :cond_0

    .line 40
    .line 41
    invoke-virtual {v0}, Lokio/w;->b()Lokio/w;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    iput-object v1, p0, Lokio/e;->g:Lokio/w;

    .line 46
    .line 47
    invoke-static {v0}, Lokio/x;->b(Lokio/w;)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    new-instance p0, Ljava/io/EOFException;

    .line 52
    .line 53
    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    .line 54
    .line 55
    .line 56
    throw p0

    .line 57
    :cond_2
    return-void
.end method

.method public final t(Lokio/e;JJ)Lokio/e;
    .locals 7

    .line 1
    const-string v0, "out"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    move-wide v3, p2

    .line 11
    move-wide v5, p4

    .line 12
    invoke-static/range {v1 .. v6}, Lokio/b;->b(JJJ)V

    .line 13
    .line 14
    .line 15
    const-wide/16 p2, 0x0

    .line 16
    .line 17
    cmp-long p4, v5, p2

    .line 18
    .line 19
    if-nez p4, :cond_0

    .line 20
    .line 21
    goto :goto_3

    .line 22
    :cond_0
    invoke-virtual {p1}, Lokio/e;->size()J

    .line 23
    .line 24
    .line 25
    move-result-wide p4

    .line 26
    add-long/2addr p4, v5

    .line 27
    invoke-virtual {p1, p4, p5}, Lokio/e;->U(J)V

    .line 28
    .line 29
    .line 30
    iget-object p4, p0, Lokio/e;->g:Lokio/w;

    .line 31
    .line 32
    :goto_0
    invoke-static {p4}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    iget p5, p4, Lokio/w;->c:I

    .line 36
    .line 37
    iget v0, p4, Lokio/w;->b:I

    .line 38
    .line 39
    sub-int v1, p5, v0

    .line 40
    .line 41
    int-to-long v1, v1

    .line 42
    cmp-long v1, v3, v1

    .line 43
    .line 44
    if-ltz v1, :cond_1

    .line 45
    .line 46
    sub-int/2addr p5, v0

    .line 47
    int-to-long v0, p5

    .line 48
    sub-long/2addr v3, v0

    .line 49
    iget-object p4, p4, Lokio/w;->f:Lokio/w;

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    move-object v0, p4

    .line 53
    move-wide p4, v5

    .line 54
    :goto_1
    cmp-long v1, p4, p2

    .line 55
    .line 56
    if-lez v1, :cond_3

    .line 57
    .line 58
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0}, Lokio/w;->d()Lokio/w;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    iget v2, v1, Lokio/w;->b:I

    .line 66
    .line 67
    long-to-int v3, v3

    .line 68
    add-int/2addr v2, v3

    .line 69
    iput v2, v1, Lokio/w;->b:I

    .line 70
    .line 71
    long-to-int v3, p4

    .line 72
    add-int/2addr v2, v3

    .line 73
    iget v3, v1, Lokio/w;->c:I

    .line 74
    .line 75
    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    iput v2, v1, Lokio/w;->c:I

    .line 80
    .line 81
    iget-object v2, p1, Lokio/e;->g:Lokio/w;

    .line 82
    .line 83
    if-nez v2, :cond_2

    .line 84
    .line 85
    iput-object v1, v1, Lokio/w;->g:Lokio/w;

    .line 86
    .line 87
    iput-object v1, v1, Lokio/w;->f:Lokio/w;

    .line 88
    .line 89
    iput-object v1, p1, Lokio/e;->g:Lokio/w;

    .line 90
    .line 91
    goto :goto_2

    .line 92
    :cond_2
    invoke-static {v2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 93
    .line 94
    .line 95
    iget-object v2, v2, Lokio/w;->g:Lokio/w;

    .line 96
    .line 97
    invoke-static {v2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v2, v1}, Lokio/w;->c(Lokio/w;)Lokio/w;

    .line 101
    .line 102
    .line 103
    :goto_2
    iget v2, v1, Lokio/w;->c:I

    .line 104
    .line 105
    iget v1, v1, Lokio/w;->b:I

    .line 106
    .line 107
    sub-int/2addr v2, v1

    .line 108
    int-to-long v1, v2

    .line 109
    sub-long/2addr p4, v1

    .line 110
    iget-object v0, v0, Lokio/w;->f:Lokio/w;

    .line 111
    .line 112
    move-wide v3, p2

    .line 113
    goto :goto_1

    .line 114
    :cond_3
    :goto_3
    return-object p0
.end method

.method public timeout()Lokio/C;
    .locals 0

    .line 1
    sget-object p0, Lokio/C;->NONE:Lokio/C;

    .line 2
    .line 3
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lokio/e;->a0()Lokio/h;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lokio/h;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public u(Lokio/B;)J
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const-string v0, "source"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    :goto_0
    const-wide/16 v2, 0x2000

    .line 9
    .line 10
    invoke-interface {p1, p0, v2, v3}, Lokio/B;->read(Lokio/e;J)J

    .line 11
    .line 12
    .line 13
    move-result-wide v2

    .line 14
    const-wide/16 v4, -0x1

    .line 15
    .line 16
    cmp-long v4, v2, v4

    .line 17
    .line 18
    if-eqz v4, :cond_0

    .line 19
    .line 20
    add-long/2addr v0, v2

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return-wide v0
.end method

.method public v()Lokio/e;
    .locals 0

    .line 1
    return-object p0
.end method

.method public w()Lokio/e;
    .locals 0

    .line 1
    return-object p0
.end method

.method public write(Ljava/nio/ByteBuffer;)I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    const-string v0, "source"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 3
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    move v1, v0

    :goto_0
    if-lez v1, :cond_0

    const/4 v2, 0x1

    .line 4
    invoke-virtual {p0, v2}, Lokio/e;->c0(I)Lokio/w;

    move-result-object v2

    .line 5
    iget v3, v2, Lokio/w;->c:I

    rsub-int v3, v3, 0x2000

    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 6
    iget-object v4, v2, Lokio/w;->a:[B

    iget v5, v2, Lokio/w;->c:I

    invoke-virtual {p1, v4, v5, v3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    sub-int/2addr v1, v3

    .line 7
    iget v4, v2, Lokio/w;->c:I

    add-int/2addr v4, v3

    iput v4, v2, Lokio/w;->c:I

    goto :goto_0

    .line 8
    :cond_0
    iget-wide v1, p0, Lokio/e;->h:J

    int-to-long v3, v0

    add-long/2addr v1, v3

    iput-wide v1, p0, Lokio/e;->h:J

    return v0
.end method

.method public bridge synthetic write([B)Lokio/f;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lokio/e;->e0([B)Lokio/e;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic write([BII)Lokio/f;
    .locals 0

    .line 2
    invoke-virtual {p0, p1, p2, p3}, Lokio/e;->f0([BII)Lokio/e;

    move-result-object p0

    return-object p0
.end method

.method public write(Lokio/e;J)V
    .locals 7

    const-string v0, "source"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    if-eq p1, p0, :cond_6

    .line 9
    invoke-virtual {p1}, Lokio/e;->size()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    move-wide v5, p2

    invoke-static/range {v1 .. v6}, Lokio/b;->b(JJJ)V

    :goto_0
    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-lez v0, :cond_5

    .line 10
    iget-object v0, p1, Lokio/e;->g:Lokio/w;

    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    iget v0, v0, Lokio/w;->c:I

    iget-object v1, p1, Lokio/e;->g:Lokio/w;

    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    iget v1, v1, Lokio/w;->b:I

    sub-int/2addr v0, v1

    int-to-long v0, v0

    cmp-long v0, p2, v0

    if-gez v0, :cond_3

    .line 11
    iget-object v0, p0, Lokio/e;->g:Lokio/w;

    if-eqz v0, :cond_0

    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    iget-object v0, v0, Lokio/w;->g:Lokio/w;

    goto :goto_1

    :cond_0
    const/4 v0, 0x0

    :goto_1
    if-eqz v0, :cond_2

    .line 12
    iget-boolean v1, v0, Lokio/w;->e:Z

    if-eqz v1, :cond_2

    .line 13
    iget v1, v0, Lokio/w;->c:I

    int-to-long v1, v1

    add-long/2addr v1, p2

    iget-boolean v3, v0, Lokio/w;->d:Z

    if-eqz v3, :cond_1

    const/4 v3, 0x0

    goto :goto_2

    :cond_1
    iget v3, v0, Lokio/w;->b:I

    :goto_2
    int-to-long v3, v3

    sub-long/2addr v1, v3

    const-wide/16 v3, 0x2000

    cmp-long v1, v1, v3

    if-gtz v1, :cond_2

    .line 14
    iget-object v1, p1, Lokio/e;->g:Lokio/w;

    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    long-to-int v2, p2

    invoke-virtual {v1, v0, v2}, Lokio/w;->g(Lokio/w;I)V

    .line 15
    invoke-virtual {p1}, Lokio/e;->size()J

    move-result-wide v0

    sub-long/2addr v0, p2

    invoke-virtual {p1, v0, v1}, Lokio/e;->U(J)V

    .line 16
    invoke-virtual {p0}, Lokio/e;->size()J

    move-result-wide v0

    add-long/2addr v0, p2

    invoke-virtual {p0, v0, v1}, Lokio/e;->U(J)V

    return-void

    .line 17
    :cond_2
    iget-object v0, p1, Lokio/e;->g:Lokio/w;

    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    long-to-int v1, p2

    invoke-virtual {v0, v1}, Lokio/w;->e(I)Lokio/w;

    move-result-object v0

    iput-object v0, p1, Lokio/e;->g:Lokio/w;

    .line 18
    :cond_3
    iget-object v0, p1, Lokio/e;->g:Lokio/w;

    .line 19
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    iget v1, v0, Lokio/w;->c:I

    iget v2, v0, Lokio/w;->b:I

    sub-int/2addr v1, v2

    int-to-long v1, v1

    .line 20
    invoke-virtual {v0}, Lokio/w;->b()Lokio/w;

    move-result-object v3

    iput-object v3, p1, Lokio/e;->g:Lokio/w;

    .line 21
    iget-object v3, p0, Lokio/e;->g:Lokio/w;

    if-nez v3, :cond_4

    .line 22
    iput-object v0, p0, Lokio/e;->g:Lokio/w;

    .line 23
    iput-object v0, v0, Lokio/w;->g:Lokio/w;

    .line 24
    iput-object v0, v0, Lokio/w;->f:Lokio/w;

    goto :goto_3

    .line 25
    :cond_4
    invoke-static {v3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    iget-object v3, v3, Lokio/w;->g:Lokio/w;

    .line 26
    invoke-static {v3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    invoke-virtual {v3, v0}, Lokio/w;->c(Lokio/w;)Lokio/w;

    move-result-object v0

    .line 27
    invoke-virtual {v0}, Lokio/w;->a()V

    .line 28
    :goto_3
    invoke-virtual {p1}, Lokio/e;->size()J

    move-result-wide v3

    sub-long/2addr v3, v1

    invoke-virtual {p1, v3, v4}, Lokio/e;->U(J)V

    .line 29
    invoke-virtual {p0}, Lokio/e;->size()J

    move-result-wide v3

    add-long/2addr v3, v1

    invoke-virtual {p0, v3, v4}, Lokio/e;->U(J)V

    sub-long/2addr p2, v1

    goto/16 :goto_0

    :cond_5
    return-void

    .line 30
    :cond_6
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "source == this"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public bridge synthetic writeByte(I)Lokio/f;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lokio/e;->g0(I)Lokio/e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic writeInt(I)Lokio/f;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lokio/e;->j0(I)Lokio/e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic writeShort(I)Lokio/f;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lokio/e;->l0(I)Lokio/e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public x()Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const-wide v0, 0x7fffffffffffffffL

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0, v1}, Lokio/e;->o(J)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public y(J)[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-ltz v0, :cond_1

    .line 6
    .line 7
    const-wide/32 v0, 0x7fffffff

    .line 8
    .line 9
    .line 10
    cmp-long v0, p1, v0

    .line 11
    .line 12
    if-gtz v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    cmp-long v0, v0, p1

    .line 19
    .line 20
    if-ltz v0, :cond_0

    .line 21
    .line 22
    long-to-int p1, p1

    .line 23
    new-array p1, p1, [B

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lokio/e;->readFully([B)V

    .line 26
    .line 27
    .line 28
    return-object p1

    .line 29
    :cond_0
    new-instance p0, Ljava/io/EOFException;

    .line 30
    .line 31
    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    .line 32
    .line 33
    .line 34
    throw p0

    .line 35
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    .line 39
    .line 40
    const-string v0, "byteCount: "

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    throw p1
.end method
