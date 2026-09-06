.class Landroidx/profileinstaller/g;
.super Ljava/lang/Object;
.source "ProfileTranscoder.java"


# static fields
.field static final a:[B

.field static final b:[B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/4 v0, 0x4

    .line 2
    new-array v1, v0, [B

    .line 3
    .line 4
    fill-array-data v1, :array_0

    .line 5
    .line 6
    .line 7
    sput-object v1, Landroidx/profileinstaller/g;->a:[B

    .line 8
    .line 9
    new-array v0, v0, [B

    .line 10
    .line 11
    fill-array-data v0, :array_1

    .line 12
    .line 13
    .line 14
    sput-object v0, Landroidx/profileinstaller/g;->b:[B

    .line 15
    .line 16
    return-void

    .line 17
    :array_0
    .array-data 1
        0x70t
        0x72t
        0x6ft
        0x0t
    .end array-data

    .line 18
    .line 19
    .line 20
    :array_1
    .array-data 1
        0x70t
        0x72t
        0x6dt
        0x0t
    .end array-data
.end method

.method private static A([BIILandroidx/profileinstaller/c;)V
    .locals 1

    .line 1
    iget p3, p3, Landroidx/profileinstaller/c;->g:I

    .line 2
    .line 3
    invoke-static {p1, p2, p3}, Landroidx/profileinstaller/g;->m(III)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    div-int/lit8 p2, p1, 0x8

    .line 8
    .line 9
    aget-byte p3, p0, p2

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    rem-int/lit8 p1, p1, 0x8

    .line 13
    .line 14
    shl-int p1, v0, p1

    .line 15
    .line 16
    or-int/2addr p1, p3

    .line 17
    int-to-byte p1, p1

    .line 18
    aput-byte p1, p0, p2

    .line 19
    .line 20
    return-void
.end method

.method private static B(Ljava/io/InputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-static {p0}, Landroidx/profileinstaller/d;->h(Ljava/io/InputStream;)I

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Landroidx/profileinstaller/d;->j(Ljava/io/InputStream;)I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x6

    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    goto :goto_2

    .line 12
    :cond_0
    const/4 v1, 0x7

    .line 13
    if-ne v0, v1, :cond_1

    .line 14
    .line 15
    goto :goto_2

    .line 16
    :cond_1
    :goto_0
    if-lez v0, :cond_3

    .line 17
    .line 18
    invoke-static {p0}, Landroidx/profileinstaller/d;->j(Ljava/io/InputStream;)I

    .line 19
    .line 20
    .line 21
    invoke-static {p0}, Landroidx/profileinstaller/d;->j(Ljava/io/InputStream;)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    :goto_1
    if-lez v1, :cond_2

    .line 26
    .line 27
    invoke-static {p0}, Landroidx/profileinstaller/d;->h(Ljava/io/InputStream;)I

    .line 28
    .line 29
    .line 30
    add-int/lit8 v1, v1, -0x1

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_2
    add-int/lit8 v0, v0, -0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_3
    :goto_2
    return-void
.end method

.method static C(Ljava/io/OutputStream;[B[Landroidx/profileinstaller/c;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    sget-object v0, Landroidx/profileinstaller/i;->a:[B

    .line 2
    .line 3
    invoke-static {p1, v0}, Ljava/util/Arrays;->equals([B[B)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-static {p0, p2}, Landroidx/profileinstaller/g;->P(Ljava/io/OutputStream;[Landroidx/profileinstaller/c;)V

    .line 11
    .line 12
    .line 13
    return v1

    .line 14
    :cond_0
    sget-object v0, Landroidx/profileinstaller/i;->b:[B

    .line 15
    .line 16
    invoke-static {p1, v0}, Ljava/util/Arrays;->equals([B[B)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-static {p0, p2}, Landroidx/profileinstaller/g;->O(Ljava/io/OutputStream;[Landroidx/profileinstaller/c;)V

    .line 23
    .line 24
    .line 25
    return v1

    .line 26
    :cond_1
    sget-object v0, Landroidx/profileinstaller/i;->d:[B

    .line 27
    .line 28
    invoke-static {p1, v0}, Ljava/util/Arrays;->equals([B[B)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    invoke-static {p0, p2}, Landroidx/profileinstaller/g;->M(Ljava/io/OutputStream;[Landroidx/profileinstaller/c;)V

    .line 35
    .line 36
    .line 37
    return v1

    .line 38
    :cond_2
    sget-object v0, Landroidx/profileinstaller/i;->c:[B

    .line 39
    .line 40
    invoke-static {p1, v0}, Ljava/util/Arrays;->equals([B[B)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_3

    .line 45
    .line 46
    invoke-static {p0, p2}, Landroidx/profileinstaller/g;->N(Ljava/io/OutputStream;[Landroidx/profileinstaller/c;)V

    .line 47
    .line 48
    .line 49
    return v1

    .line 50
    :cond_3
    sget-object v0, Landroidx/profileinstaller/i;->e:[B

    .line 51
    .line 52
    invoke-static {p1, v0}, Ljava/util/Arrays;->equals([B[B)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_4

    .line 57
    .line 58
    invoke-static {p0, p2}, Landroidx/profileinstaller/g;->L(Ljava/io/OutputStream;[Landroidx/profileinstaller/c;)V

    .line 59
    .line 60
    .line 61
    return v1

    .line 62
    :cond_4
    const/4 p0, 0x0

    .line 63
    return p0
.end method

.method private static D(Ljava/io/OutputStream;Landroidx/profileinstaller/c;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object p1, p1, Landroidx/profileinstaller/c;->h:[I

    .line 2
    .line 3
    array-length v0, p1

    .line 4
    const/4 v1, 0x0

    .line 5
    move v2, v1

    .line 6
    :goto_0
    if-ge v1, v0, :cond_0

    .line 7
    .line 8
    aget v3, p1, v1

    .line 9
    .line 10
    sub-int v2, v3, v2

    .line 11
    .line 12
    invoke-static {p0, v2}, Landroidx/profileinstaller/d;->p(Ljava/io/OutputStream;I)V

    .line 13
    .line 14
    .line 15
    add-int/lit8 v1, v1, 0x1

    .line 16
    .line 17
    move v2, v3

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    return-void
.end method

.method private static E([Landroidx/profileinstaller/c;)Landroidx/profileinstaller/j;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    array-length v1, p0

    .line 7
    invoke-static {v0, v1}, Landroidx/profileinstaller/d;->p(Ljava/io/OutputStream;I)V

    .line 8
    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    const/4 v2, 0x2

    .line 12
    move v3, v1

    .line 13
    :goto_0
    array-length v4, p0

    .line 14
    if-ge v3, v4, :cond_0

    .line 15
    .line 16
    aget-object v4, p0, v3

    .line 17
    .line 18
    iget-wide v5, v4, Landroidx/profileinstaller/c;->c:J

    .line 19
    .line 20
    invoke-static {v0, v5, v6}, Landroidx/profileinstaller/d;->q(Ljava/io/OutputStream;J)V

    .line 21
    .line 22
    .line 23
    iget-wide v5, v4, Landroidx/profileinstaller/c;->d:J

    .line 24
    .line 25
    invoke-static {v0, v5, v6}, Landroidx/profileinstaller/d;->q(Ljava/io/OutputStream;J)V

    .line 26
    .line 27
    .line 28
    iget v5, v4, Landroidx/profileinstaller/c;->g:I

    .line 29
    .line 30
    int-to-long v5, v5

    .line 31
    invoke-static {v0, v5, v6}, Landroidx/profileinstaller/d;->q(Ljava/io/OutputStream;J)V

    .line 32
    .line 33
    .line 34
    iget-object v5, v4, Landroidx/profileinstaller/c;->a:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v4, v4, Landroidx/profileinstaller/c;->b:Ljava/lang/String;

    .line 37
    .line 38
    sget-object v6, Landroidx/profileinstaller/i;->a:[B

    .line 39
    .line 40
    invoke-static {v5, v4, v6}, Landroidx/profileinstaller/g;->j(Ljava/lang/String;Ljava/lang/String;[B)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    add-int/lit8 v2, v2, 0xe

    .line 45
    .line 46
    invoke-static {v4}, Landroidx/profileinstaller/d;->k(Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    move-result v5

    .line 50
    invoke-static {v0, v5}, Landroidx/profileinstaller/d;->p(Ljava/io/OutputStream;I)V

    .line 51
    .line 52
    .line 53
    add-int/2addr v2, v5

    .line 54
    invoke-static {v0, v4}, Landroidx/profileinstaller/d;->n(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    add-int/lit8 v3, v3, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :catchall_0
    move-exception p0

    .line 61
    goto :goto_1

    .line 62
    :cond_0
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    array-length v3, p0

    .line 67
    if-ne v2, v3, :cond_1

    .line 68
    .line 69
    new-instance v3, Landroidx/profileinstaller/j;

    .line 70
    .line 71
    sget-object v4, Landroidx/profileinstaller/e;->h:Landroidx/profileinstaller/e;

    .line 72
    .line 73
    invoke-direct {v3, v4, v2, p0, v1}, Landroidx/profileinstaller/j;-><init>(Landroidx/profileinstaller/e;I[BZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 77
    .line 78
    .line 79
    return-object v3

    .line 80
    :cond_1
    :try_start_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 81
    .line 82
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 83
    .line 84
    .line 85
    const-string v3, "Expected size "

    .line 86
    .line 87
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v2, ", does not match actual size "

    .line 94
    .line 95
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    array-length p0, p0

    .line 99
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-static {p0}, Landroidx/profileinstaller/d;->c(Ljava/lang/String;)Ljava/lang/RuntimeException;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 111
    :goto_1
    :try_start_2
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 112
    .line 113
    .line 114
    goto :goto_2

    .line 115
    :catchall_1
    move-exception v0

    .line 116
    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 117
    .line 118
    .line 119
    :goto_2
    throw p0
.end method

.method static F(Ljava/io/OutputStream;[B)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    sget-object v0, Landroidx/profileinstaller/g;->a:[B

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write([B)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ljava/io/OutputStream;->write([B)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private static G(Ljava/io/OutputStream;Landroidx/profileinstaller/c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-static {p0, p1}, Landroidx/profileinstaller/g;->K(Ljava/io/OutputStream;Landroidx/profileinstaller/c;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p0, p1}, Landroidx/profileinstaller/g;->D(Ljava/io/OutputStream;Landroidx/profileinstaller/c;)V

    .line 5
    .line 6
    .line 7
    invoke-static {p0, p1}, Landroidx/profileinstaller/g;->I(Ljava/io/OutputStream;Landroidx/profileinstaller/c;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private static H(Ljava/io/OutputStream;Landroidx/profileinstaller/c;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-static {p2}, Landroidx/profileinstaller/d;->k(Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p0, v0}, Landroidx/profileinstaller/d;->p(Ljava/io/OutputStream;I)V

    .line 6
    .line 7
    .line 8
    iget v0, p1, Landroidx/profileinstaller/c;->e:I

    .line 9
    .line 10
    invoke-static {p0, v0}, Landroidx/profileinstaller/d;->p(Ljava/io/OutputStream;I)V

    .line 11
    .line 12
    .line 13
    iget v0, p1, Landroidx/profileinstaller/c;->f:I

    .line 14
    .line 15
    int-to-long v0, v0

    .line 16
    invoke-static {p0, v0, v1}, Landroidx/profileinstaller/d;->q(Ljava/io/OutputStream;J)V

    .line 17
    .line 18
    .line 19
    iget-wide v0, p1, Landroidx/profileinstaller/c;->c:J

    .line 20
    .line 21
    invoke-static {p0, v0, v1}, Landroidx/profileinstaller/d;->q(Ljava/io/OutputStream;J)V

    .line 22
    .line 23
    .line 24
    iget p1, p1, Landroidx/profileinstaller/c;->g:I

    .line 25
    .line 26
    int-to-long v0, p1

    .line 27
    invoke-static {p0, v0, v1}, Landroidx/profileinstaller/d;->q(Ljava/io/OutputStream;J)V

    .line 28
    .line 29
    .line 30
    invoke-static {p0, p2}, Landroidx/profileinstaller/d;->n(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private static I(Ljava/io/OutputStream;Landroidx/profileinstaller/c;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget v0, p1, Landroidx/profileinstaller/c;->g:I

    .line 2
    .line 3
    invoke-static {v0}, Landroidx/profileinstaller/g;->k(I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    new-array v0, v0, [B

    .line 8
    .line 9
    iget-object v1, p1, Landroidx/profileinstaller/c;->i:Ljava/util/TreeMap;

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/util/TreeMap;->entrySet()Ljava/util/Set;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_2

    .line 24
    .line 25
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Ljava/util/Map$Entry;

    .line 30
    .line 31
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    check-cast v3, Ljava/lang/Integer;

    .line 36
    .line 37
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    check-cast v2, Ljava/lang/Integer;

    .line 46
    .line 47
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    and-int/lit8 v4, v2, 0x2

    .line 52
    .line 53
    if-eqz v4, :cond_1

    .line 54
    .line 55
    const/4 v4, 0x2

    .line 56
    invoke-static {v0, v4, v3, p1}, Landroidx/profileinstaller/g;->A([BIILandroidx/profileinstaller/c;)V

    .line 57
    .line 58
    .line 59
    :cond_1
    and-int/lit8 v2, v2, 0x4

    .line 60
    .line 61
    if-eqz v2, :cond_0

    .line 62
    .line 63
    const/4 v2, 0x4

    .line 64
    invoke-static {v0, v2, v3, p1}, Landroidx/profileinstaller/g;->A([BIILandroidx/profileinstaller/c;)V

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_2
    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write([B)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method private static J(Ljava/io/OutputStream;ILandroidx/profileinstaller/c;)V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget v0, p2, Landroidx/profileinstaller/c;->g:I

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroidx/profileinstaller/g;->l(II)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    new-array v0, v0, [B

    .line 8
    .line 9
    iget-object v1, p2, Landroidx/profileinstaller/c;->i:Ljava/util/TreeMap;

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/util/TreeMap;->entrySet()Ljava/util/Set;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_4

    .line 24
    .line 25
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Ljava/util/Map$Entry;

    .line 30
    .line 31
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    check-cast v3, Ljava/lang/Integer;

    .line 36
    .line 37
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    check-cast v2, Ljava/lang/Integer;

    .line 46
    .line 47
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    const/4 v4, 0x1

    .line 52
    const/4 v5, 0x0

    .line 53
    move v6, v4

    .line 54
    :goto_0
    const/4 v7, 0x4

    .line 55
    if-gt v6, v7, :cond_0

    .line 56
    .line 57
    if-ne v6, v4, :cond_1

    .line 58
    .line 59
    :goto_1
    shl-int/lit8 v6, v6, 0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    and-int v7, v6, p1

    .line 63
    .line 64
    if-nez v7, :cond_2

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_2
    and-int v7, v6, v2

    .line 68
    .line 69
    if-ne v7, v6, :cond_3

    .line 70
    .line 71
    iget v7, p2, Landroidx/profileinstaller/c;->g:I

    .line 72
    .line 73
    mul-int/2addr v7, v5

    .line 74
    add-int/2addr v7, v3

    .line 75
    div-int/lit8 v8, v7, 0x8

    .line 76
    .line 77
    aget-byte v9, v0, v8

    .line 78
    .line 79
    rem-int/lit8 v7, v7, 0x8

    .line 80
    .line 81
    shl-int v7, v4, v7

    .line 82
    .line 83
    or-int/2addr v7, v9

    .line 84
    int-to-byte v7, v7

    .line 85
    aput-byte v7, v0, v8

    .line 86
    .line 87
    :cond_3
    add-int/lit8 v5, v5, 0x1

    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_4
    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write([B)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method private static K(Ljava/io/OutputStream;Landroidx/profileinstaller/c;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object p1, p1, Landroidx/profileinstaller/c;->i:Ljava/util/TreeMap;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/util/TreeMap;->entrySet()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const/4 v0, 0x0

    .line 12
    move v1, v0

    .line 13
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-eqz v2, :cond_1

    .line 18
    .line 19
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Ljava/util/Map$Entry;

    .line 24
    .line 25
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    check-cast v3, Ljava/lang/Integer;

    .line 30
    .line 31
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    check-cast v2, Ljava/lang/Integer;

    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    and-int/lit8 v2, v2, 0x1

    .line 46
    .line 47
    if-nez v2, :cond_0

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    sub-int v1, v3, v1

    .line 51
    .line 52
    invoke-static {p0, v1}, Landroidx/profileinstaller/d;->p(Ljava/io/OutputStream;I)V

    .line 53
    .line 54
    .line 55
    invoke-static {p0, v0}, Landroidx/profileinstaller/d;->p(Ljava/io/OutputStream;I)V

    .line 56
    .line 57
    .line 58
    move v1, v3

    .line 59
    goto :goto_0

    .line 60
    :cond_1
    return-void
.end method

.method private static L(Ljava/io/OutputStream;[Landroidx/profileinstaller/c;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    array-length v0, p1

    .line 2
    invoke-static {p0, v0}, Landroidx/profileinstaller/d;->p(Ljava/io/OutputStream;I)V

    .line 3
    .line 4
    .line 5
    array-length v0, p1

    .line 6
    const/4 v1, 0x0

    .line 7
    move v2, v1

    .line 8
    :goto_0
    if-ge v2, v0, :cond_2

    .line 9
    .line 10
    aget-object v3, p1, v2

    .line 11
    .line 12
    iget-object v4, v3, Landroidx/profileinstaller/c;->a:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v5, v3, Landroidx/profileinstaller/c;->b:Ljava/lang/String;

    .line 15
    .line 16
    sget-object v6, Landroidx/profileinstaller/i;->e:[B

    .line 17
    .line 18
    invoke-static {v4, v5, v6}, Landroidx/profileinstaller/g;->j(Ljava/lang/String;Ljava/lang/String;[B)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    invoke-static {v4}, Landroidx/profileinstaller/d;->k(Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    move-result v5

    .line 26
    invoke-static {p0, v5}, Landroidx/profileinstaller/d;->p(Ljava/io/OutputStream;I)V

    .line 27
    .line 28
    .line 29
    iget-object v5, v3, Landroidx/profileinstaller/c;->i:Ljava/util/TreeMap;

    .line 30
    .line 31
    invoke-virtual {v5}, Ljava/util/TreeMap;->size()I

    .line 32
    .line 33
    .line 34
    move-result v5

    .line 35
    invoke-static {p0, v5}, Landroidx/profileinstaller/d;->p(Ljava/io/OutputStream;I)V

    .line 36
    .line 37
    .line 38
    iget-object v5, v3, Landroidx/profileinstaller/c;->h:[I

    .line 39
    .line 40
    array-length v5, v5

    .line 41
    invoke-static {p0, v5}, Landroidx/profileinstaller/d;->p(Ljava/io/OutputStream;I)V

    .line 42
    .line 43
    .line 44
    iget-wide v5, v3, Landroidx/profileinstaller/c;->c:J

    .line 45
    .line 46
    invoke-static {p0, v5, v6}, Landroidx/profileinstaller/d;->q(Ljava/io/OutputStream;J)V

    .line 47
    .line 48
    .line 49
    invoke-static {p0, v4}, Landroidx/profileinstaller/d;->n(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-object v4, v3, Landroidx/profileinstaller/c;->i:Ljava/util/TreeMap;

    .line 53
    .line 54
    invoke-virtual {v4}, Ljava/util/TreeMap;->keySet()Ljava/util/Set;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 63
    .line 64
    .line 65
    move-result v5

    .line 66
    if-eqz v5, :cond_0

    .line 67
    .line 68
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v5

    .line 72
    check-cast v5, Ljava/lang/Integer;

    .line 73
    .line 74
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 75
    .line 76
    .line 77
    move-result v5

    .line 78
    invoke-static {p0, v5}, Landroidx/profileinstaller/d;->p(Ljava/io/OutputStream;I)V

    .line 79
    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_0
    iget-object v3, v3, Landroidx/profileinstaller/c;->h:[I

    .line 83
    .line 84
    array-length v4, v3

    .line 85
    move v5, v1

    .line 86
    :goto_2
    if-ge v5, v4, :cond_1

    .line 87
    .line 88
    aget v6, v3, v5

    .line 89
    .line 90
    invoke-static {p0, v6}, Landroidx/profileinstaller/d;->p(Ljava/io/OutputStream;I)V

    .line 91
    .line 92
    .line 93
    add-int/lit8 v5, v5, 0x1

    .line 94
    .line 95
    goto :goto_2

    .line 96
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_2
    return-void
.end method

.method private static M(Ljava/io/OutputStream;[Landroidx/profileinstaller/c;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    array-length v0, p1

    .line 2
    invoke-static {p0, v0}, Landroidx/profileinstaller/d;->r(Ljava/io/OutputStream;I)V

    .line 3
    .line 4
    .line 5
    array-length v0, p1

    .line 6
    const/4 v1, 0x0

    .line 7
    move v2, v1

    .line 8
    :goto_0
    if-ge v2, v0, :cond_2

    .line 9
    .line 10
    aget-object v3, p1, v2

    .line 11
    .line 12
    iget-object v4, v3, Landroidx/profileinstaller/c;->i:Ljava/util/TreeMap;

    .line 13
    .line 14
    invoke-virtual {v4}, Ljava/util/TreeMap;->size()I

    .line 15
    .line 16
    .line 17
    move-result v4

    .line 18
    mul-int/lit8 v4, v4, 0x4

    .line 19
    .line 20
    iget-object v5, v3, Landroidx/profileinstaller/c;->a:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v6, v3, Landroidx/profileinstaller/c;->b:Ljava/lang/String;

    .line 23
    .line 24
    sget-object v7, Landroidx/profileinstaller/i;->d:[B

    .line 25
    .line 26
    invoke-static {v5, v6, v7}, Landroidx/profileinstaller/g;->j(Ljava/lang/String;Ljava/lang/String;[B)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v5

    .line 30
    invoke-static {v5}, Landroidx/profileinstaller/d;->k(Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    move-result v6

    .line 34
    invoke-static {p0, v6}, Landroidx/profileinstaller/d;->p(Ljava/io/OutputStream;I)V

    .line 35
    .line 36
    .line 37
    iget-object v6, v3, Landroidx/profileinstaller/c;->h:[I

    .line 38
    .line 39
    array-length v6, v6

    .line 40
    invoke-static {p0, v6}, Landroidx/profileinstaller/d;->p(Ljava/io/OutputStream;I)V

    .line 41
    .line 42
    .line 43
    int-to-long v6, v4

    .line 44
    invoke-static {p0, v6, v7}, Landroidx/profileinstaller/d;->q(Ljava/io/OutputStream;J)V

    .line 45
    .line 46
    .line 47
    iget-wide v6, v3, Landroidx/profileinstaller/c;->c:J

    .line 48
    .line 49
    invoke-static {p0, v6, v7}, Landroidx/profileinstaller/d;->q(Ljava/io/OutputStream;J)V

    .line 50
    .line 51
    .line 52
    invoke-static {p0, v5}, Landroidx/profileinstaller/d;->n(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    iget-object v4, v3, Landroidx/profileinstaller/c;->i:Ljava/util/TreeMap;

    .line 56
    .line 57
    invoke-virtual {v4}, Ljava/util/TreeMap;->keySet()Ljava/util/Set;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 66
    .line 67
    .line 68
    move-result v5

    .line 69
    if-eqz v5, :cond_0

    .line 70
    .line 71
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v5

    .line 75
    check-cast v5, Ljava/lang/Integer;

    .line 76
    .line 77
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 78
    .line 79
    .line 80
    move-result v5

    .line 81
    invoke-static {p0, v5}, Landroidx/profileinstaller/d;->p(Ljava/io/OutputStream;I)V

    .line 82
    .line 83
    .line 84
    invoke-static {p0, v1}, Landroidx/profileinstaller/d;->p(Ljava/io/OutputStream;I)V

    .line 85
    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_0
    iget-object v3, v3, Landroidx/profileinstaller/c;->h:[I

    .line 89
    .line 90
    array-length v4, v3

    .line 91
    move v5, v1

    .line 92
    :goto_2
    if-ge v5, v4, :cond_1

    .line 93
    .line 94
    aget v6, v3, v5

    .line 95
    .line 96
    invoke-static {p0, v6}, Landroidx/profileinstaller/d;->p(Ljava/io/OutputStream;I)V

    .line 97
    .line 98
    .line 99
    add-int/lit8 v5, v5, 0x1

    .line 100
    .line 101
    goto :goto_2

    .line 102
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_2
    return-void
.end method

.method private static N(Ljava/io/OutputStream;[Landroidx/profileinstaller/c;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    sget-object v0, Landroidx/profileinstaller/i;->c:[B

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroidx/profileinstaller/g;->b([Landroidx/profileinstaller/c;[B)[B

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    array-length p1, p1

    .line 8
    invoke-static {p0, p1}, Landroidx/profileinstaller/d;->r(Ljava/io/OutputStream;I)V

    .line 9
    .line 10
    .line 11
    invoke-static {p0, v0}, Landroidx/profileinstaller/d;->m(Ljava/io/OutputStream;[B)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private static O(Ljava/io/OutputStream;[Landroidx/profileinstaller/c;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    sget-object v0, Landroidx/profileinstaller/i;->b:[B

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroidx/profileinstaller/g;->b([Landroidx/profileinstaller/c;[B)[B

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    array-length p1, p1

    .line 8
    invoke-static {p0, p1}, Landroidx/profileinstaller/d;->r(Ljava/io/OutputStream;I)V

    .line 9
    .line 10
    .line 11
    invoke-static {p0, v0}, Landroidx/profileinstaller/d;->m(Ljava/io/OutputStream;[B)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private static P(Ljava/io/OutputStream;[Landroidx/profileinstaller/c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-static {p0, p1}, Landroidx/profileinstaller/g;->Q(Ljava/io/OutputStream;[Landroidx/profileinstaller/c;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static Q(Ljava/io/OutputStream;[Landroidx/profileinstaller/c;)V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 5
    .line 6
    .line 7
    new-instance v2, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 10
    .line 11
    .line 12
    invoke-static {p1}, Landroidx/profileinstaller/g;->E([Landroidx/profileinstaller/c;)Landroidx/profileinstaller/j;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    invoke-static {p1}, Landroidx/profileinstaller/g;->c([Landroidx/profileinstaller/c;)Landroidx/profileinstaller/j;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    invoke-static {p1}, Landroidx/profileinstaller/g;->d([Landroidx/profileinstaller/c;)Landroidx/profileinstaller/j;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    sget-object p1, Landroidx/profileinstaller/i;->a:[B

    .line 34
    .line 35
    array-length p1, p1

    .line 36
    int-to-long v3, p1

    .line 37
    sget-object p1, Landroidx/profileinstaller/g;->a:[B

    .line 38
    .line 39
    array-length p1, p1

    .line 40
    int-to-long v5, p1

    .line 41
    add-long/2addr v3, v5

    .line 42
    const-wide/16 v5, 0x4

    .line 43
    .line 44
    add-long/2addr v3, v5

    .line 45
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    mul-int/lit8 p1, p1, 0x10

    .line 50
    .line 51
    int-to-long v5, p1

    .line 52
    add-long/2addr v3, v5

    .line 53
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    int-to-long v5, p1

    .line 58
    invoke-static {p0, v5, v6}, Landroidx/profileinstaller/d;->q(Ljava/io/OutputStream;J)V

    .line 59
    .line 60
    .line 61
    const/4 p1, 0x0

    .line 62
    move v1, p1

    .line 63
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 64
    .line 65
    .line 66
    move-result v5

    .line 67
    if-ge v1, v5, :cond_1

    .line 68
    .line 69
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v5

    .line 73
    check-cast v5, Landroidx/profileinstaller/j;

    .line 74
    .line 75
    iget-object v6, v5, Landroidx/profileinstaller/j;->a:Landroidx/profileinstaller/e;

    .line 76
    .line 77
    invoke-virtual {v6}, Landroidx/profileinstaller/e;->c()J

    .line 78
    .line 79
    .line 80
    move-result-wide v6

    .line 81
    invoke-static {p0, v6, v7}, Landroidx/profileinstaller/d;->q(Ljava/io/OutputStream;J)V

    .line 82
    .line 83
    .line 84
    invoke-static {p0, v3, v4}, Landroidx/profileinstaller/d;->q(Ljava/io/OutputStream;J)V

    .line 85
    .line 86
    .line 87
    iget-boolean v6, v5, Landroidx/profileinstaller/j;->d:Z

    .line 88
    .line 89
    if-eqz v6, :cond_0

    .line 90
    .line 91
    iget-object v5, v5, Landroidx/profileinstaller/j;->c:[B

    .line 92
    .line 93
    array-length v6, v5

    .line 94
    int-to-long v6, v6

    .line 95
    invoke-static {v5}, Landroidx/profileinstaller/d;->b([B)[B

    .line 96
    .line 97
    .line 98
    move-result-object v5

    .line 99
    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    array-length v8, v5

    .line 103
    int-to-long v8, v8

    .line 104
    invoke-static {p0, v8, v9}, Landroidx/profileinstaller/d;->q(Ljava/io/OutputStream;J)V

    .line 105
    .line 106
    .line 107
    invoke-static {p0, v6, v7}, Landroidx/profileinstaller/d;->q(Ljava/io/OutputStream;J)V

    .line 108
    .line 109
    .line 110
    array-length v5, v5

    .line 111
    :goto_1
    int-to-long v5, v5

    .line 112
    add-long/2addr v3, v5

    .line 113
    goto :goto_2

    .line 114
    :cond_0
    iget-object v6, v5, Landroidx/profileinstaller/j;->c:[B

    .line 115
    .line 116
    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    iget-object v6, v5, Landroidx/profileinstaller/j;->c:[B

    .line 120
    .line 121
    array-length v6, v6

    .line 122
    int-to-long v6, v6

    .line 123
    invoke-static {p0, v6, v7}, Landroidx/profileinstaller/d;->q(Ljava/io/OutputStream;J)V

    .line 124
    .line 125
    .line 126
    const-wide/16 v6, 0x0

    .line 127
    .line 128
    invoke-static {p0, v6, v7}, Landroidx/profileinstaller/d;->q(Ljava/io/OutputStream;J)V

    .line 129
    .line 130
    .line 131
    iget-object v5, v5, Landroidx/profileinstaller/j;->c:[B

    .line 132
    .line 133
    array-length v5, v5

    .line 134
    goto :goto_1

    .line 135
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 136
    .line 137
    goto :goto_0

    .line 138
    :cond_1
    :goto_3
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    if-ge p1, v0, :cond_2

    .line 143
    .line 144
    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    check-cast v0, [B

    .line 149
    .line 150
    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write([B)V

    .line 151
    .line 152
    .line 153
    add-int/lit8 p1, p1, 0x1

    .line 154
    .line 155
    goto :goto_3

    .line 156
    :cond_2
    return-void
.end method

.method private static a(Landroidx/profileinstaller/c;)I
    .locals 2

    .line 1
    iget-object p0, p0, Landroidx/profileinstaller/c;->i:Ljava/util/TreeMap;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/TreeMap;->entrySet()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 v0, 0x0

    .line 12
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Ljava/util/Map$Entry;

    .line 23
    .line 24
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Ljava/lang/Integer;

    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    or-int/2addr v0, v1

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    return v0
.end method

.method private static b([Landroidx/profileinstaller/c;[B)[B
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    array-length v0, p0

    .line 2
    const/4 v1, 0x0

    .line 3
    move v2, v1

    .line 4
    move v3, v2

    .line 5
    :goto_0
    if-ge v2, v0, :cond_0

    .line 6
    .line 7
    aget-object v4, p0, v2

    .line 8
    .line 9
    iget-object v5, v4, Landroidx/profileinstaller/c;->a:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v6, v4, Landroidx/profileinstaller/c;->b:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v5, v6, p1}, Landroidx/profileinstaller/g;->j(Ljava/lang/String;Ljava/lang/String;[B)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v5

    .line 17
    invoke-static {v5}, Landroidx/profileinstaller/d;->k(Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result v5

    .line 21
    add-int/lit8 v5, v5, 0x10

    .line 22
    .line 23
    iget v6, v4, Landroidx/profileinstaller/c;->e:I

    .line 24
    .line 25
    mul-int/lit8 v6, v6, 0x2

    .line 26
    .line 27
    add-int/2addr v5, v6

    .line 28
    iget v6, v4, Landroidx/profileinstaller/c;->f:I

    .line 29
    .line 30
    add-int/2addr v5, v6

    .line 31
    iget v4, v4, Landroidx/profileinstaller/c;->g:I

    .line 32
    .line 33
    invoke-static {v4}, Landroidx/profileinstaller/g;->k(I)I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    add-int/2addr v5, v4

    .line 38
    add-int/2addr v3, v5

    .line 39
    add-int/lit8 v2, v2, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    .line 43
    .line 44
    invoke-direct {v0, v3}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 45
    .line 46
    .line 47
    sget-object v2, Landroidx/profileinstaller/i;->c:[B

    .line 48
    .line 49
    invoke-static {p1, v2}, Ljava/util/Arrays;->equals([B[B)Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-eqz v2, :cond_1

    .line 54
    .line 55
    array-length v2, p0

    .line 56
    :goto_1
    if-ge v1, v2, :cond_3

    .line 57
    .line 58
    aget-object v4, p0, v1

    .line 59
    .line 60
    iget-object v5, v4, Landroidx/profileinstaller/c;->a:Ljava/lang/String;

    .line 61
    .line 62
    iget-object v6, v4, Landroidx/profileinstaller/c;->b:Ljava/lang/String;

    .line 63
    .line 64
    invoke-static {v5, v6, p1}, Landroidx/profileinstaller/g;->j(Ljava/lang/String;Ljava/lang/String;[B)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    invoke-static {v0, v4, v5}, Landroidx/profileinstaller/g;->H(Ljava/io/OutputStream;Landroidx/profileinstaller/c;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-static {v0, v4}, Landroidx/profileinstaller/g;->G(Ljava/io/OutputStream;Landroidx/profileinstaller/c;)V

    .line 72
    .line 73
    .line 74
    add-int/lit8 v1, v1, 0x1

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_1
    array-length v2, p0

    .line 78
    move v4, v1

    .line 79
    :goto_2
    if-ge v4, v2, :cond_2

    .line 80
    .line 81
    aget-object v5, p0, v4

    .line 82
    .line 83
    iget-object v6, v5, Landroidx/profileinstaller/c;->a:Ljava/lang/String;

    .line 84
    .line 85
    iget-object v7, v5, Landroidx/profileinstaller/c;->b:Ljava/lang/String;

    .line 86
    .line 87
    invoke-static {v6, v7, p1}, Landroidx/profileinstaller/g;->j(Ljava/lang/String;Ljava/lang/String;[B)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v6

    .line 91
    invoke-static {v0, v5, v6}, Landroidx/profileinstaller/g;->H(Ljava/io/OutputStream;Landroidx/profileinstaller/c;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    add-int/lit8 v4, v4, 0x1

    .line 95
    .line 96
    goto :goto_2

    .line 97
    :cond_2
    array-length p1, p0

    .line 98
    :goto_3
    if-ge v1, p1, :cond_3

    .line 99
    .line 100
    aget-object v2, p0, v1

    .line 101
    .line 102
    invoke-static {v0, v2}, Landroidx/profileinstaller/g;->G(Ljava/io/OutputStream;Landroidx/profileinstaller/c;)V

    .line 103
    .line 104
    .line 105
    add-int/lit8 v1, v1, 0x1

    .line 106
    .line 107
    goto :goto_3

    .line 108
    :cond_3
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    .line 109
    .line 110
    .line 111
    move-result p0

    .line 112
    if-ne p0, v3, :cond_4

    .line 113
    .line 114
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    return-object p0

    .line 119
    :cond_4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 120
    .line 121
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 122
    .line 123
    .line 124
    const-string p1, "The bytes saved do not match expectation. actual="

    .line 125
    .line 126
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    const-string p1, " expected="

    .line 137
    .line 138
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    invoke-static {p0}, Landroidx/profileinstaller/d;->c(Ljava/lang/String;)Ljava/lang/RuntimeException;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    throw p0
.end method

.method private static c([Landroidx/profileinstaller/c;)Landroidx/profileinstaller/j;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    move v2, v1

    .line 8
    :goto_0
    :try_start_0
    array-length v3, p0

    .line 9
    if-ge v1, v3, :cond_0

    .line 10
    .line 11
    aget-object v3, p0, v1

    .line 12
    .line 13
    invoke-static {v0, v1}, Landroidx/profileinstaller/d;->p(Ljava/io/OutputStream;I)V

    .line 14
    .line 15
    .line 16
    add-int/lit8 v2, v2, 0x4

    .line 17
    .line 18
    iget v4, v3, Landroidx/profileinstaller/c;->e:I

    .line 19
    .line 20
    invoke-static {v0, v4}, Landroidx/profileinstaller/d;->p(Ljava/io/OutputStream;I)V

    .line 21
    .line 22
    .line 23
    iget v4, v3, Landroidx/profileinstaller/c;->e:I

    .line 24
    .line 25
    mul-int/lit8 v4, v4, 0x2

    .line 26
    .line 27
    add-int/2addr v2, v4

    .line 28
    invoke-static {v0, v3}, Landroidx/profileinstaller/g;->D(Ljava/io/OutputStream;Landroidx/profileinstaller/c;)V

    .line 29
    .line 30
    .line 31
    add-int/lit8 v1, v1, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :catchall_0
    move-exception p0

    .line 35
    goto :goto_1

    .line 36
    :cond_0
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    array-length v1, p0

    .line 41
    if-ne v2, v1, :cond_1

    .line 42
    .line 43
    new-instance v1, Landroidx/profileinstaller/j;

    .line 44
    .line 45
    sget-object v3, Landroidx/profileinstaller/e;->j:Landroidx/profileinstaller/e;

    .line 46
    .line 47
    const/4 v4, 0x1

    .line 48
    invoke-direct {v1, v3, v2, p0, v4}, Landroidx/profileinstaller/j;-><init>(Landroidx/profileinstaller/e;I[BZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 52
    .line 53
    .line 54
    return-object v1

    .line 55
    :cond_1
    :try_start_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 58
    .line 59
    .line 60
    const-string v3, "Expected size "

    .line 61
    .line 62
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const-string v2, ", does not match actual size "

    .line 69
    .line 70
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    array-length p0, p0

    .line 74
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-static {p0}, Landroidx/profileinstaller/d;->c(Ljava/lang/String;)Ljava/lang/RuntimeException;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 86
    :goto_1
    :try_start_2
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 87
    .line 88
    .line 89
    goto :goto_2

    .line 90
    :catchall_1
    move-exception v0

    .line 91
    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 92
    .line 93
    .line 94
    :goto_2
    throw p0
.end method

.method private static d([Landroidx/profileinstaller/c;)Landroidx/profileinstaller/j;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    move v2, v1

    .line 8
    :goto_0
    :try_start_0
    array-length v3, p0

    .line 9
    if-ge v1, v3, :cond_0

    .line 10
    .line 11
    aget-object v3, p0, v1

    .line 12
    .line 13
    invoke-static {v3}, Landroidx/profileinstaller/g;->a(Landroidx/profileinstaller/c;)I

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    invoke-static {v4, v3}, Landroidx/profileinstaller/g;->e(ILandroidx/profileinstaller/c;)[B

    .line 18
    .line 19
    .line 20
    move-result-object v5

    .line 21
    invoke-static {v3}, Landroidx/profileinstaller/g;->f(Landroidx/profileinstaller/c;)[B

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-static {v0, v1}, Landroidx/profileinstaller/d;->p(Ljava/io/OutputStream;I)V

    .line 26
    .line 27
    .line 28
    array-length v6, v5

    .line 29
    add-int/lit8 v6, v6, 0x2

    .line 30
    .line 31
    array-length v7, v3

    .line 32
    add-int/2addr v6, v7

    .line 33
    add-int/lit8 v2, v2, 0x6

    .line 34
    .line 35
    int-to-long v7, v6

    .line 36
    invoke-static {v0, v7, v8}, Landroidx/profileinstaller/d;->q(Ljava/io/OutputStream;J)V

    .line 37
    .line 38
    .line 39
    invoke-static {v0, v4}, Landroidx/profileinstaller/d;->p(Ljava/io/OutputStream;I)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v5}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v3}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 46
    .line 47
    .line 48
    add-int/2addr v2, v6

    .line 49
    add-int/lit8 v1, v1, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :catchall_0
    move-exception p0

    .line 53
    goto :goto_1

    .line 54
    :cond_0
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    array-length v1, p0

    .line 59
    if-ne v2, v1, :cond_1

    .line 60
    .line 61
    new-instance v1, Landroidx/profileinstaller/j;

    .line 62
    .line 63
    sget-object v3, Landroidx/profileinstaller/e;->k:Landroidx/profileinstaller/e;

    .line 64
    .line 65
    const/4 v4, 0x1

    .line 66
    invoke-direct {v1, v3, v2, p0, v4}, Landroidx/profileinstaller/j;-><init>(Landroidx/profileinstaller/e;I[BZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 70
    .line 71
    .line 72
    return-object v1

    .line 73
    :cond_1
    :try_start_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 76
    .line 77
    .line 78
    const-string v3, "Expected size "

    .line 79
    .line 80
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    const-string v2, ", does not match actual size "

    .line 87
    .line 88
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    array-length p0, p0

    .line 92
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-static {p0}, Landroidx/profileinstaller/d;->c(Ljava/lang/String;)Ljava/lang/RuntimeException;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 104
    :goto_1
    :try_start_2
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 105
    .line 106
    .line 107
    goto :goto_2

    .line 108
    :catchall_1
    move-exception v0

    .line 109
    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 110
    .line 111
    .line 112
    :goto_2
    throw p0
.end method

.method private static e(ILandroidx/profileinstaller/c;)[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-static {v0, p0, p1}, Landroidx/profileinstaller/g;->J(Ljava/io/OutputStream;ILandroidx/profileinstaller/c;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 10
    .line 11
    .line 12
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 14
    .line 15
    .line 16
    return-object p0

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    :try_start_1
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catchall_1
    move-exception p1

    .line 23
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    :goto_0
    throw p0
.end method

.method private static f(Landroidx/profileinstaller/c;)[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-static {v0, p0}, Landroidx/profileinstaller/g;->K(Ljava/io/OutputStream;Landroidx/profileinstaller/c;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 10
    .line 11
    .line 12
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 14
    .line 15
    .line 16
    return-object p0

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    :try_start_1
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catchall_1
    move-exception v0

    .line 23
    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    :goto_0
    throw p0
.end method

.method private static g(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    const-string v0, "!"

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const-string v2, ":"

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0, v0, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    :cond_1
    return-object p0
.end method

.method private static h(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "!"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-gez v0, :cond_0

    .line 8
    .line 9
    const-string v0, ":"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    :cond_0
    if-lez v0, :cond_1

    .line 16
    .line 17
    add-int/lit8 v0, v0, 0x1

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    :cond_1
    return-object p0
.end method

.method private static i([Landroidx/profileinstaller/c;Ljava/lang/String;)Landroidx/profileinstaller/c;
    .locals 3

    .line 1
    array-length v0, p0

    .line 2
    const/4 v1, 0x0

    .line 3
    if-gtz v0, :cond_0

    .line 4
    .line 5
    return-object v1

    .line 6
    :cond_0
    invoke-static {p1}, Landroidx/profileinstaller/g;->h(Ljava/lang/String;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const/4 v0, 0x0

    .line 11
    :goto_0
    array-length v2, p0

    .line 12
    if-ge v0, v2, :cond_2

    .line 13
    .line 14
    aget-object v2, p0, v0

    .line 15
    .line 16
    iget-object v2, v2, Landroidx/profileinstaller/c;->b:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_1

    .line 23
    .line 24
    aget-object p0, p0, v0

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_2
    return-object v1
.end method

.method private static j(Ljava/lang/String;Ljava/lang/String;[B)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {p2}, Landroidx/profileinstaller/i;->a([B)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-gtz v1, :cond_0

    .line 10
    .line 11
    invoke-static {p1, v0}, Landroidx/profileinstaller/g;->g(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const-string v1, "classes.dex"

    .line 17
    .line 18
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_1
    const-string v1, "!"

    .line 26
    .line 27
    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-nez v1, :cond_4

    .line 32
    .line 33
    const-string v1, ":"

    .line 34
    .line 35
    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_2

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_2
    const-string v0, ".apk"

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_3

    .line 49
    .line 50
    return-object p1

    .line 51
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-static {p2}, Landroidx/profileinstaller/i;->a([B)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0

    .line 74
    :cond_4
    :goto_0
    invoke-static {p1, v0}, Landroidx/profileinstaller/g;->g(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    return-object p0
.end method

.method private static k(I)I
    .locals 0

    .line 1
    mul-int/lit8 p0, p0, 0x2

    .line 2
    .line 3
    invoke-static {p0}, Landroidx/profileinstaller/g;->z(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    div-int/lit8 p0, p0, 0x8

    .line 8
    .line 9
    return p0
.end method

.method private static l(II)I
    .locals 0

    .line 1
    and-int/lit8 p0, p0, -0x2

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->bitCount(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    mul-int/2addr p0, p1

    .line 8
    invoke-static {p0}, Landroidx/profileinstaller/g;->z(I)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    div-int/lit8 p0, p0, 0x8

    .line 13
    .line 14
    return p0
.end method

.method private static m(III)I
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p0, v0, :cond_2

    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    if-eq p0, v0, :cond_1

    .line 6
    .line 7
    const/4 v0, 0x4

    .line 8
    if-ne p0, v0, :cond_0

    .line 9
    .line 10
    add-int/2addr p1, p2

    .line 11
    return p1

    .line 12
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    const-string p2, "Unexpected flag: "

    .line 18
    .line 19
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {p0}, Landroidx/profileinstaller/d;->c(Ljava/lang/String;)Ljava/lang/RuntimeException;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    throw p0

    .line 34
    :cond_1
    return p1

    .line 35
    :cond_2
    const-string p0, "HOT methods are not stored in the bitmap"

    .line 36
    .line 37
    invoke-static {p0}, Landroidx/profileinstaller/d;->c(Ljava/lang/String;)Ljava/lang/RuntimeException;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    throw p0
.end method

.method private static n(Ljava/io/InputStream;I)[I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    new-array v0, p1, [I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    move v2, v1

    .line 5
    :goto_0
    if-ge v1, p1, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Landroidx/profileinstaller/d;->h(Ljava/io/InputStream;)I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    add-int/2addr v2, v3

    .line 12
    aput v2, v0, v1

    .line 13
    .line 14
    add-int/lit8 v1, v1, 0x1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    return-object v0
.end method

.method private static o(Ljava/util/BitSet;II)I
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0, p1, p2}, Landroidx/profileinstaller/g;->m(III)I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    invoke-virtual {p0, v1}, Ljava/util/BitSet;->get(I)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    :goto_0
    const/4 v1, 0x4

    .line 15
    invoke-static {v1, p1, p2}, Landroidx/profileinstaller/g;->m(III)I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    invoke-virtual {p0, p1}, Ljava/util/BitSet;->get(I)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    or-int/lit8 p0, v0, 0x4

    .line 26
    .line 27
    return p0

    .line 28
    :cond_1
    return v0
.end method

.method static p(Ljava/io/InputStream;[B)[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    array-length v0, p1

    .line 2
    invoke-static {p0, v0}, Landroidx/profileinstaller/d;->d(Ljava/io/InputStream;I)[B

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-static {p1, v0}, Ljava/util/Arrays;->equals([B[B)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    sget-object p1, Landroidx/profileinstaller/i;->b:[B

    .line 13
    .line 14
    array-length p1, p1

    .line 15
    invoke-static {p0, p1}, Landroidx/profileinstaller/d;->d(Ljava/io/InputStream;I)[B

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    const-string p0, "Invalid magic"

    .line 21
    .line 22
    invoke-static {p0}, Landroidx/profileinstaller/d;->c(Ljava/lang/String;)Ljava/lang/RuntimeException;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    throw p0
.end method

.method private static q(Ljava/io/InputStream;Landroidx/profileinstaller/c;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p1, Landroidx/profileinstaller/c;->f:I

    .line 6
    .line 7
    sub-int/2addr v0, v1

    .line 8
    const/4 v1, 0x0

    .line 9
    :cond_0
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-le v2, v0, :cond_1

    .line 14
    .line 15
    invoke-static {p0}, Landroidx/profileinstaller/d;->h(Ljava/io/InputStream;)I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    add-int/2addr v1, v2

    .line 20
    iget-object v2, p1, Landroidx/profileinstaller/c;->i:Ljava/util/TreeMap;

    .line 21
    .line 22
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    const/4 v4, 0x1

    .line 27
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    invoke-virtual {v2, v3, v4}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    invoke-static {p0}, Landroidx/profileinstaller/d;->h(Ljava/io/InputStream;)I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    :goto_0
    if-lez v2, :cond_0

    .line 39
    .line 40
    invoke-static {p0}, Landroidx/profileinstaller/g;->B(Ljava/io/InputStream;)V

    .line 41
    .line 42
    .line 43
    add-int/lit8 v2, v2, -0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-ne p0, v0, :cond_2

    .line 51
    .line 52
    return-void

    .line 53
    :cond_2
    const-string p0, "Read too much data during profile line parse"

    .line 54
    .line 55
    invoke-static {p0}, Landroidx/profileinstaller/d;->c(Ljava/lang/String;)Ljava/lang/RuntimeException;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    throw p0
.end method

.method static r(Ljava/io/InputStream;[B[B[Landroidx/profileinstaller/c;)[Landroidx/profileinstaller/c;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    sget-object v0, Landroidx/profileinstaller/i;->f:[B

    .line 2
    .line 3
    invoke-static {p1, v0}, Ljava/util/Arrays;->equals([B[B)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    sget-object v0, Landroidx/profileinstaller/i;->a:[B

    .line 10
    .line 11
    invoke-static {v0, p2}, Ljava/util/Arrays;->equals([B[B)Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-nez p2, :cond_0

    .line 16
    .line 17
    invoke-static {p0, p1, p3}, Landroidx/profileinstaller/g;->s(Ljava/io/InputStream;[B[Landroidx/profileinstaller/c;)[Landroidx/profileinstaller/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    const-string p0, "Requires new Baseline Profile Metadata. Please rebuild the APK with Android Gradle Plugin 7.2 Canary 7 or higher"

    .line 23
    .line 24
    invoke-static {p0}, Landroidx/profileinstaller/d;->c(Ljava/lang/String;)Ljava/lang/RuntimeException;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    throw p0

    .line 29
    :cond_1
    sget-object v0, Landroidx/profileinstaller/i;->g:[B

    .line 30
    .line 31
    invoke-static {p1, v0}, Ljava/util/Arrays;->equals([B[B)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_2

    .line 36
    .line 37
    invoke-static {p0, p2, p3}, Landroidx/profileinstaller/g;->u(Ljava/io/InputStream;[B[Landroidx/profileinstaller/c;)[Landroidx/profileinstaller/c;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0

    .line 42
    :cond_2
    const-string p0, "Unsupported meta version"

    .line 43
    .line 44
    invoke-static {p0}, Landroidx/profileinstaller/d;->c(Ljava/lang/String;)Ljava/lang/RuntimeException;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    throw p0
.end method

.method static s(Ljava/io/InputStream;[B[Landroidx/profileinstaller/c;)[Landroidx/profileinstaller/c;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    sget-object v0, Landroidx/profileinstaller/i;->f:[B

    .line 2
    .line 3
    invoke-static {p1, v0}, Ljava/util/Arrays;->equals([B[B)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    invoke-static {p0}, Landroidx/profileinstaller/d;->j(Ljava/io/InputStream;)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-static {p0}, Landroidx/profileinstaller/d;->i(Ljava/io/InputStream;)J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    invoke-static {p0}, Landroidx/profileinstaller/d;->i(Ljava/io/InputStream;)J

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    long-to-int v2, v2

    .line 22
    long-to-int v0, v0

    .line 23
    invoke-static {p0, v2, v0}, Landroidx/profileinstaller/d;->e(Ljava/io/InputStream;II)[B

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-gtz p0, :cond_0

    .line 32
    .line 33
    new-instance p0, Ljava/io/ByteArrayInputStream;

    .line 34
    .line 35
    invoke-direct {p0, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 36
    .line 37
    .line 38
    :try_start_0
    invoke-static {p0, p1, p2}, Landroidx/profileinstaller/g;->t(Ljava/io/InputStream;I[Landroidx/profileinstaller/c;)[Landroidx/profileinstaller/c;

    .line 39
    .line 40
    .line 41
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 43
    .line 44
    .line 45
    return-object p1

    .line 46
    :catchall_0
    move-exception p1

    .line 47
    :try_start_1
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :catchall_1
    move-exception p0

    .line 52
    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 53
    .line 54
    .line 55
    :goto_0
    throw p1

    .line 56
    :cond_0
    const-string p0, "Content found after the end of file"

    .line 57
    .line 58
    invoke-static {p0}, Landroidx/profileinstaller/d;->c(Ljava/lang/String;)Ljava/lang/RuntimeException;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    throw p0

    .line 63
    :cond_1
    const-string p0, "Unsupported meta version"

    .line 64
    .line 65
    invoke-static {p0}, Landroidx/profileinstaller/d;->c(Ljava/lang/String;)Ljava/lang/RuntimeException;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    throw p0
.end method

.method private static t(Ljava/io/InputStream;I[Landroidx/profileinstaller/c;)[Landroidx/profileinstaller/c;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    new-array p0, v1, [Landroidx/profileinstaller/c;

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    array-length v0, p2

    .line 12
    if-ne p1, v0, :cond_4

    .line 13
    .line 14
    new-array v0, p1, [Ljava/lang/String;

    .line 15
    .line 16
    new-array v2, p1, [I

    .line 17
    .line 18
    move v3, v1

    .line 19
    :goto_0
    if-ge v3, p1, :cond_1

    .line 20
    .line 21
    invoke-static {p0}, Landroidx/profileinstaller/d;->h(Ljava/io/InputStream;)I

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    invoke-static {p0}, Landroidx/profileinstaller/d;->h(Ljava/io/InputStream;)I

    .line 26
    .line 27
    .line 28
    move-result v5

    .line 29
    aput v5, v2, v3

    .line 30
    .line 31
    invoke-static {p0, v4}, Landroidx/profileinstaller/d;->f(Ljava/io/InputStream;I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    aput-object v4, v0, v3

    .line 36
    .line 37
    add-int/lit8 v3, v3, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    :goto_1
    if-ge v1, p1, :cond_3

    .line 41
    .line 42
    aget-object v3, p2, v1

    .line 43
    .line 44
    iget-object v4, v3, Landroidx/profileinstaller/c;->b:Ljava/lang/String;

    .line 45
    .line 46
    aget-object v5, v0, v1

    .line 47
    .line 48
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    if-eqz v4, :cond_2

    .line 53
    .line 54
    aget v4, v2, v1

    .line 55
    .line 56
    iput v4, v3, Landroidx/profileinstaller/c;->e:I

    .line 57
    .line 58
    invoke-static {p0, v4}, Landroidx/profileinstaller/g;->n(Ljava/io/InputStream;I)[I

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    iput-object v4, v3, Landroidx/profileinstaller/c;->h:[I

    .line 63
    .line 64
    add-int/lit8 v1, v1, 0x1

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_2
    const-string p0, "Order of dexfiles in metadata did not match baseline"

    .line 68
    .line 69
    invoke-static {p0}, Landroidx/profileinstaller/d;->c(Ljava/lang/String;)Ljava/lang/RuntimeException;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    throw p0

    .line 74
    :cond_3
    return-object p2

    .line 75
    :cond_4
    const-string p0, "Mismatched number of dex files found in metadata"

    .line 76
    .line 77
    invoke-static {p0}, Landroidx/profileinstaller/d;->c(Ljava/lang/String;)Ljava/lang/RuntimeException;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    throw p0
.end method

.method static u(Ljava/io/InputStream;[B[Landroidx/profileinstaller/c;)[Landroidx/profileinstaller/c;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-static {p0}, Landroidx/profileinstaller/d;->h(Ljava/io/InputStream;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p0}, Landroidx/profileinstaller/d;->i(Ljava/io/InputStream;)J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-static {p0}, Landroidx/profileinstaller/d;->i(Ljava/io/InputStream;)J

    .line 10
    .line 11
    .line 12
    move-result-wide v3

    .line 13
    long-to-int v3, v3

    .line 14
    long-to-int v1, v1

    .line 15
    invoke-static {p0, v3, v1}, Landroidx/profileinstaller/d;->e(Ljava/io/InputStream;II)[B

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-gtz p0, :cond_0

    .line 24
    .line 25
    new-instance p0, Ljava/io/ByteArrayInputStream;

    .line 26
    .line 27
    invoke-direct {p0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 28
    .line 29
    .line 30
    :try_start_0
    invoke-static {p0, p1, v0, p2}, Landroidx/profileinstaller/g;->v(Ljava/io/InputStream;[BI[Landroidx/profileinstaller/c;)[Landroidx/profileinstaller/c;

    .line 31
    .line 32
    .line 33
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 35
    .line 36
    .line 37
    return-object p1

    .line 38
    :catchall_0
    move-exception p1

    .line 39
    :try_start_1
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :catchall_1
    move-exception p0

    .line 44
    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 45
    .line 46
    .line 47
    :goto_0
    throw p1

    .line 48
    :cond_0
    const-string p0, "Content found after the end of file"

    .line 49
    .line 50
    invoke-static {p0}, Landroidx/profileinstaller/d;->c(Ljava/lang/String;)Ljava/lang/RuntimeException;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    throw p0
.end method

.method private static v(Ljava/io/InputStream;[BI[Landroidx/profileinstaller/c;)[Landroidx/profileinstaller/c;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    new-array p0, v1, [Landroidx/profileinstaller/c;

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    array-length v0, p3

    .line 12
    if-ne p2, v0, :cond_4

    .line 13
    .line 14
    :goto_0
    if-ge v1, p2, :cond_3

    .line 15
    .line 16
    invoke-static {p0}, Landroidx/profileinstaller/d;->h(Ljava/io/InputStream;)I

    .line 17
    .line 18
    .line 19
    invoke-static {p0}, Landroidx/profileinstaller/d;->h(Ljava/io/InputStream;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-static {p0, v0}, Landroidx/profileinstaller/d;->f(Ljava/io/InputStream;I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {p0}, Landroidx/profileinstaller/d;->i(Ljava/io/InputStream;)J

    .line 28
    .line 29
    .line 30
    move-result-wide v2

    .line 31
    invoke-static {p0}, Landroidx/profileinstaller/d;->h(Ljava/io/InputStream;)I

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    invoke-static {p3, v0}, Landroidx/profileinstaller/g;->i([Landroidx/profileinstaller/c;Ljava/lang/String;)Landroidx/profileinstaller/c;

    .line 36
    .line 37
    .line 38
    move-result-object v5

    .line 39
    if-eqz v5, :cond_2

    .line 40
    .line 41
    iput-wide v2, v5, Landroidx/profileinstaller/c;->d:J

    .line 42
    .line 43
    invoke-static {p0, v4}, Landroidx/profileinstaller/g;->n(Ljava/io/InputStream;I)[I

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    sget-object v2, Landroidx/profileinstaller/i;->e:[B

    .line 48
    .line 49
    invoke-static {p1, v2}, Ljava/util/Arrays;->equals([B[B)Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-eqz v2, :cond_1

    .line 54
    .line 55
    iput v4, v5, Landroidx/profileinstaller/c;->e:I

    .line 56
    .line 57
    iput-object v0, v5, Landroidx/profileinstaller/c;->h:[I

    .line 58
    .line 59
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 65
    .line 66
    .line 67
    const-string p1, "Missing profile key: "

    .line 68
    .line 69
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-static {p0}, Landroidx/profileinstaller/d;->c(Ljava/lang/String;)Ljava/lang/RuntimeException;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    throw p0

    .line 84
    :cond_3
    return-object p3

    .line 85
    :cond_4
    const-string p0, "Mismatched number of dex files found in metadata"

    .line 86
    .line 87
    invoke-static {p0}, Landroidx/profileinstaller/d;->c(Ljava/lang/String;)Ljava/lang/RuntimeException;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    throw p0
.end method

.method private static w(Ljava/io/InputStream;Landroidx/profileinstaller/c;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget v0, p1, Landroidx/profileinstaller/c;->g:I

    .line 2
    .line 3
    mul-int/lit8 v0, v0, 0x2

    .line 4
    .line 5
    invoke-static {v0}, Landroidx/profileinstaller/d;->a(I)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-static {p0, v0}, Landroidx/profileinstaller/d;->d(Ljava/io/InputStream;I)[B

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Ljava/util/BitSet;->valueOf([B)Ljava/util/BitSet;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/4 v0, 0x0

    .line 18
    move v1, v0

    .line 19
    :goto_0
    iget v2, p1, Landroidx/profileinstaller/c;->g:I

    .line 20
    .line 21
    if-ge v1, v2, :cond_2

    .line 22
    .line 23
    invoke-static {p0, v1, v2}, Landroidx/profileinstaller/g;->o(Ljava/util/BitSet;II)I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_1

    .line 28
    .line 29
    iget-object v3, p1, Landroidx/profileinstaller/c;->i:Ljava/util/TreeMap;

    .line 30
    .line 31
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    invoke-virtual {v3, v4}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    check-cast v3, Ljava/lang/Integer;

    .line 40
    .line 41
    if-nez v3, :cond_0

    .line 42
    .line 43
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    :cond_0
    iget-object v4, p1, Landroidx/profileinstaller/c;->i:Ljava/util/TreeMap;

    .line 48
    .line 49
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 50
    .line 51
    .line 52
    move-result-object v5

    .line 53
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    or-int/2addr v2, v3

    .line 58
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v4, v5, v2}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_2
    return-void
.end method

.method static x(Ljava/io/InputStream;[BLjava/lang/String;)[Landroidx/profileinstaller/c;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    sget-object v0, Landroidx/profileinstaller/i;->b:[B

    .line 2
    .line 3
    invoke-static {p1, v0}, Ljava/util/Arrays;->equals([B[B)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    invoke-static {p0}, Landroidx/profileinstaller/d;->j(Ljava/io/InputStream;)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-static {p0}, Landroidx/profileinstaller/d;->i(Ljava/io/InputStream;)J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    invoke-static {p0}, Landroidx/profileinstaller/d;->i(Ljava/io/InputStream;)J

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    long-to-int v2, v2

    .line 22
    long-to-int v0, v0

    .line 23
    invoke-static {p0, v2, v0}, Landroidx/profileinstaller/d;->e(Ljava/io/InputStream;II)[B

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-gtz p0, :cond_0

    .line 32
    .line 33
    new-instance p0, Ljava/io/ByteArrayInputStream;

    .line 34
    .line 35
    invoke-direct {p0, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 36
    .line 37
    .line 38
    :try_start_0
    invoke-static {p0, p2, p1}, Landroidx/profileinstaller/g;->y(Ljava/io/InputStream;Ljava/lang/String;I)[Landroidx/profileinstaller/c;

    .line 39
    .line 40
    .line 41
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 43
    .line 44
    .line 45
    return-object p1

    .line 46
    :catchall_0
    move-exception p1

    .line 47
    :try_start_1
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :catchall_1
    move-exception p0

    .line 52
    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 53
    .line 54
    .line 55
    :goto_0
    throw p1

    .line 56
    :cond_0
    const-string p0, "Content found after the end of file"

    .line 57
    .line 58
    invoke-static {p0}, Landroidx/profileinstaller/d;->c(Ljava/lang/String;)Ljava/lang/RuntimeException;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    throw p0

    .line 63
    :cond_1
    const-string p0, "Unsupported version"

    .line 64
    .line 65
    invoke-static {p0}, Landroidx/profileinstaller/d;->c(Ljava/lang/String;)Ljava/lang/RuntimeException;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    throw p0
.end method

.method private static y(Ljava/io/InputStream;Ljava/lang/String;I)[Landroidx/profileinstaller/c;
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p2

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    const/4 v3, 0x0

    .line 10
    if-nez v2, :cond_0

    .line 11
    .line 12
    new-array v0, v3, [Landroidx/profileinstaller/c;

    .line 13
    .line 14
    return-object v0

    .line 15
    :cond_0
    new-array v2, v1, [Landroidx/profileinstaller/c;

    .line 16
    .line 17
    move v4, v3

    .line 18
    :goto_0
    if-ge v4, v1, :cond_1

    .line 19
    .line 20
    invoke-static {v0}, Landroidx/profileinstaller/d;->h(Ljava/io/InputStream;)I

    .line 21
    .line 22
    .line 23
    move-result v5

    .line 24
    invoke-static {v0}, Landroidx/profileinstaller/d;->h(Ljava/io/InputStream;)I

    .line 25
    .line 26
    .line 27
    move-result v13

    .line 28
    invoke-static {v0}, Landroidx/profileinstaller/d;->i(Ljava/io/InputStream;)J

    .line 29
    .line 30
    .line 31
    move-result-wide v6

    .line 32
    invoke-static {v0}, Landroidx/profileinstaller/d;->i(Ljava/io/InputStream;)J

    .line 33
    .line 34
    .line 35
    move-result-wide v9

    .line 36
    invoke-static {v0}, Landroidx/profileinstaller/d;->i(Ljava/io/InputStream;)J

    .line 37
    .line 38
    .line 39
    move-result-wide v11

    .line 40
    new-instance v8, Landroidx/profileinstaller/c;

    .line 41
    .line 42
    invoke-static {v0, v5}, Landroidx/profileinstaller/d;->f(Ljava/io/InputStream;I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    long-to-int v14, v6

    .line 47
    long-to-int v15, v11

    .line 48
    new-array v6, v13, [I

    .line 49
    .line 50
    new-instance v17, Ljava/util/TreeMap;

    .line 51
    .line 52
    invoke-direct/range {v17 .. v17}, Ljava/util/TreeMap;-><init>()V

    .line 53
    .line 54
    .line 55
    const-wide/16 v11, 0x0

    .line 56
    .line 57
    move-object/from16 v7, p1

    .line 58
    .line 59
    move-object/from16 v16, v6

    .line 60
    .line 61
    move-object v6, v8

    .line 62
    move-object v8, v5

    .line 63
    invoke-direct/range {v6 .. v17}, Landroidx/profileinstaller/c;-><init>(Ljava/lang/String;Ljava/lang/String;JJIII[ILjava/util/TreeMap;)V

    .line 64
    .line 65
    .line 66
    aput-object v6, v2, v4

    .line 67
    .line 68
    add-int/lit8 v4, v4, 0x1

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_1
    :goto_1
    if-ge v3, v1, :cond_2

    .line 72
    .line 73
    aget-object v4, v2, v3

    .line 74
    .line 75
    invoke-static {v0, v4}, Landroidx/profileinstaller/g;->q(Ljava/io/InputStream;Landroidx/profileinstaller/c;)V

    .line 76
    .line 77
    .line 78
    iget v5, v4, Landroidx/profileinstaller/c;->e:I

    .line 79
    .line 80
    invoke-static {v0, v5}, Landroidx/profileinstaller/g;->n(Ljava/io/InputStream;I)[I

    .line 81
    .line 82
    .line 83
    move-result-object v5

    .line 84
    iput-object v5, v4, Landroidx/profileinstaller/c;->h:[I

    .line 85
    .line 86
    invoke-static {v0, v4}, Landroidx/profileinstaller/g;->w(Ljava/io/InputStream;Landroidx/profileinstaller/c;)V

    .line 87
    .line 88
    .line 89
    add-int/lit8 v3, v3, 0x1

    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_2
    return-object v2
.end method

.method private static z(I)I
    .locals 0

    .line 1
    add-int/lit8 p0, p0, 0x7

    .line 2
    .line 3
    and-int/lit8 p0, p0, -0x8

    .line 4
    .line 5
    return p0
.end method
