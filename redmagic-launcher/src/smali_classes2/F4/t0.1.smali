.class final LF4/t0;
.super LF4/z0;
.source "JobSupport.kt"


# instance fields
.field private final k:Lu4/l;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/l<",
            "Ljava/lang/Throwable;",
            "Lh4/t;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lu4/l;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lu4/l<",
            "-",
            "Ljava/lang/Throwable;",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, LF4/z0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LF4/t0;->k:Lu4/l;

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
    iget-object p0, p0, LF4/t0;->k:Lu4/l;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method
