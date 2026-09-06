.class public final Lokio/v$a;
.super Ljava/io/InputStream;
.source "RealBufferedSource.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lokio/v;->Y()Ljava/io/InputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic g:Lokio/v;


# direct methods
.method constructor <init>(Lokio/v;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lokio/v$a;->g:Lokio/v;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public available()I
    .locals 4

    .line 1
    iget-object p0, p0, Lokio/v$a;->g:Lokio/v;

    .line 2
    .line 3
    iget-boolean v0, p0, Lokio/v;->i:Z

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lokio/v;->h:Lokio/e;

    .line 8
    .line 9
    invoke-virtual {p0}, Lokio/e;->size()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    const p0, 0x7fffffff

    .line 14
    .line 15
    .line 16
    int-to-long v2, p0

    .line 17
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    long-to-int p0, v0

    .line 22
    return p0

    .line 23
    :cond_0
    new-instance p0, Ljava/io/IOException;

    .line 24
    .line 25
    const-string v0, "closed"

    .line 26
    .line 27
    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    throw p0
.end method

.method public close()V
    .locals 0

    .line 1
    iget-object p0, p0, Lokio/v$a;->g:Lokio/v;

    .line 2
    .line 3
    invoke-virtual {p0}, Lokio/v;->close()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public read()I
    .locals 4

    .line 1
    iget-object v0, p0, Lokio/v$a;->g:Lokio/v;

    iget-boolean v1, v0, Lokio/v;->i:Z

    if-nez v1, :cond_1

    .line 2
    iget-object v0, v0, Lokio/v;->h:Lokio/e;

    .line 3
    invoke-virtual {v0}, Lokio/e;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 4
    iget-object v0, p0, Lokio/v$a;->g:Lokio/v;

    iget-object v1, v0, Lokio/v;->g:Lokio/B;

    .line 5
    iget-object v0, v0, Lokio/v;->h:Lokio/e;

    const-wide/16 v2, 0x2000

    .line 6
    invoke-interface {v1, v0, v2, v3}, Lokio/B;->read(Lokio/e;J)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 p0, -0x1

    return p0

    .line 7
    :cond_0
    iget-object p0, p0, Lokio/v$a;->g:Lokio/v;

    .line 8
    iget-object p0, p0, Lokio/v;->h:Lokio/e;

    .line 9
    invoke-virtual {p0}, Lokio/e;->readByte()B

    move-result p0

    and-int/lit16 p0, p0, 0xff

    return p0

    .line 10
    :cond_1
    new-instance p0, Ljava/io/IOException;

    const-string v0, "closed"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public read([BII)I
    .locals 7

    const-string v0, "data"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 11
    iget-object v0, p0, Lokio/v$a;->g:Lokio/v;

    iget-boolean v0, v0, Lokio/v;->i:Z

    if-nez v0, :cond_1

    .line 12
    array-length v0, p1

    int-to-long v1, v0

    int-to-long v3, p2

    int-to-long v5, p3

    invoke-static/range {v1 .. v6}, Lokio/b;->b(JJJ)V

    .line 13
    iget-object v0, p0, Lokio/v$a;->g:Lokio/v;

    .line 14
    iget-object v0, v0, Lokio/v;->h:Lokio/e;

    .line 15
    invoke-virtual {v0}, Lokio/e;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 16
    iget-object v0, p0, Lokio/v$a;->g:Lokio/v;

    iget-object v1, v0, Lokio/v;->g:Lokio/B;

    .line 17
    iget-object v0, v0, Lokio/v;->h:Lokio/e;

    const-wide/16 v2, 0x2000

    .line 18
    invoke-interface {v1, v0, v2, v3}, Lokio/B;->read(Lokio/e;J)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 p0, -0x1

    return p0

    .line 19
    :cond_0
    iget-object p0, p0, Lokio/v$a;->g:Lokio/v;

    .line 20
    iget-object p0, p0, Lokio/v;->h:Lokio/e;

    .line 21
    invoke-virtual {p0, p1, p2, p3}, Lokio/e;->read([BII)I

    move-result p0

    return p0

    .line 22
    :cond_1
    new-instance p0, Ljava/io/IOException;

    const-string p1, "closed"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lokio/v$a;->g:Lokio/v;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p0, ".inputStream()"

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method
