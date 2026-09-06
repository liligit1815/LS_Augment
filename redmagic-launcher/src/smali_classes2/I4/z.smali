.class public final LI4/z;
.super Ljava/lang/Object;
.source "Share.kt"

# interfaces
.implements LI4/e;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "LI4/e<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final g:LI4/e;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LI4/e<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final h:Lu4/p;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/p<",
            "LI4/e<",
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


# virtual methods
.method public final b(Ll4/d;)Ljava/lang/Object;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    instance-of v0, p1, LI4/z$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, LI4/z$a;

    .line 7
    .line 8
    iget v1, v0, LI4/z$a;->k:I

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
    iput v1, v0, LI4/z$a;->k:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, LI4/z$a;

    .line 21
    .line 22
    invoke-direct {v0, p0, p1}, LI4/z$a;-><init>(LI4/z;Ll4/d;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p1, v0, LI4/z$a;->i:Ljava/lang/Object;

    .line 26
    .line 27
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget v2, v0, LI4/z$a;->k:I

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
    invoke-static {p1}, Lh4/n;->b(Ljava/lang/Object;)V

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
    iget-object p0, v0, LI4/z$a;->h:Ljava/lang/Object;

    .line 54
    .line 55
    check-cast p0, LJ4/u;

    .line 56
    .line 57
    iget-object v2, v0, LI4/z$a;->g:Ljava/lang/Object;

    .line 58
    .line 59
    check-cast v2, LI4/z;

    .line 60
    .line 61
    :try_start_0
    invoke-static {p1}, Lh4/n;->b(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 62
    .line 63
    .line 64
    goto :goto_1

    .line 65
    :catchall_0
    move-exception p1

    .line 66
    goto :goto_4

    .line 67
    :cond_3
    invoke-static {p1}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    new-instance p1, LJ4/u;

    .line 71
    .line 72
    iget-object v2, p0, LI4/z;->g:LI4/e;

    .line 73
    .line 74
    invoke-interface {v0}, Ll4/d;->getContext()Ll4/g;

    .line 75
    .line 76
    .line 77
    move-result-object v5

    .line 78
    invoke-direct {p1, v2, v5}, LJ4/u;-><init>(LI4/e;Ll4/g;)V

    .line 79
    .line 80
    .line 81
    :try_start_1
    iget-object v2, p0, LI4/z;->h:Lu4/p;

    .line 82
    .line 83
    iput-object p0, v0, LI4/z$a;->g:Ljava/lang/Object;

    .line 84
    .line 85
    iput-object p1, v0, LI4/z$a;->h:Ljava/lang/Object;

    .line 86
    .line 87
    iput v4, v0, LI4/z$a;->k:I

    .line 88
    .line 89
    invoke-interface {v2, p1, v0}, Lu4/p;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 93
    if-ne v2, v1, :cond_4

    .line 94
    .line 95
    goto :goto_2

    .line 96
    :cond_4
    move-object v2, p0

    .line 97
    move-object p0, p1

    .line 98
    :goto_1
    invoke-virtual {p0}, LJ4/u;->releaseIntercepted()V

    .line 99
    .line 100
    .line 101
    iget-object p0, v2, LI4/z;->g:LI4/e;

    .line 102
    .line 103
    instance-of p1, p0, LI4/z;

    .line 104
    .line 105
    if-eqz p1, :cond_6

    .line 106
    .line 107
    check-cast p0, LI4/z;

    .line 108
    .line 109
    const/4 p1, 0x0

    .line 110
    iput-object p1, v0, LI4/z$a;->g:Ljava/lang/Object;

    .line 111
    .line 112
    iput-object p1, v0, LI4/z$a;->h:Ljava/lang/Object;

    .line 113
    .line 114
    iput v3, v0, LI4/z$a;->k:I

    .line 115
    .line 116
    invoke-virtual {p0, v0}, LI4/z;->b(Ll4/d;)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    if-ne p0, v1, :cond_5

    .line 121
    .line 122
    :goto_2
    return-object v1

    .line 123
    :cond_5
    :goto_3
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 124
    .line 125
    return-object p0

    .line 126
    :cond_6
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 127
    .line 128
    return-object p0

    .line 129
    :catchall_1
    move-exception p0

    .line 130
    move-object v6, p1

    .line 131
    move-object p1, p0

    .line 132
    move-object p0, v6

    .line 133
    :goto_4
    invoke-virtual {p0}, LJ4/u;->releaseIntercepted()V

    .line 134
    .line 135
    .line 136
    throw p1
.end method

.method public emit(Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;
    .locals 0
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
    iget-object p0, p0, LI4/z;->g:LI4/e;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, LI4/e;->emit(Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
