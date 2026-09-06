.class public final LJ4/k;
.super Ljava/lang/Object;
.source "Combine.kt"


# direct methods
.method public static final a(LI4/e;[LI4/d;Lu4/a;Lu4/q;Ll4/d;)Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            "T:",
            "Ljava/lang/Object;",
            ">(",
            "LI4/e<",
            "-TR;>;[",
            "LI4/d<",
            "+TT;>;",
            "Lu4/a<",
            "[TT;>;",
            "Lu4/q<",
            "-",
            "LI4/e<",
            "-TR;>;-[TT;-",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;+",
            "Ljava/lang/Object;",
            ">;",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    new-instance v0, LJ4/k$a;

    .line 2
    .line 3
    const/4 v5, 0x0

    .line 4
    move-object v4, p0

    .line 5
    move-object v1, p1

    .line 6
    move-object v2, p2

    .line 7
    move-object v3, p3

    .line 8
    invoke-direct/range {v0 .. v5}, LJ4/k$a;-><init>([LI4/d;Lu4/a;Lu4/q;LI4/e;Ll4/d;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0, p4}, LJ4/n;->a(Lu4/p;Ll4/d;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    if-ne p0, p1, :cond_0

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 23
    .line 24
    return-object p0
.end method
