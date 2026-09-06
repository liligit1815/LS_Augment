.class Lretrofit2/RequestBuilder$ContentTypeOverridingRequestBody;
.super LO4/F;
.source "RequestBuilder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lretrofit2/RequestBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ContentTypeOverridingRequestBody"
.end annotation


# instance fields
.field private final contentType:LO4/z;

.field private final delegate:LO4/F;


# direct methods
.method constructor <init>(LO4/F;LO4/z;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LO4/F;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lretrofit2/RequestBuilder$ContentTypeOverridingRequestBody;->delegate:LO4/F;

    .line 5
    .line 6
    iput-object p2, p0, Lretrofit2/RequestBuilder$ContentTypeOverridingRequestBody;->contentType:LO4/z;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public contentLength()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object p0, p0, Lretrofit2/RequestBuilder$ContentTypeOverridingRequestBody;->delegate:LO4/F;

    .line 2
    .line 3
    invoke-virtual {p0}, LO4/F;->contentLength()J

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
    iget-object p0, p0, Lretrofit2/RequestBuilder$ContentTypeOverridingRequestBody;->contentType:LO4/z;

    .line 2
    .line 3
    return-object p0
.end method

.method public writeTo(Lokio/f;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object p0, p0, Lretrofit2/RequestBuilder$ContentTypeOverridingRequestBody;->delegate:LO4/F;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LO4/F;->writeTo(Lokio/f;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
