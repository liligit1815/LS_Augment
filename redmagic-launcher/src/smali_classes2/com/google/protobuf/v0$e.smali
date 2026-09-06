.class final Lcom/google/protobuf/v0$e;
.super Lcom/google/protobuf/v0$b;
.source "Utf8.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/protobuf/v0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "e"
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

.method static m()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/u0;->I()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/google/protobuf/u0;->J()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    return v0

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    return v0
.end method

.method private static n(JI)I
    .locals 10

    .line 1
    invoke-static {p0, p1, p2}, Lcom/google/protobuf/v0$e;->p(JI)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-long v1, v0

    .line 6
    add-long/2addr p0, v1

    .line 7
    sub-int/2addr p2, v0

    .line 8
    :cond_0
    :goto_0
    const/4 v0, 0x0

    .line 9
    move v1, v0

    .line 10
    :goto_1
    const-wide/16 v2, 0x1

    .line 11
    .line 12
    if-lez p2, :cond_2

    .line 13
    .line 14
    add-long v4, p0, v2

    .line 15
    .line 16
    invoke-static {p0, p1}, Lcom/google/protobuf/u0;->w(J)B

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-ltz v1, :cond_1

    .line 21
    .line 22
    add-int/lit8 p2, p2, -0x1

    .line 23
    .line 24
    move-wide p0, v4

    .line 25
    goto :goto_1

    .line 26
    :cond_1
    move-wide p0, v4

    .line 27
    :cond_2
    if-nez p2, :cond_3

    .line 28
    .line 29
    return v0

    .line 30
    :cond_3
    add-int/lit8 v0, p2, -0x1

    .line 31
    .line 32
    const/16 v4, -0x20

    .line 33
    .line 34
    const/4 v5, -0x1

    .line 35
    const/16 v6, -0x41

    .line 36
    .line 37
    if-ge v1, v4, :cond_7

    .line 38
    .line 39
    if-nez v0, :cond_4

    .line 40
    .line 41
    return v1

    .line 42
    :cond_4
    add-int/lit8 p2, p2, -0x2

    .line 43
    .line 44
    const/16 v0, -0x3e

    .line 45
    .line 46
    if-lt v1, v0, :cond_6

    .line 47
    .line 48
    add-long/2addr v2, p0

    .line 49
    invoke-static {p0, p1}, Lcom/google/protobuf/u0;->w(J)B

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-le p0, v6, :cond_5

    .line 54
    .line 55
    goto :goto_2

    .line 56
    :cond_5
    move-wide p0, v2

    .line 57
    goto :goto_0

    .line 58
    :cond_6
    :goto_2
    return v5

    .line 59
    :cond_7
    const/16 v7, -0x10

    .line 60
    .line 61
    const-wide/16 v8, 0x2

    .line 62
    .line 63
    if-ge v1, v7, :cond_c

    .line 64
    .line 65
    const/4 v7, 0x2

    .line 66
    if-ge v0, v7, :cond_8

    .line 67
    .line 68
    invoke-static {p0, p1, v1, v0}, Lcom/google/protobuf/v0$e;->r(JII)I

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    return p0

    .line 73
    :cond_8
    add-int/lit8 p2, p2, -0x3

    .line 74
    .line 75
    add-long/2addr v2, p0

    .line 76
    invoke-static {p0, p1}, Lcom/google/protobuf/u0;->w(J)B

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-gt v0, v6, :cond_b

    .line 81
    .line 82
    const/16 v7, -0x60

    .line 83
    .line 84
    if-ne v1, v4, :cond_9

    .line 85
    .line 86
    if-lt v0, v7, :cond_b

    .line 87
    .line 88
    :cond_9
    const/16 v4, -0x13

    .line 89
    .line 90
    if-ne v1, v4, :cond_a

    .line 91
    .line 92
    if-ge v0, v7, :cond_b

    .line 93
    .line 94
    :cond_a
    add-long/2addr p0, v8

    .line 95
    invoke-static {v2, v3}, Lcom/google/protobuf/u0;->w(J)B

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-le v0, v6, :cond_0

    .line 100
    .line 101
    :cond_b
    return v5

    .line 102
    :cond_c
    const/4 v4, 0x3

    .line 103
    if-ge v0, v4, :cond_d

    .line 104
    .line 105
    invoke-static {p0, p1, v1, v0}, Lcom/google/protobuf/v0$e;->r(JII)I

    .line 106
    .line 107
    .line 108
    move-result p0

    .line 109
    return p0

    .line 110
    :cond_d
    add-int/lit8 p2, p2, -0x4

    .line 111
    .line 112
    add-long/2addr v2, p0

    .line 113
    invoke-static {p0, p1}, Lcom/google/protobuf/u0;->w(J)B

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-gt v0, v6, :cond_e

    .line 118
    .line 119
    shl-int/lit8 v1, v1, 0x1c

    .line 120
    .line 121
    add-int/lit8 v0, v0, 0x70

    .line 122
    .line 123
    add-int/2addr v1, v0

    .line 124
    shr-int/lit8 v0, v1, 0x1e

    .line 125
    .line 126
    if-nez v0, :cond_e

    .line 127
    .line 128
    add-long/2addr v8, p0

    .line 129
    invoke-static {v2, v3}, Lcom/google/protobuf/u0;->w(J)B

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-gt v0, v6, :cond_e

    .line 134
    .line 135
    const-wide/16 v0, 0x3

    .line 136
    .line 137
    add-long/2addr p0, v0

    .line 138
    invoke-static {v8, v9}, Lcom/google/protobuf/u0;->w(J)B

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    if-le v0, v6, :cond_0

    .line 143
    .line 144
    :cond_e
    return v5
.end method

.method private static o([BJI)I
    .locals 10

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/google/protobuf/v0$e;->q([BJI)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sub-int/2addr p3, v0

    .line 6
    int-to-long v0, v0

    .line 7
    add-long/2addr p1, v0

    .line 8
    :cond_0
    :goto_0
    const/4 v0, 0x0

    .line 9
    move v1, v0

    .line 10
    :goto_1
    const-wide/16 v2, 0x1

    .line 11
    .line 12
    if-lez p3, :cond_2

    .line 13
    .line 14
    add-long v4, p1, v2

    .line 15
    .line 16
    invoke-static {p0, p1, p2}, Lcom/google/protobuf/u0;->x([BJ)B

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-ltz v1, :cond_1

    .line 21
    .line 22
    add-int/lit8 p3, p3, -0x1

    .line 23
    .line 24
    move-wide p1, v4

    .line 25
    goto :goto_1

    .line 26
    :cond_1
    move-wide p1, v4

    .line 27
    :cond_2
    if-nez p3, :cond_3

    .line 28
    .line 29
    return v0

    .line 30
    :cond_3
    add-int/lit8 v0, p3, -0x1

    .line 31
    .line 32
    const/16 v4, -0x20

    .line 33
    .line 34
    const/4 v5, -0x1

    .line 35
    const/16 v6, -0x41

    .line 36
    .line 37
    if-ge v1, v4, :cond_7

    .line 38
    .line 39
    if-nez v0, :cond_4

    .line 40
    .line 41
    return v1

    .line 42
    :cond_4
    add-int/lit8 p3, p3, -0x2

    .line 43
    .line 44
    const/16 v0, -0x3e

    .line 45
    .line 46
    if-lt v1, v0, :cond_6

    .line 47
    .line 48
    add-long/2addr v2, p1

    .line 49
    invoke-static {p0, p1, p2}, Lcom/google/protobuf/u0;->x([BJ)B

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-le p1, v6, :cond_5

    .line 54
    .line 55
    goto :goto_2

    .line 56
    :cond_5
    move-wide p1, v2

    .line 57
    goto :goto_0

    .line 58
    :cond_6
    :goto_2
    return v5

    .line 59
    :cond_7
    const/16 v7, -0x10

    .line 60
    .line 61
    const-wide/16 v8, 0x2

    .line 62
    .line 63
    if-ge v1, v7, :cond_c

    .line 64
    .line 65
    const/4 v7, 0x2

    .line 66
    if-ge v0, v7, :cond_8

    .line 67
    .line 68
    invoke-static {p0, v1, p1, p2, v0}, Lcom/google/protobuf/v0$e;->s([BIJI)I

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    return p0

    .line 73
    :cond_8
    add-int/lit8 p3, p3, -0x3

    .line 74
    .line 75
    add-long/2addr v2, p1

    .line 76
    invoke-static {p0, p1, p2}, Lcom/google/protobuf/u0;->x([BJ)B

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-gt v0, v6, :cond_b

    .line 81
    .line 82
    const/16 v7, -0x60

    .line 83
    .line 84
    if-ne v1, v4, :cond_9

    .line 85
    .line 86
    if-lt v0, v7, :cond_b

    .line 87
    .line 88
    :cond_9
    const/16 v4, -0x13

    .line 89
    .line 90
    if-ne v1, v4, :cond_a

    .line 91
    .line 92
    if-ge v0, v7, :cond_b

    .line 93
    .line 94
    :cond_a
    add-long/2addr p1, v8

    .line 95
    invoke-static {p0, v2, v3}, Lcom/google/protobuf/u0;->x([BJ)B

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-le v0, v6, :cond_0

    .line 100
    .line 101
    :cond_b
    return v5

    .line 102
    :cond_c
    const/4 v4, 0x3

    .line 103
    if-ge v0, v4, :cond_d

    .line 104
    .line 105
    invoke-static {p0, v1, p1, p2, v0}, Lcom/google/protobuf/v0$e;->s([BIJI)I

    .line 106
    .line 107
    .line 108
    move-result p0

    .line 109
    return p0

    .line 110
    :cond_d
    add-int/lit8 p3, p3, -0x4

    .line 111
    .line 112
    add-long/2addr v2, p1

    .line 113
    invoke-static {p0, p1, p2}, Lcom/google/protobuf/u0;->x([BJ)B

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-gt v0, v6, :cond_e

    .line 118
    .line 119
    shl-int/lit8 v1, v1, 0x1c

    .line 120
    .line 121
    add-int/lit8 v0, v0, 0x70

    .line 122
    .line 123
    add-int/2addr v1, v0

    .line 124
    shr-int/lit8 v0, v1, 0x1e

    .line 125
    .line 126
    if-nez v0, :cond_e

    .line 127
    .line 128
    add-long/2addr v8, p1

    .line 129
    invoke-static {p0, v2, v3}, Lcom/google/protobuf/u0;->x([BJ)B

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-gt v0, v6, :cond_e

    .line 134
    .line 135
    const-wide/16 v0, 0x3

    .line 136
    .line 137
    add-long/2addr p1, v0

    .line 138
    invoke-static {p0, v8, v9}, Lcom/google/protobuf/u0;->x([BJ)B

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    if-le v0, v6, :cond_0

    .line 143
    .line 144
    :cond_e
    return v5
.end method

.method private static p(JI)I
    .locals 5

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    if-ge p2, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    neg-long v0, p0

    .line 8
    const-wide/16 v2, 0x7

    .line 9
    .line 10
    and-long/2addr v0, v2

    .line 11
    long-to-int v0, v0

    .line 12
    move v1, v0

    .line 13
    :goto_0
    if-lez v1, :cond_2

    .line 14
    .line 15
    const-wide/16 v2, 0x1

    .line 16
    .line 17
    add-long/2addr v2, p0

    .line 18
    invoke-static {p0, p1}, Lcom/google/protobuf/u0;->w(J)B

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-gez p0, :cond_1

    .line 23
    .line 24
    sub-int/2addr v0, v1

    .line 25
    return v0

    .line 26
    :cond_1
    add-int/lit8 v1, v1, -0x1

    .line 27
    .line 28
    move-wide p0, v2

    .line 29
    goto :goto_0

    .line 30
    :cond_2
    sub-int v0, p2, v0

    .line 31
    .line 32
    :goto_1
    const/16 v1, 0x8

    .line 33
    .line 34
    if-lt v0, v1, :cond_3

    .line 35
    .line 36
    invoke-static {p0, p1}, Lcom/google/protobuf/u0;->D(J)J

    .line 37
    .line 38
    .line 39
    move-result-wide v1

    .line 40
    const-wide v3, -0x7f7f7f7f7f7f7f80L    # -2.937446524422997E-306

    .line 41
    .line 42
    .line 43
    .line 44
    .line 45
    and-long/2addr v1, v3

    .line 46
    const-wide/16 v3, 0x0

    .line 47
    .line 48
    cmp-long v1, v1, v3

    .line 49
    .line 50
    if-nez v1, :cond_3

    .line 51
    .line 52
    const-wide/16 v1, 0x8

    .line 53
    .line 54
    add-long/2addr p0, v1

    .line 55
    add-int/lit8 v0, v0, -0x8

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_3
    sub-int/2addr p2, v0

    .line 59
    return p2
.end method

.method private static q([BJI)I
    .locals 8

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-ge p3, v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    long-to-int v0, p1

    .line 8
    and-int/lit8 v0, v0, 0x7

    .line 9
    .line 10
    rsub-int/lit8 v0, v0, 0x8

    .line 11
    .line 12
    :goto_0
    const-wide/16 v2, 0x1

    .line 13
    .line 14
    if-ge v1, v0, :cond_2

    .line 15
    .line 16
    add-long/2addr v2, p1

    .line 17
    invoke-static {p0, p1, p2}, Lcom/google/protobuf/u0;->x([BJ)B

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-gez p1, :cond_1

    .line 22
    .line 23
    return v1

    .line 24
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 25
    .line 26
    move-wide p1, v2

    .line 27
    goto :goto_0

    .line 28
    :cond_2
    :goto_1
    add-int/lit8 v0, v1, 0x8

    .line 29
    .line 30
    if-gt v0, p3, :cond_4

    .line 31
    .line 32
    sget-wide v4, Lcom/google/protobuf/u0;->h:J

    .line 33
    .line 34
    add-long/2addr v4, p1

    .line 35
    invoke-static {p0, v4, v5}, Lcom/google/protobuf/u0;->E(Ljava/lang/Object;J)J

    .line 36
    .line 37
    .line 38
    move-result-wide v4

    .line 39
    const-wide v6, -0x7f7f7f7f7f7f7f80L    # -2.937446524422997E-306

    .line 40
    .line 41
    .line 42
    .line 43
    .line 44
    and-long/2addr v4, v6

    .line 45
    const-wide/16 v6, 0x0

    .line 46
    .line 47
    cmp-long v4, v4, v6

    .line 48
    .line 49
    if-eqz v4, :cond_3

    .line 50
    .line 51
    goto :goto_2

    .line 52
    :cond_3
    const-wide/16 v4, 0x8

    .line 53
    .line 54
    add-long/2addr p1, v4

    .line 55
    move v1, v0

    .line 56
    goto :goto_1

    .line 57
    :cond_4
    :goto_2
    if-ge v1, p3, :cond_6

    .line 58
    .line 59
    add-long v4, p1, v2

    .line 60
    .line 61
    invoke-static {p0, p1, p2}, Lcom/google/protobuf/u0;->x([BJ)B

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-gez p1, :cond_5

    .line 66
    .line 67
    return v1

    .line 68
    :cond_5
    add-int/lit8 v1, v1, 0x1

    .line 69
    .line 70
    move-wide p1, v4

    .line 71
    goto :goto_2

    .line 72
    :cond_6
    return p3
.end method

.method private static r(JII)I
    .locals 2

    .line 1
    if-eqz p3, :cond_2

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p3, v0, :cond_1

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-ne p3, v0, :cond_0

    .line 8
    .line 9
    invoke-static {p0, p1}, Lcom/google/protobuf/u0;->w(J)B

    .line 10
    .line 11
    .line 12
    move-result p3

    .line 13
    const-wide/16 v0, 0x1

    .line 14
    .line 15
    add-long/2addr p0, v0

    .line 16
    invoke-static {p0, p1}, Lcom/google/protobuf/u0;->w(J)B

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-static {p2, p3, p0}, Lcom/google/protobuf/v0;->b(III)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0

    .line 25
    :cond_0
    new-instance p0, Ljava/lang/AssertionError;

    .line 26
    .line 27
    invoke-direct {p0}, Ljava/lang/AssertionError;-><init>()V

    .line 28
    .line 29
    .line 30
    throw p0

    .line 31
    :cond_1
    invoke-static {p0, p1}, Lcom/google/protobuf/u0;->w(J)B

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    invoke-static {p2, p0}, Lcom/google/protobuf/v0;->a(II)I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    return p0

    .line 40
    :cond_2
    invoke-static {p2}, Lcom/google/protobuf/v0;->d(I)I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    return p0
.end method

.method private static s([BIJI)I
    .locals 2

    .line 1
    if-eqz p4, :cond_2

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p4, v0, :cond_1

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-ne p4, v0, :cond_0

    .line 8
    .line 9
    invoke-static {p0, p2, p3}, Lcom/google/protobuf/u0;->x([BJ)B

    .line 10
    .line 11
    .line 12
    move-result p4

    .line 13
    const-wide/16 v0, 0x1

    .line 14
    .line 15
    add-long/2addr p2, v0

    .line 16
    invoke-static {p0, p2, p3}, Lcom/google/protobuf/u0;->x([BJ)B

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-static {p1, p4, p0}, Lcom/google/protobuf/v0;->b(III)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0

    .line 25
    :cond_0
    new-instance p0, Ljava/lang/AssertionError;

    .line 26
    .line 27
    invoke-direct {p0}, Ljava/lang/AssertionError;-><init>()V

    .line 28
    .line 29
    .line 30
    throw p0

    .line 31
    :cond_1
    invoke-static {p0, p2, p3}, Lcom/google/protobuf/u0;->x([BJ)B

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    invoke-static {p1, p0}, Lcom/google/protobuf/v0;->a(II)I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    return p0

    .line 40
    :cond_2
    invoke-static {p1}, Lcom/google/protobuf/v0;->d(I)I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    return p0
.end method


# virtual methods
.method b([BII)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    new-instance p0, Ljava/lang/String;

    .line 2
    .line 3
    sget-object v0, Lcom/google/protobuf/A;->b:Ljava/nio/charset/Charset;

    .line 4
    .line 5
    invoke-direct {p0, p1, p2, p3, v0}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 6
    .line 7
    .line 8
    const-string v1, "\ufffd"

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    add-int/2addr p3, p2

    .line 22
    invoke-static {p1, p2, p3}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-static {v0, p1}, Ljava/util/Arrays;->equals([B[B)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    :goto_0
    return-object p0

    .line 33
    :cond_1
    invoke-static {}, Lcom/google/protobuf/B;->d()Lcom/google/protobuf/B;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    throw p0
.end method

.method d(Ljava/nio/ByteBuffer;II)Ljava/lang/String;
    .locals 20
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    move/from16 v0, p2

    .line 2
    .line 3
    move/from16 v1, p3

    .line 4
    .line 5
    or-int v2, v0, v1

    .line 6
    .line 7
    invoke-virtual/range {p1 .. p1}, Ljava/nio/ByteBuffer;->limit()I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    sub-int/2addr v3, v0

    .line 12
    sub-int/2addr v3, v1

    .line 13
    or-int/2addr v2, v3

    .line 14
    if-ltz v2, :cond_b

    .line 15
    .line 16
    invoke-static/range {p1 .. p1}, Lcom/google/protobuf/u0;->k(Ljava/nio/ByteBuffer;)J

    .line 17
    .line 18
    .line 19
    move-result-wide v2

    .line 20
    int-to-long v4, v0

    .line 21
    add-long/2addr v2, v4

    .line 22
    int-to-long v4, v1

    .line 23
    add-long/2addr v4, v2

    .line 24
    new-array v10, v1, [C

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    move v1, v0

    .line 28
    :goto_0
    cmp-long v6, v2, v4

    .line 29
    .line 30
    const-wide/16 v12, 0x1

    .line 31
    .line 32
    if-gez v6, :cond_1

    .line 33
    .line 34
    invoke-static {v2, v3}, Lcom/google/protobuf/u0;->w(J)B

    .line 35
    .line 36
    .line 37
    move-result v6

    .line 38
    invoke-static {v6}, Lcom/google/protobuf/v0$a;->b(B)Z

    .line 39
    .line 40
    .line 41
    move-result v7

    .line 42
    if-nez v7, :cond_0

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_0
    add-long/2addr v2, v12

    .line 46
    add-int/lit8 v7, v1, 0x1

    .line 47
    .line 48
    invoke-static {v6, v10, v1}, Lcom/google/protobuf/v0$a;->c(B[CI)V

    .line 49
    .line 50
    .line 51
    move v1, v7

    .line 52
    goto :goto_0

    .line 53
    :cond_1
    :goto_1
    move v11, v1

    .line 54
    :goto_2
    cmp-long v1, v2, v4

    .line 55
    .line 56
    if-gez v1, :cond_a

    .line 57
    .line 58
    add-long v6, v2, v12

    .line 59
    .line 60
    move-wide v7, v6

    .line 61
    invoke-static {v2, v3}, Lcom/google/protobuf/u0;->w(J)B

    .line 62
    .line 63
    .line 64
    move-result v6

    .line 65
    invoke-static {v6}, Lcom/google/protobuf/v0$a;->b(B)Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-eqz v1, :cond_4

    .line 70
    .line 71
    add-int/lit8 v1, v11, 0x1

    .line 72
    .line 73
    invoke-static {v6, v10, v11}, Lcom/google/protobuf/v0$a;->c(B[CI)V

    .line 74
    .line 75
    .line 76
    move-wide v6, v7

    .line 77
    :goto_3
    cmp-long v2, v6, v4

    .line 78
    .line 79
    if-gez v2, :cond_3

    .line 80
    .line 81
    invoke-static {v6, v7}, Lcom/google/protobuf/u0;->w(J)B

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    invoke-static {v2}, Lcom/google/protobuf/v0$a;->b(B)Z

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    if-nez v3, :cond_2

    .line 90
    .line 91
    goto :goto_4

    .line 92
    :cond_2
    add-long/2addr v6, v12

    .line 93
    add-int/lit8 v3, v1, 0x1

    .line 94
    .line 95
    invoke-static {v2, v10, v1}, Lcom/google/protobuf/v0$a;->c(B[CI)V

    .line 96
    .line 97
    .line 98
    move v1, v3

    .line 99
    goto :goto_3

    .line 100
    :cond_3
    :goto_4
    move v11, v1

    .line 101
    move-wide v2, v6

    .line 102
    goto :goto_2

    .line 103
    :cond_4
    invoke-static {v6}, Lcom/google/protobuf/v0$a;->d(B)Z

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    const-wide/16 v14, 0x2

    .line 108
    .line 109
    if-eqz v1, :cond_6

    .line 110
    .line 111
    cmp-long v1, v7, v4

    .line 112
    .line 113
    if-gez v1, :cond_5

    .line 114
    .line 115
    add-long/2addr v2, v14

    .line 116
    invoke-static {v7, v8}, Lcom/google/protobuf/u0;->w(J)B

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    add-int/lit8 v7, v11, 0x1

    .line 121
    .line 122
    invoke-static {v6, v1, v10, v11}, Lcom/google/protobuf/v0$a;->e(BB[CI)V

    .line 123
    .line 124
    .line 125
    move v11, v7

    .line 126
    goto :goto_2

    .line 127
    :cond_5
    invoke-static {}, Lcom/google/protobuf/B;->d()Lcom/google/protobuf/B;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    throw v0

    .line 132
    :cond_6
    invoke-static {v6}, Lcom/google/protobuf/v0$a;->f(B)Z

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    const-wide/16 v16, 0x3

    .line 137
    .line 138
    if-eqz v1, :cond_8

    .line 139
    .line 140
    sub-long v18, v4, v12

    .line 141
    .line 142
    cmp-long v1, v7, v18

    .line 143
    .line 144
    if-gez v1, :cond_7

    .line 145
    .line 146
    add-long/2addr v14, v2

    .line 147
    invoke-static {v7, v8}, Lcom/google/protobuf/u0;->w(J)B

    .line 148
    .line 149
    .line 150
    move-result v1

    .line 151
    add-long v2, v2, v16

    .line 152
    .line 153
    invoke-static {v14, v15}, Lcom/google/protobuf/u0;->w(J)B

    .line 154
    .line 155
    .line 156
    move-result v7

    .line 157
    add-int/lit8 v8, v11, 0x1

    .line 158
    .line 159
    invoke-static {v6, v1, v7, v10, v11}, Lcom/google/protobuf/v0$a;->g(BBB[CI)V

    .line 160
    .line 161
    .line 162
    move v11, v8

    .line 163
    goto :goto_2

    .line 164
    :cond_7
    invoke-static {}, Lcom/google/protobuf/B;->d()Lcom/google/protobuf/B;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    throw v0

    .line 169
    :cond_8
    sub-long v18, v4, v14

    .line 170
    .line 171
    cmp-long v1, v7, v18

    .line 172
    .line 173
    if-gez v1, :cond_9

    .line 174
    .line 175
    add-long/2addr v14, v2

    .line 176
    invoke-static {v7, v8}, Lcom/google/protobuf/u0;->w(J)B

    .line 177
    .line 178
    .line 179
    move-result v7

    .line 180
    add-long v16, v2, v16

    .line 181
    .line 182
    invoke-static {v14, v15}, Lcom/google/protobuf/u0;->w(J)B

    .line 183
    .line 184
    .line 185
    move-result v8

    .line 186
    const-wide/16 v14, 0x4

    .line 187
    .line 188
    add-long/2addr v2, v14

    .line 189
    invoke-static/range {v16 .. v17}, Lcom/google/protobuf/u0;->w(J)B

    .line 190
    .line 191
    .line 192
    move-result v9

    .line 193
    invoke-static/range {v6 .. v11}, Lcom/google/protobuf/v0$a;->a(BBBB[CI)V

    .line 194
    .line 195
    .line 196
    add-int/lit8 v11, v11, 0x2

    .line 197
    .line 198
    goto/16 :goto_2

    .line 199
    .line 200
    :cond_9
    invoke-static {}, Lcom/google/protobuf/B;->d()Lcom/google/protobuf/B;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    throw v0

    .line 205
    :cond_a
    new-instance v1, Ljava/lang/String;

    .line 206
    .line 207
    invoke-direct {v1, v10, v0, v11}, Ljava/lang/String;-><init>([CII)V

    .line 208
    .line 209
    .line 210
    return-object v1

    .line 211
    :cond_b
    new-instance v2, Ljava/lang/ArrayIndexOutOfBoundsException;

    .line 212
    .line 213
    invoke-virtual/range {p1 .. p1}, Ljava/nio/ByteBuffer;->limit()I

    .line 214
    .line 215
    .line 216
    move-result v3

    .line 217
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 218
    .line 219
    .line 220
    move-result-object v3

    .line 221
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 226
    .line 227
    .line 228
    move-result-object v1

    .line 229
    filled-new-array {v3, v0, v1}, [Ljava/lang/Object;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    const-string v1, "buffer limit=%d, index=%d, limit=%d"

    .line 234
    .line 235
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    invoke-direct {v2, v0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    .line 240
    .line 241
    .line 242
    throw v2
.end method

.method e(Ljava/lang/CharSequence;[BII)I
    .locals 23

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    move/from16 v2, p3

    .line 6
    .line 7
    move/from16 v3, p4

    .line 8
    .line 9
    int-to-long v4, v2

    .line 10
    int-to-long v6, v3

    .line 11
    add-long/2addr v6, v4

    .line 12
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 13
    .line 14
    .line 15
    move-result v8

    .line 16
    const-string v9, " at index "

    .line 17
    .line 18
    const-string v10, "Failed writing "

    .line 19
    .line 20
    if-gt v8, v3, :cond_c

    .line 21
    .line 22
    array-length v11, v1

    .line 23
    sub-int/2addr v11, v3

    .line 24
    if-lt v11, v2, :cond_c

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    :goto_0
    const-wide/16 v11, 0x1

    .line 28
    .line 29
    const/16 v3, 0x80

    .line 30
    .line 31
    if-ge v2, v8, :cond_0

    .line 32
    .line 33
    invoke-interface {v0, v2}, Ljava/lang/CharSequence;->charAt(I)C

    .line 34
    .line 35
    .line 36
    move-result v13

    .line 37
    if-ge v13, v3, :cond_0

    .line 38
    .line 39
    add-long/2addr v11, v4

    .line 40
    int-to-byte v3, v13

    .line 41
    invoke-static {v1, v4, v5, v3}, Lcom/google/protobuf/u0;->O([BJB)V

    .line 42
    .line 43
    .line 44
    add-int/lit8 v2, v2, 0x1

    .line 45
    .line 46
    move-wide v4, v11

    .line 47
    goto :goto_0

    .line 48
    :cond_0
    if-ne v2, v8, :cond_1

    .line 49
    .line 50
    long-to-int v0, v4

    .line 51
    return v0

    .line 52
    :cond_1
    :goto_1
    if-ge v2, v8, :cond_b

    .line 53
    .line 54
    invoke-interface {v0, v2}, Ljava/lang/CharSequence;->charAt(I)C

    .line 55
    .line 56
    .line 57
    move-result v13

    .line 58
    if-ge v13, v3, :cond_2

    .line 59
    .line 60
    cmp-long v14, v4, v6

    .line 61
    .line 62
    if-gez v14, :cond_2

    .line 63
    .line 64
    add-long v14, v4, v11

    .line 65
    .line 66
    int-to-byte v13, v13

    .line 67
    invoke-static {v1, v4, v5, v13}, Lcom/google/protobuf/u0;->O([BJB)V

    .line 68
    .line 69
    .line 70
    move-wide/from16 v19, v6

    .line 71
    .line 72
    move-wide/from16 p3, v11

    .line 73
    .line 74
    move-wide v4, v14

    .line 75
    goto/16 :goto_4

    .line 76
    .line 77
    :cond_2
    const/16 v14, 0x800

    .line 78
    .line 79
    const-wide/16 v15, 0x2

    .line 80
    .line 81
    if-ge v13, v14, :cond_3

    .line 82
    .line 83
    sub-long v17, v6, v15

    .line 84
    .line 85
    cmp-long v14, v4, v17

    .line 86
    .line 87
    if-gtz v14, :cond_3

    .line 88
    .line 89
    move-wide/from16 p3, v11

    .line 90
    .line 91
    add-long v11, v4, p3

    .line 92
    .line 93
    ushr-int/lit8 v14, v13, 0x6

    .line 94
    .line 95
    or-int/lit16 v14, v14, 0x3c0

    .line 96
    .line 97
    int-to-byte v14, v14

    .line 98
    invoke-static {v1, v4, v5, v14}, Lcom/google/protobuf/u0;->O([BJB)V

    .line 99
    .line 100
    .line 101
    add-long/2addr v4, v15

    .line 102
    and-int/lit8 v13, v13, 0x3f

    .line 103
    .line 104
    or-int/2addr v13, v3

    .line 105
    int-to-byte v13, v13

    .line 106
    invoke-static {v1, v11, v12, v13}, Lcom/google/protobuf/u0;->O([BJB)V

    .line 107
    .line 108
    .line 109
    move-wide/from16 v19, v6

    .line 110
    .line 111
    goto/16 :goto_4

    .line 112
    .line 113
    :cond_3
    move-wide/from16 p3, v11

    .line 114
    .line 115
    const v11, 0xdfff

    .line 116
    .line 117
    .line 118
    const v12, 0xd800

    .line 119
    .line 120
    .line 121
    const-wide/16 v17, 0x3

    .line 122
    .line 123
    if-lt v13, v12, :cond_5

    .line 124
    .line 125
    if-ge v11, v13, :cond_4

    .line 126
    .line 127
    goto :goto_2

    .line 128
    :cond_4
    move-wide/from16 v19, v6

    .line 129
    .line 130
    goto :goto_3

    .line 131
    :cond_5
    :goto_2
    sub-long v19, v6, v17

    .line 132
    .line 133
    cmp-long v14, v4, v19

    .line 134
    .line 135
    if-gtz v14, :cond_4

    .line 136
    .line 137
    add-long v11, v4, p3

    .line 138
    .line 139
    ushr-int/lit8 v14, v13, 0xc

    .line 140
    .line 141
    or-int/lit16 v14, v14, 0x1e0

    .line 142
    .line 143
    int-to-byte v14, v14

    .line 144
    invoke-static {v1, v4, v5, v14}, Lcom/google/protobuf/u0;->O([BJB)V

    .line 145
    .line 146
    .line 147
    add-long v14, v4, v15

    .line 148
    .line 149
    ushr-int/lit8 v16, v13, 0x6

    .line 150
    .line 151
    move-wide/from16 v19, v6

    .line 152
    .line 153
    and-int/lit8 v6, v16, 0x3f

    .line 154
    .line 155
    or-int/2addr v6, v3

    .line 156
    int-to-byte v6, v6

    .line 157
    invoke-static {v1, v11, v12, v6}, Lcom/google/protobuf/u0;->O([BJB)V

    .line 158
    .line 159
    .line 160
    add-long v4, v4, v17

    .line 161
    .line 162
    and-int/lit8 v6, v13, 0x3f

    .line 163
    .line 164
    or-int/2addr v6, v3

    .line 165
    int-to-byte v6, v6

    .line 166
    invoke-static {v1, v14, v15, v6}, Lcom/google/protobuf/u0;->O([BJB)V

    .line 167
    .line 168
    .line 169
    goto :goto_4

    .line 170
    :goto_3
    const-wide/16 v6, 0x4

    .line 171
    .line 172
    sub-long v21, v19, v6

    .line 173
    .line 174
    cmp-long v14, v4, v21

    .line 175
    .line 176
    if-gtz v14, :cond_8

    .line 177
    .line 178
    add-int/lit8 v11, v2, 0x1

    .line 179
    .line 180
    if-eq v11, v8, :cond_7

    .line 181
    .line 182
    invoke-interface {v0, v11}, Ljava/lang/CharSequence;->charAt(I)C

    .line 183
    .line 184
    .line 185
    move-result v2

    .line 186
    invoke-static {v13, v2}, Ljava/lang/Character;->isSurrogatePair(CC)Z

    .line 187
    .line 188
    .line 189
    move-result v12

    .line 190
    if-eqz v12, :cond_6

    .line 191
    .line 192
    invoke-static {v13, v2}, Ljava/lang/Character;->toCodePoint(CC)I

    .line 193
    .line 194
    .line 195
    move-result v2

    .line 196
    add-long v12, v4, p3

    .line 197
    .line 198
    ushr-int/lit8 v14, v2, 0x12

    .line 199
    .line 200
    or-int/lit16 v14, v14, 0xf0

    .line 201
    .line 202
    int-to-byte v14, v14

    .line 203
    invoke-static {v1, v4, v5, v14}, Lcom/google/protobuf/u0;->O([BJB)V

    .line 204
    .line 205
    .line 206
    add-long v14, v4, v15

    .line 207
    .line 208
    ushr-int/lit8 v16, v2, 0xc

    .line 209
    .line 210
    move-wide/from16 v21, v6

    .line 211
    .line 212
    and-int/lit8 v6, v16, 0x3f

    .line 213
    .line 214
    or-int/2addr v6, v3

    .line 215
    int-to-byte v6, v6

    .line 216
    invoke-static {v1, v12, v13, v6}, Lcom/google/protobuf/u0;->O([BJB)V

    .line 217
    .line 218
    .line 219
    add-long v6, v4, v17

    .line 220
    .line 221
    ushr-int/lit8 v12, v2, 0x6

    .line 222
    .line 223
    and-int/lit8 v12, v12, 0x3f

    .line 224
    .line 225
    or-int/2addr v12, v3

    .line 226
    int-to-byte v12, v12

    .line 227
    invoke-static {v1, v14, v15, v12}, Lcom/google/protobuf/u0;->O([BJB)V

    .line 228
    .line 229
    .line 230
    add-long v4, v4, v21

    .line 231
    .line 232
    and-int/lit8 v2, v2, 0x3f

    .line 233
    .line 234
    or-int/2addr v2, v3

    .line 235
    int-to-byte v2, v2

    .line 236
    invoke-static {v1, v6, v7, v2}, Lcom/google/protobuf/u0;->O([BJB)V

    .line 237
    .line 238
    .line 239
    move v2, v11

    .line 240
    :goto_4
    add-int/lit8 v2, v2, 0x1

    .line 241
    .line 242
    move-wide/from16 v11, p3

    .line 243
    .line 244
    move-wide/from16 v6, v19

    .line 245
    .line 246
    goto/16 :goto_1

    .line 247
    .line 248
    :cond_6
    move v2, v11

    .line 249
    :cond_7
    new-instance v0, Lcom/google/protobuf/v0$d;

    .line 250
    .line 251
    add-int/lit8 v2, v2, -0x1

    .line 252
    .line 253
    invoke-direct {v0, v2, v8}, Lcom/google/protobuf/v0$d;-><init>(II)V

    .line 254
    .line 255
    .line 256
    throw v0

    .line 257
    :cond_8
    if-gt v12, v13, :cond_a

    .line 258
    .line 259
    if-gt v13, v11, :cond_a

    .line 260
    .line 261
    add-int/lit8 v1, v2, 0x1

    .line 262
    .line 263
    if-eq v1, v8, :cond_9

    .line 264
    .line 265
    invoke-interface {v0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    .line 266
    .line 267
    .line 268
    move-result v0

    .line 269
    invoke-static {v13, v0}, Ljava/lang/Character;->isSurrogatePair(CC)Z

    .line 270
    .line 271
    .line 272
    move-result v0

    .line 273
    if-nez v0, :cond_a

    .line 274
    .line 275
    :cond_9
    new-instance v0, Lcom/google/protobuf/v0$d;

    .line 276
    .line 277
    invoke-direct {v0, v2, v8}, Lcom/google/protobuf/v0$d;-><init>(II)V

    .line 278
    .line 279
    .line 280
    throw v0

    .line 281
    :cond_a
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    .line 282
    .line 283
    new-instance v1, Ljava/lang/StringBuilder;

    .line 284
    .line 285
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 286
    .line 287
    .line 288
    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 289
    .line 290
    .line 291
    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 292
    .line 293
    .line 294
    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 295
    .line 296
    .line 297
    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 298
    .line 299
    .line 300
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 301
    .line 302
    .line 303
    move-result-object v1

    .line 304
    invoke-direct {v0, v1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    .line 305
    .line 306
    .line 307
    throw v0

    .line 308
    :cond_b
    long-to-int v0, v4

    .line 309
    return v0

    .line 310
    :cond_c
    new-instance v1, Ljava/lang/ArrayIndexOutOfBoundsException;

    .line 311
    .line 312
    new-instance v4, Ljava/lang/StringBuilder;

    .line 313
    .line 314
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 315
    .line 316
    .line 317
    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 318
    .line 319
    .line 320
    add-int/lit8 v8, v8, -0x1

    .line 321
    .line 322
    invoke-interface {v0, v8}, Ljava/lang/CharSequence;->charAt(I)C

    .line 323
    .line 324
    .line 325
    move-result v0

    .line 326
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 327
    .line 328
    .line 329
    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 330
    .line 331
    .line 332
    add-int v0, v2, v3

    .line 333
    .line 334
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 335
    .line 336
    .line 337
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 338
    .line 339
    .line 340
    move-result-object v0

    .line 341
    invoke-direct {v1, v0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    .line 342
    .line 343
    .line 344
    throw v1
.end method

.method i(I[BII)I
    .locals 9

    .line 1
    or-int p0, p3, p4

    .line 2
    .line 3
    array-length v0, p2

    .line 4
    sub-int/2addr v0, p4

    .line 5
    or-int/2addr p0, v0

    .line 6
    if-ltz p0, :cond_11

    .line 7
    .line 8
    int-to-long v0, p3

    .line 9
    int-to-long p3, p4

    .line 10
    if-eqz p1, :cond_10

    .line 11
    .line 12
    cmp-long p0, v0, p3

    .line 13
    .line 14
    if-ltz p0, :cond_0

    .line 15
    .line 16
    return p1

    .line 17
    :cond_0
    int-to-byte p0, p1

    .line 18
    const/16 v2, -0x20

    .line 19
    .line 20
    const/4 v3, -0x1

    .line 21
    const/16 v4, -0x41

    .line 22
    .line 23
    const-wide/16 v5, 0x1

    .line 24
    .line 25
    if-ge p0, v2, :cond_3

    .line 26
    .line 27
    const/16 p1, -0x3e

    .line 28
    .line 29
    if-lt p0, p1, :cond_2

    .line 30
    .line 31
    add-long/2addr v5, v0

    .line 32
    invoke-static {p2, v0, v1}, Lcom/google/protobuf/u0;->x([BJ)B

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-le p0, v4, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    move-wide v0, v5

    .line 40
    goto/16 :goto_3

    .line 41
    .line 42
    :cond_2
    :goto_0
    return v3

    .line 43
    :cond_3
    const/16 v7, -0x10

    .line 44
    .line 45
    if-ge p0, v7, :cond_a

    .line 46
    .line 47
    shr-int/lit8 p1, p1, 0x8

    .line 48
    .line 49
    not-int p1, p1

    .line 50
    int-to-byte p1, p1

    .line 51
    if-nez p1, :cond_5

    .line 52
    .line 53
    add-long v7, v0, v5

    .line 54
    .line 55
    invoke-static {p2, v0, v1}, Lcom/google/protobuf/u0;->x([BJ)B

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    cmp-long v0, v7, p3

    .line 60
    .line 61
    if-ltz v0, :cond_4

    .line 62
    .line 63
    invoke-static {p0, p1}, Lcom/google/protobuf/v0;->a(II)I

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    return p0

    .line 68
    :cond_4
    move-wide v0, v7

    .line 69
    :cond_5
    if-gt p1, v4, :cond_9

    .line 70
    .line 71
    const/16 v7, -0x60

    .line 72
    .line 73
    if-ne p0, v2, :cond_6

    .line 74
    .line 75
    if-lt p1, v7, :cond_9

    .line 76
    .line 77
    :cond_6
    const/16 v2, -0x13

    .line 78
    .line 79
    if-ne p0, v2, :cond_7

    .line 80
    .line 81
    if-ge p1, v7, :cond_9

    .line 82
    .line 83
    :cond_7
    add-long p0, v0, v5

    .line 84
    .line 85
    invoke-static {p2, v0, v1}, Lcom/google/protobuf/u0;->x([BJ)B

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-le v0, v4, :cond_8

    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_8
    move-wide v0, p0

    .line 93
    goto :goto_3

    .line 94
    :cond_9
    :goto_1
    return v3

    .line 95
    :cond_a
    shr-int/lit8 v2, p1, 0x8

    .line 96
    .line 97
    not-int v2, v2

    .line 98
    int-to-byte v2, v2

    .line 99
    if-nez v2, :cond_c

    .line 100
    .line 101
    add-long v7, v0, v5

    .line 102
    .line 103
    invoke-static {p2, v0, v1}, Lcom/google/protobuf/u0;->x([BJ)B

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    cmp-long p1, v7, p3

    .line 108
    .line 109
    if-ltz p1, :cond_b

    .line 110
    .line 111
    invoke-static {p0, v2}, Lcom/google/protobuf/v0;->a(II)I

    .line 112
    .line 113
    .line 114
    move-result p0

    .line 115
    return p0

    .line 116
    :cond_b
    const/4 p1, 0x0

    .line 117
    move-wide v0, v7

    .line 118
    goto :goto_2

    .line 119
    :cond_c
    shr-int/lit8 p1, p1, 0x10

    .line 120
    .line 121
    int-to-byte p1, p1

    .line 122
    :goto_2
    if-nez p1, :cond_e

    .line 123
    .line 124
    add-long v7, v0, v5

    .line 125
    .line 126
    invoke-static {p2, v0, v1}, Lcom/google/protobuf/u0;->x([BJ)B

    .line 127
    .line 128
    .line 129
    move-result p1

    .line 130
    cmp-long v0, v7, p3

    .line 131
    .line 132
    if-ltz v0, :cond_d

    .line 133
    .line 134
    invoke-static {p0, v2, p1}, Lcom/google/protobuf/v0;->b(III)I

    .line 135
    .line 136
    .line 137
    move-result p0

    .line 138
    return p0

    .line 139
    :cond_d
    move-wide v0, v7

    .line 140
    :cond_e
    if-gt v2, v4, :cond_f

    .line 141
    .line 142
    shl-int/lit8 p0, p0, 0x1c

    .line 143
    .line 144
    add-int/lit8 v2, v2, 0x70

    .line 145
    .line 146
    add-int/2addr p0, v2

    .line 147
    shr-int/lit8 p0, p0, 0x1e

    .line 148
    .line 149
    if-nez p0, :cond_f

    .line 150
    .line 151
    if-gt p1, v4, :cond_f

    .line 152
    .line 153
    add-long p0, v0, v5

    .line 154
    .line 155
    invoke-static {p2, v0, v1}, Lcom/google/protobuf/u0;->x([BJ)B

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    if-le v0, v4, :cond_8

    .line 160
    .line 161
    :cond_f
    return v3

    .line 162
    :cond_10
    :goto_3
    sub-long/2addr p3, v0

    .line 163
    long-to-int p0, p3

    .line 164
    invoke-static {p2, v0, v1, p0}, Lcom/google/protobuf/v0$e;->o([BJI)I

    .line 165
    .line 166
    .line 167
    move-result p0

    .line 168
    return p0

    .line 169
    :cond_11
    new-instance p0, Ljava/lang/ArrayIndexOutOfBoundsException;

    .line 170
    .line 171
    array-length p1, p2

    .line 172
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 177
    .line 178
    .line 179
    move-result-object p2

    .line 180
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 181
    .line 182
    .line 183
    move-result-object p3

    .line 184
    filled-new-array {p1, p2, p3}, [Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    const-string p2, "Array length=%d, index=%d, limit=%d"

    .line 189
    .line 190
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    invoke-direct {p0, p1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    throw p0
.end method

.method l(ILjava/nio/ByteBuffer;II)I
    .locals 8

    .line 1
    or-int p0, p3, p4

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->limit()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sub-int/2addr v0, p4

    .line 8
    or-int/2addr p0, v0

    .line 9
    if-ltz p0, :cond_11

    .line 10
    .line 11
    invoke-static {p2}, Lcom/google/protobuf/u0;->k(Ljava/nio/ByteBuffer;)J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    int-to-long v2, p3

    .line 16
    add-long/2addr v0, v2

    .line 17
    sub-int/2addr p4, p3

    .line 18
    int-to-long p2, p4

    .line 19
    add-long/2addr p2, v0

    .line 20
    if-eqz p1, :cond_10

    .line 21
    .line 22
    cmp-long p0, v0, p2

    .line 23
    .line 24
    if-ltz p0, :cond_0

    .line 25
    .line 26
    return p1

    .line 27
    :cond_0
    int-to-byte p0, p1

    .line 28
    const/16 p4, -0x20

    .line 29
    .line 30
    const/4 v2, -0x1

    .line 31
    const/16 v3, -0x41

    .line 32
    .line 33
    const-wide/16 v4, 0x1

    .line 34
    .line 35
    if-ge p0, p4, :cond_3

    .line 36
    .line 37
    const/16 p1, -0x3e

    .line 38
    .line 39
    if-lt p0, p1, :cond_2

    .line 40
    .line 41
    add-long/2addr v4, v0

    .line 42
    invoke-static {v0, v1}, Lcom/google/protobuf/u0;->w(J)B

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-le p0, v3, :cond_1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    move-wide v0, v4

    .line 50
    goto/16 :goto_3

    .line 51
    .line 52
    :cond_2
    :goto_0
    return v2

    .line 53
    :cond_3
    const/16 v6, -0x10

    .line 54
    .line 55
    if-ge p0, v6, :cond_a

    .line 56
    .line 57
    shr-int/lit8 p1, p1, 0x8

    .line 58
    .line 59
    not-int p1, p1

    .line 60
    int-to-byte p1, p1

    .line 61
    if-nez p1, :cond_5

    .line 62
    .line 63
    add-long v6, v0, v4

    .line 64
    .line 65
    invoke-static {v0, v1}, Lcom/google/protobuf/u0;->w(J)B

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    cmp-long v0, v6, p2

    .line 70
    .line 71
    if-ltz v0, :cond_4

    .line 72
    .line 73
    invoke-static {p0, p1}, Lcom/google/protobuf/v0;->a(II)I

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    return p0

    .line 78
    :cond_4
    move-wide v0, v6

    .line 79
    :cond_5
    if-gt p1, v3, :cond_9

    .line 80
    .line 81
    const/16 v6, -0x60

    .line 82
    .line 83
    if-ne p0, p4, :cond_6

    .line 84
    .line 85
    if-lt p1, v6, :cond_9

    .line 86
    .line 87
    :cond_6
    const/16 p4, -0x13

    .line 88
    .line 89
    if-ne p0, p4, :cond_7

    .line 90
    .line 91
    if-ge p1, v6, :cond_9

    .line 92
    .line 93
    :cond_7
    add-long p0, v0, v4

    .line 94
    .line 95
    invoke-static {v0, v1}, Lcom/google/protobuf/u0;->w(J)B

    .line 96
    .line 97
    .line 98
    move-result p4

    .line 99
    if-le p4, v3, :cond_8

    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_8
    move-wide v0, p0

    .line 103
    goto :goto_3

    .line 104
    :cond_9
    :goto_1
    return v2

    .line 105
    :cond_a
    shr-int/lit8 p4, p1, 0x8

    .line 106
    .line 107
    not-int p4, p4

    .line 108
    int-to-byte p4, p4

    .line 109
    if-nez p4, :cond_c

    .line 110
    .line 111
    add-long v6, v0, v4

    .line 112
    .line 113
    invoke-static {v0, v1}, Lcom/google/protobuf/u0;->w(J)B

    .line 114
    .line 115
    .line 116
    move-result p4

    .line 117
    cmp-long p1, v6, p2

    .line 118
    .line 119
    if-ltz p1, :cond_b

    .line 120
    .line 121
    invoke-static {p0, p4}, Lcom/google/protobuf/v0;->a(II)I

    .line 122
    .line 123
    .line 124
    move-result p0

    .line 125
    return p0

    .line 126
    :cond_b
    const/4 p1, 0x0

    .line 127
    move-wide v0, v6

    .line 128
    goto :goto_2

    .line 129
    :cond_c
    shr-int/lit8 p1, p1, 0x10

    .line 130
    .line 131
    int-to-byte p1, p1

    .line 132
    :goto_2
    if-nez p1, :cond_e

    .line 133
    .line 134
    add-long v6, v0, v4

    .line 135
    .line 136
    invoke-static {v0, v1}, Lcom/google/protobuf/u0;->w(J)B

    .line 137
    .line 138
    .line 139
    move-result p1

    .line 140
    cmp-long v0, v6, p2

    .line 141
    .line 142
    if-ltz v0, :cond_d

    .line 143
    .line 144
    invoke-static {p0, p4, p1}, Lcom/google/protobuf/v0;->b(III)I

    .line 145
    .line 146
    .line 147
    move-result p0

    .line 148
    return p0

    .line 149
    :cond_d
    move-wide v0, v6

    .line 150
    :cond_e
    if-gt p4, v3, :cond_f

    .line 151
    .line 152
    shl-int/lit8 p0, p0, 0x1c

    .line 153
    .line 154
    add-int/lit8 p4, p4, 0x70

    .line 155
    .line 156
    add-int/2addr p0, p4

    .line 157
    shr-int/lit8 p0, p0, 0x1e

    .line 158
    .line 159
    if-nez p0, :cond_f

    .line 160
    .line 161
    if-gt p1, v3, :cond_f

    .line 162
    .line 163
    add-long p0, v0, v4

    .line 164
    .line 165
    invoke-static {v0, v1}, Lcom/google/protobuf/u0;->w(J)B

    .line 166
    .line 167
    .line 168
    move-result p4

    .line 169
    if-le p4, v3, :cond_8

    .line 170
    .line 171
    :cond_f
    return v2

    .line 172
    :cond_10
    :goto_3
    sub-long/2addr p2, v0

    .line 173
    long-to-int p0, p2

    .line 174
    invoke-static {v0, v1, p0}, Lcom/google/protobuf/v0$e;->n(JI)I

    .line 175
    .line 176
    .line 177
    move-result p0

    .line 178
    return p0

    .line 179
    :cond_11
    new-instance p0, Ljava/lang/ArrayIndexOutOfBoundsException;

    .line 180
    .line 181
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->limit()I

    .line 182
    .line 183
    .line 184
    move-result p1

    .line 185
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 190
    .line 191
    .line 192
    move-result-object p2

    .line 193
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 194
    .line 195
    .line 196
    move-result-object p3

    .line 197
    filled-new-array {p1, p2, p3}, [Ljava/lang/Object;

    .line 198
    .line 199
    .line 200
    move-result-object p1

    .line 201
    const-string p2, "buffer limit=%d, index=%d, limit=%d"

    .line 202
    .line 203
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object p1

    .line 207
    invoke-direct {p0, p1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    throw p0
.end method
