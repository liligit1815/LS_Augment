.class LO4/F$a;
.super LO4/F;
.source "RequestBody.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LO4/F;->create(LO4/z;Lokio/h;)LO4/F;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:LO4/z;

.field final synthetic b:Lokio/h;


# direct methods
.method constructor <init>(LO4/z;Lokio/h;)V
    .locals 0

    .line 1
    iput-object p1, p0, LO4/F$a;->a:LO4/z;

    .line 2
    .line 3
    iput-object p2, p0, LO4/F$a;->b:Lokio/h;

    .line 4
    .line 5
    invoke-direct {p0}, LO4/F;-><init>()V

    .line 6
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
    iget-object p0, p0, LO4/F$a;->b:Lokio/h;

    .line 2
    .line 3
    invoke-virtual {p0}, Lokio/h;->z()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    int-to-long v0, p0

    .line 8
    return-wide v0
.end method

.method public contentType()LO4/z;
    .locals 0
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, LO4/F$a;->a:LO4/z;

    .line 2
    .line 3
    return-object p0
.end method

.method public writeTo(Lokio/f;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object p0, p0, LO4/F$a;->b:Lokio/h;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Lokio/f;->V(Lokio/h;)Lokio/f;

    .line 4
    .line 5
    .line 6
    return-void
.end method
