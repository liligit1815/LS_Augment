.class final LI4/a;
.super LI4/b;
.source "Builders.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "LI4/b<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final k:Lu4/p;
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

    .line 4
    invoke-direct {p0, p1, p2, p3, p4}, LI4/b;-><init>(Lu4/p;Ll4/g;ILH4/a;)V

    .line 5
    iput-object p1, p0, LI4/a;->k:Lu4/p;

    return-void
.end method

.method public synthetic constructor <init>(Lu4/p;Ll4/g;ILH4/a;ILkotlin/jvm/internal/j;)V
    .locals 0

    and-int/lit8 p6, p5, 0x2

    if-eqz p6, :cond_0

    .line 1
    sget-object p2, Ll4/h;->g:Ll4/h;

    :cond_0
    and-int/lit8 p6, p5, 0x4

    if-eqz p6, :cond_1

    const/4 p3, -0x2

    :cond_1
    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_2

    .line 2
    sget-object p4, LH4/a;->g:LH4/a;

    .line 3
    :cond_2
    invoke-direct {p0, p1, p2, p3, p4}, LI4/a;-><init>(Lu4/p;Ll4/g;ILH4/a;)V

    return-void
.end method


# virtual methods
.method protected e(LH4/u;Ll4/d;)Ljava/lang/Object;
    .locals 4
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
    instance-of v0, p2, LI4/a$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, LI4/a$a;

    .line 7
    .line 8
    iget v1, v0, LI4/a$a;->j:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, LI4/a$a;->j:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, LI4/a$a;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, LI4/a$a;-><init>(LI4/a;Ll4/d;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p2, v0, LI4/a$a;->h:Ljava/lang/Object;

    .line 26
    .line 27
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget v2, v0, LI4/a$a;->j:I

    .line 32
    .line 33
    const/4 v3, 0x1

    .line 34
    if-eqz v2, :cond_2

    .line 35
    .line 36
    if-ne v2, v3, :cond_1

    .line 37
    .line 38
    iget-object p0, v0, LI4/a$a;->g:Ljava/lang/Object;

    .line 39
    .line 40
    move-object p1, p0

    .line 41
    check-cast p1, LH4/u;

    .line 42
    .line 43
    invoke-static {p2}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 48
    .line 49
    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    .line 50
    .line 51
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    throw p0

    .line 55
    :cond_2
    invoke-static {p2}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    iput-object p1, v0, LI4/a$a;->g:Ljava/lang/Object;

    .line 59
    .line 60
    iput v3, v0, LI4/a$a;->j:I

    .line 61
    .line 62
    invoke-super {p0, p1, v0}, LI4/b;->e(LH4/u;Ll4/d;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    if-ne p0, v1, :cond_3

    .line 67
    .line 68
    return-object v1

    .line 69
    :cond_3
    :goto_1
    invoke-interface {p1}, LH4/x;->q()Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-eqz p0, :cond_4

    .line 74
    .line 75
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 76
    .line 77
    return-object p0

    .line 78
    :cond_4
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 79
    .line 80
    const-string p1, "\'awaitClose { yourCallbackOrListener.cancel() }\' should be used in the end of callbackFlow block.\nOtherwise, a callback/listener may leak in case of external cancellation.\nSee callbackFlow API documentation for the details."

    .line 81
    .line 82
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    throw p0
.end method

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
    new-instance v0, LI4/a;

    .line 2
    .line 3
    iget-object p0, p0, LI4/a;->k:Lu4/p;

    .line 4
    .line 5
    invoke-direct {v0, p0, p1, p2, p3}, LI4/a;-><init>(Lu4/p;Ll4/g;ILH4/a;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method
