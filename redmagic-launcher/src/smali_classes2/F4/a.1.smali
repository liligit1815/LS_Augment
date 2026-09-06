.class public abstract LF4/a;
.super LF4/A0;
.source "AbstractCoroutine.kt"

# interfaces
.implements LF4/u0;
.implements Ll4/d;
.implements LF4/I;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "LF4/A0;",
        "LF4/u0;",
        "Ll4/d<",
        "TT;>;",
        "LF4/I;"
    }
.end annotation


# instance fields
.field private final i:Ll4/g;


# direct methods
.method public constructor <init>(Ll4/g;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0, p3}, LF4/A0;-><init>(Z)V

    .line 2
    .line 3
    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    sget-object p2, LF4/u0;->b:LF4/u0$b;

    .line 7
    .line 8
    invoke-interface {p1, p2}, Ll4/g;->b(Ll4/g$c;)Ll4/g$b;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    check-cast p2, LF4/u0;

    .line 13
    .line 14
    invoke-virtual {p0, p2}, LF4/A0;->h0(LF4/u0;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-interface {p1, p0}, Ll4/g;->J(Ll4/g;)Ll4/g;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, LF4/a;->i:Ll4/g;

    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method protected H()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, LF4/M;->a(Ljava/lang/Object;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p0, " was cancelled"

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method protected L0(Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, LF4/A0;->x(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method protected M0(Ljava/lang/Throwable;Z)V
    .locals 0

    .line 1
    return-void
.end method

.method protected N0(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public final O0(LF4/K;Ljava/lang/Object;Lu4/p;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "LF4/K;",
            "TR;",
            "Lu4/p<",
            "-TR;-",
            "Ll4/d<",
            "-TT;>;+",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1, p3, p2, p0}, LF4/K;->c(Lu4/p;Ljava/lang/Object;Ll4/d;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final g0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, LF4/a;->i:Ll4/g;

    .line 2
    .line 3
    invoke-static {p0, p1}, LF4/G;->a(Ll4/g;Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final getContext()Ll4/g;
    .locals 0

    .line 1
    iget-object p0, p0, LF4/a;->i:Ll4/g;

    .line 2
    .line 3
    return-object p0
.end method

.method public isActive()Z
    .locals 0

    .line 1
    invoke-super {p0}, LF4/A0;->isActive()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public o()Ll4/g;
    .locals 0

    .line 1
    iget-object p0, p0, LF4/a;->i:Ll4/g;

    .line 2
    .line 3
    return-object p0
.end method

.method public q0()Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, LF4/a;->i:Ll4/g;

    .line 2
    .line 3
    invoke-static {v0}, LF4/C;->g(Ll4/g;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-super {p0}, LF4/A0;->q0()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    const/16 v2, 0x22

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v0, "\":"

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-super {p0}, LF4/A0;->q0()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method public final resumeWith(Ljava/lang/Object;)V
    .locals 1

    .line 1
    invoke-static {p1}, LF4/x;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, LF4/A0;->p0(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    sget-object v0, LF4/B0;->b:LK4/D;

    .line 10
    .line 11
    if-ne p1, v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p0, p1}, LF4/a;->L0(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method protected final v0(Ljava/lang/Object;)V
    .locals 1

    .line 1
    instance-of v0, p1, LF4/v;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, LF4/v;

    .line 6
    .line 7
    iget-object v0, p1, LF4/v;->a:Ljava/lang/Throwable;

    .line 8
    .line 9
    invoke-virtual {p1}, LF4/v;->a()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-virtual {p0, v0, p1}, LF4/a;->M0(Ljava/lang/Throwable;Z)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p0, p1}, LF4/a;->N0(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
