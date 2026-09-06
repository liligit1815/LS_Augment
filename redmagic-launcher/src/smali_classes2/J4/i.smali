.class public final LJ4/i;
.super LJ4/g;
.source "Merge.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "LJ4/g<",
        "TT;TR;>;"
    }
.end annotation


# instance fields
.field private final k:Lu4/q;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/q<",
            "LI4/e<",
            "-TR;>;TT;",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lu4/q;LI4/d;Ll4/g;ILH4/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lu4/q<",
            "-",
            "LI4/e<",
            "-TR;>;-TT;-",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;+",
            "Ljava/lang/Object;",
            ">;",
            "LI4/d<",
            "+TT;>;",
            "Ll4/g;",
            "I",
            "LH4/a;",
            ")V"
        }
    .end annotation

    .line 4
    invoke-direct {p0, p2, p3, p4, p5}, LJ4/g;-><init>(LI4/d;Ll4/g;ILH4/a;)V

    .line 5
    iput-object p1, p0, LJ4/i;->k:Lu4/q;

    return-void
.end method

.method public synthetic constructor <init>(Lu4/q;LI4/d;Ll4/g;ILH4/a;ILkotlin/jvm/internal/j;)V
    .locals 6

    and-int/lit8 p7, p6, 0x4

    if-eqz p7, :cond_0

    .line 1
    sget-object p3, Ll4/h;->g:Ll4/h;

    :cond_0
    move-object v3, p3

    and-int/lit8 p3, p6, 0x8

    if-eqz p3, :cond_1

    const/4 p4, -0x2

    :cond_1
    move v4, p4

    and-int/lit8 p3, p6, 0x10

    if-eqz p3, :cond_2

    .line 2
    sget-object p5, LH4/a;->g:LH4/a;

    :cond_2
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v5, p5

    .line 3
    invoke-direct/range {v0 .. v5}, LJ4/i;-><init>(Lu4/q;LI4/d;Ll4/g;ILH4/a;)V

    return-void
.end method

.method public static final synthetic n(LJ4/i;)Lu4/q;
    .locals 0

    .line 1
    iget-object p0, p0, LJ4/i;->k:Lu4/q;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method protected f(Ll4/g;ILH4/a;)LJ4/e;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll4/g;",
            "I",
            "LH4/a;",
            ")",
            "LJ4/e<",
            "TR;>;"
        }
    .end annotation

    .line 1
    new-instance v0, LJ4/i;

    .line 2
    .line 3
    iget-object v1, p0, LJ4/i;->k:Lu4/q;

    .line 4
    .line 5
    iget-object v2, p0, LJ4/g;->j:LI4/d;

    .line 6
    .line 7
    move-object v3, p1

    .line 8
    move v4, p2

    .line 9
    move-object v5, p3

    .line 10
    invoke-direct/range {v0 .. v5}, LJ4/i;-><init>(Lu4/q;LI4/d;Ll4/g;ILH4/a;)V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method protected m(LI4/e;Ll4/d;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LI4/e<",
            "-TR;>;",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    new-instance v0, LJ4/i$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, p1, v1}, LJ4/i$a;-><init>(LJ4/i;LI4/e;Ll4/d;)V

    .line 5
    .line 6
    .line 7
    invoke-static {v0, p2}, LF4/J;->e(Lu4/p;Ll4/d;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    if-ne p0, p1, :cond_0

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 19
    .line 20
    return-object p0
.end method
