.class final Lretrofit2/OkHttpCall$ExceptionCatchingRequestBody;
.super LO4/H;
.source "OkHttpCall.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lretrofit2/OkHttpCall;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ExceptionCatchingRequestBody"
.end annotation


# instance fields
.field private final delegate:LO4/H;

.field thrownException:Ljava/io/IOException;


# direct methods
.method constructor <init>(LO4/H;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LO4/H;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lretrofit2/OkHttpCall$ExceptionCatchingRequestBody;->delegate:LO4/H;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public close()V
    .locals 0

    .line 1
    iget-object p0, p0, Lretrofit2/OkHttpCall$ExceptionCatchingRequestBody;->delegate:LO4/H;

    .line 2
    .line 3
    invoke-virtual {p0}, LO4/H;->close()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public contentLength()J
    .locals 2

    .line 1
    iget-object p0, p0, Lretrofit2/OkHttpCall$ExceptionCatchingRequestBody;->delegate:LO4/H;

    .line 2
    .line 3
    invoke-virtual {p0}, LO4/H;->contentLength()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public contentType()LO4/z;
    .locals 0

    .line 1
    iget-object p0, p0, Lretrofit2/OkHttpCall$ExceptionCatchingRequestBody;->delegate:LO4/H;

    .line 2
    .line 3
    invoke-virtual {p0}, LO4/H;->contentType()LO4/z;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public source()Lokio/g;
    .locals 2

    .line 1
    new-instance v0, Lretrofit2/OkHttpCall$ExceptionCatchingRequestBody$1;

    .line 2
    .line 3
    iget-object v1, p0, Lretrofit2/OkHttpCall$ExceptionCatchingRequestBody;->delegate:LO4/H;

    .line 4
    .line 5
    invoke-virtual {v1}, LO4/H;->source()Lokio/g;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {v0, p0, v1}, Lretrofit2/OkHttpCall$ExceptionCatchingRequestBody$1;-><init>(Lretrofit2/OkHttpCall$ExceptionCatchingRequestBody;Lokio/B;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, Lokio/o;->d(Lokio/B;)Lokio/g;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method throwIfCaught()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object p0, p0, Lretrofit2/OkHttpCall$ExceptionCatchingRequestBody;->thrownException:Ljava/io/IOException;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    throw p0
.end method
