.class final Lokhttp3/internal/cache2/Relay;
.super Ljava/lang/Object;
.source "Relay.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lokhttp3/internal/cache2/Relay$RelaySource;
    }
.end annotation


# static fields
.field private static final FILE_HEADER_SIZE:J = 0x20L

.field static final PREFIX_CLEAN:Lokio/h;

.field static final PREFIX_DIRTY:Lokio/h;

.field private static final SOURCE_FILE:I = 0x2

.field private static final SOURCE_UPSTREAM:I = 0x1


# instance fields
.field final buffer:Lokio/e;

.field final bufferMaxSize:J

.field complete:Z

.field file:Ljava/io/RandomAccessFile;

.field private final metadata:Lokio/h;

.field sourceCount:I

.field upstream:Lokio/B;

.field final upstreamBuffer:Lokio/e;

.field upstreamPos:J

.field upstreamReader:Ljava/lang/Thread;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "OkHttp cache v1\n"

    .line 2
    .line 3
    invoke-static {v0}, Lokio/h;->f(Ljava/lang/String;)Lokio/h;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lokhttp3/internal/cache2/Relay;->PREFIX_CLEAN:Lokio/h;

    .line 8
    .line 9
    const-string v0, "OkHttp DIRTY :(\n"

    .line 10
    .line 11
    invoke-static {v0}, Lokio/h;->f(Ljava/lang/String;)Lokio/h;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Lokhttp3/internal/cache2/Relay;->PREFIX_DIRTY:Lokio/h;

    .line 16
    .line 17
    return-void
.end method

.method private constructor <init>(Ljava/io/RandomAccessFile;Lokio/B;JLokio/h;J)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lokio/e;

    .line 5
    .line 6
    invoke-direct {v0}, Lokio/e;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lokhttp3/internal/cache2/Relay;->upstreamBuffer:Lokio/e;

    .line 10
    .line 11
    new-instance v0, Lokio/e;

    .line 12
    .line 13
    invoke-direct {v0}, Lokio/e;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lokhttp3/internal/cache2/Relay;->buffer:Lokio/e;

    .line 17
    .line 18
    iput-object p1, p0, Lokhttp3/internal/cache2/Relay;->file:Ljava/io/RandomAccessFile;

    .line 19
    .line 20
    iput-object p2, p0, Lokhttp3/internal/cache2/Relay;->upstream:Lokio/B;

    .line 21
    .line 22
    if-nez p2, :cond_0

    .line 23
    .line 24
    const/4 p1, 0x1

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p1, 0x0

    .line 27
    :goto_0
    iput-boolean p1, p0, Lokhttp3/internal/cache2/Relay;->complete:Z

    .line 28
    .line 29
    iput-wide p3, p0, Lokhttp3/internal/cache2/Relay;->upstreamPos:J

    .line 30
    .line 31
    iput-object p5, p0, Lokhttp3/internal/cache2/Relay;->metadata:Lokio/h;

    .line 32
    .line 33
    iput-wide p6, p0, Lokhttp3/internal/cache2/Relay;->bufferMaxSize:J

    .line 34
    .line 35
    return-void
.end method

.method public static edit(Ljava/io/File;Lokio/B;Lokio/h;J)Lokhttp3/internal/cache2/Relay;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    new-instance v1, Ljava/io/RandomAccessFile;

    .line 2
    .line 3
    const-string v0, "rw"

    .line 4
    .line 5
    invoke-direct {v1, p0, v0}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Lokhttp3/internal/cache2/Relay;

    .line 9
    .line 10
    const-wide/16 v3, 0x0

    .line 11
    .line 12
    move-object v2, p1

    .line 13
    move-object v5, p2

    .line 14
    move-wide v6, p3

    .line 15
    invoke-direct/range {v0 .. v7}, Lokhttp3/internal/cache2/Relay;-><init>(Ljava/io/RandomAccessFile;Lokio/B;JLokio/h;J)V

    .line 16
    .line 17
    .line 18
    const-wide/16 p0, 0x0

    .line 19
    .line 20
    invoke-virtual {v1, p0, p1}, Ljava/io/RandomAccessFile;->setLength(J)V

    .line 21
    .line 22
    .line 23
    sget-object v3, Lokhttp3/internal/cache2/Relay;->PREFIX_DIRTY:Lokio/h;

    .line 24
    .line 25
    const-wide/16 v4, -0x1

    .line 26
    .line 27
    const-wide/16 v6, -0x1

    .line 28
    .line 29
    move-object v2, v0

    .line 30
    invoke-direct/range {v2 .. v7}, Lokhttp3/internal/cache2/Relay;->writeHeader(Lokio/h;JJ)V

    .line 31
    .line 32
    .line 33
    return-object v0
.end method

.method public static read(Ljava/io/File;)Lokhttp3/internal/cache2/Relay;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    new-instance v1, Ljava/io/RandomAccessFile;

    .line 2
    .line 3
    const-string v0, "rw"

    .line 4
    .line 5
    invoke-direct {v1, p0, v0}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v2, Lokhttp3/internal/cache2/FileOperator;

    .line 9
    .line 10
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-direct {v2, p0}, Lokhttp3/internal/cache2/FileOperator;-><init>(Ljava/nio/channels/FileChannel;)V

    .line 15
    .line 16
    .line 17
    new-instance v5, Lokio/e;

    .line 18
    .line 19
    invoke-direct {v5}, Lokio/e;-><init>()V

    .line 20
    .line 21
    .line 22
    const-wide/16 v3, 0x0

    .line 23
    .line 24
    const-wide/16 v6, 0x20

    .line 25
    .line 26
    invoke-virtual/range {v2 .. v7}, Lokhttp3/internal/cache2/FileOperator;->read(JLokio/e;J)V

    .line 27
    .line 28
    .line 29
    sget-object p0, Lokhttp3/internal/cache2/Relay;->PREFIX_CLEAN:Lokio/h;

    .line 30
    .line 31
    invoke-virtual {p0}, Lokio/h;->z()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    int-to-long v3, v0

    .line 36
    invoke-virtual {v5, v3, v4}, Lokio/e;->K(J)Lokio/h;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0, p0}, Lokio/h;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-eqz p0, :cond_0

    .line 45
    .line 46
    invoke-virtual {v5}, Lokio/e;->readLong()J

    .line 47
    .line 48
    .line 49
    move-result-wide v8

    .line 50
    invoke-virtual {v5}, Lokio/e;->readLong()J

    .line 51
    .line 52
    .line 53
    move-result-wide v6

    .line 54
    new-instance v5, Lokio/e;

    .line 55
    .line 56
    invoke-direct {v5}, Lokio/e;-><init>()V

    .line 57
    .line 58
    .line 59
    const-wide/16 v3, 0x20

    .line 60
    .line 61
    add-long/2addr v3, v8

    .line 62
    invoke-virtual/range {v2 .. v7}, Lokhttp3/internal/cache2/FileOperator;->read(JLokio/e;J)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v5}, Lokio/e;->I()Lokio/h;

    .line 66
    .line 67
    .line 68
    move-result-object v5

    .line 69
    new-instance v0, Lokhttp3/internal/cache2/Relay;

    .line 70
    .line 71
    const/4 v2, 0x0

    .line 72
    const-wide/16 v6, 0x0

    .line 73
    .line 74
    move-wide v3, v8

    .line 75
    invoke-direct/range {v0 .. v7}, Lokhttp3/internal/cache2/Relay;-><init>(Ljava/io/RandomAccessFile;Lokio/B;JLokio/h;J)V

    .line 76
    .line 77
    .line 78
    return-object v0

    .line 79
    :cond_0
    new-instance p0, Ljava/io/IOException;

    .line 80
    .line 81
    const-string v0, "unreadable cache file"

    .line 82
    .line 83
    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    throw p0
.end method

.method private writeHeader(Lokio/h;JJ)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    move-wide v0, p2

    .line 2
    new-instance p3, Lokio/e;

    .line 3
    .line 4
    invoke-direct {p3}, Lokio/e;-><init>()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3, p1}, Lokio/e;->d0(Lokio/h;)Lokio/e;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p3, v0, v1}, Lokio/e;->k0(J)Lokio/e;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p3, p4, p5}, Lokio/e;->k0(J)Lokio/e;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p3}, Lokio/e;->size()J

    .line 17
    .line 18
    .line 19
    move-result-wide p1

    .line 20
    const-wide/16 p4, 0x20

    .line 21
    .line 22
    cmp-long p1, p1, p4

    .line 23
    .line 24
    if-nez p1, :cond_0

    .line 25
    .line 26
    move-object p1, p0

    .line 27
    new-instance p0, Lokhttp3/internal/cache2/FileOperator;

    .line 28
    .line 29
    iget-object p1, p1, Lokhttp3/internal/cache2/Relay;->file:Ljava/io/RandomAccessFile;

    .line 30
    .line 31
    invoke-virtual {p1}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-direct {p0, p1}, Lokhttp3/internal/cache2/FileOperator;-><init>(Ljava/nio/channels/FileChannel;)V

    .line 36
    .line 37
    .line 38
    const-wide/16 p1, 0x0

    .line 39
    .line 40
    const-wide/16 p4, 0x20

    .line 41
    .line 42
    invoke-virtual/range {p0 .. p5}, Lokhttp3/internal/cache2/FileOperator;->write(JLokio/e;J)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 47
    .line 48
    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 49
    .line 50
    .line 51
    throw p0
.end method

.method private writeMetadata(J)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    new-instance v3, Lokio/e;

    .line 2
    .line 3
    invoke-direct {v3}, Lokio/e;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lokhttp3/internal/cache2/Relay;->metadata:Lokio/h;

    .line 7
    .line 8
    invoke-virtual {v3, v0}, Lokio/e;->d0(Lokio/h;)Lokio/e;

    .line 9
    .line 10
    .line 11
    new-instance v0, Lokhttp3/internal/cache2/FileOperator;

    .line 12
    .line 13
    iget-object v1, p0, Lokhttp3/internal/cache2/Relay;->file:Ljava/io/RandomAccessFile;

    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-direct {v0, v1}, Lokhttp3/internal/cache2/FileOperator;-><init>(Ljava/nio/channels/FileChannel;)V

    .line 20
    .line 21
    .line 22
    const-wide/16 v1, 0x20

    .line 23
    .line 24
    add-long/2addr v1, p1

    .line 25
    iget-object p0, p0, Lokhttp3/internal/cache2/Relay;->metadata:Lokio/h;

    .line 26
    .line 27
    invoke-virtual {p0}, Lokio/h;->z()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    int-to-long v4, p0

    .line 32
    invoke-virtual/range {v0 .. v5}, Lokhttp3/internal/cache2/FileOperator;->write(JLokio/e;J)V

    .line 33
    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method commit(J)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Lokhttp3/internal/cache2/Relay;->writeMetadata(J)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lokhttp3/internal/cache2/Relay;->file:Ljava/io/RandomAccessFile;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Ljava/nio/channels/FileChannel;->force(Z)V

    .line 12
    .line 13
    .line 14
    sget-object v3, Lokhttp3/internal/cache2/Relay;->PREFIX_CLEAN:Lokio/h;

    .line 15
    .line 16
    iget-object v0, p0, Lokhttp3/internal/cache2/Relay;->metadata:Lokio/h;

    .line 17
    .line 18
    invoke-virtual {v0}, Lokio/h;->z()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    int-to-long v6, v0

    .line 23
    move-object v2, p0

    .line 24
    move-wide v4, p1

    .line 25
    invoke-direct/range {v2 .. v7}, Lokhttp3/internal/cache2/Relay;->writeHeader(Lokio/h;JJ)V

    .line 26
    .line 27
    .line 28
    iget-object p0, v2, Lokhttp3/internal/cache2/Relay;->file:Ljava/io/RandomAccessFile;

    .line 29
    .line 30
    invoke-virtual {p0}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0, v1}, Ljava/nio/channels/FileChannel;->force(Z)V

    .line 35
    .line 36
    .line 37
    monitor-enter v2

    .line 38
    const/4 p0, 0x1

    .line 39
    :try_start_0
    iput-boolean p0, v2, Lokhttp3/internal/cache2/Relay;->complete:Z

    .line 40
    .line 41
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    iget-object p0, v2, Lokhttp3/internal/cache2/Relay;->upstream:Lokio/B;

    .line 43
    .line 44
    invoke-static {p0}, Lokhttp3/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x0

    .line 48
    iput-object p0, v2, Lokhttp3/internal/cache2/Relay;->upstream:Lokio/B;

    .line 49
    .line 50
    return-void

    .line 51
    :catchall_0
    move-exception v0

    .line 52
    move-object p0, v0

    .line 53
    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 54
    throw p0
.end method

.method isClosed()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lokhttp3/internal/cache2/Relay;->file:Ljava/io/RandomAccessFile;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public metadata()Lokio/h;
    .locals 0

    .line 1
    iget-object p0, p0, Lokhttp3/internal/cache2/Relay;->metadata:Lokio/h;

    .line 2
    .line 3
    return-object p0
.end method

.method public newSource()Lokio/B;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lokhttp3/internal/cache2/Relay;->file:Ljava/io/RandomAccessFile;

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    monitor-exit p0

    .line 8
    return-object v0

    .line 9
    :catchall_0
    move-exception v0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget v0, p0, Lokhttp3/internal/cache2/Relay;->sourceCount:I

    .line 12
    .line 13
    add-int/lit8 v0, v0, 0x1

    .line 14
    .line 15
    iput v0, p0, Lokhttp3/internal/cache2/Relay;->sourceCount:I

    .line 16
    .line 17
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    new-instance v0, Lokhttp3/internal/cache2/Relay$RelaySource;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Lokhttp3/internal/cache2/Relay$RelaySource;-><init>(Lokhttp3/internal/cache2/Relay;)V

    .line 21
    .line 22
    .line 23
    return-object v0

    .line 24
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    throw v0
.end method
