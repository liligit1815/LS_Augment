.class public final LH1/d;
.super Ljava/lang/Object;
.source "ResponsiveCellSpecsProvider.kt"

# interfaces
.implements LH1/g;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LH1/d$a;
    }
.end annotation


# static fields
.field public static final g:LH1/d$a;


# instance fields
.field private final a:I

.field private final b:LH1/j$b;

.field private final c:LH1/j$a$a;

.field private final d:LH1/q;

.field private final e:LH1/q;

.field private final f:LH1/q;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LH1/d$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, LH1/d$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LH1/d;->g:LH1/d$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(ILH1/j$b;LH1/j$a$a;LH1/q;LH1/q;LH1/q;)V
    .locals 1

    const-string v0, "dimensionType"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "specType"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "iconSize"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "iconTextSize"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "iconDrawablePadding"

    invoke-static {p6, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput p1, p0, LH1/d;->a:I

    .line 3
    iput-object p2, p0, LH1/d;->b:LH1/j$b;

    .line 4
    iput-object p3, p0, LH1/d;->c:LH1/j$a$a;

    .line 5
    iput-object p4, p0, LH1/d;->d:LH1/q;

    .line 6
    iput-object p5, p0, LH1/d;->e:LH1/q;

    .line 7
    iput-object p6, p0, LH1/d;->f:LH1/q;

    .line 8
    invoke-virtual {p0}, LH1/d;->h()Z

    move-result p0

    if-eqz p0, :cond_0

    return-void

    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Invalid CellSpec found."

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public constructor <init>(LH1/j$a$a;Landroid/content/res/TypedArray;Ljava/util/Map;)V
    .locals 9
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

    .line 9
    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    .line 10
    invoke-static {}, LH1/j$b;->c()Ln4/a;

    move-result-object v0

    .line 11
    sget-object v2, LH1/j$b;->g:LH1/j$b;

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    .line 12
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p2

    .line 13
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    move-object v4, p2

    check-cast v4, LH1/j$b;

    .line 14
    const-string p2, "iconSize"

    invoke-static {p3, p2}, LH1/o;->a(Ljava/util/Map;Ljava/lang/String;)LH1/q;

    move-result-object v6

    .line 15
    const-string p2, "iconTextSize"

    invoke-static {p3, p2}, LH1/o;->a(Ljava/util/Map;Ljava/lang/String;)LH1/q;

    move-result-object v7

    .line 16
    const-string p2, "iconDrawablePadding"

    invoke-static {p3, p2}, LH1/o;->a(Ljava/util/Map;Ljava/lang/String;)LH1/q;

    move-result-object v8

    move-object v2, p0

    move-object v5, p1

    .line 17
    invoke-direct/range {v2 .. v8}, LH1/d;-><init>(ILH1/j$b;LH1/j$a$a;LH1/q;LH1/q;LH1/q;)V

    return-void
.end method

.method private final d()Z
    .locals 2

    .line 1
    iget-object v0, p0, LH1/d;->d:LH1/q;

    .line 2
    .line 3
    invoke-virtual {v0}, LH1/q;->c()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    cmpl-float v0, v0, v1

    .line 9
    .line 10
    if-gtz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, LH1/d;->d:LH1/q;

    .line 13
    .line 14
    invoke-virtual {v0}, LH1/q;->d()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, LH1/d;->e:LH1/q;

    .line 21
    .line 22
    invoke-virtual {v0}, LH1/q;->c()F

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    cmpl-float v0, v0, v1

    .line 27
    .line 28
    if-gez v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, LH1/d;->e:LH1/q;

    .line 31
    .line 32
    invoke-virtual {v0}, LH1/q;->d()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    :cond_1
    iget-object v0, p0, LH1/d;->f:LH1/q;

    .line 39
    .line 40
    invoke-virtual {v0}, LH1/q;->c()F

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    cmpl-float v0, v0, v1

    .line 45
    .line 46
    if-gez v0, :cond_3

    .line 47
    .line 48
    iget-object p0, p0, LH1/d;->f:LH1/q;

    .line 49
    .line 50
    invoke-virtual {p0}, LH1/q;->d()Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    if-eqz p0, :cond_2

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_2
    const/4 p0, 0x0

    .line 58
    return p0

    .line 59
    :cond_3
    :goto_0
    const/4 p0, 0x1

    .line 60
    return p0
.end method

.method private final i()Z
    .locals 2

    .line 1
    iget-object v0, p0, LH1/d;->d:LH1/q;

    .line 2
    .line 3
    invoke-virtual {v0}, LH1/q;->c()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, LH1/d;->e:LH1/q;

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
    iget-object v1, p0, LH1/d;->f:LH1/q;

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
    invoke-virtual {p0}, LH1/d;->a()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    int-to-float p0, p0

    .line 26
    cmpg-float p0, v0, p0

    .line 27
    .line 28
    if-gtz p0, :cond_0

    .line 29
    .line 30
    const/4 p0, 0x1

    .line 31
    return p0

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    return p0
.end method

.method private final j(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "CellSpec#isValid - "

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
    const-string p1, "CellSpec"

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
    iget p0, p0, LH1/d;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public b()LH1/j$a$a;
    .locals 0

    .line 1
    iget-object p0, p0, LH1/d;->c:LH1/j$a$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()LH1/j$b;
    .locals 0

    .line 1
    iget-object p0, p0, LH1/d;->b:LH1/j$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e()LH1/q;
    .locals 0

    .line 1
    iget-object p0, p0, LH1/d;->f:LH1/q;

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
    instance-of v1, p1, LH1/d;

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
    check-cast p1, LH1/d;

    .line 12
    .line 13
    iget v1, p0, LH1/d;->a:I

    .line 14
    .line 15
    iget v3, p1, LH1/d;->a:I

    .line 16
    .line 17
    if-eq v1, v3, :cond_2

    .line 18
    .line 19
    return v2

    .line 20
    :cond_2
    iget-object v1, p0, LH1/d;->b:LH1/j$b;

    .line 21
    .line 22
    iget-object v3, p1, LH1/d;->b:LH1/j$b;

    .line 23
    .line 24
    if-eq v1, v3, :cond_3

    .line 25
    .line 26
    return v2

    .line 27
    :cond_3
    iget-object v1, p0, LH1/d;->c:LH1/j$a$a;

    .line 28
    .line 29
    iget-object v3, p1, LH1/d;->c:LH1/j$a$a;

    .line 30
    .line 31
    if-eq v1, v3, :cond_4

    .line 32
    .line 33
    return v2

    .line 34
    :cond_4
    iget-object v1, p0, LH1/d;->d:LH1/q;

    .line 35
    .line 36
    iget-object v3, p1, LH1/d;->d:LH1/q;

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
    iget-object v1, p0, LH1/d;->e:LH1/q;

    .line 46
    .line 47
    iget-object v3, p1, LH1/d;->e:LH1/q;

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
    iget-object p0, p0, LH1/d;->f:LH1/q;

    .line 57
    .line 58
    iget-object p1, p1, LH1/d;->f:LH1/q;

    .line 59
    .line 60
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-nez p0, :cond_7

    .line 65
    .line 66
    return v2

    .line 67
    :cond_7
    return v0
.end method

.method public final f()LH1/q;
    .locals 0

    .line 1
    iget-object p0, p0, LH1/d;->d:LH1/q;

    .line 2
    .line 3
    return-object p0
.end method

.method public final g()LH1/q;
    .locals 0

    .line 1
    iget-object p0, p0, LH1/d;->e:LH1/q;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, LH1/d;->a()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-gtz v0, :cond_0

    .line 7
    .line 8
    const-string v0, "The property maxAvailableSize must be higher than 0."

    .line 9
    .line 10
    invoke-direct {p0, v0}, LH1/d;->j(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return v1

    .line 14
    :cond_0
    invoke-direct {p0}, LH1/d;->d()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    const-string v0, "Specs must be either Fixed Size or Match Workspace!"

    .line 21
    .line 22
    invoke-direct {p0, v0}, LH1/d;->j(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return v1

    .line 26
    :cond_1
    invoke-direct {p0}, LH1/d;->i()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_2

    .line 31
    .line 32
    invoke-virtual {p0}, LH1/d;->a()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    new-instance v2, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 39
    .line 40
    .line 41
    const-string v3, "The total Fixed Size used must be lower or equal to "

    .line 42
    .line 43
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string v0, "."

    .line 50
    .line 51
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-direct {p0, v0}, LH1/d;->j(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    return v1

    .line 62
    :cond_2
    const/4 p0, 0x1

    .line 63
    return p0
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget v0, p0, LH1/d;->a:I

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
    iget-object v1, p0, LH1/d;->b:LH1/j$b;

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
    iget-object v1, p0, LH1/d;->c:LH1/j$a$a;

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
    iget-object v1, p0, LH1/d;->d:LH1/q;

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
    iget-object v1, p0, LH1/d;->e:LH1/q;

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
    iget-object p0, p0, LH1/d;->f:LH1/q;

    .line 46
    .line 47
    invoke-virtual {p0}, LH1/q;->hashCode()I

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    add-int/2addr v0, p0

    .line 52
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 7

    .line 1
    iget v0, p0, LH1/d;->a:I

    .line 2
    .line 3
    iget-object v1, p0, LH1/d;->b:LH1/j$b;

    .line 4
    .line 5
    iget-object v2, p0, LH1/d;->c:LH1/j$a$a;

    .line 6
    .line 7
    iget-object v3, p0, LH1/d;->d:LH1/q;

    .line 8
    .line 9
    iget-object v4, p0, LH1/d;->e:LH1/q;

    .line 10
    .line 11
    iget-object p0, p0, LH1/d;->f:LH1/q;

    .line 12
    .line 13
    new-instance v5, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string v6, "CellSpec(maxAvailableSize="

    .line 19
    .line 20
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v0, ", dimensionType="

    .line 27
    .line 28
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v0, ", specType="

    .line 35
    .line 36
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v0, ", iconSize="

    .line 43
    .line 44
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v0, ", iconTextSize="

    .line 51
    .line 52
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string v0, ", iconDrawablePadding="

    .line 59
    .line 60
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string p0, ")"

    .line 67
    .line 68
    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    return-object p0
.end method
