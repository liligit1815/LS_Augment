.class final LF4/J0;
.super LF4/z0;
.source "JobSupport.kt"


# instance fields
.field private final k:Ll4/d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll4/d<",
            "Lh4/t;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll4/d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, LF4/z0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LF4/J0;->k:Ll4/d;

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
    iget-object p0, p0, LF4/J0;->k:Ll4/d;

    .line 2
    .line 3
    sget-object p1, Lh4/m;->g:Lh4/m$a;

    .line 4
    .line 5
    sget-object p1, Lh4/t;->a:Lh4/t;

    .line 6
    .line 7
    invoke-static {p1}, Lh4/m;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p0, p1}, Ll4/d;->resumeWith(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
