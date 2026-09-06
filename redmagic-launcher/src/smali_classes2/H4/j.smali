.class public final LH4/j;
.super Ljava/lang/Object;
.source "Channel.kt"


# direct methods
.method public static final a(ILH4/a;Lu4/l;)LH4/g;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(I",
            "LH4/a;",
            "Lu4/l<",
            "-TE;",
            "Lh4/t;",
            ">;)",
            "LH4/g<",
            "TE;>;"
        }
    .end annotation

    .line 1
    const/4 v0, -0x2

    .line 2
    const/4 v1, 0x1

    .line 3
    if-eq p0, v0, :cond_6

    .line 4
    .line 5
    const/4 v0, -0x1

    .line 6
    if-eq p0, v0, :cond_4

    .line 7
    .line 8
    if-eqz p0, :cond_2

    .line 9
    .line 10
    const v0, 0x7fffffff

    .line 11
    .line 12
    .line 13
    if-eq p0, v0, :cond_1

    .line 14
    .line 15
    sget-object v0, LH4/a;->g:LH4/a;

    .line 16
    .line 17
    if-ne p1, v0, :cond_0

    .line 18
    .line 19
    new-instance p1, LH4/e;

    .line 20
    .line 21
    invoke-direct {p1, p0, p2}, LH4/e;-><init>(ILu4/l;)V

    .line 22
    .line 23
    .line 24
    return-object p1

    .line 25
    :cond_0
    new-instance v0, LH4/r;

    .line 26
    .line 27
    invoke-direct {v0, p0, p1, p2}, LH4/r;-><init>(ILH4/a;Lu4/l;)V

    .line 28
    .line 29
    .line 30
    return-object v0

    .line 31
    :cond_1
    new-instance p0, LH4/e;

    .line 32
    .line 33
    invoke-direct {p0, v0, p2}, LH4/e;-><init>(ILu4/l;)V

    .line 34
    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_2
    sget-object p0, LH4/a;->g:LH4/a;

    .line 38
    .line 39
    if-ne p1, p0, :cond_3

    .line 40
    .line 41
    new-instance p0, LH4/e;

    .line 42
    .line 43
    const/4 p1, 0x0

    .line 44
    invoke-direct {p0, p1, p2}, LH4/e;-><init>(ILu4/l;)V

    .line 45
    .line 46
    .line 47
    return-object p0

    .line 48
    :cond_3
    new-instance p0, LH4/r;

    .line 49
    .line 50
    invoke-direct {p0, v1, p1, p2}, LH4/r;-><init>(ILH4/a;Lu4/l;)V

    .line 51
    .line 52
    .line 53
    return-object p0

    .line 54
    :cond_4
    sget-object p0, LH4/a;->g:LH4/a;

    .line 55
    .line 56
    if-ne p1, p0, :cond_5

    .line 57
    .line 58
    new-instance p0, LH4/r;

    .line 59
    .line 60
    sget-object p1, LH4/a;->h:LH4/a;

    .line 61
    .line 62
    invoke-direct {p0, v1, p1, p2}, LH4/r;-><init>(ILH4/a;Lu4/l;)V

    .line 63
    .line 64
    .line 65
    return-object p0

    .line 66
    :cond_5
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 67
    .line 68
    const-string p1, "CONFLATED capacity cannot be used with non-default onBufferOverflow"

    .line 69
    .line 70
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    throw p0

    .line 74
    :cond_6
    sget-object p0, LH4/a;->g:LH4/a;

    .line 75
    .line 76
    if-ne p1, p0, :cond_7

    .line 77
    .line 78
    new-instance p0, LH4/e;

    .line 79
    .line 80
    sget-object p1, LH4/g;->c:LH4/g$a;

    .line 81
    .line 82
    invoke-virtual {p1}, LH4/g$a;->a()I

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    invoke-direct {p0, p1, p2}, LH4/e;-><init>(ILu4/l;)V

    .line 87
    .line 88
    .line 89
    return-object p0

    .line 90
    :cond_7
    new-instance p0, LH4/r;

    .line 91
    .line 92
    invoke-direct {p0, v1, p1, p2}, LH4/r;-><init>(ILH4/a;Lu4/l;)V

    .line 93
    .line 94
    .line 95
    return-object p0
.end method

.method public static synthetic b(ILH4/a;Lu4/l;ILjava/lang/Object;)LH4/g;
    .locals 0

    .line 1
    and-int/lit8 p4, p3, 0x1

    .line 2
    .line 3
    if-eqz p4, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    :cond_0
    and-int/lit8 p4, p3, 0x2

    .line 7
    .line 8
    if-eqz p4, :cond_1

    .line 9
    .line 10
    sget-object p1, LH4/a;->g:LH4/a;

    .line 11
    .line 12
    :cond_1
    and-int/lit8 p3, p3, 0x4

    .line 13
    .line 14
    if-eqz p3, :cond_2

    .line 15
    .line 16
    const/4 p2, 0x0

    .line 17
    :cond_2
    invoke-static {p0, p1, p2}, LH4/j;->a(ILH4/a;Lu4/l;)LH4/g;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method
