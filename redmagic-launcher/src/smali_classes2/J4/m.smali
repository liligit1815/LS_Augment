.class final LJ4/m;
.super LK4/z;
.source "FlowCoroutine.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "LK4/z<",
        "TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll4/g;Ll4/d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll4/g;",
            "Ll4/d<",
            "-TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, LK4/z;-><init>(Ll4/g;Ll4/d;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public K(Ljava/lang/Throwable;)Z
    .locals 1

    .line 1
    instance-of v0, p1, LJ4/j;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p0, p1}, LF4/A0;->z(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method
