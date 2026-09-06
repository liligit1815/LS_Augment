.class public final LU/u$a;
.super Ljava/lang/Object;
.source "PolygonValidation.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LU/u;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LU/u$a;-><init>()V

    return-void
.end method

.method private final b(LU/x;)LU/x;
    .locals 3

    .line 1
    invoke-static {}, Li4/m;->c()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, LU/x;->e()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Li4/m;->a0(Ljava/util/List;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, LU/g;

    .line 14
    .line 15
    invoke-virtual {v0}, LU/g;->b()LU/g;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, LU/x;->e()Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Li4/m;->l(Ljava/util/List;)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    :goto_0
    if-lez v0, :cond_0

    .line 31
    .line 32
    invoke-virtual {p1}, LU/x;->e()Ljava/util/List;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, LU/g;

    .line 41
    .line 42
    invoke-virtual {v1}, LU/g;->b()LU/g;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    add-int/lit8 v0, v0, -0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    invoke-static {p0}, Li4/m;->a(Ljava/util/List;)Ljava/util/List;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    new-instance v0, LU/x;

    .line 57
    .line 58
    invoke-virtual {p1}, LU/x;->a()J

    .line 59
    .line 60
    .line 61
    move-result-wide v1

    .line 62
    const/4 p1, 0x0

    .line 63
    invoke-direct {v0, p0, v1, v2, p1}, LU/x;-><init>(Ljava/util/List;JLkotlin/jvm/internal/j;)V

    .line 64
    .line 65
    .line 66
    return-object v0
.end method

.method private final c(LU/x;)Z
    .locals 7

    .line 1
    invoke-virtual {p1}, LU/x;->d()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljava/util/Collection;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/4 v0, 0x0

    .line 10
    const/4 v1, 0x0

    .line 11
    move v3, v0

    .line 12
    move v2, v1

    .line 13
    :goto_0
    if-ge v2, p0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, LU/x;->d()Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    check-cast v4, LU/c;

    .line 24
    .line 25
    invoke-virtual {v4}, LU/c;->d()F

    .line 26
    .line 27
    .line 28
    move-result v5

    .line 29
    invoke-virtual {v4}, LU/c;->b()F

    .line 30
    .line 31
    .line 32
    move-result v6

    .line 33
    sub-float/2addr v5, v6

    .line 34
    invoke-virtual {v4}, LU/c;->e()F

    .line 35
    .line 36
    .line 37
    move-result v6

    .line 38
    invoke-virtual {v4}, LU/c;->c()F

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    add-float/2addr v6, v4

    .line 43
    mul-float/2addr v5, v6

    .line 44
    add-float/2addr v3, v5

    .line 45
    add-int/lit8 v2, v2, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    cmpg-float p0, v3, v0

    .line 49
    .line 50
    if-gez p0, :cond_1

    .line 51
    .line 52
    const/4 p0, 0x1

    .line 53
    return p0

    .line 54
    :cond_1
    return v1
.end method


# virtual methods
.method public final a(LU/x;)LU/x;
    .locals 1

    .line 1
    const-string v0, "polygon"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1}, LU/u$a;->c(LU/x;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    return-object p1

    .line 13
    :cond_0
    invoke-direct {p0, p1}, LU/u$a;->b(LU/x;)LU/x;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method
