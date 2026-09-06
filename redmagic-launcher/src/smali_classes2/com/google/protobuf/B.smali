.class public Lcom/google/protobuf/B;
.super Ljava/io/IOException;
.source "InvalidProtocolBufferException.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/protobuf/B$a;
    }
.end annotation


# instance fields
.field private g:Lcom/google/protobuf/T;

.field private h:Z


# direct methods
.method public constructor <init>(Ljava/io/IOException;)V
    .locals 1

    .line 3
    invoke-virtual {p1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Lcom/google/protobuf/B;->g:Lcom/google/protobuf/T;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Lcom/google/protobuf/B;->g:Lcom/google/protobuf/T;

    return-void
.end method

.method static b()Lcom/google/protobuf/B;
    .locals 2

    .line 1
    new-instance v0, Lcom/google/protobuf/B;

    .line 2
    .line 3
    const-string v1, "Protocol message end-group tag did not match expected tag."

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/google/protobuf/B;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method static c()Lcom/google/protobuf/B;
    .locals 2

    .line 1
    new-instance v0, Lcom/google/protobuf/B;

    .line 2
    .line 3
    const-string v1, "Protocol message contained an invalid tag (zero)."

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/google/protobuf/B;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method static d()Lcom/google/protobuf/B;
    .locals 2

    .line 1
    new-instance v0, Lcom/google/protobuf/B;

    .line 2
    .line 3
    const-string v1, "Protocol message had invalid UTF-8."

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/google/protobuf/B;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method static e()Lcom/google/protobuf/B$a;
    .locals 2

    .line 1
    new-instance v0, Lcom/google/protobuf/B$a;

    .line 2
    .line 3
    const-string v1, "Protocol message tag had invalid wire type."

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/google/protobuf/B$a;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method static f()Lcom/google/protobuf/B;
    .locals 2

    .line 1
    new-instance v0, Lcom/google/protobuf/B;

    .line 2
    .line 3
    const-string v1, "CodedInputStream encountered a malformed varint."

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/google/protobuf/B;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method static g()Lcom/google/protobuf/B;
    .locals 2

    .line 1
    new-instance v0, Lcom/google/protobuf/B;

    .line 2
    .line 3
    const-string v1, "CodedInputStream encountered an embedded string or message which claimed to have negative size."

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/google/protobuf/B;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method static h()Lcom/google/protobuf/B;
    .locals 2

    .line 1
    new-instance v0, Lcom/google/protobuf/B;

    .line 2
    .line 3
    const-string v1, "Failed to parse the message."

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/google/protobuf/B;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method static i()Lcom/google/protobuf/B;
    .locals 2

    .line 1
    new-instance v0, Lcom/google/protobuf/B;

    .line 2
    .line 3
    const-string v1, "Protocol message had too many levels of nesting.  May be malicious.  Use CodedInputStream.setRecursionLimit() to increase the depth limit."

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/google/protobuf/B;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method static l()Lcom/google/protobuf/B;
    .locals 2

    .line 1
    new-instance v0, Lcom/google/protobuf/B;

    .line 2
    .line 3
    const-string v1, "Protocol message was too large.  May be malicious.  Use CodedInputStream.setSizeLimit() to increase the size limit."

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/google/protobuf/B;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method static m()Lcom/google/protobuf/B;
    .locals 2

    .line 1
    new-instance v0, Lcom/google/protobuf/B;

    .line 2
    .line 3
    const-string v1, "While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length."

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/google/protobuf/B;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method


# virtual methods
.method a()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/google/protobuf/B;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method j()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/google/protobuf/B;->h:Z

    .line 3
    .line 4
    return-void
.end method

.method public k(Lcom/google/protobuf/T;)Lcom/google/protobuf/B;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/protobuf/B;->g:Lcom/google/protobuf/T;

    .line 2
    .line 3
    return-object p0
.end method
