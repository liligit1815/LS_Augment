.class public final LU/z;
.super Ljava/lang/Object;
.source "Shapes.kt"


# direct methods
.method public static final a(LU/x$a;FFLU/b;Ljava/util/List;FF)LU/x;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LU/x$a;",
            "FF",
            "LU/b;",
            "Ljava/util/List<",
            "LU/b;",
            ">;FF)",
            "LU/x;"
        }
    .end annotation

    .line 1
    const-string v0, "<this>"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "rounding"

    .line 7
    .line 8
    invoke-static {p3, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x2

    .line 12
    int-to-float v0, p0

    .line 13
    div-float/2addr p1, v0

    .line 14
    sub-float v1, p5, p1

    .line 15
    .line 16
    div-float/2addr p2, v0

    .line 17
    sub-float v0, p6, p2

    .line 18
    .line 19
    add-float/2addr p1, p5

    .line 20
    add-float/2addr p2, p6

    .line 21
    const/16 v2, 0x8

    .line 22
    .line 23
    new-array v2, v2, [F

    .line 24
    .line 25
    const/4 v3, 0x0

    .line 26
    aput p1, v2, v3

    .line 27
    .line 28
    const/4 v3, 0x1

    .line 29
    aput p2, v2, v3

    .line 30
    .line 31
    aput v1, v2, p0

    .line 32
    .line 33
    const/4 p0, 0x3

    .line 34
    aput p2, v2, p0

    .line 35
    .line 36
    const/4 p0, 0x4

    .line 37
    aput v1, v2, p0

    .line 38
    .line 39
    const/4 p0, 0x5

    .line 40
    aput v0, v2, p0

    .line 41
    .line 42
    const/4 p0, 0x6

    .line 43
    aput p1, v2, p0

    .line 44
    .line 45
    const/4 p0, 0x7

    .line 46
    aput v0, v2, p0

    .line 47
    .line 48
    invoke-static {v2, p3, p4, p5, p6}, LU/y;->b([FLU/b;Ljava/util/List;FF)LU/x;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
.end method

.method public static synthetic b(LU/x$a;FFLU/b;Ljava/util/List;FFILjava/lang/Object;)LU/x;
    .locals 1

    .line 1
    and-int/lit8 p8, p7, 0x1

    .line 2
    .line 3
    const/high16 v0, 0x40000000    # 2.0f

    .line 4
    .line 5
    if-eqz p8, :cond_0

    .line 6
    .line 7
    move p1, v0

    .line 8
    :cond_0
    and-int/lit8 p8, p7, 0x2

    .line 9
    .line 10
    if-eqz p8, :cond_1

    .line 11
    .line 12
    move p2, v0

    .line 13
    :cond_1
    and-int/lit8 p8, p7, 0x4

    .line 14
    .line 15
    if-eqz p8, :cond_2

    .line 16
    .line 17
    sget-object p3, LU/b;->d:LU/b;

    .line 18
    .line 19
    :cond_2
    and-int/lit8 p8, p7, 0x8

    .line 20
    .line 21
    if-eqz p8, :cond_3

    .line 22
    .line 23
    const/4 p4, 0x0

    .line 24
    :cond_3
    and-int/lit8 p8, p7, 0x10

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    if-eqz p8, :cond_4

    .line 28
    .line 29
    move p5, v0

    .line 30
    :cond_4
    and-int/lit8 p7, p7, 0x20

    .line 31
    .line 32
    if-eqz p7, :cond_5

    .line 33
    .line 34
    move p6, v0

    .line 35
    :cond_5
    invoke-static/range {p0 .. p6}, LU/z;->a(LU/x$a;FFLU/b;Ljava/util/List;FF)LU/x;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method
