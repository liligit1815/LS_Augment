.class final LH4/t;
.super LH4/h;
.source "Produce.kt"

# interfaces
.implements LH4/u;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "LH4/h<",
        "TE;>;",
        "LH4/u<",
        "TE;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll4/g;LH4/g;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll4/g;",
            "LH4/g<",
            "TE;>;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, p1, p2, v0, v0}, LH4/h;-><init>(Ll4/g;LH4/g;ZZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method protected M0(Ljava/lang/Throwable;Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, LH4/h;->P0()LH4/g;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p1}, LH4/x;->close(Ljava/lang/Throwable;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    if-nez p2, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, LF4/a;->getContext()Ll4/g;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0, p1}, LF4/G;->a(Ll4/g;Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public bridge synthetic N0(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lh4/t;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LH4/t;->Q0(Lh4/t;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected Q0(Lh4/t;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, LH4/h;->P0()LH4/g;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    const/4 v0, 0x1

    .line 7
    invoke-static {p0, p1, v0, p1}, LH4/x$a;->a(LH4/x;Ljava/lang/Throwable;ILjava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public isActive()Z
    .locals 0

    .line 1
    invoke-super {p0}, LF4/a;->isActive()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method
