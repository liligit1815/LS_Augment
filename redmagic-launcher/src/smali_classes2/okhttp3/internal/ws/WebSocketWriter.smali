.class final Lokhttp3/internal/ws/WebSocketWriter;
.super Ljava/lang/Object;
.source "WebSocketWriter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lokhttp3/internal/ws/WebSocketWriter$FrameSink;
    }
.end annotation


# instance fields
.field activeWriter:Z

.field final buffer:Lokio/e;

.field final frameSink:Lokhttp3/internal/ws/WebSocketWriter$FrameSink;

.field final isClient:Z

.field private final maskCursor:Lokio/e$a;

.field private final maskKey:[B

.field final random:Ljava/util/Random;

.field final sink:Lokio/f;

.field final sinkBuffer:Lokio/e;

.field writerClosed:Z


# direct methods
.method constructor <init>(ZLokio/f;Ljava/util/Random;)V
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
    iput-object v0, p0, Lokhttp3/internal/ws/WebSocketWriter;->buffer:Lokio/e;

    .line 10
    .line 11
    new-instance v0, Lokhttp3/internal/ws/WebSocketWriter$FrameSink;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lokhttp3/internal/ws/WebSocketWriter$FrameSink;-><init>(Lokhttp3/internal/ws/WebSocketWriter;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lokhttp3/internal/ws/WebSocketWriter;->frameSink:Lokhttp3/internal/ws/WebSocketWriter$FrameSink;

    .line 17
    .line 18
    if-eqz p2, :cond_3

    .line 19
    .line 20
    if-eqz p3, :cond_2

    .line 21
    .line 22
    iput-boolean p1, p0, Lokhttp3/internal/ws/WebSocketWriter;->isClient:Z

    .line 23
    .line 24
    iput-object p2, p0, Lokhttp3/internal/ws/WebSocketWriter;->sink:Lokio/f;

    .line 25
    .line 26
    invoke-interface {p2}, Lokio/f;->a()Lokio/e;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    iput-object p2, p0, Lokhttp3/internal/ws/WebSocketWriter;->sinkBuffer:Lokio/e;

    .line 31
    .line 32
    iput-object p3, p0, Lokhttp3/internal/ws/WebSocketWriter;->random:Ljava/util/Random;

    .line 33
    .line 34
    const/4 p2, 0x0

    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    const/4 p3, 0x4

    .line 38
    new-array p3, p3, [B

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    move-object p3, p2

    .line 42
    :goto_0
    iput-object p3, p0, Lokhttp3/internal/ws/WebSocketWriter;->maskKey:[B

    .line 43
    .line 44
    if-eqz p1, :cond_1

    .line 45
    .line 46
    new-instance p2, Lokio/e$a;

    .line 47
    .line 48
    invoke-direct {p2}, Lokio/e$a;-><init>()V

    .line 49
    .line 50
    .line 51
    :cond_1
    iput-object p2, p0, Lokhttp3/internal/ws/WebSocketWriter;->maskCursor:Lokio/e$a;

    .line 52
    .line 53
    return-void

    .line 54
    :cond_2
    new-instance p0, Ljava/lang/NullPointerException;

    .line 55
    .line 56
    const-string p1, "random == null"

    .line 57
    .line 58
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    throw p0

    .line 62
    :cond_3
    new-instance p0, Ljava/lang/NullPointerException;

    .line 63
    .line 64
    const-string p1, "sink == null"

    .line 65
    .line 66
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    throw p0
.end method

.method private writeControlFrame(ILokio/h;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-boolean v0, p0, Lokhttp3/internal/ws/WebSocketWriter;->writerClosed:Z

    .line 2
    .line 3
    if-nez v0, :cond_3

    .line 4
    .line 5
    invoke-virtual {p2}, Lokio/h;->z()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    int-to-long v1, v0

    .line 10
    const-wide/16 v3, 0x7d

    .line 11
    .line 12
    cmp-long v1, v1, v3

    .line 13
    .line 14
    if-gtz v1, :cond_2

    .line 15
    .line 16
    or-int/lit16 p1, p1, 0x80

    .line 17
    .line 18
    iget-object v1, p0, Lokhttp3/internal/ws/WebSocketWriter;->sinkBuffer:Lokio/e;

    .line 19
    .line 20
    invoke-virtual {v1, p1}, Lokio/e;->g0(I)Lokio/e;

    .line 21
    .line 22
    .line 23
    iget-boolean p1, p0, Lokhttp3/internal/ws/WebSocketWriter;->isClient:Z

    .line 24
    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    or-int/lit16 p1, v0, 0x80

    .line 28
    .line 29
    iget-object v1, p0, Lokhttp3/internal/ws/WebSocketWriter;->sinkBuffer:Lokio/e;

    .line 30
    .line 31
    invoke-virtual {v1, p1}, Lokio/e;->g0(I)Lokio/e;

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lokhttp3/internal/ws/WebSocketWriter;->random:Ljava/util/Random;

    .line 35
    .line 36
    iget-object v1, p0, Lokhttp3/internal/ws/WebSocketWriter;->maskKey:[B

    .line 37
    .line 38
    invoke-virtual {p1, v1}, Ljava/util/Random;->nextBytes([B)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lokhttp3/internal/ws/WebSocketWriter;->sinkBuffer:Lokio/e;

    .line 42
    .line 43
    iget-object v1, p0, Lokhttp3/internal/ws/WebSocketWriter;->maskKey:[B

    .line 44
    .line 45
    invoke-virtual {p1, v1}, Lokio/e;->e0([B)Lokio/e;

    .line 46
    .line 47
    .line 48
    if-lez v0, :cond_1

    .line 49
    .line 50
    iget-object p1, p0, Lokhttp3/internal/ws/WebSocketWriter;->sinkBuffer:Lokio/e;

    .line 51
    .line 52
    invoke-virtual {p1}, Lokio/e;->size()J

    .line 53
    .line 54
    .line 55
    move-result-wide v0

    .line 56
    iget-object p1, p0, Lokhttp3/internal/ws/WebSocketWriter;->sinkBuffer:Lokio/e;

    .line 57
    .line 58
    invoke-virtual {p1, p2}, Lokio/e;->d0(Lokio/h;)Lokio/e;

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Lokhttp3/internal/ws/WebSocketWriter;->sinkBuffer:Lokio/e;

    .line 62
    .line 63
    iget-object p2, p0, Lokhttp3/internal/ws/WebSocketWriter;->maskCursor:Lokio/e$a;

    .line 64
    .line 65
    invoke-virtual {p1, p2}, Lokio/e;->F(Lokio/e$a;)Lokio/e$a;

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Lokhttp3/internal/ws/WebSocketWriter;->maskCursor:Lokio/e$a;

    .line 69
    .line 70
    invoke-virtual {p1, v0, v1}, Lokio/e$a;->d(J)I

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Lokhttp3/internal/ws/WebSocketWriter;->maskCursor:Lokio/e$a;

    .line 74
    .line 75
    iget-object p2, p0, Lokhttp3/internal/ws/WebSocketWriter;->maskKey:[B

    .line 76
    .line 77
    invoke-static {p1, p2}, Lokhttp3/internal/ws/WebSocketProtocol;->toggleMask(Lokio/e$a;[B)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Lokhttp3/internal/ws/WebSocketWriter;->maskCursor:Lokio/e$a;

    .line 81
    .line 82
    invoke-virtual {p1}, Lokio/e$a;->close()V

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_0
    iget-object p1, p0, Lokhttp3/internal/ws/WebSocketWriter;->sinkBuffer:Lokio/e;

    .line 87
    .line 88
    invoke-virtual {p1, v0}, Lokio/e;->g0(I)Lokio/e;

    .line 89
    .line 90
    .line 91
    iget-object p1, p0, Lokhttp3/internal/ws/WebSocketWriter;->sinkBuffer:Lokio/e;

    .line 92
    .line 93
    invoke-virtual {p1, p2}, Lokio/e;->d0(Lokio/h;)Lokio/e;

    .line 94
    .line 95
    .line 96
    :cond_1
    :goto_0
    iget-object p0, p0, Lokhttp3/internal/ws/WebSocketWriter;->sink:Lokio/f;

    .line 97
    .line 98
    invoke-interface {p0}, Lokio/f;->flush()V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 103
    .line 104
    const-string p1, "Payload size must be less than or equal to 125"

    .line 105
    .line 106
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    throw p0

    .line 110
    :cond_3
    new-instance p0, Ljava/io/IOException;

    .line 111
    .line 112
    const-string p1, "closed"

    .line 113
    .line 114
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    throw p0
.end method


# virtual methods
.method newMessageSink(IJ)Lokio/z;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lokhttp3/internal/ws/WebSocketWriter;->activeWriter:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lokhttp3/internal/ws/WebSocketWriter;->activeWriter:Z

    .line 7
    .line 8
    iget-object p0, p0, Lokhttp3/internal/ws/WebSocketWriter;->frameSink:Lokhttp3/internal/ws/WebSocketWriter$FrameSink;

    .line 9
    .line 10
    iput p1, p0, Lokhttp3/internal/ws/WebSocketWriter$FrameSink;->formatOpcode:I

    .line 11
    .line 12
    iput-wide p2, p0, Lokhttp3/internal/ws/WebSocketWriter$FrameSink;->contentLength:J

    .line 13
    .line 14
    iput-boolean v0, p0, Lokhttp3/internal/ws/WebSocketWriter$FrameSink;->isFirstFrame:Z

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    iput-boolean p1, p0, Lokhttp3/internal/ws/WebSocketWriter$FrameSink;->closed:Z

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 21
    .line 22
    const-string p1, "Another message writer is active. Did you call close()?"

    .line 23
    .line 24
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    throw p0
.end method

.method writeClose(ILokio/h;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    sget-object v0, Lokio/h;->k:Lokio/h;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    if-eqz p2, :cond_3

    .line 6
    .line 7
    :cond_0
    if-eqz p1, :cond_1

    .line 8
    .line 9
    invoke-static {p1}, Lokhttp3/internal/ws/WebSocketProtocol;->validateCloseCode(I)V

    .line 10
    .line 11
    .line 12
    :cond_1
    new-instance v0, Lokio/e;

    .line 13
    .line 14
    invoke-direct {v0}, Lokio/e;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p1}, Lokio/e;->l0(I)Lokio/e;

    .line 18
    .line 19
    .line 20
    if-eqz p2, :cond_2

    .line 21
    .line 22
    invoke-virtual {v0, p2}, Lokio/e;->d0(Lokio/h;)Lokio/e;

    .line 23
    .line 24
    .line 25
    :cond_2
    invoke-virtual {v0}, Lokio/e;->I()Lokio/h;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    :cond_3
    const/16 p1, 0x8

    .line 30
    .line 31
    const/4 p2, 0x1

    .line 32
    :try_start_0
    invoke-direct {p0, p1, v0}, Lokhttp3/internal/ws/WebSocketWriter;->writeControlFrame(ILokio/h;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    .line 34
    .line 35
    iput-boolean p2, p0, Lokhttp3/internal/ws/WebSocketWriter;->writerClosed:Z

    .line 36
    .line 37
    return-void

    .line 38
    :catchall_0
    move-exception p1

    .line 39
    iput-boolean p2, p0, Lokhttp3/internal/ws/WebSocketWriter;->writerClosed:Z

    .line 40
    .line 41
    throw p1
.end method

.method writeMessageFrame(IJZZ)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-boolean v0, p0, Lokhttp3/internal/ws/WebSocketWriter;->writerClosed:Z

    .line 2
    .line 3
    if-nez v0, :cond_7

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p4, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move p1, v0

    .line 10
    :goto_0
    if-eqz p5, :cond_1

    .line 11
    .line 12
    or-int/lit16 p1, p1, 0x80

    .line 13
    .line 14
    :cond_1
    iget-object p4, p0, Lokhttp3/internal/ws/WebSocketWriter;->sinkBuffer:Lokio/e;

    .line 15
    .line 16
    invoke-virtual {p4, p1}, Lokio/e;->g0(I)Lokio/e;

    .line 17
    .line 18
    .line 19
    iget-boolean p1, p0, Lokhttp3/internal/ws/WebSocketWriter;->isClient:Z

    .line 20
    .line 21
    if-eqz p1, :cond_2

    .line 22
    .line 23
    const/16 v0, 0x80

    .line 24
    .line 25
    :cond_2
    const-wide/16 p4, 0x7d

    .line 26
    .line 27
    cmp-long p1, p2, p4

    .line 28
    .line 29
    if-gtz p1, :cond_3

    .line 30
    .line 31
    long-to-int p1, p2

    .line 32
    or-int/2addr p1, v0

    .line 33
    iget-object p4, p0, Lokhttp3/internal/ws/WebSocketWriter;->sinkBuffer:Lokio/e;

    .line 34
    .line 35
    invoke-virtual {p4, p1}, Lokio/e;->g0(I)Lokio/e;

    .line 36
    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_3
    const-wide/32 p4, 0xffff

    .line 40
    .line 41
    .line 42
    cmp-long p1, p2, p4

    .line 43
    .line 44
    if-gtz p1, :cond_4

    .line 45
    .line 46
    or-int/lit8 p1, v0, 0x7e

    .line 47
    .line 48
    iget-object p4, p0, Lokhttp3/internal/ws/WebSocketWriter;->sinkBuffer:Lokio/e;

    .line 49
    .line 50
    invoke-virtual {p4, p1}, Lokio/e;->g0(I)Lokio/e;

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Lokhttp3/internal/ws/WebSocketWriter;->sinkBuffer:Lokio/e;

    .line 54
    .line 55
    long-to-int p4, p2

    .line 56
    invoke-virtual {p1, p4}, Lokio/e;->l0(I)Lokio/e;

    .line 57
    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_4
    or-int/lit8 p1, v0, 0x7f

    .line 61
    .line 62
    iget-object p4, p0, Lokhttp3/internal/ws/WebSocketWriter;->sinkBuffer:Lokio/e;

    .line 63
    .line 64
    invoke-virtual {p4, p1}, Lokio/e;->g0(I)Lokio/e;

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lokhttp3/internal/ws/WebSocketWriter;->sinkBuffer:Lokio/e;

    .line 68
    .line 69
    invoke-virtual {p1, p2, p3}, Lokio/e;->k0(J)Lokio/e;

    .line 70
    .line 71
    .line 72
    :goto_1
    iget-boolean p1, p0, Lokhttp3/internal/ws/WebSocketWriter;->isClient:Z

    .line 73
    .line 74
    if-eqz p1, :cond_5

    .line 75
    .line 76
    iget-object p1, p0, Lokhttp3/internal/ws/WebSocketWriter;->random:Ljava/util/Random;

    .line 77
    .line 78
    iget-object p4, p0, Lokhttp3/internal/ws/WebSocketWriter;->maskKey:[B

    .line 79
    .line 80
    invoke-virtual {p1, p4}, Ljava/util/Random;->nextBytes([B)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Lokhttp3/internal/ws/WebSocketWriter;->sinkBuffer:Lokio/e;

    .line 84
    .line 85
    iget-object p4, p0, Lokhttp3/internal/ws/WebSocketWriter;->maskKey:[B

    .line 86
    .line 87
    invoke-virtual {p1, p4}, Lokio/e;->e0([B)Lokio/e;

    .line 88
    .line 89
    .line 90
    const-wide/16 p4, 0x0

    .line 91
    .line 92
    cmp-long p1, p2, p4

    .line 93
    .line 94
    if-lez p1, :cond_6

    .line 95
    .line 96
    iget-object p1, p0, Lokhttp3/internal/ws/WebSocketWriter;->sinkBuffer:Lokio/e;

    .line 97
    .line 98
    invoke-virtual {p1}, Lokio/e;->size()J

    .line 99
    .line 100
    .line 101
    move-result-wide p4

    .line 102
    iget-object p1, p0, Lokhttp3/internal/ws/WebSocketWriter;->sinkBuffer:Lokio/e;

    .line 103
    .line 104
    iget-object v0, p0, Lokhttp3/internal/ws/WebSocketWriter;->buffer:Lokio/e;

    .line 105
    .line 106
    invoke-virtual {p1, v0, p2, p3}, Lokio/e;->write(Lokio/e;J)V

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Lokhttp3/internal/ws/WebSocketWriter;->sinkBuffer:Lokio/e;

    .line 110
    .line 111
    iget-object p2, p0, Lokhttp3/internal/ws/WebSocketWriter;->maskCursor:Lokio/e$a;

    .line 112
    .line 113
    invoke-virtual {p1, p2}, Lokio/e;->F(Lokio/e$a;)Lokio/e$a;

    .line 114
    .line 115
    .line 116
    iget-object p1, p0, Lokhttp3/internal/ws/WebSocketWriter;->maskCursor:Lokio/e$a;

    .line 117
    .line 118
    invoke-virtual {p1, p4, p5}, Lokio/e$a;->d(J)I

    .line 119
    .line 120
    .line 121
    iget-object p1, p0, Lokhttp3/internal/ws/WebSocketWriter;->maskCursor:Lokio/e$a;

    .line 122
    .line 123
    iget-object p2, p0, Lokhttp3/internal/ws/WebSocketWriter;->maskKey:[B

    .line 124
    .line 125
    invoke-static {p1, p2}, Lokhttp3/internal/ws/WebSocketProtocol;->toggleMask(Lokio/e$a;[B)V

    .line 126
    .line 127
    .line 128
    iget-object p1, p0, Lokhttp3/internal/ws/WebSocketWriter;->maskCursor:Lokio/e$a;

    .line 129
    .line 130
    invoke-virtual {p1}, Lokio/e$a;->close()V

    .line 131
    .line 132
    .line 133
    goto :goto_2

    .line 134
    :cond_5
    iget-object p1, p0, Lokhttp3/internal/ws/WebSocketWriter;->sinkBuffer:Lokio/e;

    .line 135
    .line 136
    iget-object p4, p0, Lokhttp3/internal/ws/WebSocketWriter;->buffer:Lokio/e;

    .line 137
    .line 138
    invoke-virtual {p1, p4, p2, p3}, Lokio/e;->write(Lokio/e;J)V

    .line 139
    .line 140
    .line 141
    :cond_6
    :goto_2
    iget-object p0, p0, Lokhttp3/internal/ws/WebSocketWriter;->sink:Lokio/f;

    .line 142
    .line 143
    invoke-interface {p0}, Lokio/f;->f()Lokio/f;

    .line 144
    .line 145
    .line 146
    return-void

    .line 147
    :cond_7
    new-instance p0, Ljava/io/IOException;

    .line 148
    .line 149
    const-string p1, "closed"

    .line 150
    .line 151
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    throw p0
.end method

.method writePing(Lokio/h;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/16 v0, 0x9

    .line 2
    .line 3
    invoke-direct {p0, v0, p1}, Lokhttp3/internal/ws/WebSocketWriter;->writeControlFrame(ILokio/h;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method writePong(Lokio/h;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/16 v0, 0xa

    .line 2
    .line 3
    invoke-direct {p0, v0, p1}, Lokhttp3/internal/ws/WebSocketWriter;->writeControlFrame(ILokio/h;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
