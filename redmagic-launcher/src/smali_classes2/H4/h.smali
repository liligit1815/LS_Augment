.class public LH4/h;
.super LF4/a;
.source "ChannelCoroutine.kt"

# interfaces
.implements LH4/g;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "LF4/a<",
        "Lh4/t;",
        ">;",
        "LH4/g<",
        "TE;>;"
    }
.end annotation


# instance fields
.field private final j:LH4/g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LH4/g<",
            "TE;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll4/g;LH4/g;ZZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll4/g;",
            "LH4/g<",
            "TE;>;ZZ)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p3, p4}, LF4/a;-><init>(Ll4/g;ZZ)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, LH4/h;->j:LH4/g;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public B(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    invoke-static {p0, p1, v0, v1, v0}, LF4/A0;->E0(LF4/A0;Ljava/lang/Throwable;Ljava/lang/String;ILjava/lang/Object;)Ljava/util/concurrent/CancellationException;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, LH4/h;->j:LH4/g;

    .line 8
    .line 9
    invoke-interface {v0, p1}, LH4/w;->c(Ljava/util/concurrent/CancellationException;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, LF4/A0;->y(Ljava/lang/Throwable;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method protected final P0()LH4/g;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "LH4/g<",
            "TE;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, LH4/h;->j:LH4/g;

    .line 2
    .line 3
    return-object p0
.end method

.method public a(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, LH4/h;->j:LH4/g;

    .line 2
    .line 3
    invoke-interface {p0, p1}, LH4/x;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final c(Ljava/util/concurrent/CancellationException;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, LF4/A0;->k0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    if-nez p1, :cond_1

    .line 9
    .line 10
    new-instance p1, LF4/v0;

    .line 11
    .line 12
    invoke-static {p0}, LF4/A0;->s(LF4/A0;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-direct {p1, v0, v1, p0}, LF4/v0;-><init>(Ljava/lang/String;Ljava/lang/Throwable;LF4/u0;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    invoke-virtual {p0, p1}, LH4/h;->B(Ljava/lang/Throwable;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public close(Ljava/lang/Throwable;)Z
    .locals 0

    .line 1
    iget-object p0, p0, LH4/h;->j:LH4/g;

    .line 2
    .line 3
    invoke-interface {p0, p1}, LH4/x;->close(Ljava/lang/Throwable;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public iterator()LH4/i;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "LH4/i<",
            "TE;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, LH4/h;->j:LH4/g;

    .line 2
    .line 3
    invoke-interface {p0}, LH4/w;->iterator()LH4/i;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public k()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, LH4/h;->j:LH4/g;

    .line 2
    .line 3
    invoke-interface {p0}, LH4/w;->k()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public l(Ll4/d;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll4/d<",
            "-",
            "LH4/k<",
            "+TE;>;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, LH4/h;->j:LH4/g;

    .line 2
    .line 3
    invoke-interface {p0, p1}, LH4/w;->l(Ll4/d;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    return-object p0
.end method

.method public m(Lu4/l;)V
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
    iget-object p0, p0, LH4/h;->j:LH4/g;

    .line 2
    .line 3
    invoke-interface {p0, p1}, LH4/x;->m(Lu4/l;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p(Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, LH4/h;->j:LH4/g;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, LH4/x;->p(Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public q()Z
    .locals 0

    .line 1
    iget-object p0, p0, LH4/h;->j:LH4/g;

    .line 2
    .line 3
    invoke-interface {p0}, LH4/x;->q()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
