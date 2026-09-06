.class LO4/H$a;
.super LO4/H;
.source "ResponseBody.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LO4/H;->create(LO4/z;JLokio/g;)LO4/H;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:LO4/z;

.field final synthetic h:J

.field final synthetic i:Lokio/g;


# direct methods
.method constructor <init>(LO4/z;JLokio/g;)V
    .locals 0

    .line 1
    iput-object p1, p0, LO4/H$a;->g:LO4/z;

    .line 2
    .line 3
    iput-wide p2, p0, LO4/H$a;->h:J

    .line 4
    .line 5
    iput-object p4, p0, LO4/H$a;->i:Lokio/g;

    .line 6
    .line 7
    invoke-direct {p0}, LO4/H;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public contentLength()J
    .locals 2

    .line 1
    iget-wide v0, p0, LO4/H$a;->h:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public contentType()LO4/z;
    .locals 0
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, LO4/H$a;->g:LO4/z;

    .line 2
    .line 3
    return-object p0
.end method

.method public source()Lokio/g;
    .locals 0

    .line 1
    iget-object p0, p0, LO4/H$a;->i:Lokio/g;

    .line 2
    .line 3
    return-object p0
.end method
