.class final synthetic LI4/o;
.super Ljava/lang/Object;
.source "Merge.kt"


# static fields
.field private static final a:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    const v1, 0x7fffffff

    .line 3
    .line 4
    .line 5
    const-string v2, "kotlinx.coroutines.flow.defaultConcurrency"

    .line 6
    .line 7
    const/16 v3, 0x10

    .line 8
    .line 9
    invoke-static {v2, v3, v0, v1}, LK4/E;->b(Ljava/lang/String;III)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    sput v0, LI4/o;->a:I

    .line 14
    .line 15
    return-void
.end method

.method public static final a(LI4/d;Lu4/p;)LI4/d;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "LI4/d<",
            "+TT;>;",
            "Lu4/p<",
            "-TT;-",
            "Ll4/d<",
            "-TR;>;+",
            "Ljava/lang/Object;",
            ">;)",
            "LI4/d<",
            "TR;>;"
        }
    .end annotation

    .line 1
    new-instance v0, LI4/o$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p1, v1}, LI4/o$a;-><init>(Lu4/p;Ll4/d;)V

    .line 5
    .line 6
    .line 7
    invoke-static {p0, v0}, LI4/f;->s(LI4/d;Lu4/q;)LI4/d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static final b(LI4/d;Lu4/q;)LI4/d;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "LI4/d<",
            "+TT;>;",
            "Lu4/q<",
            "-",
            "LI4/e<",
            "-TR;>;-TT;-",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;+",
            "Ljava/lang/Object;",
            ">;)",
            "LI4/d<",
            "TR;>;"
        }
    .end annotation

    .line 1
    new-instance v0, LJ4/i;

    .line 2
    .line 3
    const/16 v6, 0x1c

    .line 4
    .line 5
    const/4 v7, 0x0

    .line 6
    const/4 v3, 0x0

    .line 7
    const/4 v4, 0x0

    .line 8
    const/4 v5, 0x0

    .line 9
    move-object v2, p0

    .line 10
    move-object v1, p1

    .line 11
    invoke-direct/range {v0 .. v7}, LJ4/i;-><init>(Lu4/q;LI4/d;Ll4/g;ILH4/a;ILkotlin/jvm/internal/j;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method
