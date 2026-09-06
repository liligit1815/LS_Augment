.class public final LJ4/h;
.super LJ4/g;
.source "ChannelFlow.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "LJ4/g<",
        "TT;TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(LI4/d;Ll4/g;ILH4/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LI4/d<",
            "+TT;>;",
            "Ll4/g;",
            "I",
            "LH4/a;",
            ")V"
        }
    .end annotation

    .line 4
    invoke-direct {p0, p1, p2, p3, p4}, LJ4/g;-><init>(LI4/d;Ll4/g;ILH4/a;)V

    return-void
.end method

.method public synthetic constructor <init>(LI4/d;Ll4/g;ILH4/a;ILkotlin/jvm/internal/j;)V
    .locals 0

    and-int/lit8 p6, p5, 0x2

    if-eqz p6, :cond_0

    .line 1
    sget-object p2, Ll4/h;->g:Ll4/h;

    :cond_0
    and-int/lit8 p6, p5, 0x4

    if-eqz p6, :cond_1

    const/4 p3, -0x3

    :cond_1
    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_2

    .line 2
    sget-object p4, LH4/a;->g:LH4/a;

    .line 3
    :cond_2
    invoke-direct {p0, p1, p2, p3, p4}, LJ4/h;-><init>(LI4/d;Ll4/g;ILH4/a;)V

    return-void
.end method


# virtual methods
.method protected f(Ll4/g;ILH4/a;)LJ4/e;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll4/g;",
            "I",
            "LH4/a;",
            ")",
            "LJ4/e<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, LJ4/h;

    .line 2
    .line 3
    iget-object p0, p0, LJ4/g;->j:LI4/d;

    .line 4
    .line 5
    invoke-direct {v0, p0, p1, p2, p3}, LJ4/h;-><init>(LI4/d;Ll4/g;ILH4/a;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method protected m(LI4/e;Ll4/d;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LI4/e<",
            "-TT;>;",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, LJ4/g;->j:LI4/d;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, LI4/d;->collect(LI4/e;Ll4/d;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    if-ne p0, p1, :cond_0

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 15
    .line 16
    return-object p0
.end method
