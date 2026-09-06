.class public final Lokio/m;
.super Ljava/lang/Object;
.source "InflaterSource.kt"

# interfaces
.implements Lokio/B;


# instance fields
.field private final g:Lokio/g;

.field private final h:Ljava/util/zip/Inflater;

.field private i:I

.field private j:Z


# direct methods
.method public constructor <init>(Lokio/g;Ljava/util/zip/Inflater;)V
    .locals 1

    .line 1
    const-string v0, "source"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "inflater"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lokio/m;->g:Lokio/g;

    .line 15
    .line 16
    iput-object p2, p0, Lokio/m;->h:Ljava/util/zip/Inflater;

    .line 17
    .line 18
    return-void
.end method

.method private final d()V
    .locals 2

    .line 1
    iget v0, p0, Lokio/m;->i:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v1, p0, Lokio/m;->h:Ljava/util/zip/Inflater;

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/util/zip/Inflater;->getRemaining()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    sub-int/2addr v0, v1

    .line 13
    iget v1, p0, Lokio/m;->i:I

    .line 14
    .line 15
    sub-int/2addr v1, v0

    .line 16
    iput v1, p0, Lokio/m;->i:I

    .line 17
    .line 18
    iget-object p0, p0, Lokio/m;->g:Lokio/g;

    .line 19
    .line 20
    int-to-long v0, v0

    .line 21
    invoke-interface {p0, v0, v1}, Lokio/g;->skip(J)V

    .line 22
    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public final b(Lokio/e;J)J
    .locals 5
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
    if-ltz v2, :cond_4

    .line 11
    .line 12
    iget-boolean v3, p0, Lokio/m;->j:Z

    .line 13
    .line 14
    if-nez v3, :cond_3

    .line 15
    .line 16
    if-nez v2, :cond_0

    .line 17
    .line 18
    return-wide v0

    .line 19
    :cond_0
    const/4 v2, 0x1

    .line 20
    :try_start_0
    invoke-virtual {p1, v2}, Lokio/e;->c0(I)Lokio/w;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    iget v3, v2, Lokio/w;->c:I

    .line 25
    .line 26
    rsub-int v3, v3, 0x2000

    .line 27
    .line 28
    int-to-long v3, v3

    .line 29
    invoke-static {p2, p3, v3, v4}, Ljava/lang/Math;->min(JJ)J

    .line 30
    .line 31
    .line 32
    move-result-wide p2

    .line 33
    long-to-int p2, p2

    .line 34
    invoke-virtual {p0}, Lokio/m;->c()Z

    .line 35
    .line 36
    .line 37
    iget-object p3, p0, Lokio/m;->h:Ljava/util/zip/Inflater;

    .line 38
    .line 39
    iget-object v3, v2, Lokio/w;->a:[B

    .line 40
    .line 41
    iget v4, v2, Lokio/w;->c:I

    .line 42
    .line 43
    invoke-virtual {p3, v3, v4, p2}, Ljava/util/zip/Inflater;->inflate([BII)I

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    invoke-direct {p0}, Lokio/m;->d()V

    .line 48
    .line 49
    .line 50
    if-lez p2, :cond_1

    .line 51
    .line 52
    iget p0, v2, Lokio/w;->c:I

    .line 53
    .line 54
    add-int/2addr p0, p2

    .line 55
    iput p0, v2, Lokio/w;->c:I

    .line 56
    .line 57
    invoke-virtual {p1}, Lokio/e;->size()J

    .line 58
    .line 59
    .line 60
    move-result-wide v0

    .line 61
    int-to-long p2, p2

    .line 62
    add-long/2addr v0, p2

    .line 63
    invoke-virtual {p1, v0, v1}, Lokio/e;->U(J)V

    .line 64
    .line 65
    .line 66
    return-wide p2

    .line 67
    :cond_1
    iget p0, v2, Lokio/w;->b:I

    .line 68
    .line 69
    iget p2, v2, Lokio/w;->c:I

    .line 70
    .line 71
    if-ne p0, p2, :cond_2

    .line 72
    .line 73
    invoke-virtual {v2}, Lokio/w;->b()Lokio/w;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    iput-object p0, p1, Lokio/e;->g:Lokio/w;

    .line 78
    .line 79
    invoke-static {v2}, Lokio/x;->b(Lokio/w;)V
    :try_end_0
    .catch Ljava/util/zip/DataFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 80
    .line 81
    .line 82
    :cond_2
    return-wide v0

    .line 83
    :catch_0
    move-exception p0

    .line 84
    new-instance p1, Ljava/io/IOException;

    .line 85
    .line 86
    invoke-direct {p1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    .line 87
    .line 88
    .line 89
    throw p1

    .line 90
    :cond_3
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 91
    .line 92
    const-string p1, "closed"

    .line 93
    .line 94
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    throw p0

    .line 98
    :cond_4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 99
    .line 100
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 101
    .line 102
    .line 103
    const-string p1, "byteCount < 0: "

    .line 104
    .line 105
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 116
    .line 117
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    throw p1
.end method

.method public final c()Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object v0, p0, Lokio/m;->h:Ljava/util/zip/Inflater;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/zip/Inflater;->needsInput()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    iget-object v0, p0, Lokio/m;->g:Lokio/g;

    .line 12
    .line 13
    invoke-interface {v0}, Lokio/g;->O()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_1
    iget-object v0, p0, Lokio/m;->g:Lokio/g;

    .line 22
    .line 23
    invoke-interface {v0}, Lokio/g;->i()Lokio/e;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v0, v0, Lokio/e;->g:Lokio/w;

    .line 28
    .line 29
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    iget v2, v0, Lokio/w;->c:I

    .line 33
    .line 34
    iget v3, v0, Lokio/w;->b:I

    .line 35
    .line 36
    sub-int/2addr v2, v3

    .line 37
    iput v2, p0, Lokio/m;->i:I

    .line 38
    .line 39
    iget-object p0, p0, Lokio/m;->h:Ljava/util/zip/Inflater;

    .line 40
    .line 41
    iget-object v0, v0, Lokio/w;->a:[B

    .line 42
    .line 43
    invoke-virtual {p0, v0, v3, v2}, Ljava/util/zip/Inflater;->setInput([BII)V

    .line 44
    .line 45
    .line 46
    return v1
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-boolean v0, p0, Lokio/m;->j:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lokio/m;->h:Ljava/util/zip/Inflater;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/zip/Inflater;->end()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Lokio/m;->j:Z

    .line 13
    .line 14
    iget-object p0, p0, Lokio/m;->g:Lokio/g;

    .line 15
    .line 16
    invoke-interface {p0}, Lokio/B;->close()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public read(Lokio/e;J)J
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
    :goto_0
    invoke-virtual {p0, p1, p2, p3}, Lokio/m;->b(Lokio/e;J)J

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
    return-wide v0

    .line 17
    :cond_0
    iget-object v0, p0, Lokio/m;->h:Ljava/util/zip/Inflater;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/util/zip/Inflater;->finished()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iget-object v0, p0, Lokio/m;->h:Ljava/util/zip/Inflater;

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/util/zip/Inflater;->needsDictionary()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_1
    iget-object v0, p0, Lokio/m;->g:Lokio/g;

    .line 35
    .line 36
    invoke-interface {v0}, Lokio/g;->O()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-nez v0, :cond_2

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    new-instance p0, Ljava/io/EOFException;

    .line 44
    .line 45
    const-string p1, "source exhausted prematurely"

    .line 46
    .line 47
    invoke-direct {p0, p1}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    throw p0

    .line 51
    :cond_3
    :goto_1
    const-wide/16 p0, -0x1

    .line 52
    .line 53
    return-wide p0
.end method

.method public timeout()Lokio/C;
    .locals 0

    .line 1
    iget-object p0, p0, Lokio/m;->g:Lokio/g;

    .line 2
    .line 3
    invoke-interface {p0}, Lokio/B;->timeout()Lokio/C;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
