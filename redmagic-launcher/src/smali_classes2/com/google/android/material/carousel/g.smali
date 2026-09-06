.class Lcom/google/android/material/carousel/g;
.super Ljava/lang/Object;
.source "KeylineStateList.java"


# instance fields
.field private final a:Lcom/google/android/material/carousel/f;

.field private final b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/material/carousel/f;",
            ">;"
        }
    .end annotation
.end field

.field private final c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/material/carousel/f;",
            ">;"
        }
    .end annotation
.end field

.field private final d:[F

.field private final e:[F

.field private final f:F

.field private final g:F


# direct methods
.method private constructor <init>(Lcom/google/android/material/carousel/f;Ljava/util/List;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/material/carousel/f;",
            "Ljava/util/List<",
            "Lcom/google/android/material/carousel/f;",
            ">;",
            "Ljava/util/List<",
            "Lcom/google/android/material/carousel/f;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/material/carousel/g;->a:Lcom/google/android/material/carousel/f;

    .line 5
    .line 6
    invoke-static {p2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/google/android/material/carousel/g;->b:Ljava/util/List;

    .line 11
    .line 12
    invoke-static {p3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lcom/google/android/material/carousel/g;->c:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/4 v1, 0x1

    .line 23
    sub-int/2addr v0, v1

    .line 24
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/google/android/material/carousel/f;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/google/android/material/carousel/f;->c()Lcom/google/android/material/carousel/f$c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget v0, v0, Lcom/google/android/material/carousel/f$c;->a:F

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/google/android/material/carousel/f;->c()Lcom/google/android/material/carousel/f$c;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    iget v2, v2, Lcom/google/android/material/carousel/f$c;->a:F

    .line 41
    .line 42
    sub-float/2addr v0, v2

    .line 43
    iput v0, p0, Lcom/google/android/material/carousel/g;->f:F

    .line 44
    .line 45
    invoke-virtual {p1}, Lcom/google/android/material/carousel/f;->j()Lcom/google/android/material/carousel/f$c;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iget p1, p1, Lcom/google/android/material/carousel/f$c;->a:F

    .line 50
    .line 51
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    sub-int/2addr v2, v1

    .line 56
    invoke-interface {p3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    check-cast v2, Lcom/google/android/material/carousel/f;

    .line 61
    .line 62
    invoke-virtual {v2}, Lcom/google/android/material/carousel/f;->j()Lcom/google/android/material/carousel/f$c;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    iget v2, v2, Lcom/google/android/material/carousel/f$c;->a:F

    .line 67
    .line 68
    sub-float/2addr p1, v2

    .line 69
    iput p1, p0, Lcom/google/android/material/carousel/g;->g:F

    .line 70
    .line 71
    invoke-static {v0, p2, v1}, Lcom/google/android/material/carousel/g;->m(FLjava/util/List;Z)[F

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    iput-object p2, p0, Lcom/google/android/material/carousel/g;->d:[F

    .line 76
    .line 77
    const/4 p2, 0x0

    .line 78
    invoke-static {p1, p3, p2}, Lcom/google/android/material/carousel/g;->m(FLjava/util/List;Z)[F

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iput-object p1, p0, Lcom/google/android/material/carousel/g;->e:[F

    .line 83
    .line 84
    return-void
.end method

.method private a(Ljava/util/List;F[F)Lcom/google/android/material/carousel/f;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/material/carousel/f;",
            ">;F[F)",
            "Lcom/google/android/material/carousel/f;"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p3}, Lcom/google/android/material/carousel/g;->o(Ljava/util/List;F[F)[F

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p2, 0x0

    .line 6
    aget p2, p0, p2

    .line 7
    .line 8
    const/high16 p3, 0x3f000000    # 0.5f

    .line 9
    .line 10
    cmpl-float p2, p2, p3

    .line 11
    .line 12
    if-ltz p2, :cond_0

    .line 13
    .line 14
    const/4 p2, 0x2

    .line 15
    aget p0, p0, p2

    .line 16
    .line 17
    float-to-int p0, p0

    .line 18
    invoke-interface {p1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Lcom/google/android/material/carousel/f;

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_0
    const/4 p2, 0x1

    .line 26
    aget p0, p0, p2

    .line 27
    .line 28
    float-to-int p0, p0

    .line 29
    invoke-interface {p1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, Lcom/google/android/material/carousel/f;

    .line 34
    .line 35
    return-object p0
.end method

.method private static b(Lcom/google/android/material/carousel/f;F)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/carousel/f;->i()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    :goto_0
    invoke-virtual {p0}, Lcom/google/android/material/carousel/f;->g()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-ge v0, v1, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/google/android/material/carousel/f;->g()Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Lcom/google/android/material/carousel/f$c;

    .line 24
    .line 25
    iget v1, v1, Lcom/google/android/material/carousel/f$c;->c:F

    .line 26
    .line 27
    cmpl-float v1, p1, v1

    .line 28
    .line 29
    if-nez v1, :cond_0

    .line 30
    .line 31
    return v0

    .line 32
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/material/carousel/f;->g()Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    add-int/lit8 p0, p0, -0x1

    .line 44
    .line 45
    return p0
.end method

.method private static c(Lcom/google/android/material/carousel/f;)I
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    invoke-virtual {p0}, Lcom/google/android/material/carousel/f;->g()Ljava/util/List;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-ge v0, v1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/google/android/material/carousel/f;->g()Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/google/android/material/carousel/f$c;

    .line 21
    .line 22
    iget-boolean v1, v1, Lcom/google/android/material/carousel/f$c;->e:Z

    .line 23
    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    return v0

    .line 27
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    const/4 p0, -0x1

    .line 31
    return p0
.end method

.method private static d(Lcom/google/android/material/carousel/f;F)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/carousel/f;->b()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/lit8 v0, v0, -0x1

    .line 6
    .line 7
    :goto_0
    if-ltz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/google/android/material/carousel/f;->g()Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/google/android/material/carousel/f$c;

    .line 18
    .line 19
    iget v1, v1, Lcom/google/android/material/carousel/f$c;->c:F

    .line 20
    .line 21
    cmpl-float v1, p1, v1

    .line 22
    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    return v0

    .line 26
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method private static e(Lcom/google/android/material/carousel/f;)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/carousel/f;->g()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    add-int/lit8 v0, v0, -0x1

    .line 10
    .line 11
    :goto_0
    if-ltz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/google/android/material/carousel/f;->g()Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Lcom/google/android/material/carousel/f$c;

    .line 22
    .line 23
    iget-boolean v1, v1, Lcom/google/android/material/carousel/f$c;->e:Z

    .line 24
    .line 25
    if-nez v1, :cond_0

    .line 26
    .line 27
    return v0

    .line 28
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    const/4 p0, -0x1

    .line 32
    return p0
.end method

.method static f(Lcom/google/android/material/carousel/b;Lcom/google/android/material/carousel/f;FFF)Lcom/google/android/material/carousel/g;
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/material/carousel/g;

    .line 2
    .line 3
    invoke-static {p0, p1, p2, p3}, Lcom/google/android/material/carousel/g;->p(Lcom/google/android/material/carousel/b;Lcom/google/android/material/carousel/f;FF)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    invoke-static {p0, p1, p2, p4}, Lcom/google/android/material/carousel/g;->n(Lcom/google/android/material/carousel/b;Lcom/google/android/material/carousel/f;FF)Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-direct {v0, p1, p3, p0}, Lcom/google/android/material/carousel/g;-><init>(Lcom/google/android/material/carousel/f;Ljava/util/List;Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method private static m(FLjava/util/List;Z)[F
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F",
            "Ljava/util/List<",
            "Lcom/google/android/material/carousel/f;",
            ">;Z)[F"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    new-array v1, v0, [F

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    :goto_0
    if-ge v2, v0, :cond_2

    .line 9
    .line 10
    add-int/lit8 v3, v2, -0x1

    .line 11
    .line 12
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v4

    .line 16
    check-cast v4, Lcom/google/android/material/carousel/f;

    .line 17
    .line 18
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v5

    .line 22
    check-cast v5, Lcom/google/android/material/carousel/f;

    .line 23
    .line 24
    if-eqz p2, :cond_0

    .line 25
    .line 26
    invoke-virtual {v5}, Lcom/google/android/material/carousel/f;->c()Lcom/google/android/material/carousel/f$c;

    .line 27
    .line 28
    .line 29
    move-result-object v5

    .line 30
    iget v5, v5, Lcom/google/android/material/carousel/f$c;->a:F

    .line 31
    .line 32
    invoke-virtual {v4}, Lcom/google/android/material/carousel/f;->c()Lcom/google/android/material/carousel/f$c;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    iget v4, v4, Lcom/google/android/material/carousel/f$c;->a:F

    .line 37
    .line 38
    sub-float/2addr v5, v4

    .line 39
    goto :goto_1

    .line 40
    :cond_0
    invoke-virtual {v4}, Lcom/google/android/material/carousel/f;->j()Lcom/google/android/material/carousel/f$c;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    iget v4, v4, Lcom/google/android/material/carousel/f$c;->a:F

    .line 45
    .line 46
    invoke-virtual {v5}, Lcom/google/android/material/carousel/f;->j()Lcom/google/android/material/carousel/f$c;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    iget v5, v5, Lcom/google/android/material/carousel/f$c;->a:F

    .line 51
    .line 52
    sub-float v5, v4, v5

    .line 53
    .line 54
    :goto_1
    div-float/2addr v5, p0

    .line 55
    add-int/lit8 v4, v0, -0x1

    .line 56
    .line 57
    if-ne v2, v4, :cond_1

    .line 58
    .line 59
    const/high16 v3, 0x3f800000    # 1.0f

    .line 60
    .line 61
    goto :goto_2

    .line 62
    :cond_1
    aget v3, v1, v3

    .line 63
    .line 64
    add-float/2addr v3, v5

    .line 65
    :goto_2
    aput v3, v1, v2

    .line 66
    .line 67
    add-int/lit8 v2, v2, 0x1

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_2
    return-object v1
.end method

.method private static n(Lcom/google/android/material/carousel/b;Lcom/google/android/material/carousel/f;FF)Ljava/util/List;
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/material/carousel/b;",
            "Lcom/google/android/material/carousel/f;",
            "FF)",
            "Ljava/util/List<",
            "Lcom/google/android/material/carousel/f;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move/from16 v1, p2

    .line 4
    .line 5
    move/from16 v2, p3

    .line 6
    .line 7
    new-instance v3, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    invoke-static {v0}, Lcom/google/android/material/carousel/g;->e(Lcom/google/android/material/carousel/f;)I

    .line 16
    .line 17
    .line 18
    move-result v5

    .line 19
    invoke-interface/range {p0 .. p0}, Lcom/google/android/material/carousel/b;->e()Z

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    if-eqz v4, :cond_0

    .line 24
    .line 25
    invoke-interface/range {p0 .. p0}, Lcom/google/android/material/carousel/b;->a()I

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    :goto_0
    int-to-float v4, v4

    .line 30
    move v10, v4

    .line 31
    goto :goto_1

    .line 32
    :cond_0
    invoke-interface/range {p0 .. p0}, Lcom/google/android/material/carousel/b;->b()I

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    goto :goto_0

    .line 37
    :goto_1
    invoke-static/range {p0 .. p1}, Lcom/google/android/material/carousel/g;->r(Lcom/google/android/material/carousel/b;Lcom/google/android/material/carousel/f;)Z

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    const/4 v11, 0x0

    .line 42
    const/4 v12, 0x0

    .line 43
    if-nez v4, :cond_5

    .line 44
    .line 45
    const/4 v4, -0x1

    .line 46
    if-ne v5, v4, :cond_1

    .line 47
    .line 48
    goto/16 :goto_4

    .line 49
    .line 50
    :cond_1
    invoke-virtual {v0}, Lcom/google/android/material/carousel/f;->i()I

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    sub-int v13, v5, v4

    .line 55
    .line 56
    invoke-virtual {v0}, Lcom/google/android/material/carousel/f;->c()Lcom/google/android/material/carousel/f$c;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    iget v4, v4, Lcom/google/android/material/carousel/f$c;->b:F

    .line 61
    .line 62
    invoke-virtual {v0}, Lcom/google/android/material/carousel/f;->c()Lcom/google/android/material/carousel/f$c;

    .line 63
    .line 64
    .line 65
    move-result-object v6

    .line 66
    iget v6, v6, Lcom/google/android/material/carousel/f$c;->d:F

    .line 67
    .line 68
    const/high16 v7, 0x40000000    # 2.0f

    .line 69
    .line 70
    div-float/2addr v6, v7

    .line 71
    sub-float v14, v4, v6

    .line 72
    .line 73
    if-gtz v13, :cond_2

    .line 74
    .line 75
    invoke-virtual {v0}, Lcom/google/android/material/carousel/f;->h()Lcom/google/android/material/carousel/f$c;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    iget v4, v4, Lcom/google/android/material/carousel/f$c;->f:F

    .line 80
    .line 81
    cmpl-float v4, v4, v12

    .line 82
    .line 83
    if-lez v4, :cond_2

    .line 84
    .line 85
    invoke-virtual {v0}, Lcom/google/android/material/carousel/f;->h()Lcom/google/android/material/carousel/f$c;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    iget v1, v1, Lcom/google/android/material/carousel/f$c;->f:F

    .line 90
    .line 91
    sub-float/2addr v14, v1

    .line 92
    invoke-static {v0, v14, v10}, Lcom/google/android/material/carousel/g;->v(Lcom/google/android/material/carousel/f;FF)Lcom/google/android/material/carousel/f;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    return-object v3

    .line 100
    :cond_2
    move v15, v11

    .line 101
    move v4, v12

    .line 102
    :goto_2
    if-ge v15, v13, :cond_6

    .line 103
    .line 104
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 105
    .line 106
    .line 107
    move-result v6

    .line 108
    add-int/lit8 v6, v6, -0x1

    .line 109
    .line 110
    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v6

    .line 114
    check-cast v6, Lcom/google/android/material/carousel/f;

    .line 115
    .line 116
    sub-int v7, v5, v15

    .line 117
    .line 118
    invoke-virtual {v0}, Lcom/google/android/material/carousel/f;->g()Ljava/util/List;

    .line 119
    .line 120
    .line 121
    move-result-object v8

    .line 122
    invoke-interface {v8, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v8

    .line 126
    check-cast v8, Lcom/google/android/material/carousel/f$c;

    .line 127
    .line 128
    iget v8, v8, Lcom/google/android/material/carousel/f$c;->f:F

    .line 129
    .line 130
    add-float v16, v4, v8

    .line 131
    .line 132
    add-int/lit8 v7, v7, 0x1

    .line 133
    .line 134
    invoke-virtual {v0}, Lcom/google/android/material/carousel/f;->g()Ljava/util/List;

    .line 135
    .line 136
    .line 137
    move-result-object v4

    .line 138
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 139
    .line 140
    .line 141
    move-result v4

    .line 142
    if-ge v7, v4, :cond_3

    .line 143
    .line 144
    invoke-virtual {v0}, Lcom/google/android/material/carousel/f;->g()Ljava/util/List;

    .line 145
    .line 146
    .line 147
    move-result-object v4

    .line 148
    invoke-interface {v4, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object v4

    .line 152
    check-cast v4, Lcom/google/android/material/carousel/f$c;

    .line 153
    .line 154
    iget v4, v4, Lcom/google/android/material/carousel/f$c;->c:F

    .line 155
    .line 156
    invoke-static {v6, v4}, Lcom/google/android/material/carousel/g;->d(Lcom/google/android/material/carousel/f;F)I

    .line 157
    .line 158
    .line 159
    move-result v4

    .line 160
    add-int/lit8 v4, v4, 0x1

    .line 161
    .line 162
    goto :goto_3

    .line 163
    :cond_3
    move v4, v11

    .line 164
    :goto_3
    invoke-virtual {v0}, Lcom/google/android/material/carousel/f;->b()I

    .line 165
    .line 166
    .line 167
    move-result v7

    .line 168
    add-int/2addr v7, v15

    .line 169
    add-int/lit8 v8, v7, 0x1

    .line 170
    .line 171
    invoke-virtual {v0}, Lcom/google/android/material/carousel/f;->i()I

    .line 172
    .line 173
    .line 174
    move-result v7

    .line 175
    add-int/2addr v7, v15

    .line 176
    add-int/lit8 v9, v7, 0x1

    .line 177
    .line 178
    sub-float v7, v14, v16

    .line 179
    .line 180
    move-object/from16 v17, v6

    .line 181
    .line 182
    move v6, v4

    .line 183
    move-object/from16 v4, v17

    .line 184
    .line 185
    invoke-static/range {v4 .. v10}, Lcom/google/android/material/carousel/g;->t(Lcom/google/android/material/carousel/f;IIFIIF)Lcom/google/android/material/carousel/f;

    .line 186
    .line 187
    .line 188
    move-result-object v4

    .line 189
    add-int/lit8 v6, v13, -0x1

    .line 190
    .line 191
    if-ne v15, v6, :cond_4

    .line 192
    .line 193
    cmpl-float v6, v2, v12

    .line 194
    .line 195
    if-lez v6, :cond_4

    .line 196
    .line 197
    invoke-static {v4, v2, v10, v11, v1}, Lcom/google/android/material/carousel/g;->u(Lcom/google/android/material/carousel/f;FFZF)Lcom/google/android/material/carousel/f;

    .line 198
    .line 199
    .line 200
    move-result-object v4

    .line 201
    :cond_4
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 202
    .line 203
    .line 204
    add-int/lit8 v15, v15, 0x1

    .line 205
    .line 206
    move/from16 v4, v16

    .line 207
    .line 208
    goto :goto_2

    .line 209
    :cond_5
    :goto_4
    cmpl-float v4, v2, v12

    .line 210
    .line 211
    if-lez v4, :cond_6

    .line 212
    .line 213
    invoke-static {v0, v2, v10, v11, v1}, Lcom/google/android/material/carousel/g;->u(Lcom/google/android/material/carousel/f;FFZF)Lcom/google/android/material/carousel/f;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 218
    .line 219
    .line 220
    :cond_6
    return-object v3
.end method

.method private static o(Ljava/util/List;F[F)[F
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/material/carousel/f;",
            ">;F[F)[F"
        }
    .end annotation

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    const/4 v1, 0x0

    .line 7
    aget v2, p2, v1

    .line 8
    .line 9
    const/4 v3, 0x1

    .line 10
    move v4, v3

    .line 11
    :goto_0
    const/4 v5, 0x0

    .line 12
    if-ge v4, p0, :cond_1

    .line 13
    .line 14
    aget v6, p2, v4

    .line 15
    .line 16
    cmpg-float v7, p1, v6

    .line 17
    .line 18
    if-gtz v7, :cond_0

    .line 19
    .line 20
    add-int/lit8 p0, v4, -0x1

    .line 21
    .line 22
    const/high16 p2, 0x3f800000    # 1.0f

    .line 23
    .line 24
    invoke-static {v5, p2, v2, v6, p1}, LY2/a;->b(FFFFF)F

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    int-to-float p0, p0

    .line 29
    int-to-float p2, v4

    .line 30
    new-array v0, v0, [F

    .line 31
    .line 32
    aput p1, v0, v1

    .line 33
    .line 34
    aput p0, v0, v3

    .line 35
    .line 36
    const/4 p0, 0x2

    .line 37
    aput p2, v0, p0

    .line 38
    .line 39
    return-object v0

    .line 40
    :cond_0
    add-int/2addr v4, v3

    .line 41
    move v2, v6

    .line 42
    goto :goto_0

    .line 43
    :cond_1
    new-array p0, v0, [F

    .line 44
    .line 45
    fill-array-data p0, :array_0

    .line 46
    .line 47
    .line 48
    return-object p0

    .line 49
    :array_0
    .array-data 4
        0x0
        0x0
        0x0
    .end array-data
.end method

.method private static p(Lcom/google/android/material/carousel/b;Lcom/google/android/material/carousel/f;FF)Ljava/util/List;
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/material/carousel/b;",
            "Lcom/google/android/material/carousel/f;",
            "FF)",
            "Ljava/util/List<",
            "Lcom/google/android/material/carousel/f;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move/from16 v1, p2

    .line 4
    .line 5
    move/from16 v2, p3

    .line 6
    .line 7
    new-instance v3, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    invoke-static {v0}, Lcom/google/android/material/carousel/g;->c(Lcom/google/android/material/carousel/f;)I

    .line 16
    .line 17
    .line 18
    move-result v5

    .line 19
    invoke-interface/range {p0 .. p0}, Lcom/google/android/material/carousel/b;->e()Z

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    if-eqz v4, :cond_0

    .line 24
    .line 25
    invoke-interface/range {p0 .. p0}, Lcom/google/android/material/carousel/b;->a()I

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    :goto_0
    int-to-float v4, v4

    .line 30
    move v10, v4

    .line 31
    goto :goto_1

    .line 32
    :cond_0
    invoke-interface/range {p0 .. p0}, Lcom/google/android/material/carousel/b;->b()I

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    goto :goto_0

    .line 37
    :goto_1
    invoke-static {v0}, Lcom/google/android/material/carousel/g;->q(Lcom/google/android/material/carousel/f;)Z

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    const/4 v11, 0x0

    .line 42
    const/4 v12, 0x1

    .line 43
    if-nez v4, :cond_5

    .line 44
    .line 45
    const/4 v4, -0x1

    .line 46
    if-ne v5, v4, :cond_1

    .line 47
    .line 48
    goto/16 :goto_3

    .line 49
    .line 50
    :cond_1
    invoke-virtual {v0}, Lcom/google/android/material/carousel/f;->b()I

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    sub-int v13, v4, v5

    .line 55
    .line 56
    invoke-virtual {v0}, Lcom/google/android/material/carousel/f;->c()Lcom/google/android/material/carousel/f$c;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    iget v4, v4, Lcom/google/android/material/carousel/f$c;->b:F

    .line 61
    .line 62
    invoke-virtual {v0}, Lcom/google/android/material/carousel/f;->c()Lcom/google/android/material/carousel/f$c;

    .line 63
    .line 64
    .line 65
    move-result-object v6

    .line 66
    iget v6, v6, Lcom/google/android/material/carousel/f$c;->d:F

    .line 67
    .line 68
    const/high16 v7, 0x40000000    # 2.0f

    .line 69
    .line 70
    div-float/2addr v6, v7

    .line 71
    sub-float v14, v4, v6

    .line 72
    .line 73
    if-gtz v13, :cond_2

    .line 74
    .line 75
    invoke-virtual {v0}, Lcom/google/android/material/carousel/f;->a()Lcom/google/android/material/carousel/f$c;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    iget v4, v4, Lcom/google/android/material/carousel/f$c;->f:F

    .line 80
    .line 81
    cmpl-float v4, v4, v11

    .line 82
    .line 83
    if-lez v4, :cond_2

    .line 84
    .line 85
    invoke-virtual {v0}, Lcom/google/android/material/carousel/f;->a()Lcom/google/android/material/carousel/f$c;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    iget v1, v1, Lcom/google/android/material/carousel/f$c;->f:F

    .line 90
    .line 91
    add-float/2addr v14, v1

    .line 92
    invoke-static {v0, v14, v10}, Lcom/google/android/material/carousel/g;->v(Lcom/google/android/material/carousel/f;FF)Lcom/google/android/material/carousel/f;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    return-object v3

    .line 100
    :cond_2
    const/4 v4, 0x0

    .line 101
    move v15, v4

    .line 102
    move v4, v11

    .line 103
    :goto_2
    if-ge v15, v13, :cond_6

    .line 104
    .line 105
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 106
    .line 107
    .line 108
    move-result v6

    .line 109
    sub-int/2addr v6, v12

    .line 110
    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v6

    .line 114
    check-cast v6, Lcom/google/android/material/carousel/f;

    .line 115
    .line 116
    add-int v7, v5, v15

    .line 117
    .line 118
    invoke-virtual {v0}, Lcom/google/android/material/carousel/f;->g()Ljava/util/List;

    .line 119
    .line 120
    .line 121
    move-result-object v8

    .line 122
    invoke-interface {v8}, Ljava/util/List;->size()I

    .line 123
    .line 124
    .line 125
    move-result v8

    .line 126
    sub-int/2addr v8, v12

    .line 127
    invoke-virtual {v0}, Lcom/google/android/material/carousel/f;->g()Ljava/util/List;

    .line 128
    .line 129
    .line 130
    move-result-object v9

    .line 131
    invoke-interface {v9, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v9

    .line 135
    check-cast v9, Lcom/google/android/material/carousel/f$c;

    .line 136
    .line 137
    iget v9, v9, Lcom/google/android/material/carousel/f$c;->f:F

    .line 138
    .line 139
    add-float v16, v4, v9

    .line 140
    .line 141
    sub-int/2addr v7, v12

    .line 142
    if-ltz v7, :cond_3

    .line 143
    .line 144
    invoke-virtual {v0}, Lcom/google/android/material/carousel/f;->g()Ljava/util/List;

    .line 145
    .line 146
    .line 147
    move-result-object v4

    .line 148
    invoke-interface {v4, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object v4

    .line 152
    check-cast v4, Lcom/google/android/material/carousel/f$c;

    .line 153
    .line 154
    iget v4, v4, Lcom/google/android/material/carousel/f$c;->c:F

    .line 155
    .line 156
    invoke-static {v6, v4}, Lcom/google/android/material/carousel/g;->b(Lcom/google/android/material/carousel/f;F)I

    .line 157
    .line 158
    .line 159
    move-result v4

    .line 160
    add-int/lit8 v8, v4, -0x1

    .line 161
    .line 162
    :cond_3
    invoke-virtual {v0}, Lcom/google/android/material/carousel/f;->b()I

    .line 163
    .line 164
    .line 165
    move-result v4

    .line 166
    sub-int/2addr v4, v15

    .line 167
    sub-int/2addr v4, v12

    .line 168
    invoke-virtual {v0}, Lcom/google/android/material/carousel/f;->i()I

    .line 169
    .line 170
    .line 171
    move-result v7

    .line 172
    sub-int/2addr v7, v15

    .line 173
    add-int/lit8 v9, v7, -0x1

    .line 174
    .line 175
    add-float v7, v14, v16

    .line 176
    .line 177
    move/from16 v17, v8

    .line 178
    .line 179
    move v8, v4

    .line 180
    move-object v4, v6

    .line 181
    move/from16 v6, v17

    .line 182
    .line 183
    invoke-static/range {v4 .. v10}, Lcom/google/android/material/carousel/g;->t(Lcom/google/android/material/carousel/f;IIFIIF)Lcom/google/android/material/carousel/f;

    .line 184
    .line 185
    .line 186
    move-result-object v4

    .line 187
    add-int/lit8 v6, v13, -0x1

    .line 188
    .line 189
    if-ne v15, v6, :cond_4

    .line 190
    .line 191
    cmpl-float v6, v2, v11

    .line 192
    .line 193
    if-lez v6, :cond_4

    .line 194
    .line 195
    invoke-static {v4, v2, v10, v12, v1}, Lcom/google/android/material/carousel/g;->u(Lcom/google/android/material/carousel/f;FFZF)Lcom/google/android/material/carousel/f;

    .line 196
    .line 197
    .line 198
    move-result-object v4

    .line 199
    :cond_4
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    add-int/lit8 v15, v15, 0x1

    .line 203
    .line 204
    move/from16 v4, v16

    .line 205
    .line 206
    goto :goto_2

    .line 207
    :cond_5
    :goto_3
    cmpl-float v4, v2, v11

    .line 208
    .line 209
    if-lez v4, :cond_6

    .line 210
    .line 211
    invoke-static {v0, v2, v10, v12, v1}, Lcom/google/android/material/carousel/g;->u(Lcom/google/android/material/carousel/f;FFZF)Lcom/google/android/material/carousel/f;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 216
    .line 217
    .line 218
    :cond_6
    return-object v3
.end method

.method private static q(Lcom/google/android/material/carousel/f;)Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/carousel/f;->a()Lcom/google/android/material/carousel/f$c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v0, v0, Lcom/google/android/material/carousel/f$c;->b:F

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/google/android/material/carousel/f;->a()Lcom/google/android/material/carousel/f$c;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget v1, v1, Lcom/google/android/material/carousel/f$c;->d:F

    .line 12
    .line 13
    const/high16 v2, 0x40000000    # 2.0f

    .line 14
    .line 15
    div-float/2addr v1, v2

    .line 16
    sub-float/2addr v0, v1

    .line 17
    const/4 v1, 0x0

    .line 18
    cmpl-float v0, v0, v1

    .line 19
    .line 20
    if-ltz v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/google/android/material/carousel/f;->a()Lcom/google/android/material/carousel/f$c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0}, Lcom/google/android/material/carousel/f;->d()Lcom/google/android/material/carousel/f$c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    if-ne v0, p0, :cond_0

    .line 31
    .line 32
    const/4 p0, 0x1

    .line 33
    return p0

    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    return p0
.end method

.method private static r(Lcom/google/android/material/carousel/b;Lcom/google/android/material/carousel/f;)Z
    .locals 3

    .line 1
    invoke-interface {p0}, Lcom/google/android/material/carousel/b;->b()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-interface {p0}, Lcom/google/android/material/carousel/b;->e()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-interface {p0}, Lcom/google/android/material/carousel/b;->a()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/material/carousel/f;->h()Lcom/google/android/material/carousel/f$c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget p0, p0, Lcom/google/android/material/carousel/f$c;->b:F

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/google/android/material/carousel/f;->h()Lcom/google/android/material/carousel/f$c;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget v1, v1, Lcom/google/android/material/carousel/f$c;->d:F

    .line 26
    .line 27
    const/high16 v2, 0x40000000    # 2.0f

    .line 28
    .line 29
    div-float/2addr v1, v2

    .line 30
    add-float/2addr p0, v1

    .line 31
    int-to-float v0, v0

    .line 32
    cmpg-float p0, p0, v0

    .line 33
    .line 34
    if-gtz p0, :cond_1

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/google/android/material/carousel/f;->h()Lcom/google/android/material/carousel/f$c;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p1}, Lcom/google/android/material/carousel/f;->k()Lcom/google/android/material/carousel/f$c;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    if-ne p0, p1, :cond_1

    .line 45
    .line 46
    const/4 p0, 0x1

    .line 47
    return p0

    .line 48
    :cond_1
    const/4 p0, 0x0

    .line 49
    return p0
.end method

.method private static s(Ljava/util/List;F[F)Lcom/google/android/material/carousel/f;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/material/carousel/f;",
            ">;F[F)",
            "Lcom/google/android/material/carousel/f;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Lcom/google/android/material/carousel/g;->o(Ljava/util/List;F[F)[F

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 p2, 0x1

    .line 6
    aget p2, p1, p2

    .line 7
    .line 8
    float-to-int p2, p2

    .line 9
    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    check-cast p2, Lcom/google/android/material/carousel/f;

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    aget v0, p1, v0

    .line 17
    .line 18
    float-to-int v0, v0

    .line 19
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Lcom/google/android/material/carousel/f;

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    aget p1, p1, v0

    .line 27
    .line 28
    invoke-static {p2, p0, p1}, Lcom/google/android/material/carousel/f;->m(Lcom/google/android/material/carousel/f;Lcom/google/android/material/carousel/f;F)Lcom/google/android/material/carousel/f;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method private static t(Lcom/google/android/material/carousel/f;IIFIIF)Lcom/google/android/material/carousel/f;
    .locals 8

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/carousel/f;->g()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Lcom/google/android/material/carousel/f$c;

    .line 15
    .line 16
    invoke-interface {v0, p2, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    new-instance v1, Lcom/google/android/material/carousel/f$b;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/google/android/material/carousel/f;->f()F

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    invoke-direct {v1, p0, p6}, Lcom/google/android/material/carousel/f$b;-><init>(FF)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    move p1, p0

    .line 30
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    if-ge p1, p2, :cond_1

    .line 35
    .line 36
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    check-cast p2, Lcom/google/android/material/carousel/f$c;

    .line 41
    .line 42
    iget v4, p2, Lcom/google/android/material/carousel/f$c;->d:F

    .line 43
    .line 44
    const/high16 p6, 0x40000000    # 2.0f

    .line 45
    .line 46
    div-float p6, v4, p6

    .line 47
    .line 48
    add-float v2, p3, p6

    .line 49
    .line 50
    if-lt p1, p4, :cond_0

    .line 51
    .line 52
    if-gt p1, p5, :cond_0

    .line 53
    .line 54
    const/4 p6, 0x1

    .line 55
    move v5, p6

    .line 56
    goto :goto_1

    .line 57
    :cond_0
    move v5, p0

    .line 58
    :goto_1
    iget v3, p2, Lcom/google/android/material/carousel/f$c;->c:F

    .line 59
    .line 60
    iget-boolean v6, p2, Lcom/google/android/material/carousel/f$c;->e:Z

    .line 61
    .line 62
    iget v7, p2, Lcom/google/android/material/carousel/f$c;->f:F

    .line 63
    .line 64
    invoke-virtual/range {v1 .. v7}, Lcom/google/android/material/carousel/f$b;->e(FFFZZF)Lcom/google/android/material/carousel/f$b;

    .line 65
    .line 66
    .line 67
    iget p2, p2, Lcom/google/android/material/carousel/f$c;->d:F

    .line 68
    .line 69
    add-float/2addr p3, p2

    .line 70
    add-int/lit8 p1, p1, 0x1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    invoke-virtual {v1}, Lcom/google/android/material/carousel/f$b;->i()Lcom/google/android/material/carousel/f;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    return-object p0
.end method

.method private static u(Lcom/google/android/material/carousel/f;FFZF)Lcom/google/android/material/carousel/f;
    .locals 16

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/carousel/f;->g()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 8
    .line 9
    .line 10
    new-instance v2, Lcom/google/android/material/carousel/f$b;

    .line 11
    .line 12
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/carousel/f;->f()F

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    move/from16 v3, p2

    .line 17
    .line 18
    invoke-direct {v2, v1, v3}, Lcom/google/android/material/carousel/f$b;-><init>(FF)V

    .line 19
    .line 20
    .line 21
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/carousel/f;->l()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    int-to-float v1, v1

    .line 26
    div-float v1, p1, v1

    .line 27
    .line 28
    const/4 v11, 0x0

    .line 29
    if-eqz p3, :cond_0

    .line 30
    .line 31
    move/from16 v3, p1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    move v3, v11

    .line 35
    :goto_0
    const/4 v12, 0x0

    .line 36
    move v13, v3

    .line 37
    move v14, v12

    .line 38
    :goto_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    if-ge v14, v3, :cond_5

    .line 43
    .line 44
    invoke-interface {v0, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    check-cast v3, Lcom/google/android/material/carousel/f$c;

    .line 49
    .line 50
    iget-boolean v4, v3, Lcom/google/android/material/carousel/f$c;->e:Z

    .line 51
    .line 52
    if-eqz v4, :cond_1

    .line 53
    .line 54
    iget v4, v3, Lcom/google/android/material/carousel/f$c;->b:F

    .line 55
    .line 56
    move v5, v4

    .line 57
    iget v4, v3, Lcom/google/android/material/carousel/f$c;->c:F

    .line 58
    .line 59
    move v6, v5

    .line 60
    iget v5, v3, Lcom/google/android/material/carousel/f$c;->d:F

    .line 61
    .line 62
    const/4 v7, 0x1

    .line 63
    iget v8, v3, Lcom/google/android/material/carousel/f$c;->f:F

    .line 64
    .line 65
    move v3, v6

    .line 66
    const/4 v6, 0x0

    .line 67
    invoke-virtual/range {v2 .. v8}, Lcom/google/android/material/carousel/f$b;->e(FFFZZF)Lcom/google/android/material/carousel/f$b;

    .line 68
    .line 69
    .line 70
    move/from16 v15, p4

    .line 71
    .line 72
    goto :goto_6

    .line 73
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/carousel/f;->b()I

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    if-lt v14, v4, :cond_2

    .line 78
    .line 79
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/carousel/f;->i()I

    .line 80
    .line 81
    .line 82
    move-result v4

    .line 83
    if-gt v14, v4, :cond_2

    .line 84
    .line 85
    const/4 v4, 0x1

    .line 86
    move v6, v4

    .line 87
    goto :goto_2

    .line 88
    :cond_2
    move v6, v12

    .line 89
    :goto_2
    iget v4, v3, Lcom/google/android/material/carousel/f$c;->d:F

    .line 90
    .line 91
    sub-float v5, v4, v1

    .line 92
    .line 93
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/carousel/f;->f()F

    .line 94
    .line 95
    .line 96
    move-result v4

    .line 97
    move/from16 v15, p4

    .line 98
    .line 99
    invoke-static {v5, v4, v15}, Lcom/google/android/material/carousel/d;->b(FFF)F

    .line 100
    .line 101
    .line 102
    move-result v4

    .line 103
    const/high16 v7, 0x40000000    # 2.0f

    .line 104
    .line 105
    div-float v7, v5, v7

    .line 106
    .line 107
    add-float/2addr v7, v13

    .line 108
    iget v8, v3, Lcom/google/android/material/carousel/f$c;->b:F

    .line 109
    .line 110
    sub-float v8, v7, v8

    .line 111
    .line 112
    iget v3, v3, Lcom/google/android/material/carousel/f$c;->f:F

    .line 113
    .line 114
    if-eqz p3, :cond_3

    .line 115
    .line 116
    move v9, v8

    .line 117
    goto :goto_3

    .line 118
    :cond_3
    move v9, v11

    .line 119
    :goto_3
    if-eqz p3, :cond_4

    .line 120
    .line 121
    move v10, v11

    .line 122
    :goto_4
    move v8, v3

    .line 123
    move v3, v7

    .line 124
    goto :goto_5

    .line 125
    :cond_4
    move v10, v8

    .line 126
    goto :goto_4

    .line 127
    :goto_5
    const/4 v7, 0x0

    .line 128
    invoke-virtual/range {v2 .. v10}, Lcom/google/android/material/carousel/f$b;->f(FFFZZFFF)Lcom/google/android/material/carousel/f$b;

    .line 129
    .line 130
    .line 131
    add-float/2addr v13, v5

    .line 132
    :goto_6
    add-int/lit8 v14, v14, 0x1

    .line 133
    .line 134
    goto :goto_1

    .line 135
    :cond_5
    invoke-virtual {v2}, Lcom/google/android/material/carousel/f$b;->i()Lcom/google/android/material/carousel/f;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    return-object v0
.end method

.method private static v(Lcom/google/android/material/carousel/f;FF)Lcom/google/android/material/carousel/f;
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/carousel/f;->b()I

    .line 2
    .line 3
    .line 4
    move-result v4

    .line 5
    invoke-virtual {p0}, Lcom/google/android/material/carousel/f;->i()I

    .line 6
    .line 7
    .line 8
    move-result v5

    .line 9
    const/4 v1, 0x0

    .line 10
    const/4 v2, 0x0

    .line 11
    move-object v0, p0

    .line 12
    move v3, p1

    .line 13
    move v6, p2

    .line 14
    invoke-static/range {v0 .. v6}, Lcom/google/android/material/carousel/g;->t(Lcom/google/android/material/carousel/f;IIFIIF)Lcom/google/android/material/carousel/f;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method


# virtual methods
.method g()Lcom/google/android/material/carousel/f;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/carousel/g;->a:Lcom/google/android/material/carousel/f;

    .line 2
    .line 3
    return-object p0
.end method

.method h()Lcom/google/android/material/carousel/f;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/material/carousel/g;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit8 v0, v0, -0x1

    .line 8
    .line 9
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/google/android/material/carousel/f;

    .line 14
    .line 15
    return-object p0
.end method

.method i(IIIZ)Ljava/util/Map;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIIZ)",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/google/android/material/carousel/f;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/material/carousel/g;->a:Lcom/google/android/material/carousel/f;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/material/carousel/f;->f()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    new-instance v1, Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 10
    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    move v3, v2

    .line 14
    move v4, v3

    .line 15
    :goto_0
    const/4 v5, -0x1

    .line 16
    const/4 v6, 0x1

    .line 17
    if-ge v3, p1, :cond_4

    .line 18
    .line 19
    if-eqz p4, :cond_0

    .line 20
    .line 21
    sub-int v7, p1, v3

    .line 22
    .line 23
    sub-int/2addr v7, v6

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    move v7, v3

    .line 26
    :goto_1
    int-to-float v8, v7

    .line 27
    mul-float/2addr v8, v0

    .line 28
    if-eqz p4, :cond_1

    .line 29
    .line 30
    goto :goto_2

    .line 31
    :cond_1
    move v5, v6

    .line 32
    :goto_2
    int-to-float v5, v5

    .line 33
    mul-float/2addr v8, v5

    .line 34
    int-to-float v5, p3

    .line 35
    iget v9, p0, Lcom/google/android/material/carousel/g;->g:F

    .line 36
    .line 37
    sub-float/2addr v5, v9

    .line 38
    cmpl-float v5, v8, v5

    .line 39
    .line 40
    if-gtz v5, :cond_2

    .line 41
    .line 42
    iget-object v5, p0, Lcom/google/android/material/carousel/g;->c:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 45
    .line 46
    .line 47
    move-result v5

    .line 48
    sub-int v5, p1, v5

    .line 49
    .line 50
    if-lt v3, v5, :cond_3

    .line 51
    .line 52
    :cond_2
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 53
    .line 54
    .line 55
    move-result-object v5

    .line 56
    iget-object v7, p0, Lcom/google/android/material/carousel/g;->c:Ljava/util/List;

    .line 57
    .line 58
    invoke-interface {v7}, Ljava/util/List;->size()I

    .line 59
    .line 60
    .line 61
    move-result v8

    .line 62
    sub-int/2addr v8, v6

    .line 63
    invoke-static {v4, v2, v8}, LE/a;->b(III)I

    .line 64
    .line 65
    .line 66
    move-result v6

    .line 67
    invoke-interface {v7, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v6

    .line 71
    check-cast v6, Lcom/google/android/material/carousel/f;

    .line 72
    .line 73
    invoke-interface {v1, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    add-int/lit8 v4, v4, 0x1

    .line 77
    .line 78
    :cond_3
    add-int/lit8 v3, v3, 0x1

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_4
    add-int/lit8 p3, p1, -0x1

    .line 82
    .line 83
    move v3, v2

    .line 84
    :goto_3
    if-ltz p3, :cond_9

    .line 85
    .line 86
    if-eqz p4, :cond_5

    .line 87
    .line 88
    sub-int v4, p1, p3

    .line 89
    .line 90
    sub-int/2addr v4, v6

    .line 91
    goto :goto_4

    .line 92
    :cond_5
    move v4, p3

    .line 93
    :goto_4
    int-to-float v7, v4

    .line 94
    mul-float/2addr v7, v0

    .line 95
    if-eqz p4, :cond_6

    .line 96
    .line 97
    move v8, v5

    .line 98
    goto :goto_5

    .line 99
    :cond_6
    move v8, v6

    .line 100
    :goto_5
    int-to-float v8, v8

    .line 101
    mul-float/2addr v7, v8

    .line 102
    int-to-float v8, p2

    .line 103
    iget v9, p0, Lcom/google/android/material/carousel/g;->f:F

    .line 104
    .line 105
    add-float/2addr v8, v9

    .line 106
    cmpg-float v7, v7, v8

    .line 107
    .line 108
    if-ltz v7, :cond_7

    .line 109
    .line 110
    iget-object v7, p0, Lcom/google/android/material/carousel/g;->b:Ljava/util/List;

    .line 111
    .line 112
    invoke-interface {v7}, Ljava/util/List;->size()I

    .line 113
    .line 114
    .line 115
    move-result v7

    .line 116
    if-ge p3, v7, :cond_8

    .line 117
    .line 118
    :cond_7
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 119
    .line 120
    .line 121
    move-result-object v4

    .line 122
    iget-object v7, p0, Lcom/google/android/material/carousel/g;->b:Ljava/util/List;

    .line 123
    .line 124
    invoke-interface {v7}, Ljava/util/List;->size()I

    .line 125
    .line 126
    .line 127
    move-result v8

    .line 128
    sub-int/2addr v8, v6

    .line 129
    invoke-static {v3, v2, v8}, LE/a;->b(III)I

    .line 130
    .line 131
    .line 132
    move-result v8

    .line 133
    invoke-interface {v7, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v7

    .line 137
    check-cast v7, Lcom/google/android/material/carousel/f;

    .line 138
    .line 139
    invoke-interface {v1, v4, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    add-int/lit8 v3, v3, 0x1

    .line 143
    .line 144
    :cond_8
    add-int/lit8 p3, p3, -0x1

    .line 145
    .line 146
    goto :goto_3

    .line 147
    :cond_9
    return-object v1
.end method

.method public j(FFF)Lcom/google/android/material/carousel/f;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/google/android/material/carousel/g;->k(FFFZ)Lcom/google/android/material/carousel/f;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method k(FFFZ)Lcom/google/android/material/carousel/f;
    .locals 5

    .line 1
    iget v0, p0, Lcom/google/android/material/carousel/g;->f:F

    .line 2
    .line 3
    add-float/2addr v0, p2

    .line 4
    iget v1, p0, Lcom/google/android/material/carousel/g;->g:F

    .line 5
    .line 6
    sub-float v1, p3, v1

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/google/android/material/carousel/g;->l()Lcom/google/android/material/carousel/f;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v2}, Lcom/google/android/material/carousel/f;->a()Lcom/google/android/material/carousel/f$c;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    iget v2, v2, Lcom/google/android/material/carousel/f$c;->g:F

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/google/android/material/carousel/g;->h()Lcom/google/android/material/carousel/f;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    invoke-virtual {v3}, Lcom/google/android/material/carousel/f;->h()Lcom/google/android/material/carousel/f$c;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    iget v3, v3, Lcom/google/android/material/carousel/f$c;->h:F

    .line 27
    .line 28
    iget v4, p0, Lcom/google/android/material/carousel/g;->f:F

    .line 29
    .line 30
    cmpl-float v4, v4, v2

    .line 31
    .line 32
    if-nez v4, :cond_0

    .line 33
    .line 34
    add-float/2addr v0, v2

    .line 35
    :cond_0
    iget v2, p0, Lcom/google/android/material/carousel/g;->g:F

    .line 36
    .line 37
    cmpl-float v2, v2, v3

    .line 38
    .line 39
    if-nez v2, :cond_1

    .line 40
    .line 41
    sub-float/2addr v1, v3

    .line 42
    :cond_1
    cmpg-float v2, p1, v0

    .line 43
    .line 44
    const/4 v3, 0x0

    .line 45
    const/high16 v4, 0x3f800000    # 1.0f

    .line 46
    .line 47
    if-gez v2, :cond_2

    .line 48
    .line 49
    invoke-static {v4, v3, p2, v0, p1}, LY2/a;->b(FFFFF)F

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    iget-object p2, p0, Lcom/google/android/material/carousel/g;->b:Ljava/util/List;

    .line 54
    .line 55
    iget-object p3, p0, Lcom/google/android/material/carousel/g;->d:[F

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    cmpl-float p2, p1, v1

    .line 59
    .line 60
    if-lez p2, :cond_4

    .line 61
    .line 62
    invoke-static {v3, v4, v1, p3, p1}, LY2/a;->b(FFFFF)F

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    iget-object p2, p0, Lcom/google/android/material/carousel/g;->c:Ljava/util/List;

    .line 67
    .line 68
    iget-object p3, p0, Lcom/google/android/material/carousel/g;->e:[F

    .line 69
    .line 70
    :goto_0
    if-eqz p4, :cond_3

    .line 71
    .line 72
    invoke-direct {p0, p2, p1, p3}, Lcom/google/android/material/carousel/g;->a(Ljava/util/List;F[F)Lcom/google/android/material/carousel/f;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    return-object p0

    .line 77
    :cond_3
    invoke-static {p2, p1, p3}, Lcom/google/android/material/carousel/g;->s(Ljava/util/List;F[F)Lcom/google/android/material/carousel/f;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    return-object p0

    .line 82
    :cond_4
    iget-object p0, p0, Lcom/google/android/material/carousel/g;->a:Lcom/google/android/material/carousel/f;

    .line 83
    .line 84
    return-object p0
.end method

.method l()Lcom/google/android/material/carousel/f;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/material/carousel/g;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit8 v0, v0, -0x1

    .line 8
    .line 9
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/google/android/material/carousel/f;

    .line 14
    .line 15
    return-object p0
.end method
