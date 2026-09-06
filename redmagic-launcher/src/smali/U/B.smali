.class public final LU/B;
.super Ljava/lang/Object;
.source "SvgPathParser.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LU/B$a;,
        LU/B$b;
    }
.end annotation


# static fields
.field public static final d:LU/B$b;


# instance fields
.field private final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "LU/c;",
            ">;"
        }
    .end annotation
.end field

.field private final b:J

.field private c:LU/B$a;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LU/B$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, LU/B$b;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LU/B;->d:LU/B$b;

    .line 8
    .line 9
    return-void
.end method

.method private constructor <init>(J)V
    .locals 10

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, LU/B;->a:Ljava/util/List;

    .line 4
    iput-wide p1, p0, LU/B;->b:J

    .line 5
    new-instance v1, LU/B$a;

    const/4 p1, 0x0

    new-array v4, p1, [F

    const/16 v8, 0x10

    const/4 v9, 0x0

    const/16 v2, 0x49

    const/4 v3, 0x0

    const/4 v5, 0x0

    const-wide/16 v6, 0x0

    invoke-direct/range {v1 .. v9}, LU/B$a;-><init>(CZ[FIJILkotlin/jvm/internal/j;)V

    iput-object v1, p0, LU/B;->c:LU/B$a;

    return-void
.end method

.method public synthetic constructor <init>(JLkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, LU/B;-><init>(J)V

    return-void
.end method

.method public static final synthetic a(LU/B;JJJJ)LU/c;
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p8}, LU/B;->f(JJJJ)LU/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic b(LU/B;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, LU/B;->a:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic c(LU/B;)J
    .locals 2

    .line 1
    invoke-direct {p0}, LU/B;->g()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public static final synthetic d(LU/B;JJ)LU/c;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, LU/B;->i(JJ)LU/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic e(LU/B;LU/B$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LU/B;->l(LU/B$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final f(JJJJ)LU/c;
    .locals 2

    .line 1
    new-instance p0, LU/c;

    .line 2
    .line 3
    invoke-static {p1, p2}, LU/r;->h(J)F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {p1, p2}, LU/r;->i(J)F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-static {p3, p4}, LU/r;->h(J)F

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    invoke-static {p3, p4}, LU/r;->i(J)F

    .line 16
    .line 17
    .line 18
    move-result p3

    .line 19
    invoke-static {p5, p6}, LU/r;->h(J)F

    .line 20
    .line 21
    .line 22
    move-result p4

    .line 23
    invoke-static {p5, p6}, LU/r;->i(J)F

    .line 24
    .line 25
    .line 26
    move-result p5

    .line 27
    invoke-static {p7, p8}, LU/r;->h(J)F

    .line 28
    .line 29
    .line 30
    move-result p6

    .line 31
    invoke-static {p7, p8}, LU/r;->i(J)F

    .line 32
    .line 33
    .line 34
    move-result p7

    .line 35
    const/16 p8, 0x8

    .line 36
    .line 37
    new-array p8, p8, [F

    .line 38
    .line 39
    const/4 v1, 0x0

    .line 40
    aput v0, p8, v1

    .line 41
    .line 42
    const/4 v0, 0x1

    .line 43
    aput p1, p8, v0

    .line 44
    .line 45
    const/4 p1, 0x2

    .line 46
    aput p2, p8, p1

    .line 47
    .line 48
    const/4 p1, 0x3

    .line 49
    aput p3, p8, p1

    .line 50
    .line 51
    const/4 p1, 0x4

    .line 52
    aput p4, p8, p1

    .line 53
    .line 54
    const/4 p1, 0x5

    .line 55
    aput p5, p8, p1

    .line 56
    .line 57
    const/4 p1, 0x6

    .line 58
    aput p6, p8, p1

    .line 59
    .line 60
    const/4 p1, 0x7

    .line 61
    aput p7, p8, p1

    .line 62
    .line 63
    invoke-direct {p0, p8}, LU/c;-><init>([F)V

    .line 64
    .line 65
    .line 66
    return-object p0
.end method

.method private final g()J
    .locals 2

    .line 1
    iget-object v0, p0, LU/B;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Li4/m;->o0(Ljava/util/List;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, LU/c;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, LU/c;->d()F

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-virtual {v0}, LU/c;->e()F

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-static {p0, v0}, Lo/e;->b(FF)J

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    return-wide v0

    .line 24
    :cond_0
    iget-wide v0, p0, LU/B;->b:J

    .line 25
    .line 26
    return-wide v0
.end method

.method private final h()J
    .locals 6

    .line 1
    invoke-direct {p0}, LU/B;->g()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-direct {p0}, LU/B;->g()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    iget-object v4, p0, LU/B;->a:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {v4}, Li4/m;->m0(Ljava/util/List;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    check-cast v4, LU/c;

    .line 16
    .line 17
    invoke-virtual {v4}, LU/c;->h()F

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    iget-object p0, p0, LU/B;->a:Ljava/util/List;

    .line 22
    .line 23
    invoke-static {p0}, Li4/m;->m0(Ljava/util/List;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, LU/c;

    .line 28
    .line 29
    invoke-virtual {p0}, LU/c;->i()F

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    invoke-static {v4, p0}, Lo/e;->b(FF)J

    .line 34
    .line 35
    .line 36
    move-result-wide v4

    .line 37
    invoke-static {v2, v3, v4, v5}, LU/r;->k(JJ)J

    .line 38
    .line 39
    .line 40
    move-result-wide v2

    .line 41
    invoke-static {v0, v1, v2, v3}, LU/r;->l(JJ)J

    .line 42
    .line 43
    .line 44
    move-result-wide v0

    .line 45
    return-wide v0
.end method

.method private final i(JJ)LU/c;
    .locals 1

    .line 1
    sget-object p0, LU/c;->b:LU/c$a;

    .line 2
    .line 3
    invoke-static {p1, p2}, LU/r;->h(J)F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {p1, p2}, LU/r;->i(J)F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-static {p3, p4}, LU/r;->h(J)F

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    invoke-static {p3, p4}, LU/r;->i(J)F

    .line 16
    .line 17
    .line 18
    move-result p3

    .line 19
    invoke-virtual {p0, v0, p1, p2, p3}, LU/c$a;->c(FFFF)LU/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method private final j(LU/B$a;)V
    .locals 13

    .line 1
    const/4 v0, 0x5

    .line 2
    const/4 v1, 0x6

    .line 3
    invoke-virtual {p1, v0, v1}, LU/B$a;->p(II)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iget-object v2, p0, LU/B;->a:Ljava/util/List;

    .line 8
    .line 9
    sget-object v3, LU/a;->a:LU/a$a;

    .line 10
    .line 11
    invoke-direct {p0}, LU/B;->g()J

    .line 12
    .line 13
    .line 14
    move-result-wide v4

    .line 15
    invoke-static {v4, v5}, LU/r;->h(J)F

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    invoke-direct {p0}, LU/B;->g()J

    .line 20
    .line 21
    .line 22
    move-result-wide v5

    .line 23
    invoke-static {v5, v6}, LU/r;->i(J)F

    .line 24
    .line 25
    .line 26
    move-result v5

    .line 27
    invoke-static {v0, v1}, LU/r;->h(J)F

    .line 28
    .line 29
    .line 30
    move-result v6

    .line 31
    invoke-static {v0, v1}, LU/r;->i(J)F

    .line 32
    .line 33
    .line 34
    move-result v7

    .line 35
    const/4 p0, 0x0

    .line 36
    invoke-virtual {p1, p0}, LU/B$a;->d(I)F

    .line 37
    .line 38
    .line 39
    move-result v8

    .line 40
    const/4 v0, 0x1

    .line 41
    invoke-virtual {p1, v0}, LU/B$a;->d(I)F

    .line 42
    .line 43
    .line 44
    move-result v9

    .line 45
    const/4 v1, 0x2

    .line 46
    invoke-virtual {p1, v1}, LU/B$a;->d(I)F

    .line 47
    .line 48
    .line 49
    move-result v10

    .line 50
    const/4 v1, 0x3

    .line 51
    invoke-virtual {p1, v1}, LU/B$a;->d(I)F

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    const/4 v11, 0x0

    .line 56
    cmpg-float v1, v1, v11

    .line 57
    .line 58
    if-nez v1, :cond_0

    .line 59
    .line 60
    move v1, v0

    .line 61
    goto :goto_0

    .line 62
    :cond_0
    move v1, p0

    .line 63
    :goto_0
    xor-int/2addr v1, v0

    .line 64
    const/4 v12, 0x4

    .line 65
    invoke-virtual {p1, v12}, LU/B$a;->d(I)F

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    cmpg-float p1, p1, v11

    .line 70
    .line 71
    if-nez p1, :cond_1

    .line 72
    .line 73
    move p0, v0

    .line 74
    :cond_1
    xor-int/lit8 v12, p0, 0x1

    .line 75
    .line 76
    move v11, v1

    .line 77
    invoke-virtual/range {v3 .. v12}, LU/a$a;->b(FFFFFFFZZ)Ljava/util/List;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-interface {v2, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method private final k(LU/B$a;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, LU/B$a;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0, p1}, LU/B;->n(LU/B$a;)V

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {p1}, LU/B$a;->l()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-direct {p0, p1}, LU/B;->m(LU/B$a;)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    invoke-virtual {p1}, LU/B$a;->i()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    invoke-direct {p0, p1}, LU/B;->j(LU/B$a;)V

    .line 28
    .line 29
    .line 30
    :cond_2
    :goto_0
    iput-object p1, p0, LU/B;->c:LU/B$a;

    .line 31
    .line 32
    return-void
.end method

.method private final l(LU/B$a;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, LU/B$a;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, LU/B;->a:Ljava/util/List;

    .line 8
    .line 9
    invoke-direct {p0}, LU/B;->g()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    iget-wide v2, p0, LU/B;->b:J

    .line 14
    .line 15
    invoke-direct {p0, v0, v1, v2, v3}, LU/B;->i(JJ)LU/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-virtual {p1}, LU/B$a;->f()[F

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, Li4/g;->K([F)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-virtual {p1}, LU/B$a;->g()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-lez v1, :cond_2

    .line 36
    .line 37
    const/4 v2, 0x0

    .line 38
    invoke-static {v2, v0, v1}, Lo4/c;->b(III)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-ltz v0, :cond_1

    .line 43
    .line 44
    :goto_0
    invoke-direct {p0}, LU/B;->g()J

    .line 45
    .line 46
    .line 47
    move-result-wide v3

    .line 48
    invoke-virtual {p1, v2, v3, v4}, LU/B$a;->c(IJ)LU/B$a;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-direct {p0, v3}, LU/B;->k(LU/B$a;)V

    .line 53
    .line 54
    .line 55
    if-eq v2, v0, :cond_1

    .line 56
    .line 57
    add-int/2addr v2, v1

    .line 58
    goto :goto_0

    .line 59
    :cond_1
    return-void

    .line 60
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 61
    .line 62
    new-instance p1, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 65
    .line 66
    .line 67
    const-string v0, "Step must be positive, was: "

    .line 68
    .line 69
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    const/16 v0, 0x2e

    .line 76
    .line 77
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    throw p0
.end method

.method private final m(LU/B$a;)V
    .locals 7

    .line 1
    new-instance v0, LU/B$c;

    .line 2
    .line 3
    invoke-direct {v0, p0}, LU/B$c;-><init>(LU/B;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, LU/B$a;->e()C

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/16 v2, 0x63

    .line 11
    .line 12
    const/4 v3, 0x3

    .line 13
    const/4 v4, 0x2

    .line 14
    const/4 v5, 0x1

    .line 15
    const/4 v6, 0x0

    .line 16
    if-eq v1, v2, :cond_5

    .line 17
    .line 18
    const/16 v2, 0x71

    .line 19
    .line 20
    if-eq v1, v2, :cond_4

    .line 21
    .line 22
    const/16 v2, 0x73

    .line 23
    .line 24
    if-eq v1, v2, :cond_2

    .line 25
    .line 26
    const/16 v2, 0x74

    .line 27
    .line 28
    if-eq v1, v2, :cond_0

    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iget-object v1, p0, LU/B;->c:LU/B$a;

    .line 32
    .line 33
    invoke-virtual {v1}, LU/B$a;->n()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    invoke-direct {p0}, LU/B;->h()J

    .line 40
    .line 41
    .line 42
    move-result-wide v1

    .line 43
    goto :goto_0

    .line 44
    :cond_1
    invoke-direct {p0}, LU/B;->g()J

    .line 45
    .line 46
    .line 47
    move-result-wide v1

    .line 48
    :goto_0
    invoke-static {v1, v2}, Lo/e;->a(J)Lo/e;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {v1, v2}, Lo/e;->a(J)Lo/e;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {p1, v6, v5}, LU/B$a;->p(II)J

    .line 57
    .line 58
    .line 59
    move-result-wide v2

    .line 60
    invoke-static {v2, v3}, Lo/e;->a(J)Lo/e;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-interface {v0, p0, v1, p1}, Lu4/q;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_2
    iget-object v1, p0, LU/B;->c:LU/B$a;

    .line 69
    .line 70
    invoke-virtual {v1}, LU/B$a;->j()Z

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-eqz v1, :cond_3

    .line 75
    .line 76
    invoke-direct {p0}, LU/B;->h()J

    .line 77
    .line 78
    .line 79
    move-result-wide v1

    .line 80
    goto :goto_1

    .line 81
    :cond_3
    invoke-direct {p0}, LU/B;->g()J

    .line 82
    .line 83
    .line 84
    move-result-wide v1

    .line 85
    :goto_1
    invoke-static {v1, v2}, Lo/e;->a(J)Lo/e;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {p1, v6, v5}, LU/B$a;->p(II)J

    .line 90
    .line 91
    .line 92
    move-result-wide v1

    .line 93
    invoke-static {v1, v2}, Lo/e;->a(J)Lo/e;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-virtual {p1, v4, v3}, LU/B$a;->p(II)J

    .line 98
    .line 99
    .line 100
    move-result-wide v2

    .line 101
    invoke-static {v2, v3}, Lo/e;->a(J)Lo/e;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-interface {v0, p0, v1, p1}, Lu4/q;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_4
    invoke-virtual {p1, v6, v5}, LU/B$a;->p(II)J

    .line 110
    .line 111
    .line 112
    move-result-wide v1

    .line 113
    invoke-static {v1, v2}, Lo/e;->a(J)Lo/e;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-virtual {p1, v6, v5}, LU/B$a;->p(II)J

    .line 118
    .line 119
    .line 120
    move-result-wide v1

    .line 121
    invoke-static {v1, v2}, Lo/e;->a(J)Lo/e;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    invoke-virtual {p1, v4, v3}, LU/B$a;->p(II)J

    .line 126
    .line 127
    .line 128
    move-result-wide v2

    .line 129
    invoke-static {v2, v3}, Lo/e;->a(J)Lo/e;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    invoke-interface {v0, p0, v1, p1}, Lu4/q;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    return-void

    .line 137
    :cond_5
    invoke-virtual {p1, v6, v5}, LU/B$a;->p(II)J

    .line 138
    .line 139
    .line 140
    move-result-wide v1

    .line 141
    invoke-static {v1, v2}, Lo/e;->a(J)Lo/e;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    invoke-virtual {p1, v4, v3}, LU/B$a;->p(II)J

    .line 146
    .line 147
    .line 148
    move-result-wide v1

    .line 149
    invoke-static {v1, v2}, Lo/e;->a(J)Lo/e;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    const/4 v2, 0x4

    .line 154
    const/4 v3, 0x5

    .line 155
    invoke-virtual {p1, v2, v3}, LU/B$a;->p(II)J

    .line 156
    .line 157
    .line 158
    move-result-wide v2

    .line 159
    invoke-static {v2, v3}, Lo/e;->a(J)Lo/e;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    invoke-interface {v0, p0, v1, p1}, Lu4/q;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    return-void
.end method

.method private final n(LU/B$a;)V
    .locals 5

    .line 1
    new-instance v0, LU/B$d;

    .line 2
    .line 3
    invoke-direct {v0, p0}, LU/B$d;-><init>(LU/B;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, LU/B$a;->e()C

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    const/16 v1, 0x68

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    if-eq p0, v1, :cond_2

    .line 14
    .line 15
    const/16 v1, 0x6c

    .line 16
    .line 17
    if-eq p0, v1, :cond_1

    .line 18
    .line 19
    const/16 v1, 0x76

    .line 20
    .line 21
    if-eq p0, v1, :cond_0

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-virtual {p1}, LU/B$a;->h()J

    .line 25
    .line 26
    .line 27
    move-result-wide v3

    .line 28
    invoke-static {v3, v4}, LU/r;->h(J)F

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    invoke-virtual {p1, v2}, LU/B$a;->q(I)F

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    invoke-static {p0, p1}, Lo/e;->b(FF)J

    .line 37
    .line 38
    .line 39
    move-result-wide p0

    .line 40
    invoke-static {p0, p1}, Lo/e;->a(J)Lo/e;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-interface {v0, p0}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    const/4 p0, 0x1

    .line 49
    invoke-virtual {p1, v2, p0}, LU/B$a;->p(II)J

    .line 50
    .line 51
    .line 52
    move-result-wide p0

    .line 53
    invoke-static {p0, p1}, Lo/e;->a(J)Lo/e;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-interface {v0, p0}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_2
    invoke-virtual {p1, v2}, LU/B$a;->o(I)F

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    invoke-virtual {p1}, LU/B$a;->h()J

    .line 66
    .line 67
    .line 68
    move-result-wide v1

    .line 69
    invoke-static {v1, v2}, LU/r;->i(J)F

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    invoke-static {p0, p1}, Lo/e;->b(FF)J

    .line 74
    .line 75
    .line 76
    move-result-wide p0

    .line 77
    invoke-static {p0, p1}, Lo/e;->a(J)Lo/e;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-interface {v0, p0}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    return-void
.end method
