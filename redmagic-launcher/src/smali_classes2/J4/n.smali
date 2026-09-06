.class public final LJ4/n;
.super Ljava/lang/Object;
.source "FlowCoroutine.kt"


# direct methods
.method public static final a(Lu4/p;Ll4/d;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lu4/p<",
            "-",
            "LF4/I;",
            "-",
            "Ll4/d<",
            "-TR;>;+",
            "Ljava/lang/Object;",
            ">;",
            "Ll4/d<",
            "-TR;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    new-instance v0, LJ4/m;

    .line 2
    .line 3
    invoke-interface {p1}, Ll4/d;->getContext()Ll4/g;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1, p1}, LJ4/m;-><init>(Ll4/g;Ll4/d;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v0, p0}, LL4/b;->b(LK4/z;Ljava/lang/Object;Lu4/p;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-ne p0, v0, :cond_0

    .line 19
    .line 20
    invoke-static {p1}, Lkotlin/coroutines/jvm/internal/h;->c(Ll4/d;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-object p0
.end method
