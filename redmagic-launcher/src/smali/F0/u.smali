.class LF0/u;
.super Ljava/lang/Object;
.source "KeyframesParser.java"


# static fields
.field static a:LG0/c$a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "k"

    .line 2
    .line 3
    filled-new-array {v0}, [Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, LG0/c$a;->a([Ljava/lang/String;)LG0/c$a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, LF0/u;->a:LG0/c$a;

    .line 12
    .line 13
    return-void
.end method

.method static a(LG0/c;Lv0/h;FLF0/N;Z)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "LG0/c;",
            "Lv0/h;",
            "F",
            "LF0/N<",
            "TT;>;Z)",
            "Ljava/util/List<",
            "LI0/a<",
            "TT;>;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, LG0/c;->D()LG0/c$b;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    sget-object v2, LG0/c$b;->l:LG0/c$b;

    .line 11
    .line 12
    if-ne v1, v2, :cond_0

    .line 13
    .line 14
    const-string p0, "Lottie doesn\'t support expressions."

    .line 15
    .line 16
    invoke-virtual {p1, p0}, Lv0/h;->a(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-object v0

    .line 20
    :cond_0
    invoke-virtual {p0}, LG0/c;->d()V

    .line 21
    .line 22
    .line 23
    :goto_0
    invoke-virtual {p0}, LG0/c;->n()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_5

    .line 28
    .line 29
    sget-object v1, LF0/u;->a:LG0/c$a;

    .line 30
    .line 31
    invoke-virtual {p0, v1}, LG0/c;->F(LG0/c$a;)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, LG0/c;->J()V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    invoke-virtual {p0}, LG0/c;->D()LG0/c$b;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    sget-object v2, LG0/c$b;->g:LG0/c$b;

    .line 46
    .line 47
    if-ne v1, v2, :cond_4

    .line 48
    .line 49
    invoke-virtual {p0}, LG0/c;->c()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, LG0/c;->D()LG0/c$b;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    sget-object v2, LG0/c$b;->m:LG0/c$b;

    .line 57
    .line 58
    if-ne v1, v2, :cond_2

    .line 59
    .line 60
    const/4 v7, 0x0

    .line 61
    move-object v3, p0

    .line 62
    move-object v4, p1

    .line 63
    move v5, p2

    .line 64
    move-object v6, p3

    .line 65
    move v8, p4

    .line 66
    invoke-static/range {v3 .. v8}, LF0/t;->c(LG0/c;Lv0/h;FLF0/N;ZZ)LI0/a;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    move-object v1, v3

    .line 71
    move-object v2, v4

    .line 72
    move v3, v5

    .line 73
    move-object v4, v6

    .line 74
    move v6, v8

    .line 75
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    goto :goto_2

    .line 79
    :cond_2
    move-object v1, p0

    .line 80
    move-object v2, p1

    .line 81
    move v3, p2

    .line 82
    move-object v4, p3

    .line 83
    move v6, p4

    .line 84
    :goto_1
    invoke-virtual {v1}, LG0/c;->n()Z

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    if-eqz p0, :cond_3

    .line 89
    .line 90
    const/4 v5, 0x1

    .line 91
    invoke-static/range {v1 .. v6}, LF0/t;->c(LG0/c;Lv0/h;FLF0/N;ZZ)LI0/a;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_3
    :goto_2
    invoke-virtual {v1}, LG0/c;->e()V

    .line 100
    .line 101
    .line 102
    move-object p0, v1

    .line 103
    move-object p1, v2

    .line 104
    move p2, v3

    .line 105
    move-object p3, v4

    .line 106
    move p4, v6

    .line 107
    goto :goto_0

    .line 108
    :cond_4
    move-object v1, p0

    .line 109
    move-object v2, p1

    .line 110
    move v3, p2

    .line 111
    move-object v4, p3

    .line 112
    move v6, p4

    .line 113
    const/4 v5, 0x0

    .line 114
    invoke-static/range {v1 .. v6}, LF0/t;->c(LG0/c;Lv0/h;FLF0/N;ZZ)LI0/a;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    move-object p0, v1

    .line 122
    goto :goto_0

    .line 123
    :cond_5
    move-object v1, p0

    .line 124
    invoke-virtual {v1}, LG0/c;->g()V

    .line 125
    .line 126
    .line 127
    invoke-static {v0}, LF0/u;->b(Ljava/util/List;)V

    .line 128
    .line 129
    .line 130
    return-object v0
.end method

.method public static b(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "+",
            "LI0/a<",
            "TT;>;>;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    :cond_0
    :goto_0
    const/4 v2, 0x1

    .line 7
    add-int/lit8 v3, v0, -0x1

    .line 8
    .line 9
    if-ge v1, v3, :cond_1

    .line 10
    .line 11
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    check-cast v2, LI0/a;

    .line 16
    .line 17
    add-int/lit8 v1, v1, 0x1

    .line 18
    .line 19
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    check-cast v3, LI0/a;

    .line 24
    .line 25
    iget v4, v3, LI0/a;->g:F

    .line 26
    .line 27
    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    iput-object v4, v2, LI0/a;->h:Ljava/lang/Float;

    .line 32
    .line 33
    iget-object v4, v2, LI0/a;->c:Ljava/lang/Object;

    .line 34
    .line 35
    if-nez v4, :cond_0

    .line 36
    .line 37
    iget-object v3, v3, LI0/a;->b:Ljava/lang/Object;

    .line 38
    .line 39
    if-eqz v3, :cond_0

    .line 40
    .line 41
    iput-object v3, v2, LI0/a;->c:Ljava/lang/Object;

    .line 42
    .line 43
    instance-of v3, v2, Ly0/i;

    .line 44
    .line 45
    if-eqz v3, :cond_0

    .line 46
    .line 47
    check-cast v2, Ly0/i;

    .line 48
    .line 49
    invoke-virtual {v2}, Ly0/i;->j()V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, LI0/a;

    .line 58
    .line 59
    iget-object v1, v0, LI0/a;->b:Ljava/lang/Object;

    .line 60
    .line 61
    if-eqz v1, :cond_2

    .line 62
    .line 63
    iget-object v1, v0, LI0/a;->c:Ljava/lang/Object;

    .line 64
    .line 65
    if-nez v1, :cond_3

    .line 66
    .line 67
    :cond_2
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-le v1, v2, :cond_3

    .line 72
    .line 73
    invoke-interface {p0, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    :cond_3
    return-void
.end method
