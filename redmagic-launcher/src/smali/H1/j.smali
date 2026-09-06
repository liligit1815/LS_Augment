.class public final LH1/j;
.super Ljava/lang/Object;
.source "ResponsiveSpec.kt"

# interfaces
.implements LH1/g;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LH1/j$a;,
        LH1/j$b;
    }
.end annotation


# static fields
.field public static final h:LH1/j$a;


# instance fields
.field private final a:I

.field private final b:LH1/j$b;

.field private final c:LH1/j$a$a;

.field private final d:LH1/q;

.field private final e:LH1/q;

.field private final f:LH1/q;

.field private final g:LH1/q;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LH1/j$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, LH1/j$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LH1/j;->h:LH1/j$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(ILH1/j$b;LH1/j$a$a;LH1/q;LH1/q;LH1/q;LH1/q;)V
    .locals 1

    const-string v0, "dimensionType"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "specType"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "startPadding"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "endPadding"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "gutter"

    invoke-static {p6, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "cellSize"

    invoke-static {p7, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput p1, p0, LH1/j;->a:I

    .line 3
    iput-object p2, p0, LH1/j;->b:LH1/j$b;

    .line 4
    iput-object p3, p0, LH1/j;->c:LH1/j$a$a;

    .line 5
    iput-object p4, p0, LH1/j;->d:LH1/q;

    .line 6
    iput-object p5, p0, LH1/j;->e:LH1/q;

    .line 7
    iput-object p6, p0, LH1/j;->f:LH1/q;

    .line 8
    iput-object p7, p0, LH1/j;->g:LH1/q;

    .line 9
    invoke-virtual {p0}, LH1/j;->i()Z

    move-result p1

    if-eqz p1, :cond_0

    return-void

    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "Invalid ResponsiveSpec found. "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public constructor <init>(LH1/j$a$a;Landroid/content/res/TypedArray;Ljava/util/Map;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LH1/j$a$a;",
            "Landroid/content/res/TypedArray;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "LH1/q;",
            ">;)V"
        }
    .end annotation

    const-string v0, "responsiveSpecType"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "attrs"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "specs"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 10
    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    .line 11
    invoke-static {}, LH1/j$b;->c()Ln4/a;

    move-result-object v0

    .line 12
    sget-object v2, LH1/j$b;->g:LH1/j$b;

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    .line 13
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p2

    .line 14
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    move-object v4, p2

    check-cast v4, LH1/j$b;

    .line 15
    const-string p2, "startPadding"

    invoke-static {p3, p2}, LH1/o;->a(Ljava/util/Map;Ljava/lang/String;)LH1/q;

    move-result-object v6

    .line 16
    const-string p2, "endPadding"

    invoke-static {p3, p2}, LH1/o;->a(Ljava/util/Map;Ljava/lang/String;)LH1/q;

    move-result-object v7

    .line 17
    const-string p2, "gutter"

    invoke-static {p3, p2}, LH1/o;->a(Ljava/util/Map;Ljava/lang/String;)LH1/q;

    move-result-object v8

    .line 18
    const-string p2, "cellSize"

    invoke-static {p3, p2}, LH1/o;->a(Ljava/util/Map;Ljava/lang/String;)LH1/q;

    move-result-object v9

    move-object v2, p0

    move-object v5, p1

    .line 19
    invoke-direct/range {v2 .. v9}, LH1/j;-><init>(ILH1/j$b;LH1/j$a$a;LH1/q;LH1/q;LH1/q;LH1/q;)V

    return-void
.end method

.method private final d()Z
    .locals 1

    .line 1
    iget-object v0, p0, LH1/j;->d:LH1/q;

    .line 2
    .line 3
    invoke-virtual {v0}, LH1/q;->i()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, LH1/j;->e:LH1/q;

    .line 10
    .line 11
    invoke-virtual {v0}, LH1/q;->i()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, LH1/j;->f:LH1/q;

    .line 18
    .line 19
    invoke-virtual {v0}, LH1/q;->i()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, LH1/j;->g:LH1/q;

    .line 26
    .line 27
    invoke-virtual {p0}, LH1/q;->i()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    return p0
.end method

.method private final j()Z
    .locals 2

    .line 1
    iget-object v0, p0, LH1/j;->d:LH1/q;

    .line 2
    .line 3
    invoke-virtual {v0}, LH1/q;->e()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, LH1/j;->e:LH1/q;

    .line 8
    .line 9
    invoke-virtual {v1}, LH1/q;->e()F

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    add-float/2addr v0, v1

    .line 14
    iget-object v1, p0, LH1/j;->f:LH1/q;

    .line 15
    .line 16
    invoke-virtual {v1}, LH1/q;->e()F

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    add-float/2addr v0, v1

    .line 21
    iget-object p0, p0, LH1/j;->g:LH1/q;

    .line 22
    .line 23
    invoke-virtual {p0}, LH1/q;->e()F

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    add-float/2addr v0, p0

    .line 28
    const/high16 p0, 0x3f800000    # 1.0f

    .line 29
    .line 30
    cmpg-float p0, v0, p0

    .line 31
    .line 32
    if-gez p0, :cond_0

    .line 33
    .line 34
    const/4 p0, 0x1

    .line 35
    return p0

    .line 36
    :cond_0
    const/4 p0, 0x0

    .line 37
    return p0
.end method

.method private final k()Z
    .locals 2

    .line 1
    iget-object v0, p0, LH1/j;->d:LH1/q;

    .line 2
    .line 3
    invoke-virtual {v0}, LH1/q;->c()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, LH1/j;->e:LH1/q;

    .line 8
    .line 9
    invoke-virtual {v1}, LH1/q;->c()F

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    add-float/2addr v0, v1

    .line 14
    iget-object v1, p0, LH1/j;->f:LH1/q;

    .line 15
    .line 16
    invoke-virtual {v1}, LH1/q;->c()F

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    add-float/2addr v0, v1

    .line 21
    iget-object v1, p0, LH1/j;->g:LH1/q;

    .line 22
    .line 23
    invoke-virtual {v1}, LH1/q;->c()F

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    add-float/2addr v0, v1

    .line 28
    invoke-virtual {p0}, LH1/j;->a()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    int-to-float p0, p0

    .line 33
    cmpg-float p0, v0, p0

    .line 34
    .line 35
    if-gtz p0, :cond_0

    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_0
    const/4 p0, 0x0

    .line 40
    return p0
.end method

.method private final l()Z
    .locals 2

    .line 1
    iget-object v0, p0, LH1/j;->d:LH1/q;

    .line 2
    .line 3
    invoke-virtual {v0}, LH1/q;->f()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, LH1/j;->e:LH1/q;

    .line 8
    .line 9
    invoke-virtual {v1}, LH1/q;->f()F

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    add-float/2addr v0, v1

    .line 14
    iget-object v1, p0, LH1/j;->f:LH1/q;

    .line 15
    .line 16
    invoke-virtual {v1}, LH1/q;->f()F

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    add-float/2addr v0, v1

    .line 21
    iget-object p0, p0, LH1/j;->g:LH1/q;

    .line 22
    .line 23
    invoke-virtual {p0}, LH1/q;->f()F

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    add-float/2addr v0, p0

    .line 28
    const/4 p0, 0x0

    .line 29
    cmpg-float p0, v0, p0

    .line 30
    .line 31
    if-nez p0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/high16 p0, 0x3f800000    # 1.0f

    .line 35
    .line 36
    cmpg-float p0, v0, p0

    .line 37
    .line 38
    if-nez p0, :cond_1

    .line 39
    .line 40
    :goto_0
    const/4 p0, 0x1

    .line 41
    return p0

    .line 42
    :cond_1
    const/4 p0, 0x0

    .line 43
    return p0
.end method

.method private final m(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "ResponsiveSpec#isValid - "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string p1, " - "

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string p1, "ResponsiveSpec"

    .line 27
    .line 28
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget p0, p0, LH1/j;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public b()LH1/j$a$a;
    .locals 0

    .line 1
    iget-object p0, p0, LH1/j;->c:LH1/j$a$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()LH1/j$b;
    .locals 0

    .line 1
    iget-object p0, p0, LH1/j;->b:LH1/j$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e()LH1/q;
    .locals 0

    .line 1
    iget-object p0, p0, LH1/j;->g:LH1/q;

    .line 2
    .line 3
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, LH1/j;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, LH1/j;

    .line 12
    .line 13
    iget v1, p0, LH1/j;->a:I

    .line 14
    .line 15
    iget v3, p1, LH1/j;->a:I

    .line 16
    .line 17
    if-eq v1, v3, :cond_2

    .line 18
    .line 19
    return v2

    .line 20
    :cond_2
    iget-object v1, p0, LH1/j;->b:LH1/j$b;

    .line 21
    .line 22
    iget-object v3, p1, LH1/j;->b:LH1/j$b;

    .line 23
    .line 24
    if-eq v1, v3, :cond_3

    .line 25
    .line 26
    return v2

    .line 27
    :cond_3
    iget-object v1, p0, LH1/j;->c:LH1/j$a$a;

    .line 28
    .line 29
    iget-object v3, p1, LH1/j;->c:LH1/j$a$a;

    .line 30
    .line 31
    if-eq v1, v3, :cond_4

    .line 32
    .line 33
    return v2

    .line 34
    :cond_4
    iget-object v1, p0, LH1/j;->d:LH1/q;

    .line 35
    .line 36
    iget-object v3, p1, LH1/j;->d:LH1/q;

    .line 37
    .line 38
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-nez v1, :cond_5

    .line 43
    .line 44
    return v2

    .line 45
    :cond_5
    iget-object v1, p0, LH1/j;->e:LH1/q;

    .line 46
    .line 47
    iget-object v3, p1, LH1/j;->e:LH1/q;

    .line 48
    .line 49
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-nez v1, :cond_6

    .line 54
    .line 55
    return v2

    .line 56
    :cond_6
    iget-object v1, p0, LH1/j;->f:LH1/q;

    .line 57
    .line 58
    iget-object v3, p1, LH1/j;->f:LH1/q;

    .line 59
    .line 60
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-nez v1, :cond_7

    .line 65
    .line 66
    return v2

    .line 67
    :cond_7
    iget-object p0, p0, LH1/j;->g:LH1/q;

    .line 68
    .line 69
    iget-object p1, p1, LH1/j;->g:LH1/q;

    .line 70
    .line 71
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    if-nez p0, :cond_8

    .line 76
    .line 77
    return v2

    .line 78
    :cond_8
    return v0
.end method

.method public final f()LH1/q;
    .locals 0

    .line 1
    iget-object p0, p0, LH1/j;->e:LH1/q;

    .line 2
    .line 3
    return-object p0
.end method

.method public final g()LH1/q;
    .locals 0

    .line 1
    iget-object p0, p0, LH1/j;->f:LH1/q;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h()LH1/q;
    .locals 0

    .line 1
    iget-object p0, p0, LH1/j;->d:LH1/q;

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget v0, p0, LH1/j;->a:I

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    mul-int/lit8 v0, v0, 0x1f

    .line 8
    .line 9
    iget-object v1, p0, LH1/j;->b:LH1/j$b;

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/lang/Enum;->hashCode()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    add-int/2addr v0, v1

    .line 16
    mul-int/lit8 v0, v0, 0x1f

    .line 17
    .line 18
    iget-object v1, p0, LH1/j;->c:LH1/j$a$a;

    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/Enum;->hashCode()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    add-int/2addr v0, v1

    .line 25
    mul-int/lit8 v0, v0, 0x1f

    .line 26
    .line 27
    iget-object v1, p0, LH1/j;->d:LH1/q;

    .line 28
    .line 29
    invoke-virtual {v1}, LH1/q;->hashCode()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    add-int/2addr v0, v1

    .line 34
    mul-int/lit8 v0, v0, 0x1f

    .line 35
    .line 36
    iget-object v1, p0, LH1/j;->e:LH1/q;

    .line 37
    .line 38
    invoke-virtual {v1}, LH1/q;->hashCode()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    add-int/2addr v0, v1

    .line 43
    mul-int/lit8 v0, v0, 0x1f

    .line 44
    .line 45
    iget-object v1, p0, LH1/j;->f:LH1/q;

    .line 46
    .line 47
    invoke-virtual {v1}, LH1/q;->hashCode()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    add-int/2addr v0, v1

    .line 52
    mul-int/lit8 v0, v0, 0x1f

    .line 53
    .line 54
    iget-object p0, p0, LH1/j;->g:LH1/q;

    .line 55
    .line 56
    invoke-virtual {p0}, LH1/q;->hashCode()I

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    add-int/2addr v0, p0

    .line 61
    return v0
.end method

.method public final i()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, LH1/j;->b()LH1/j$a$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, LH1/j$a$a;->j:LH1/j$a$a;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-ne v0, v1, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, LH1/j;->d:LH1/q;

    .line 11
    .line 12
    invoke-virtual {v0}, LH1/q;->d()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, LH1/j;->e:LH1/q;

    .line 19
    .line 20
    invoke-virtual {v0}, LH1/q;->d()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    iget-object v0, p0, LH1/j;->f:LH1/q;

    .line 27
    .line 28
    invoke-virtual {v0}, LH1/q;->d()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_0

    .line 33
    .line 34
    iget-object v0, p0, LH1/j;->g:LH1/q;

    .line 35
    .line 36
    invoke-virtual {v0}, LH1/q;->d()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    :cond_0
    const-string v0, "Workspace spec provided must not have any match workspace value."

    .line 43
    .line 44
    invoke-direct {p0, v0}, LH1/j;->m(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return v2

    .line 48
    :cond_1
    invoke-virtual {p0}, LH1/j;->a()I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-gtz v0, :cond_2

    .line 53
    .line 54
    const-string v0, "The property maxAvailableSize must be higher than 0."

    .line 55
    .line 56
    invoke-direct {p0, v0}, LH1/j;->m(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    return v2

    .line 60
    :cond_2
    invoke-direct {p0}, LH1/j;->d()Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-nez v0, :cond_3

    .line 65
    .line 66
    const-string v0, "One or more specs are invalid!"

    .line 67
    .line 68
    invoke-direct {p0, v0}, LH1/j;->m(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    return v2

    .line 72
    :cond_3
    invoke-direct {p0}, LH1/j;->l()Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-nez v0, :cond_4

    .line 77
    .line 78
    const-string v0, "The total Remainder Space used must be equal to 0 or 1."

    .line 79
    .line 80
    invoke-direct {p0, v0}, LH1/j;->m(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    return v2

    .line 84
    :cond_4
    invoke-direct {p0}, LH1/j;->j()Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-nez v0, :cond_5

    .line 89
    .line 90
    const-string v0, "The total Available Space used must be lower or equal to 100%."

    .line 91
    .line 92
    invoke-direct {p0, v0}, LH1/j;->m(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    return v2

    .line 96
    :cond_5
    invoke-direct {p0}, LH1/j;->k()Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-nez v0, :cond_6

    .line 101
    .line 102
    invoke-virtual {p0}, LH1/j;->a()I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    new-instance v1, Ljava/lang/StringBuilder;

    .line 107
    .line 108
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 109
    .line 110
    .line 111
    const-string v3, "The total Fixed Size used must be lower or equal to "

    .line 112
    .line 113
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    const-string v0, "."

    .line 120
    .line 121
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-direct {p0, v0}, LH1/j;->m(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    return v2

    .line 132
    :cond_6
    const/4 p0, 0x1

    .line 133
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 8

    .line 1
    iget v0, p0, LH1/j;->a:I

    .line 2
    .line 3
    iget-object v1, p0, LH1/j;->b:LH1/j$b;

    .line 4
    .line 5
    iget-object v2, p0, LH1/j;->c:LH1/j$a$a;

    .line 6
    .line 7
    iget-object v3, p0, LH1/j;->d:LH1/q;

    .line 8
    .line 9
    iget-object v4, p0, LH1/j;->e:LH1/q;

    .line 10
    .line 11
    iget-object v5, p0, LH1/j;->f:LH1/q;

    .line 12
    .line 13
    iget-object p0, p0, LH1/j;->g:LH1/q;

    .line 14
    .line 15
    new-instance v6, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string v7, "ResponsiveSpec(maxAvailableSize="

    .line 21
    .line 22
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v0, ", dimensionType="

    .line 29
    .line 30
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v0, ", specType="

    .line 37
    .line 38
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v0, ", startPadding="

    .line 45
    .line 46
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v0, ", endPadding="

    .line 53
    .line 54
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    const-string v0, ", gutter="

    .line 61
    .line 62
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const-string v0, ", cellSize="

    .line 69
    .line 70
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    const-string p0, ")"

    .line 77
    .line 78
    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    return-object p0
.end method
