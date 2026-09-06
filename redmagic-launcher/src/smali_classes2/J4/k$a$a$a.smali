.class final LJ4/k$a$a$a;
.super Ljava/lang/Object;
.source "Combine.kt"

# interfaces
.implements LI4/e;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LJ4/k$a$a;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "LI4/e;"
    }
.end annotation


# instance fields
.field final synthetic g:LH4/g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LH4/g<",
            "Li4/B<",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field final synthetic h:I


# direct methods
.method constructor <init>(LH4/g;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LH4/g<",
            "Li4/B<",
            "Ljava/lang/Object;",
            ">;>;I)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, LJ4/k$a$a$a;->g:LH4/g;

    .line 2
    .line 3
    iput p2, p0, LJ4/k$a$a$a;->h:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final emit(Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    instance-of v0, p2, LJ4/k$a$a$a$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, LJ4/k$a$a$a$a;

    .line 7
    .line 8
    iget v1, v0, LJ4/k$a$a$a$a;->i:I

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
    iput v1, v0, LJ4/k$a$a$a$a;->i:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, LJ4/k$a$a$a$a;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, LJ4/k$a$a$a$a;-><init>(LJ4/k$a$a$a;Ll4/d;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p2, v0, LJ4/k$a$a$a$a;->g:Ljava/lang/Object;

    .line 26
    .line 27
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget v2, v0, LJ4/k$a$a$a$a;->i:I

    .line 32
    .line 33
    const/4 v3, 0x2

    .line 34
    const/4 v4, 0x1

    .line 35
    if-eqz v2, :cond_3

    .line 36
    .line 37
    if-eq v2, v4, :cond_2

    .line 38
    .line 39
    if-ne v2, v3, :cond_1

    .line 40
    .line 41
    invoke-static {p2}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    goto :goto_3

    .line 45
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 46
    .line 47
    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    .line 48
    .line 49
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    throw p0

    .line 53
    :cond_2
    invoke-static {p2}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_3
    invoke-static {p2}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    iget-object p2, p0, LJ4/k$a$a$a;->g:LH4/g;

    .line 61
    .line 62
    new-instance v2, Li4/B;

    .line 63
    .line 64
    iget p0, p0, LJ4/k$a$a$a;->h:I

    .line 65
    .line 66
    invoke-direct {v2, p0, p1}, Li4/B;-><init>(ILjava/lang/Object;)V

    .line 67
    .line 68
    .line 69
    iput v4, v0, LJ4/k$a$a$a$a;->i:I

    .line 70
    .line 71
    invoke-interface {p2, v2, v0}, LH4/x;->p(Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    if-ne p0, v1, :cond_4

    .line 76
    .line 77
    goto :goto_2

    .line 78
    :cond_4
    :goto_1
    iput v3, v0, LJ4/k$a$a$a$a;->i:I

    .line 79
    .line 80
    invoke-static {v0}, LF4/a1;->a(Ll4/d;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    if-ne p0, v1, :cond_5

    .line 85
    .line 86
    :goto_2
    return-object v1

    .line 87
    :cond_5
    :goto_3
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 88
    .line 89
    return-object p0
.end method
