.class final LF4/r;
.super LF4/z0;
.source "JobSupport.kt"

# interfaces
.implements LF4/q;


# instance fields
.field public final k:LF4/s;


# direct methods
.method public constructor <init>(LF4/s;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LF4/z0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LF4/r;->k:LF4/s;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Throwable;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, LF4/z0;->s()LF4/A0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, LF4/A0;->K(Ljava/lang/Throwable;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getParent()LF4/u0;
    .locals 0

    .line 1
    invoke-virtual {p0}, LF4/z0;->s()LF4/A0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public t()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public u(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p1, p0, LF4/r;->k:LF4/s;

    .line 2
    .line 3
    invoke-virtual {p0}, LF4/z0;->s()LF4/A0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p1, p0}, LF4/s;->t(LF4/I0;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
