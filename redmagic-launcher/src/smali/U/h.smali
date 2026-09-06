.class public final LU/h;
.super Ljava/lang/Object;
.source "FeatureDetector.kt"


# direct methods
.method public static final a(LU/c;LU/c;)Z
    .locals 1

    .line 1
    const-string v0, "<this>"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "next"

    .line 7
    .line 8
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p0}, LU/h;->f(LU/c;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-static {p1}, LU/h;->f(LU/c;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-static {p0, p1}, LU/h;->e(LU/c;LU/c;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_2

    .line 28
    .line 29
    :cond_0
    invoke-virtual {p0}, LU/c;->o()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-nez p0, :cond_2

    .line 34
    .line 35
    invoke-virtual {p1}, LU/c;->o()Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    const/4 p0, 0x0

    .line 43
    return p0

    .line 44
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 45
    return p0
.end method

.method public static final b(LU/c;LU/c;)LU/g;
    .locals 2

    .line 1
    const-string v0, "<this>"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "next"

    .line 7
    .line 8
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p0}, LU/h;->f(LU/c;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    new-instance p1, LU/g$b;

    .line 18
    .line 19
    invoke-static {p0}, Li4/m;->d(Ljava/lang/Object;)Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-direct {p1, p0}, LU/g$b;-><init>(Ljava/util/List;)V

    .line 24
    .line 25
    .line 26
    return-object p1

    .line 27
    :cond_0
    new-instance v0, LU/g$a;

    .line 28
    .line 29
    invoke-static {p0}, Li4/m;->d(Ljava/lang/Object;)Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {p0, p1}, LU/c;->a(LU/c;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    invoke-direct {v0, v1, p0}, LU/g$a;-><init>(Ljava/util/List;Z)V

    .line 38
    .line 39
    .line 40
    return-object v0
.end method

.method public static final c(Ljava/util/List;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "LU/c;",
            ">;)",
            "Ljava/util/List<",
            "LU/g;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "cubics"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-static {}, Li4/m;->k()Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_0
    invoke-static {}, Li4/m;->c()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {p0}, Li4/m;->a0(Ljava/util/List;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, LU/c;

    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/Collection;->size()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    const/4 v3, 0x0

    .line 32
    :goto_0
    if-ge v3, v2, :cond_3

    .line 33
    .line 34
    add-int/lit8 v4, v3, 0x1

    .line 35
    .line 36
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 37
    .line 38
    .line 39
    move-result v5

    .line 40
    rem-int v5, v4, v5

    .line 41
    .line 42
    invoke-interface {p0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    check-cast v5, LU/c;

    .line 47
    .line 48
    invoke-static {p0}, Li4/m;->l(Ljava/util/List;)I

    .line 49
    .line 50
    .line 51
    move-result v6

    .line 52
    if-ge v3, v6, :cond_1

    .line 53
    .line 54
    invoke-static {v1, v5}, LU/h;->a(LU/c;LU/c;)Z

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    if-eqz v3, :cond_1

    .line 59
    .line 60
    sget-object v3, LU/c;->b:LU/c$a;

    .line 61
    .line 62
    invoke-static {v3, v1, v5}, LU/h;->d(LU/c$a;LU/c;LU/c;)LU/c;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    goto :goto_1

    .line 67
    :cond_1
    invoke-static {v1, v5}, LU/h;->b(LU/c;LU/c;)LU/g;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    invoke-static {v1, v5}, LU/h;->e(LU/c;LU/c;)Z

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    if-nez v3, :cond_2

    .line 79
    .line 80
    sget-object v3, LU/c;->b:LU/c$a;

    .line 81
    .line 82
    invoke-virtual {v1}, LU/c;->d()F

    .line 83
    .line 84
    .line 85
    move-result v6

    .line 86
    invoke-virtual {v1}, LU/c;->e()F

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    invoke-virtual {v3, v6, v1}, LU/c$a;->b(FF)LU/c;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-static {v1, v5}, LU/h;->b(LU/c;LU/c;)LU/g;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    :cond_2
    move-object v1, v5

    .line 102
    :goto_1
    move v3, v4

    .line 103
    goto :goto_0

    .line 104
    :cond_3
    invoke-static {v0}, Li4/m;->a(Ljava/util/List;)Ljava/util/List;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    return-object p0
.end method

.method private static final d(LU/c$a;LU/c;LU/c;)LU/c;
    .locals 8

    .line 1
    invoke-virtual {p1}, LU/c;->o()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, LU/c;->b()F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p1}, LU/c;->c()F

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {p2}, LU/c;->f()F

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    invoke-virtual {p2}, LU/c;->g()F

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    invoke-virtual {p2}, LU/c;->h()F

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    invoke-virtual {p2}, LU/c;->i()F

    .line 28
    .line 29
    .line 30
    move-result v5

    .line 31
    invoke-virtual {p2}, LU/c;->d()F

    .line 32
    .line 33
    .line 34
    move-result v6

    .line 35
    invoke-virtual {p2}, LU/c;->e()F

    .line 36
    .line 37
    .line 38
    move-result v7

    .line 39
    invoke-static/range {v0 .. v7}, LU/d;->a(FFFFFFFF)LU/c;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0

    .line 44
    :cond_0
    invoke-virtual {p1}, LU/c;->b()F

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    invoke-virtual {p1}, LU/c;->c()F

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    invoke-virtual {p1}, LU/c;->f()F

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    invoke-virtual {p1}, LU/c;->g()F

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    invoke-virtual {p1}, LU/c;->h()F

    .line 61
    .line 62
    .line 63
    move-result v4

    .line 64
    invoke-virtual {p1}, LU/c;->i()F

    .line 65
    .line 66
    .line 67
    move-result v5

    .line 68
    invoke-virtual {p2}, LU/c;->d()F

    .line 69
    .line 70
    .line 71
    move-result v6

    .line 72
    invoke-virtual {p2}, LU/c;->e()F

    .line 73
    .line 74
    .line 75
    move-result v7

    .line 76
    invoke-static/range {v0 .. v7}, LU/d;->a(FFFFFFFF)LU/c;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    return-object p0
.end method

.method public static final e(LU/c;LU/c;)Z
    .locals 8

    .line 1
    const-string v0, "<this>"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "next"

    .line 7
    .line 8
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, LU/c;->h()F

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {p0}, LU/c;->i()F

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    invoke-virtual {p1}, LU/c;->f()F

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    invoke-virtual {p1}, LU/c;->g()F

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    invoke-virtual {p0}, LU/c;->d()F

    .line 28
    .line 29
    .line 30
    move-result v5

    .line 31
    invoke-virtual {p0}, LU/c;->e()F

    .line 32
    .line 33
    .line 34
    move-result v6

    .line 35
    const v7, 0x3ba3d70a    # 0.005f

    .line 36
    .line 37
    .line 38
    invoke-static/range {v1 .. v7}, LU/C;->a(FFFFFFF)Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    return p0
.end method

.method public static final f(LU/c;)Z
    .locals 8

    .line 1
    const-string v0, "<this>"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, LU/c;->o()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, LU/c;->b()F

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {p0}, LU/c;->c()F

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    invoke-virtual {p0}, LU/c;->d()F

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    invoke-virtual {p0}, LU/c;->e()F

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    invoke-virtual {p0}, LU/c;->f()F

    .line 29
    .line 30
    .line 31
    move-result v5

    .line 32
    invoke-virtual {p0}, LU/c;->g()F

    .line 33
    .line 34
    .line 35
    move-result v6

    .line 36
    const v7, 0x3ba3d70a    # 0.005f

    .line 37
    .line 38
    .line 39
    invoke-static/range {v1 .. v7}, LU/C;->a(FFFFFFF)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    invoke-virtual {p0}, LU/c;->b()F

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    invoke-virtual {p0}, LU/c;->c()F

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    invoke-virtual {p0}, LU/c;->d()F

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    invoke-virtual {p0}, LU/c;->e()F

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    invoke-virtual {p0}, LU/c;->h()F

    .line 62
    .line 63
    .line 64
    move-result v5

    .line 65
    invoke-virtual {p0}, LU/c;->i()F

    .line 66
    .line 67
    .line 68
    move-result v6

    .line 69
    const v7, 0x3ba3d70a    # 0.005f

    .line 70
    .line 71
    .line 72
    invoke-static/range {v1 .. v7}, LU/C;->a(FFFFFFF)Z

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    if-eqz p0, :cond_0

    .line 77
    .line 78
    const/4 p0, 0x1

    .line 79
    return p0

    .line 80
    :cond_0
    const/4 p0, 0x0

    .line 81
    return p0
.end method
