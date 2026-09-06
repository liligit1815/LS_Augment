.class LI4/b;
.super LJ4/e;
.source "Builders.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "LJ4/e<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final j:Lu4/p;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/p<",
            "LH4/u<",
            "-TT;>;",
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
.method public constructor <init>(Lu4/p;Ll4/g;ILH4/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lu4/p<",
            "-",
            "LH4/u<",
            "-TT;>;-",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;+",
            "Ljava/lang/Object;",
            ">;",
            "Ll4/g;",
            "I",
            "LH4/a;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p2, p3, p4}, LJ4/e;-><init>(Ll4/g;ILH4/a;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LI4/b;->j:Lu4/p;

    .line 5
    .line 6
    return-void
.end method

.method static synthetic j(LI4/b;LH4/u;Ll4/d;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "LI4/b<",
            "TT;>;",
            "LH4/u<",
            "-TT;>;",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, LI4/b;->j:Lu4/p;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lu4/p;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

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


# virtual methods
.method protected e(LH4/u;Ll4/d;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LH4/u<",
            "-TT;>;",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, LI4/b;->j(LI4/b;LH4/u;Ll4/d;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "block["

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, LI4/b;->j:Lu4/p;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, "] -> "

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-super {p0}, LJ4/e;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method
