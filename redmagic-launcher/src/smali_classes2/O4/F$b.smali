.class LO4/F$b;
.super LO4/F;
.source "RequestBody.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LO4/F;->create(LO4/z;[BII)LO4/F;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:LO4/z;

.field final synthetic b:I

.field final synthetic c:[B

.field final synthetic d:I


# direct methods
.method constructor <init>(LO4/z;I[BI)V
    .locals 0

    .line 1
    iput-object p1, p0, LO4/F$b;->a:LO4/z;

    .line 2
    .line 3
    iput p2, p0, LO4/F$b;->b:I

    .line 4
    .line 5
    iput-object p3, p0, LO4/F$b;->c:[B

    .line 6
    .line 7
    iput p4, p0, LO4/F$b;->d:I

    .line 8
    .line 9
    invoke-direct {p0}, LO4/F;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public contentLength()J
    .locals 2

    .line 1
    iget p0, p0, LO4/F$b;->b:I

    .line 2
    .line 3
    int-to-long v0, p0

    .line 4
    return-wide v0
.end method

.method public contentType()LO4/z;
    .locals 0
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, LO4/F$b;->a:LO4/z;

    .line 2
    .line 3
    return-object p0
.end method

.method public writeTo(Lokio/f;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object v0, p0, LO4/F$b;->c:[B

    .line 2
    .line 3
    iget v1, p0, LO4/F$b;->d:I

    .line 4
    .line 5
    iget p0, p0, LO4/F$b;->b:I

    .line 6
    .line 7
    invoke-interface {p1, v0, v1, p0}, Lokio/f;->write([BII)Lokio/f;

    .line 8
    .line 9
    .line 10
    return-void
.end method
