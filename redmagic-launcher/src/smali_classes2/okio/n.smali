.class Lokio/n;
.super Ljava/lang/Object;
.source "JvmOkio.kt"

# interfaces
.implements Lokio/B;


# instance fields
.field private final g:Ljava/io/InputStream;

.field private final h:Lokio/C;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Lokio/C;)V
    .locals 1

    .line 1
    const-string v0, "input"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "timeout"

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
    iput-object p1, p0, Lokio/n;->g:Ljava/io/InputStream;

    .line 15
    .line 16
    iput-object p2, p0, Lokio/n;->h:Lokio/C;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public close()V
    .locals 0

    .line 1
    iget-object p0, p0, Lokio/n;->g:Ljava/io/InputStream;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public read(Lokio/e;J)J
    .locals 3

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
    if-nez v2, :cond_0

    .line 11
    .line 12
    return-wide v0

    .line 13
    :cond_0
    if-ltz v2, :cond_4

    .line 14
    .line 15
    :try_start_0
    iget-object v0, p0, Lokio/n;->h:Lokio/C;

    .line 16
    .line 17
    invoke-virtual {v0}, Lokio/C;->throwIfReached()V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    invoke-virtual {p1, v0}, Lokio/e;->c0(I)Lokio/w;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget v1, v0, Lokio/w;->c:I

    .line 26
    .line 27
    rsub-int v1, v1, 0x2000

    .line 28
    .line 29
    int-to-long v1, v1

    .line 30
    invoke-static {p2, p3, v1, v2}, Ljava/lang/Math;->min(JJ)J

    .line 31
    .line 32
    .line 33
    move-result-wide p2

    .line 34
    long-to-int p2, p2

    .line 35
    iget-object p0, p0, Lokio/n;->g:Ljava/io/InputStream;

    .line 36
    .line 37
    iget-object p3, v0, Lokio/w;->a:[B

    .line 38
    .line 39
    iget v1, v0, Lokio/w;->c:I

    .line 40
    .line 41
    invoke-virtual {p0, p3, v1, p2}, Ljava/io/InputStream;->read([BII)I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    const/4 p2, -0x1

    .line 46
    if-ne p0, p2, :cond_2

    .line 47
    .line 48
    iget p0, v0, Lokio/w;->b:I

    .line 49
    .line 50
    iget p2, v0, Lokio/w;->c:I

    .line 51
    .line 52
    if-ne p0, p2, :cond_1

    .line 53
    .line 54
    invoke-virtual {v0}, Lokio/w;->b()Lokio/w;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    iput-object p0, p1, Lokio/e;->g:Lokio/w;

    .line 59
    .line 60
    invoke-static {v0}, Lokio/x;->b(Lokio/w;)V

    .line 61
    .line 62
    .line 63
    :cond_1
    const-wide/16 p0, -0x1

    .line 64
    .line 65
    return-wide p0

    .line 66
    :cond_2
    iget p2, v0, Lokio/w;->c:I

    .line 67
    .line 68
    add-int/2addr p2, p0

    .line 69
    iput p2, v0, Lokio/w;->c:I

    .line 70
    .line 71
    invoke-virtual {p1}, Lokio/e;->size()J

    .line 72
    .line 73
    .line 74
    move-result-wide p2

    .line 75
    int-to-long v0, p0

    .line 76
    add-long/2addr p2, v0

    .line 77
    invoke-virtual {p1, p2, p3}, Lokio/e;->U(J)V
    :try_end_0
    .catch Ljava/lang/AssertionError; {:try_start_0 .. :try_end_0} :catch_0

    .line 78
    .line 79
    .line 80
    return-wide v0

    .line 81
    :catch_0
    move-exception p0

    .line 82
    invoke-static {p0}, Lokio/o;->e(Ljava/lang/AssertionError;)Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    if-eqz p1, :cond_3

    .line 87
    .line 88
    new-instance p1, Ljava/io/IOException;

    .line 89
    .line 90
    invoke-direct {p1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    .line 91
    .line 92
    .line 93
    throw p1

    .line 94
    :cond_3
    throw p0

    .line 95
    :cond_4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 98
    .line 99
    .line 100
    const-string p1, "byteCount < 0: "

    .line 101
    .line 102
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 113
    .line 114
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    throw p1
.end method

.method public timeout()Lokio/C;
    .locals 0

    .line 1
    iget-object p0, p0, Lokio/n;->h:Lokio/C;

    .line 2
    .line 3
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "source("

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lokio/n;->g:Ljava/io/InputStream;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const/16 p0, 0x29

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method
