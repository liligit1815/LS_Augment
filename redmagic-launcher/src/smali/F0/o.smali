.class public LF0/o;
.super Ljava/lang/Object;
.source "GradientColorParser.java"

# interfaces
.implements LF0/N;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "LF0/N<",
        "LC0/d;",
        ">;"
    }
.end annotation


# instance fields
.field private a:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, LF0/o;->a:I

    .line 5
    .line 6
    return-void
.end method

.method private b(LC0/d;Ljava/util/List;)LC0/d;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LC0/d;",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;)",
            "LC0/d;"
        }
    .end annotation

    .line 1
    iget v0, p0, LF0/o;->a:I

    .line 2
    .line 3
    mul-int/lit8 v0, v0, 0x4

    .line 4
    .line 5
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-gt v1, v0, :cond_0

    .line 10
    .line 11
    return-object p1

    .line 12
    :cond_0
    invoke-virtual {p1}, LC0/d;->d()[F

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {p1}, LC0/d;->c()[I

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    sub-int/2addr v3, v0

    .line 25
    div-int/lit8 v3, v3, 0x2

    .line 26
    .line 27
    new-array v4, v3, [F

    .line 28
    .line 29
    new-array v3, v3, [F

    .line 30
    .line 31
    const/4 v5, 0x0

    .line 32
    move v6, v5

    .line 33
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result v7

    .line 37
    if-ge v0, v7, :cond_2

    .line 38
    .line 39
    rem-int/lit8 v7, v0, 0x2

    .line 40
    .line 41
    if-nez v7, :cond_1

    .line 42
    .line 43
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v7

    .line 47
    check-cast v7, Ljava/lang/Float;

    .line 48
    .line 49
    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    .line 50
    .line 51
    .line 52
    move-result v7

    .line 53
    aput v7, v4, v6

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_1
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v7

    .line 60
    check-cast v7, Ljava/lang/Float;

    .line 61
    .line 62
    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    .line 63
    .line 64
    .line 65
    move-result v7

    .line 66
    aput v7, v3, v6

    .line 67
    .line 68
    add-int/lit8 v6, v6, 0x1

    .line 69
    .line 70
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_2
    invoke-virtual {p1}, LC0/d;->d()[F

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-static {p1, v4}, LF0/o;->e([F[F)[F

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    array-length p2, p1

    .line 82
    new-array v0, p2, [I

    .line 83
    .line 84
    :goto_2
    if-ge v5, p2, :cond_6

    .line 85
    .line 86
    aget v6, p1, v5

    .line 87
    .line 88
    invoke-static {v1, v6}, Ljava/util/Arrays;->binarySearch([FF)I

    .line 89
    .line 90
    .line 91
    move-result v7

    .line 92
    invoke-static {v4, v6}, Ljava/util/Arrays;->binarySearch([FF)I

    .line 93
    .line 94
    .line 95
    move-result v8

    .line 96
    if-ltz v7, :cond_4

    .line 97
    .line 98
    if-lez v8, :cond_3

    .line 99
    .line 100
    goto :goto_3

    .line 101
    :cond_3
    aget v7, v2, v7

    .line 102
    .line 103
    invoke-direct {p0, v6, v7, v4, v3}, LF0/o;->d(FI[F[F)I

    .line 104
    .line 105
    .line 106
    move-result v6

    .line 107
    aput v6, v0, v5

    .line 108
    .line 109
    goto :goto_4

    .line 110
    :cond_4
    :goto_3
    if-gez v8, :cond_5

    .line 111
    .line 112
    add-int/lit8 v8, v8, 0x1

    .line 113
    .line 114
    neg-int v8, v8

    .line 115
    :cond_5
    aget v7, v3, v8

    .line 116
    .line 117
    invoke-virtual {p0, v6, v7, v1, v2}, LF0/o;->c(FF[F[I)I

    .line 118
    .line 119
    .line 120
    move-result v6

    .line 121
    aput v6, v0, v5

    .line 122
    .line 123
    :goto_4
    add-int/lit8 v5, v5, 0x1

    .line 124
    .line 125
    goto :goto_2

    .line 126
    :cond_6
    new-instance p0, LC0/d;

    .line 127
    .line 128
    invoke-direct {p0, p1, v0}, LC0/d;-><init>([F[I)V

    .line 129
    .line 130
    .line 131
    return-object p0
.end method

.method private d(FI[F[F)I
    .locals 5

    .line 1
    array-length p0, p4

    .line 2
    const/4 v0, 0x2

    .line 3
    const/4 v1, 0x0

    .line 4
    const/high16 v2, 0x437f0000    # 255.0f

    .line 5
    .line 6
    if-lt p0, v0, :cond_4

    .line 7
    .line 8
    aget p0, p3, v1

    .line 9
    .line 10
    cmpg-float p0, p1, p0

    .line 11
    .line 12
    if-gtz p0, :cond_0

    .line 13
    .line 14
    goto :goto_3

    .line 15
    :cond_0
    const/4 p0, 0x1

    .line 16
    move v0, p0

    .line 17
    :goto_0
    array-length v1, p3

    .line 18
    if-ge v0, v1, :cond_3

    .line 19
    .line 20
    aget v1, p3, v0

    .line 21
    .line 22
    cmpg-float v3, v1, p1

    .line 23
    .line 24
    if-gez v3, :cond_1

    .line 25
    .line 26
    array-length v4, p3

    .line 27
    sub-int/2addr v4, p0

    .line 28
    if-eq v0, v4, :cond_1

    .line 29
    .line 30
    add-int/lit8 v0, v0, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    if-gtz v3, :cond_2

    .line 34
    .line 35
    aget p0, p4, v0

    .line 36
    .line 37
    :goto_1
    mul-float/2addr p0, v2

    .line 38
    float-to-int p0, p0

    .line 39
    goto :goto_2

    .line 40
    :cond_2
    add-int/lit8 p0, v0, -0x1

    .line 41
    .line 42
    aget p3, p3, p0

    .line 43
    .line 44
    sub-float/2addr v1, p3

    .line 45
    sub-float/2addr p1, p3

    .line 46
    div-float/2addr p1, v1

    .line 47
    aget p0, p4, p0

    .line 48
    .line 49
    aget p3, p4, v0

    .line 50
    .line 51
    invoke-static {p0, p3, p1}, LH0/g;->i(FFF)F

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    goto :goto_1

    .line 56
    :goto_2
    invoke-static {p2}, Landroid/graphics/Color;->red(I)I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    invoke-static {p2}, Landroid/graphics/Color;->green(I)I

    .line 61
    .line 62
    .line 63
    move-result p3

    .line 64
    invoke-static {p2}, Landroid/graphics/Color;->blue(I)I

    .line 65
    .line 66
    .line 67
    move-result p2

    .line 68
    invoke-static {p0, p1, p3, p2}, Landroid/graphics/Color;->argb(IIII)I

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    return p0

    .line 73
    :cond_3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 74
    .line 75
    const-string p1, "Unreachable code."

    .line 76
    .line 77
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    throw p0

    .line 81
    :cond_4
    :goto_3
    aget p0, p4, v1

    .line 82
    .line 83
    mul-float/2addr p0, v2

    .line 84
    float-to-int p0, p0

    .line 85
    invoke-static {p2}, Landroid/graphics/Color;->red(I)I

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    invoke-static {p2}, Landroid/graphics/Color;->green(I)I

    .line 90
    .line 91
    .line 92
    move-result p3

    .line 93
    invoke-static {p2}, Landroid/graphics/Color;->blue(I)I

    .line 94
    .line 95
    .line 96
    move-result p2

    .line 97
    invoke-static {p0, p1, p3, p2}, Landroid/graphics/Color;->argb(IIII)I

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    return p0
.end method

.method protected static e([F[F)[F
    .locals 9

    .line 1
    array-length v0, p0

    .line 2
    if-nez v0, :cond_0

    .line 3
    .line 4
    return-object p1

    .line 5
    :cond_0
    array-length v0, p1

    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_1
    array-length v0, p0

    .line 10
    array-length v1, p1

    .line 11
    add-int/2addr v0, v1

    .line 12
    new-array v1, v0, [F

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    move v3, v2

    .line 16
    move v4, v3

    .line 17
    move v5, v4

    .line 18
    :goto_0
    if-ge v2, v0, :cond_8

    .line 19
    .line 20
    array-length v6, p0

    .line 21
    const/high16 v7, 0x7fc00000    # Float.NaN

    .line 22
    .line 23
    if-ge v4, v6, :cond_2

    .line 24
    .line 25
    aget v6, p0, v4

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_2
    move v6, v7

    .line 29
    :goto_1
    array-length v8, p1

    .line 30
    if-ge v5, v8, :cond_3

    .line 31
    .line 32
    aget v7, p1, v5

    .line 33
    .line 34
    :cond_3
    invoke-static {v7}, Ljava/lang/Float;->isNaN(F)Z

    .line 35
    .line 36
    .line 37
    move-result v8

    .line 38
    if-nez v8, :cond_7

    .line 39
    .line 40
    cmpg-float v8, v6, v7

    .line 41
    .line 42
    if-gez v8, :cond_4

    .line 43
    .line 44
    goto :goto_3

    .line 45
    :cond_4
    invoke-static {v6}, Ljava/lang/Float;->isNaN(F)Z

    .line 46
    .line 47
    .line 48
    move-result v8

    .line 49
    if-nez v8, :cond_6

    .line 50
    .line 51
    cmpg-float v8, v7, v6

    .line 52
    .line 53
    if-gez v8, :cond_5

    .line 54
    .line 55
    goto :goto_2

    .line 56
    :cond_5
    aput v6, v1, v2

    .line 57
    .line 58
    add-int/lit8 v4, v4, 0x1

    .line 59
    .line 60
    add-int/lit8 v5, v5, 0x1

    .line 61
    .line 62
    add-int/lit8 v3, v3, 0x1

    .line 63
    .line 64
    goto :goto_4

    .line 65
    :cond_6
    :goto_2
    aput v7, v1, v2

    .line 66
    .line 67
    add-int/lit8 v5, v5, 0x1

    .line 68
    .line 69
    goto :goto_4

    .line 70
    :cond_7
    :goto_3
    aput v6, v1, v2

    .line 71
    .line 72
    add-int/lit8 v4, v4, 0x1

    .line 73
    .line 74
    :goto_4
    add-int/lit8 v2, v2, 0x1

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_8
    if-nez v3, :cond_9

    .line 78
    .line 79
    return-object v1

    .line 80
    :cond_9
    sub-int/2addr v0, v3

    .line 81
    invoke-static {v1, v0}, Ljava/util/Arrays;->copyOf([FI)[F

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    return-object p0
.end method


# virtual methods
.method public bridge synthetic a(LG0/c;F)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, LF0/o;->f(LG0/c;F)LC0/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method c(FF[F[I)I
    .locals 3

    .line 1
    array-length p0, p4

    .line 2
    const/4 v0, 0x2

    .line 3
    const/4 v1, 0x0

    .line 4
    if-lt p0, v0, :cond_3

    .line 5
    .line 6
    aget p0, p3, v1

    .line 7
    .line 8
    cmpl-float p0, p1, p0

    .line 9
    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_0
    const/4 p0, 0x1

    .line 14
    move v0, p0

    .line 15
    :goto_0
    array-length v1, p3

    .line 16
    if-ge v0, v1, :cond_2

    .line 17
    .line 18
    aget v1, p3, v0

    .line 19
    .line 20
    cmpg-float v2, v1, p1

    .line 21
    .line 22
    if-gez v2, :cond_1

    .line 23
    .line 24
    array-length v2, p3

    .line 25
    sub-int/2addr v2, p0

    .line 26
    if-eq v0, v2, :cond_1

    .line 27
    .line 28
    add-int/lit8 v0, v0, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    add-int/lit8 p0, v0, -0x1

    .line 32
    .line 33
    aget p3, p3, p0

    .line 34
    .line 35
    sub-float/2addr v1, p3

    .line 36
    sub-float/2addr p1, p3

    .line 37
    div-float/2addr p1, v1

    .line 38
    aget p3, p4, v0

    .line 39
    .line 40
    aget p0, p4, p0

    .line 41
    .line 42
    const/high16 p4, 0x437f0000    # 255.0f

    .line 43
    .line 44
    mul-float/2addr p2, p4

    .line 45
    float-to-int p2, p2

    .line 46
    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    .line 47
    .line 48
    .line 49
    move-result p4

    .line 50
    invoke-static {p3}, Landroid/graphics/Color;->red(I)I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    invoke-static {p1, p4, v0}, LH0/b;->c(FII)I

    .line 55
    .line 56
    .line 57
    move-result p4

    .line 58
    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    invoke-static {p3}, Landroid/graphics/Color;->green(I)I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    invoke-static {p1, v0, v1}, LH0/b;->c(FII)I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    invoke-static {p3}, Landroid/graphics/Color;->blue(I)I

    .line 75
    .line 76
    .line 77
    move-result p3

    .line 78
    invoke-static {p1, p0, p3}, LH0/b;->c(FII)I

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    invoke-static {p2, p4, v0, p0}, Landroid/graphics/Color;->argb(IIII)I

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    return p0

    .line 87
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 88
    .line 89
    const-string p1, "Unreachable code."

    .line 90
    .line 91
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    throw p0

    .line 95
    :cond_3
    :goto_1
    aget p0, p4, v1

    .line 96
    .line 97
    return p0
.end method

.method public f(LG0/c;F)LC0/d;
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual/range {p1 .. p1}, LG0/c;->D()LG0/c$b;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    sget-object v3, LG0/c$b;->g:LG0/c$b;

    .line 13
    .line 14
    const/4 v4, 0x1

    .line 15
    const/4 v5, 0x0

    .line 16
    if-ne v2, v3, :cond_0

    .line 17
    .line 18
    move v2, v4

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move v2, v5

    .line 21
    :goto_0
    if-eqz v2, :cond_1

    .line 22
    .line 23
    invoke-virtual/range {p1 .. p1}, LG0/c;->c()V

    .line 24
    .line 25
    .line 26
    :cond_1
    :goto_1
    invoke-virtual/range {p1 .. p1}, LG0/c;->n()Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-eqz v3, :cond_2

    .line 31
    .line 32
    invoke-virtual/range {p1 .. p1}, LG0/c;->v()D

    .line 33
    .line 34
    .line 35
    move-result-wide v6

    .line 36
    double-to-float v3, v6

    .line 37
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_2
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    const/4 v6, 0x3

    .line 50
    const/4 v7, 0x2

    .line 51
    const/4 v8, 0x4

    .line 52
    if-ne v3, v8, :cond_3

    .line 53
    .line 54
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    check-cast v3, Ljava/lang/Float;

    .line 59
    .line 60
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    const/high16 v9, 0x3f800000    # 1.0f

    .line 65
    .line 66
    cmpl-float v3, v3, v9

    .line 67
    .line 68
    if-nez v3, :cond_3

    .line 69
    .line 70
    const/4 v3, 0x0

    .line 71
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    invoke-interface {v1, v5, v3}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    invoke-static {v9}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    check-cast v3, Ljava/lang/Float;

    .line 90
    .line 91
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    check-cast v3, Ljava/lang/Float;

    .line 99
    .line 100
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    check-cast v3, Ljava/lang/Float;

    .line 108
    .line 109
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    iput v7, v0, LF0/o;->a:I

    .line 113
    .line 114
    :cond_3
    if-eqz v2, :cond_4

    .line 115
    .line 116
    invoke-virtual/range {p1 .. p1}, LG0/c;->e()V

    .line 117
    .line 118
    .line 119
    :cond_4
    iget v2, v0, LF0/o;->a:I

    .line 120
    .line 121
    const/4 v3, -0x1

    .line 122
    if-ne v2, v3, :cond_5

    .line 123
    .line 124
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    div-int/2addr v2, v8

    .line 129
    iput v2, v0, LF0/o;->a:I

    .line 130
    .line 131
    :cond_5
    iget v2, v0, LF0/o;->a:I

    .line 132
    .line 133
    new-array v3, v2, [F

    .line 134
    .line 135
    new-array v2, v2, [I

    .line 136
    .line 137
    move v9, v5

    .line 138
    move v10, v9

    .line 139
    :goto_2
    iget v11, v0, LF0/o;->a:I

    .line 140
    .line 141
    mul-int/2addr v11, v8

    .line 142
    if-ge v5, v11, :cond_b

    .line 143
    .line 144
    div-int/lit8 v11, v5, 0x4

    .line 145
    .line 146
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object v12

    .line 150
    check-cast v12, Ljava/lang/Float;

    .line 151
    .line 152
    invoke-virtual {v12}, Ljava/lang/Float;->floatValue()F

    .line 153
    .line 154
    .line 155
    move-result v12

    .line 156
    float-to-double v12, v12

    .line 157
    rem-int/lit8 v14, v5, 0x4

    .line 158
    .line 159
    if-eqz v14, :cond_9

    .line 160
    .line 161
    const-wide v15, 0x406fe00000000000L    # 255.0

    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    if-eq v14, v4, :cond_8

    .line 167
    .line 168
    if-eq v14, v7, :cond_7

    .line 169
    .line 170
    if-eq v14, v6, :cond_6

    .line 171
    .line 172
    goto :goto_3

    .line 173
    :cond_6
    mul-double/2addr v12, v15

    .line 174
    double-to-int v12, v12

    .line 175
    const/16 v13, 0xff

    .line 176
    .line 177
    invoke-static {v13, v9, v10, v12}, Landroid/graphics/Color;->argb(IIII)I

    .line 178
    .line 179
    .line 180
    move-result v12

    .line 181
    aput v12, v2, v11

    .line 182
    .line 183
    goto :goto_3

    .line 184
    :cond_7
    mul-double/2addr v12, v15

    .line 185
    double-to-int v10, v12

    .line 186
    goto :goto_3

    .line 187
    :cond_8
    mul-double/2addr v12, v15

    .line 188
    double-to-int v9, v12

    .line 189
    goto :goto_3

    .line 190
    :cond_9
    if-lez v11, :cond_a

    .line 191
    .line 192
    add-int/lit8 v14, v11, -0x1

    .line 193
    .line 194
    aget v14, v3, v14

    .line 195
    .line 196
    double-to-float v15, v12

    .line 197
    cmpl-float v14, v14, v15

    .line 198
    .line 199
    if-ltz v14, :cond_a

    .line 200
    .line 201
    const v12, 0x3c23d70a    # 0.01f

    .line 202
    .line 203
    .line 204
    add-float/2addr v15, v12

    .line 205
    aput v15, v3, v11

    .line 206
    .line 207
    goto :goto_3

    .line 208
    :cond_a
    double-to-float v12, v12

    .line 209
    aput v12, v3, v11

    .line 210
    .line 211
    :goto_3
    add-int/lit8 v5, v5, 0x1

    .line 212
    .line 213
    goto :goto_2

    .line 214
    :cond_b
    new-instance v4, LC0/d;

    .line 215
    .line 216
    invoke-direct {v4, v3, v2}, LC0/d;-><init>([F[I)V

    .line 217
    .line 218
    .line 219
    invoke-direct {v0, v4, v1}, LF0/o;->b(LC0/d;Ljava/util/List;)LC0/d;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    return-object v0
.end method
