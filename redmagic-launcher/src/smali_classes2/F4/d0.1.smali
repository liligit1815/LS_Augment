.class final LF4/d0;
.super LF4/z0;
.source "Job.kt"


# instance fields
.field private final k:LF4/b0;


# direct methods
.method public constructor <init>(LF4/b0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LF4/z0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LF4/d0;->k:LF4/b0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public t()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public u(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, LF4/d0;->k:LF4/b0;

    .line 2
    .line 3
    invoke-interface {p0}, LF4/b0;->dispose()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
