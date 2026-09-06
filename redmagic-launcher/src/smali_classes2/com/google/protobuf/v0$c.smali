.class final Lcom/google/protobuf/v0$c;
.super Lcom/google/protobuf/v0$b;
.source "Utf8.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/protobuf/v0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "c"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/protobuf/v0$b;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static m([BII)I
    .locals 1

    .line 1
    :goto_0
    if-ge p1, p2, :cond_0

    .line 2
    .line 3
    aget-byte v0, p0, p1

    .line 4
    .line 5
    if-ltz v0, :cond_0

    .line 6
    .line 7
    add-int/lit8 p1, p1, 0x1

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    if-lt p1, p2, :cond_1

    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    invoke-static {p0, p1, p2}, Lcom/google/protobuf/v0$c;->n([BII)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method private static n([BII)I
    .locals 7

    .line 1
    :cond_0
    :goto_0
    if-lt p1, p2, :cond_1

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_1
    add-int/lit8 v0, p1, 0x1

    .line 6
    .line 7
    aget-byte v1, p0, p1

    .line 8
    .line 9
    if-gez v1, :cond_c

    .line 10
    .line 11
    const/16 v2, -0x20

    .line 12
    .line 13
    const/4 v3, -0x1

    .line 14
    const/16 v4, -0x41

    .line 15
    .line 16
    if-ge v1, v2, :cond_4

    .line 17
    .line 18
    if-lt v0, p2, :cond_2

    .line 19
    .line 20
    return v1

    .line 21
    :cond_2
    const/16 v2, -0x3e

    .line 22
    .line 23
    if-lt v1, v2, :cond_3

    .line 24
    .line 25
    add-int/lit8 p1, p1, 0x2

    .line 26
    .line 27
    aget-byte v0, p0, v0

    .line 28
    .line 29
    if-le v0, v4, :cond_0

    .line 30
    .line 31
    :cond_3
    return v3

    .line 32
    :cond_4
    const/16 v5, -0x10

    .line 33
    .line 34
    if-ge v1, v5, :cond_9

    .line 35
    .line 36
    add-int/lit8 v5, p2, -0x1

    .line 37
    .line 38
    if-lt v0, v5, :cond_5

    .line 39
    .line 40
    invoke-static {p0, v0, p2}, Lcom/google/protobuf/v0;->c([BII)I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    return p0

    .line 45
    :cond_5
    add-int/lit8 v5, p1, 0x2

    .line 46
    .line 47
    aget-byte v0, p0, v0

    .line 48
    .line 49
    if-gt v0, v4, :cond_8

    .line 50
    .line 51
    const/16 v6, -0x60

    .line 52
    .line 53
    if-ne v1, v2, :cond_6

    .line 54
    .line 55
    if-lt v0, v6, :cond_8

    .line 56
    .line 57
    :cond_6
    const/16 v2, -0x13

    .line 58
    .line 59
    if-ne v1, v2, :cond_7

    .line 60
    .line 61
    if-ge v0, v6, :cond_8

    .line 62
    .line 63
    :cond_7
    add-int/lit8 p1, p1, 0x3

    .line 64
    .line 65
    aget-byte v0, p0, v5

    .line 66
    .line 67
    if-le v0, v4, :cond_0

    .line 68
    .line 69
    :cond_8
    return v3

    .line 70
    :cond_9
    add-int/lit8 v2, p2, -0x2

    .line 71
    .line 72
    if-lt v0, v2, :cond_a

    .line 73
    .line 74
    invoke-static {p0, v0, p2}, Lcom/google/protobuf/v0;->c([BII)I

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    return p0

    .line 79
    :cond_a
    add-int/lit8 v2, p1, 0x2

    .line 80
    .line 81
    aget-byte v0, p0, v0

    .line 82
    .line 83
    if-gt v0, v4, :cond_b

    .line 84
    .line 85
    shl-int/lit8 v1, v1, 0x1c

    .line 86
    .line 87
    add-int/lit8 v0, v0, 0x70

    .line 88
    .line 89
    add-int/2addr v1, v0

    .line 90
    shr-int/lit8 v0, v1, 0x1e

    .line 91
    .line 92
    if-nez v0, :cond_b

    .line 93
    .line 94
    add-int/lit8 v0, p1, 0x3

    .line 95
    .line 96
    aget-byte v1, p0, v2

    .line 97
    .line 98
    if-gt v1, v4, :cond_b

    .line 99
    .line 100
    add-int/lit8 p1, p1, 0x4

    .line 101
    .line 102
    aget-byte v0, p0, v0

    .line 103
    .line 104
    if-le v0, v4, :cond_0

    .line 105
    .line 106
    :cond_b
    return v3

    .line 107
    :cond_c
    move p1, v0

    .line 108
    goto :goto_0
.end method


# virtual methods
.method b([BII)Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    or-int p0, p2, p3

    .line 2
    .line 3
    array-length v0, p1

    .line 4
    sub-int/2addr v0, p2

    .line 5
    sub-int/2addr v0, p3

    .line 6
    or-int/2addr p0, v0

    .line 7
    if-ltz p0, :cond_b

    .line 8
    .line 9
    add-int p0, p2, p3

    .line 10
    .line 11
    new-array v4, p3, [C

    .line 12
    .line 13
    const/4 p3, 0x0

    .line 14
    move v0, p3

    .line 15
    :goto_0
    if-ge p2, p0, :cond_1

    .line 16
    .line 17
    aget-byte v1, p1, p2

    .line 18
    .line 19
    invoke-static {v1}, Lcom/google/protobuf/v0$a;->b(B)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-nez v2, :cond_0

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_0
    add-int/lit8 p2, p2, 0x1

    .line 27
    .line 28
    add-int/lit8 v2, v0, 0x1

    .line 29
    .line 30
    invoke-static {v1, v4, v0}, Lcom/google/protobuf/v0$a;->c(B[CI)V

    .line 31
    .line 32
    .line 33
    move v0, v2

    .line 34
    goto :goto_0

    .line 35
    :cond_1
    :goto_1
    move v5, v0

    .line 36
    :goto_2
    if-ge p2, p0, :cond_a

    .line 37
    .line 38
    add-int/lit8 v0, p2, 0x1

    .line 39
    .line 40
    move v1, v0

    .line 41
    aget-byte v0, p1, p2

    .line 42
    .line 43
    invoke-static {v0}, Lcom/google/protobuf/v0$a;->b(B)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-eqz v2, :cond_4

    .line 48
    .line 49
    add-int/lit8 p2, v5, 0x1

    .line 50
    .line 51
    invoke-static {v0, v4, v5}, Lcom/google/protobuf/v0$a;->c(B[CI)V

    .line 52
    .line 53
    .line 54
    move v0, v1

    .line 55
    :goto_3
    if-ge v0, p0, :cond_3

    .line 56
    .line 57
    aget-byte v1, p1, v0

    .line 58
    .line 59
    invoke-static {v1}, Lcom/google/protobuf/v0$a;->b(B)Z

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    if-nez v2, :cond_2

    .line 64
    .line 65
    goto :goto_4

    .line 66
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 67
    .line 68
    add-int/lit8 v2, p2, 0x1

    .line 69
    .line 70
    invoke-static {v1, v4, p2}, Lcom/google/protobuf/v0$a;->c(B[CI)V

    .line 71
    .line 72
    .line 73
    move p2, v2

    .line 74
    goto :goto_3

    .line 75
    :cond_3
    :goto_4
    move v5, p2

    .line 76
    move p2, v0

    .line 77
    goto :goto_2

    .line 78
    :cond_4
    invoke-static {v0}, Lcom/google/protobuf/v0$a;->d(B)Z

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    if-eqz v2, :cond_6

    .line 83
    .line 84
    if-ge v1, p0, :cond_5

    .line 85
    .line 86
    add-int/lit8 p2, p2, 0x2

    .line 87
    .line 88
    aget-byte v1, p1, v1

    .line 89
    .line 90
    add-int/lit8 v2, v5, 0x1

    .line 91
    .line 92
    invoke-static {v0, v1, v4, v5}, Lcom/google/protobuf/v0$a;->e(BB[CI)V

    .line 93
    .line 94
    .line 95
    move v5, v2

    .line 96
    goto :goto_2

    .line 97
    :cond_5
    invoke-static {}, Lcom/google/protobuf/B;->d()Lcom/google/protobuf/B;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    throw p0

    .line 102
    :cond_6
    invoke-static {v0}, Lcom/google/protobuf/v0$a;->f(B)Z

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    if-eqz v2, :cond_8

    .line 107
    .line 108
    add-int/lit8 v2, p0, -0x1

    .line 109
    .line 110
    if-ge v1, v2, :cond_7

    .line 111
    .line 112
    add-int/lit8 v2, p2, 0x2

    .line 113
    .line 114
    aget-byte v1, p1, v1

    .line 115
    .line 116
    add-int/lit8 p2, p2, 0x3

    .line 117
    .line 118
    aget-byte v2, p1, v2

    .line 119
    .line 120
    add-int/lit8 v3, v5, 0x1

    .line 121
    .line 122
    invoke-static {v0, v1, v2, v4, v5}, Lcom/google/protobuf/v0$a;->g(BBB[CI)V

    .line 123
    .line 124
    .line 125
    move v5, v3

    .line 126
    goto :goto_2

    .line 127
    :cond_7
    invoke-static {}, Lcom/google/protobuf/B;->d()Lcom/google/protobuf/B;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    throw p0

    .line 132
    :cond_8
    add-int/lit8 v2, p0, -0x2

    .line 133
    .line 134
    if-ge v1, v2, :cond_9

    .line 135
    .line 136
    add-int/lit8 v2, p2, 0x2

    .line 137
    .line 138
    aget-byte v1, p1, v1

    .line 139
    .line 140
    add-int/lit8 v3, p2, 0x3

    .line 141
    .line 142
    aget-byte v2, p1, v2

    .line 143
    .line 144
    add-int/lit8 p2, p2, 0x4

    .line 145
    .line 146
    aget-byte v3, p1, v3

    .line 147
    .line 148
    invoke-static/range {v0 .. v5}, Lcom/google/protobuf/v0$a;->a(BBBB[CI)V

    .line 149
    .line 150
    .line 151
    add-int/lit8 v5, v5, 0x2

    .line 152
    .line 153
    goto :goto_2

    .line 154
    :cond_9
    invoke-static {}, Lcom/google/protobuf/B;->d()Lcom/google/protobuf/B;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    throw p0

    .line 159
    :cond_a
    new-instance p0, Ljava/lang/String;

    .line 160
    .line 161
    invoke-direct {p0, v4, p3, v5}, Ljava/lang/String;-><init>([CII)V

    .line 162
    .line 163
    .line 164
    return-object p0

    .line 165
    :cond_b
    new-instance p0, Ljava/lang/ArrayIndexOutOfBoundsException;

    .line 166
    .line 167
    array-length p1, p1

    .line 168
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 173
    .line 174
    .line 175
    move-result-object p2

    .line 176
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 177
    .line 178
    .line 179
    move-result-object p3

    .line 180
    filled-new-array {p1, p2, p3}, [Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    const-string p2, "buffer length=%d, index=%d, size=%d"

    .line 185
    .line 186
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    invoke-direct {p0, p1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    throw p0
.end method

.method d(Ljava/nio/ByteBuffer;II)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/protobuf/v0$b;->c(Ljava/nio/ByteBuffer;II)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method e(Ljava/lang/CharSequence;[BII)I
    .locals 6

    .line 1
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    add-int/2addr p4, p3

    .line 6
    const/4 v0, 0x0

    .line 7
    :goto_0
    const/16 v1, 0x80

    .line 8
    .line 9
    if-ge v0, p0, :cond_0

    .line 10
    .line 11
    add-int v2, v0, p3

    .line 12
    .line 13
    if-ge v2, p4, :cond_0

    .line 14
    .line 15
    invoke-interface {p1, v0}, Ljava/lang/CharSequence;->charAt(I)C

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    if-ge v3, v1, :cond_0

    .line 20
    .line 21
    int-to-byte v1, v3

    .line 22
    aput-byte v1, p2, v2

    .line 23
    .line 24
    add-int/lit8 v0, v0, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    if-ne v0, p0, :cond_1

    .line 28
    .line 29
    add-int/2addr p3, p0

    .line 30
    return p3

    .line 31
    :cond_1
    add-int/2addr p3, v0

    .line 32
    :goto_1
    if-ge v0, p0, :cond_b

    .line 33
    .line 34
    invoke-interface {p1, v0}, Ljava/lang/CharSequence;->charAt(I)C

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-ge v2, v1, :cond_2

    .line 39
    .line 40
    if-ge p3, p4, :cond_2

    .line 41
    .line 42
    add-int/lit8 v3, p3, 0x1

    .line 43
    .line 44
    int-to-byte v2, v2

    .line 45
    aput-byte v2, p2, p3

    .line 46
    .line 47
    move p3, v3

    .line 48
    goto/16 :goto_2

    .line 49
    .line 50
    :cond_2
    const/16 v3, 0x800

    .line 51
    .line 52
    if-ge v2, v3, :cond_3

    .line 53
    .line 54
    add-int/lit8 v3, p4, -0x2

    .line 55
    .line 56
    if-gt p3, v3, :cond_3

    .line 57
    .line 58
    add-int/lit8 v3, p3, 0x1

    .line 59
    .line 60
    ushr-int/lit8 v4, v2, 0x6

    .line 61
    .line 62
    or-int/lit16 v4, v4, 0x3c0

    .line 63
    .line 64
    int-to-byte v4, v4

    .line 65
    aput-byte v4, p2, p3

    .line 66
    .line 67
    add-int/lit8 p3, p3, 0x2

    .line 68
    .line 69
    and-int/lit8 v2, v2, 0x3f

    .line 70
    .line 71
    or-int/2addr v2, v1

    .line 72
    int-to-byte v2, v2

    .line 73
    aput-byte v2, p2, v3

    .line 74
    .line 75
    goto :goto_2

    .line 76
    :cond_3
    const v3, 0xdfff

    .line 77
    .line 78
    .line 79
    const v4, 0xd800

    .line 80
    .line 81
    .line 82
    if-lt v2, v4, :cond_4

    .line 83
    .line 84
    if-ge v3, v2, :cond_5

    .line 85
    .line 86
    :cond_4
    add-int/lit8 v5, p4, -0x3

    .line 87
    .line 88
    if-gt p3, v5, :cond_5

    .line 89
    .line 90
    add-int/lit8 v3, p3, 0x1

    .line 91
    .line 92
    ushr-int/lit8 v4, v2, 0xc

    .line 93
    .line 94
    or-int/lit16 v4, v4, 0x1e0

    .line 95
    .line 96
    int-to-byte v4, v4

    .line 97
    aput-byte v4, p2, p3

    .line 98
    .line 99
    add-int/lit8 v4, p3, 0x2

    .line 100
    .line 101
    ushr-int/lit8 v5, v2, 0x6

    .line 102
    .line 103
    and-int/lit8 v5, v5, 0x3f

    .line 104
    .line 105
    or-int/2addr v5, v1

    .line 106
    int-to-byte v5, v5

    .line 107
    aput-byte v5, p2, v3

    .line 108
    .line 109
    add-int/lit8 p3, p3, 0x3

    .line 110
    .line 111
    and-int/lit8 v2, v2, 0x3f

    .line 112
    .line 113
    or-int/2addr v2, v1

    .line 114
    int-to-byte v2, v2

    .line 115
    aput-byte v2, p2, v4

    .line 116
    .line 117
    goto :goto_2

    .line 118
    :cond_5
    add-int/lit8 v5, p4, -0x4

    .line 119
    .line 120
    if-gt p3, v5, :cond_8

    .line 121
    .line 122
    add-int/lit8 v3, v0, 0x1

    .line 123
    .line 124
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 125
    .line 126
    .line 127
    move-result v4

    .line 128
    if-eq v3, v4, :cond_7

    .line 129
    .line 130
    invoke-interface {p1, v3}, Ljava/lang/CharSequence;->charAt(I)C

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    invoke-static {v2, v0}, Ljava/lang/Character;->isSurrogatePair(CC)Z

    .line 135
    .line 136
    .line 137
    move-result v4

    .line 138
    if-eqz v4, :cond_6

    .line 139
    .line 140
    invoke-static {v2, v0}, Ljava/lang/Character;->toCodePoint(CC)I

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    add-int/lit8 v2, p3, 0x1

    .line 145
    .line 146
    ushr-int/lit8 v4, v0, 0x12

    .line 147
    .line 148
    or-int/lit16 v4, v4, 0xf0

    .line 149
    .line 150
    int-to-byte v4, v4

    .line 151
    aput-byte v4, p2, p3

    .line 152
    .line 153
    add-int/lit8 v4, p3, 0x2

    .line 154
    .line 155
    ushr-int/lit8 v5, v0, 0xc

    .line 156
    .line 157
    and-int/lit8 v5, v5, 0x3f

    .line 158
    .line 159
    or-int/2addr v5, v1

    .line 160
    int-to-byte v5, v5

    .line 161
    aput-byte v5, p2, v2

    .line 162
    .line 163
    add-int/lit8 v2, p3, 0x3

    .line 164
    .line 165
    ushr-int/lit8 v5, v0, 0x6

    .line 166
    .line 167
    and-int/lit8 v5, v5, 0x3f

    .line 168
    .line 169
    or-int/2addr v5, v1

    .line 170
    int-to-byte v5, v5

    .line 171
    aput-byte v5, p2, v4

    .line 172
    .line 173
    add-int/lit8 p3, p3, 0x4

    .line 174
    .line 175
    and-int/lit8 v0, v0, 0x3f

    .line 176
    .line 177
    or-int/2addr v0, v1

    .line 178
    int-to-byte v0, v0

    .line 179
    aput-byte v0, p2, v2

    .line 180
    .line 181
    move v0, v3

    .line 182
    :goto_2
    add-int/lit8 v0, v0, 0x1

    .line 183
    .line 184
    goto/16 :goto_1

    .line 185
    .line 186
    :cond_6
    move v0, v3

    .line 187
    :cond_7
    new-instance p1, Lcom/google/protobuf/v0$d;

    .line 188
    .line 189
    add-int/lit8 v0, v0, -0x1

    .line 190
    .line 191
    invoke-direct {p1, v0, p0}, Lcom/google/protobuf/v0$d;-><init>(II)V

    .line 192
    .line 193
    .line 194
    throw p1

    .line 195
    :cond_8
    if-gt v4, v2, :cond_a

    .line 196
    .line 197
    if-gt v2, v3, :cond_a

    .line 198
    .line 199
    add-int/lit8 p2, v0, 0x1

    .line 200
    .line 201
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 202
    .line 203
    .line 204
    move-result p4

    .line 205
    if-eq p2, p4, :cond_9

    .line 206
    .line 207
    invoke-interface {p1, p2}, Ljava/lang/CharSequence;->charAt(I)C

    .line 208
    .line 209
    .line 210
    move-result p1

    .line 211
    invoke-static {v2, p1}, Ljava/lang/Character;->isSurrogatePair(CC)Z

    .line 212
    .line 213
    .line 214
    move-result p1

    .line 215
    if-nez p1, :cond_a

    .line 216
    .line 217
    :cond_9
    new-instance p1, Lcom/google/protobuf/v0$d;

    .line 218
    .line 219
    invoke-direct {p1, v0, p0}, Lcom/google/protobuf/v0$d;-><init>(II)V

    .line 220
    .line 221
    .line 222
    throw p1

    .line 223
    :cond_a
    new-instance p0, Ljava/lang/ArrayIndexOutOfBoundsException;

    .line 224
    .line 225
    new-instance p1, Ljava/lang/StringBuilder;

    .line 226
    .line 227
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 228
    .line 229
    .line 230
    const-string p2, "Failed writing "

    .line 231
    .line 232
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 233
    .line 234
    .line 235
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 236
    .line 237
    .line 238
    const-string p2, " at index "

    .line 239
    .line 240
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 241
    .line 242
    .line 243
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object p1

    .line 250
    invoke-direct {p0, p1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    .line 251
    .line 252
    .line 253
    throw p0

    .line 254
    :cond_b
    return p3
.end method

.method i(I[BII)I
    .locals 5

    .line 1
    if-eqz p1, :cond_f

    .line 2
    .line 3
    if-lt p3, p4, :cond_0

    .line 4
    .line 5
    return p1

    .line 6
    :cond_0
    int-to-byte p0, p1

    .line 7
    const/16 v0, -0x20

    .line 8
    .line 9
    const/4 v1, -0x1

    .line 10
    const/16 v2, -0x41

    .line 11
    .line 12
    if-ge p0, v0, :cond_3

    .line 13
    .line 14
    const/16 p1, -0x3e

    .line 15
    .line 16
    if-lt p0, p1, :cond_2

    .line 17
    .line 18
    add-int/lit8 p0, p3, 0x1

    .line 19
    .line 20
    aget-byte p1, p2, p3

    .line 21
    .line 22
    if-le p1, v2, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    move p3, p0

    .line 26
    goto/16 :goto_2

    .line 27
    .line 28
    :cond_2
    :goto_0
    return v1

    .line 29
    :cond_3
    const/16 v3, -0x10

    .line 30
    .line 31
    if-ge p0, v3, :cond_9

    .line 32
    .line 33
    shr-int/lit8 p1, p1, 0x8

    .line 34
    .line 35
    not-int p1, p1

    .line 36
    int-to-byte p1, p1

    .line 37
    if-nez p1, :cond_5

    .line 38
    .line 39
    add-int/lit8 p1, p3, 0x1

    .line 40
    .line 41
    aget-byte p3, p2, p3

    .line 42
    .line 43
    if-lt p1, p4, :cond_4

    .line 44
    .line 45
    invoke-static {p0, p3}, Lcom/google/protobuf/v0;->a(II)I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    return p0

    .line 50
    :cond_4
    move v4, p3

    .line 51
    move p3, p1

    .line 52
    move p1, v4

    .line 53
    :cond_5
    if-gt p1, v2, :cond_8

    .line 54
    .line 55
    const/16 v3, -0x60

    .line 56
    .line 57
    if-ne p0, v0, :cond_6

    .line 58
    .line 59
    if-lt p1, v3, :cond_8

    .line 60
    .line 61
    :cond_6
    const/16 v0, -0x13

    .line 62
    .line 63
    if-ne p0, v0, :cond_7

    .line 64
    .line 65
    if-ge p1, v3, :cond_8

    .line 66
    .line 67
    :cond_7
    add-int/lit8 p0, p3, 0x1

    .line 68
    .line 69
    aget-byte p1, p2, p3

    .line 70
    .line 71
    if-le p1, v2, :cond_1

    .line 72
    .line 73
    :cond_8
    return v1

    .line 74
    :cond_9
    shr-int/lit8 v0, p1, 0x8

    .line 75
    .line 76
    not-int v0, v0

    .line 77
    int-to-byte v0, v0

    .line 78
    if-nez v0, :cond_b

    .line 79
    .line 80
    add-int/lit8 p1, p3, 0x1

    .line 81
    .line 82
    aget-byte v0, p2, p3

    .line 83
    .line 84
    if-lt p1, p4, :cond_a

    .line 85
    .line 86
    invoke-static {p0, v0}, Lcom/google/protobuf/v0;->a(II)I

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    return p0

    .line 91
    :cond_a
    const/4 p3, 0x0

    .line 92
    goto :goto_1

    .line 93
    :cond_b
    shr-int/lit8 p1, p1, 0x10

    .line 94
    .line 95
    int-to-byte p1, p1

    .line 96
    move v4, p3

    .line 97
    move p3, p1

    .line 98
    move p1, v4

    .line 99
    :goto_1
    if-nez p3, :cond_d

    .line 100
    .line 101
    add-int/lit8 p3, p1, 0x1

    .line 102
    .line 103
    aget-byte p1, p2, p1

    .line 104
    .line 105
    if-lt p3, p4, :cond_c

    .line 106
    .line 107
    invoke-static {p0, v0, p1}, Lcom/google/protobuf/v0;->b(III)I

    .line 108
    .line 109
    .line 110
    move-result p0

    .line 111
    return p0

    .line 112
    :cond_c
    move v4, p3

    .line 113
    move p3, p1

    .line 114
    move p1, v4

    .line 115
    :cond_d
    if-gt v0, v2, :cond_e

    .line 116
    .line 117
    shl-int/lit8 p0, p0, 0x1c

    .line 118
    .line 119
    add-int/lit8 v0, v0, 0x70

    .line 120
    .line 121
    add-int/2addr p0, v0

    .line 122
    shr-int/lit8 p0, p0, 0x1e

    .line 123
    .line 124
    if-nez p0, :cond_e

    .line 125
    .line 126
    if-gt p3, v2, :cond_e

    .line 127
    .line 128
    add-int/lit8 p3, p1, 0x1

    .line 129
    .line 130
    aget-byte p0, p2, p1

    .line 131
    .line 132
    if-le p0, v2, :cond_f

    .line 133
    .line 134
    :cond_e
    return v1

    .line 135
    :cond_f
    :goto_2
    invoke-static {p2, p3, p4}, Lcom/google/protobuf/v0$c;->m([BII)I

    .line 136
    .line 137
    .line 138
    move-result p0

    .line 139
    return p0
.end method

.method l(ILjava/nio/ByteBuffer;II)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/google/protobuf/v0$b;->k(ILjava/nio/ByteBuffer;II)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method
