.class public final LU/x;
.super Ljava/lang/Object;
.source "RoundedPolygon.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LU/x$a;
    }
.end annotation


# static fields
.field public static final d:LU/x$a;


# instance fields
.field private final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "LU/g;",
            ">;"
        }
    .end annotation
.end field

.field private final b:J

.field private final c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "LU/c;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LU/x$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, LU/x$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LU/x;->d:LU/x$a;

    .line 8
    .line 9
    return-void
.end method

.method private constructor <init>(Ljava/util/List;J)V
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "LU/g;",
            ">;J)V"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const-string v2, "features"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v1, v0, LU/x;->a:Ljava/util/List;

    move-wide/from16 v2, p2

    iput-wide v2, v0, LU/x;->b:J

    .line 3
    invoke-static {}, Li4/m;->c()Ljava/util/List;

    move-result-object v2

    .line 4
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x0

    if-lez v3, :cond_0

    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, LU/g;

    invoke-virtual {v3}, LU/g;->a()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    const/4 v7, 0x3

    if-ne v3, v7, :cond_0

    .line 5
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, LU/g;

    invoke-virtual {v3}, LU/g;->a()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, LU/c;

    const/high16 v7, 0x3f000000    # 0.5f

    .line 6
    invoke-virtual {v3, v7}, LU/c;->m(F)Lh4/l;

    move-result-object v3

    invoke-virtual {v3}, Lh4/l;->a()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, LU/c;

    invoke-virtual {v3}, Lh4/l;->b()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, LU/c;

    const/4 v8, 0x2

    .line 7
    new-array v9, v8, [LU/c;

    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, LU/g;

    invoke-virtual {v10}, LU/g;->a()Ljava/util/List;

    move-result-object v10

    invoke-interface {v10, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    aput-object v10, v9, v5

    aput-object v7, v9, v4

    invoke-static {v9}, Li4/m;->n([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    .line 8
    new-array v9, v8, [LU/c;

    aput-object v3, v9, v5

    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, LU/g;

    invoke-virtual {v3}, LU/g;->a()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v9, v4

    invoke-static {v9}, Li4/m;->n([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    goto :goto_0

    :cond_0
    move-object v3, v6

    move-object v7, v3

    .line 9
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ltz v1, :cond_a

    move v9, v5

    move-object v8, v6

    :goto_1
    if-nez v9, :cond_1

    if-eqz v3, :cond_1

    move-object v10, v3

    goto :goto_2

    .line 10
    :cond_1
    iget-object v10, v0, LU/x;->a:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    if-ne v9, v10, :cond_4

    if-nez v7, :cond_3

    :cond_2
    move-object v1, v6

    move-object v6, v8

    goto/16 :goto_5

    :cond_3
    move-object v10, v7

    goto :goto_2

    .line 11
    :cond_4
    iget-object v10, v0, LU/x;->a:Ljava/util/List;

    invoke-interface {v10, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, LU/g;

    invoke-virtual {v10}, LU/g;->a()Ljava/util/List;

    move-result-object v10

    .line 12
    :goto_2
    invoke-interface {v10}, Ljava/util/Collection;->size()I

    move-result v11

    move v12, v5

    :goto_3
    if-ge v12, v11, :cond_9

    .line 13
    invoke-interface {v10, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, LU/c;

    .line 14
    invoke-virtual {v13}, LU/c;->o()Z

    move-result v14

    if-nez v14, :cond_7

    if-eqz v8, :cond_5

    .line 15
    invoke-interface {v2, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_5
    if-nez v6, :cond_6

    move-object v6, v13

    move-object v8, v6

    goto :goto_4

    :cond_6
    move-object v8, v13

    goto :goto_4

    :cond_7
    if-eqz v8, :cond_8

    .line 16
    new-instance v14, LU/c;

    invoke-virtual {v8}, LU/c;->j()[F

    move-result-object v8

    array-length v15, v8

    invoke-static {v8, v15}, Ljava/util/Arrays;->copyOf([FI)[F

    move-result-object v8

    const-string v15, "copyOf(...)"

    invoke-static {v8, v15}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v14, v8}, LU/c;-><init>([F)V

    .line 17
    invoke-virtual {v14}, LU/c;->j()[F

    move-result-object v8

    const/4 v15, 0x6

    invoke-virtual {v13}, LU/c;->d()F

    move-result v16

    aput v16, v8, v15

    .line 18
    invoke-virtual {v14}, LU/c;->j()[F

    move-result-object v8

    const/4 v15, 0x7

    invoke-virtual {v13}, LU/c;->e()F

    move-result v13

    aput v13, v8, v15

    move-object v8, v14

    :cond_8
    :goto_4
    add-int/lit8 v12, v12, 0x1

    goto :goto_3

    :cond_9
    if-eq v9, v1, :cond_2

    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    :cond_a
    move-object v1, v6

    :goto_5
    if-eqz v6, :cond_b

    if-eqz v1, :cond_b

    .line 19
    invoke-virtual {v6}, LU/c;->b()F

    move-result v7

    .line 20
    invoke-virtual {v6}, LU/c;->c()F

    move-result v8

    .line 21
    invoke-virtual {v6}, LU/c;->f()F

    move-result v9

    .line 22
    invoke-virtual {v6}, LU/c;->g()F

    move-result v10

    .line 23
    invoke-virtual {v6}, LU/c;->h()F

    move-result v11

    .line 24
    invoke-virtual {v6}, LU/c;->i()F

    move-result v12

    .line 25
    invoke-virtual {v1}, LU/c;->b()F

    move-result v13

    .line 26
    invoke-virtual {v1}, LU/c;->c()F

    move-result v14

    .line 27
    invoke-static/range {v7 .. v14}, LU/d;->a(FFFFFFFF)LU/c;

    move-result-object v1

    .line 28
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_6

    .line 29
    :cond_b
    invoke-virtual {v0}, LU/x;->b()F

    move-result v6

    .line 30
    invoke-virtual {v0}, LU/x;->c()F

    move-result v7

    .line 31
    invoke-virtual {v0}, LU/x;->b()F

    move-result v8

    .line 32
    invoke-virtual {v0}, LU/x;->c()F

    move-result v9

    .line 33
    invoke-virtual {v0}, LU/x;->b()F

    move-result v10

    .line 34
    invoke-virtual {v0}, LU/x;->c()F

    move-result v11

    .line 35
    invoke-virtual {v0}, LU/x;->b()F

    move-result v12

    .line 36
    invoke-virtual {v0}, LU/x;->c()F

    move-result v13

    .line 37
    invoke-static/range {v6 .. v13}, LU/d;->a(FFFFFFFF)LU/c;

    move-result-object v1

    .line 38
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 39
    :goto_6
    invoke-static {v2}, Li4/m;->a(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, LU/x;->c:Ljava/util/List;

    .line 40
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    sub-int/2addr v2, v4

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    .line 41
    invoke-interface {v1}, Ljava/util/Collection;->size()I

    move-result v1

    :goto_7
    if-ge v5, v1, :cond_d

    .line 42
    iget-object v3, v0, LU/x;->c:Ljava/util/List;

    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, LU/c;

    .line 43
    invoke-virtual {v3}, LU/c;->b()F

    move-result v4

    check-cast v2, LU/c;

    invoke-virtual {v2}, LU/c;->d()F

    move-result v6

    sub-float/2addr v4, v6

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    const v6, 0x38d1b717    # 1.0E-4f

    cmpl-float v4, v4, v6

    if-gtz v4, :cond_c

    .line 44
    invoke-virtual {v3}, LU/c;->c()F

    move-result v4

    invoke-virtual {v2}, LU/c;->e()F

    move-result v2

    sub-float/2addr v4, v2

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v2

    cmpl-float v2, v2, v6

    if-gtz v2, :cond_c

    add-int/lit8 v5, v5, 0x1

    move-object v2, v3

    goto :goto_7

    .line 45
    :cond_c
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 46
    const-string v1, "RoundedPolygon must be contiguous, with the anchor points of all curves matching the anchor points of the preceding and succeeding cubics"

    .line 47
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_d
    return-void
.end method

.method public synthetic constructor <init>(Ljava/util/List;JLkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, LU/x;-><init>(Ljava/util/List;J)V

    return-void
.end method


# virtual methods
.method public final a()J
    .locals 2

    .line 1
    iget-wide v0, p0, LU/x;->b:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final b()F
    .locals 2

    .line 1
    iget-wide v0, p0, LU/x;->b:J

    .line 2
    .line 3
    invoke-static {v0, v1}, LU/r;->h(J)F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final c()F
    .locals 2

    .line 1
    iget-wide v0, p0, LU/x;->b:J

    .line 2
    .line 3
    invoke-static {v0, v1}, LU/r;->i(J)F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final d()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "LU/c;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, LU/x;->c:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "LU/g;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, LU/x;->a:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    if-ne p0, p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    instance-of v0, p1, LU/x;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_1
    iget-object p0, p0, LU/x;->a:Ljava/util/List;

    .line 12
    .line 13
    check-cast p1, LU/x;

    .line 14
    .line 15
    iget-object p1, p1, LU/x;->a:Ljava/util/List;

    .line 16
    .line 17
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public final f(LU/s;)LU/x;
    .locals 6

    .line 1
    const-string v0, "f"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-wide v0, p0, LU/x;->b:J

    .line 7
    .line 8
    invoke-static {v0, v1, p1}, LU/r;->n(JLU/s;)J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    invoke-static {}, Li4/m;->c()Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    iget-object v3, p0, LU/x;->a:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v3}, Ljava/util/Collection;->size()I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    const/4 v4, 0x0

    .line 23
    :goto_0
    if-ge v4, v3, :cond_0

    .line 24
    .line 25
    iget-object v5, p0, LU/x;->a:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    check-cast v5, LU/g;

    .line 32
    .line 33
    invoke-virtual {v5, p1}, LU/g;->c(LU/s;)LU/g;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    add-int/lit8 v4, v4, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    invoke-static {v2}, Li4/m;->a(Ljava/util/List;)Ljava/util/List;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    new-instance p1, LU/x;

    .line 48
    .line 49
    const/4 v2, 0x0

    .line 50
    invoke-direct {p1, p0, v0, v1, v2}, LU/x;-><init>(Ljava/util/List;JLkotlin/jvm/internal/j;)V

    .line 51
    .line 52
    .line 53
    return-object p1
.end method

.method public hashCode()I
    .locals 0

    .line 1
    iget-object p0, p0, LU/x;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 11

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "[RoundedPolygon. Cubics = "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v2, p0, LU/x;->c:Ljava/util/List;

    .line 12
    .line 13
    const/16 v9, 0x3f

    .line 14
    .line 15
    const/4 v10, 0x0

    .line 16
    const/4 v3, 0x0

    .line 17
    const/4 v4, 0x0

    .line 18
    const/4 v5, 0x0

    .line 19
    const/4 v6, 0x0

    .line 20
    const/4 v7, 0x0

    .line 21
    const/4 v8, 0x0

    .line 22
    invoke-static/range {v2 .. v10}, Li4/m;->k0(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lu4/l;ILjava/lang/Object;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v1, " || Features = "

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-object v2, p0, LU/x;->a:Ljava/util/List;

    .line 35
    .line 36
    invoke-static/range {v2 .. v10}, Li4/m;->k0(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lu4/l;ILjava/lang/Object;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, " || Center = ("

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, LU/x;->b()F

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string v1, ", "

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, LU/x;->c()F

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string p0, ")]"

    .line 68
    .line 69
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    return-object p0
.end method
