.class final LF4/p;
.super LF4/z0;
.source "CancellableContinuationImpl.kt"


# instance fields
.field public final k:LF4/l;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LF4/l<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(LF4/l;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LF4/l<",
            "*>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, LF4/z0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LF4/p;->k:LF4/l;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
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
    iget-object p1, p0, LF4/p;->k:LF4/l;

    .line 2
    .line 3
    invoke-virtual {p0}, LF4/z0;->s()LF4/A0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1, p0}, LF4/l;->v(LF4/u0;)Ljava/lang/Throwable;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p1, p0}, LF4/l;->K(Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
