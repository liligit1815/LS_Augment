.class public final LH1/e;
.super Ljava/lang/Object;
.source "HotseatSpecsProvider.kt"

# interfaces
.implements LH1/g;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LH1/e$a;
    }
.end annotation


# static fields
.field public static final f:LH1/e$a;


# instance fields
.field private final a:I

.field private final b:LH1/j$b;

.field private final c:LH1/j$a$a;

.field private final d:LH1/q;

.field private final e:LH1/q;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LH1/e$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, LH1/e$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LH1/e;->f:LH1/e$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(ILH1/j$b;LH1/j$a$a;LH1/q;LH1/q;)V
    .locals 1

    const-string v0, "dimensionType"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "specType"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "hotseatQsbSpace"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "edgePadding"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput p1, p0, LH1/e;->a:I

    .line 3
    iput-object p2, p0, LH1/e;->b:LH1/j$b;

    .line 4
    iput-object p3, p0, LH1/e;->c:LH1/j$a$a;

    .line 5
    iput-object p4, p0, LH1/e;->d:LH1/q;

    .line 6
    iput-object p5, p0, LH1/e;->e:LH1/q;

    .line 7
    invoke-virtual {p0}, LH1/e;->g()Z

    move-result p0

    if-eqz p0, :cond_0

    return-void

    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Invalid HotseatSpec found."

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public constructor <init>(LH1/j$a$a;Landroid/content/res/TypedArray;Ljava/util/Map;)V
    .locals 8
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

    .line 8
    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    .line 9
    invoke-static {}, LH1/j$b;->c()Ln4/a;

    move-result-object v0

    .line 10
    sget-object v2, LH1/j$b;->g:LH1/j$b;

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    .line 11
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p2

    .line 12
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    move-object v4, p2

    check-cast v4, LH1/j$b;

    .line 13
    const-string p2, "hotseatQsbSpace"

    invoke-static {p3, p2}, LH1/o;->a(Ljava/util/Map;Ljava/lang/String;)LH1/q;

    move-result-object v6

    .line 14
    const-string p2, "edgePadding"

    invoke-static {p3, p2}, LH1/o;->a(Ljava/util/Map;Ljava/lang/String;)LH1/q;

    move-result-object v7

    move-object v2, p0

    move-object v5, p1

    .line 15
    invoke-direct/range {v2 .. v7}, LH1/e;-><init>(ILH1/j$b;LH1/j$a$a;LH1/q;LH1/q;)V

    return-void
.end method

.method private final d()Z
    .locals 1

    .line 1
    iget-object v0, p0, LH1/e;->d:LH1/q;

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
    iget-object v0, p0, LH1/e;->d:LH1/q;

    .line 10
    .line 11
    invoke-virtual {v0}, LH1/q;->j()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, LH1/e;->e:LH1/q;

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
    iget-object p0, p0, LH1/e;->e:LH1/q;

    .line 26
    .line 27
    invoke-virtual {p0}, LH1/q;->j()Z

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

.method private final h()Z
    .locals 2

    .line 1
    iget-object v0, p0, LH1/e;->d:LH1/q;

    .line 2
    .line 3
    invoke-virtual {v0}, LH1/q;->c()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, LH1/e;->e:LH1/q;

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
    invoke-virtual {p0}, LH1/e;->a()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    int-to-float p0, p0

    .line 19
    cmpg-float p0, v0, p0

    .line 20
    .line 21
    if-gtz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method private final i(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "HotseatSpec #isValid - "

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
    const-string p1, "HotseatSpec"

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
    iget p0, p0, LH1/e;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public b()LH1/j$a$a;
    .locals 0

    .line 1
    iget-object p0, p0, LH1/e;->c:LH1/j$a$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()LH1/j$b;
    .locals 0

    .line 1
    iget-object p0, p0, LH1/e;->b:LH1/j$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e()LH1/q;
    .locals 0

    .line 1
    iget-object p0, p0, LH1/e;->e:LH1/q;

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
    instance-of v1, p1, LH1/e;

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
    check-cast p1, LH1/e;

    .line 12
    .line 13
    iget v1, p0, LH1/e;->a:I

    .line 14
    .line 15
    iget v3, p1, LH1/e;->a:I

    .line 16
    .line 17
    if-eq v1, v3, :cond_2

    .line 18
    .line 19
    return v2

    .line 20
    :cond_2
    iget-object v1, p0, LH1/e;->b:LH1/j$b;

    .line 21
    .line 22
    iget-object v3, p1, LH1/e;->b:LH1/j$b;

    .line 23
    .line 24
    if-eq v1, v3, :cond_3

    .line 25
    .line 26
    return v2

    .line 27
    :cond_3
    iget-object v1, p0, LH1/e;->c:LH1/j$a$a;

    .line 28
    .line 29
    iget-object v3, p1, LH1/e;->c:LH1/j$a$a;

    .line 30
    .line 31
    if-eq v1, v3, :cond_4

    .line 32
    .line 33
    return v2

    .line 34
    :cond_4
    iget-object v1, p0, LH1/e;->d:LH1/q;

    .line 35
    .line 36
    iget-object v3, p1, LH1/e;->d:LH1/q;

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
    iget-object p0, p0, LH1/e;->e:LH1/q;

    .line 46
    .line 47
    iget-object p1, p1, LH1/e;->e:LH1/q;

    .line 48
    .line 49
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-nez p0, :cond_6

    .line 54
    .line 55
    return v2

    .line 56
    :cond_6
    return v0
.end method

.method public final f()LH1/q;
    .locals 0

    .line 1
    iget-object p0, p0, LH1/e;->d:LH1/q;

    .line 2
    .line 3
    return-object p0
.end method

.method public final g()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, LH1/e;->a()I

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
    invoke-direct {p0, v0}, LH1/e;->i(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return v1

    .line 14
    :cond_0
    invoke-direct {p0}, LH1/e;->d()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    const-string v0, "One or more specs are invalid!"

    .line 21
    .line 22
    invoke-direct {p0, v0}, LH1/e;->i(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return v1

    .line 26
    :cond_1
    invoke-direct {p0}, LH1/e;->h()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_2

    .line 31
    .line 32
    invoke-virtual {p0}, LH1/e;->a()I

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
    invoke-direct {p0, v0}, LH1/e;->i(Ljava/lang/String;)V

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
    iget v0, p0, LH1/e;->a:I

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
    iget-object v1, p0, LH1/e;->b:LH1/j$b;

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
    iget-object v1, p0, LH1/e;->c:LH1/j$a$a;

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
    iget-object v1, p0, LH1/e;->d:LH1/q;

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
    iget-object p0, p0, LH1/e;->e:LH1/q;

    .line 37
    .line 38
    invoke-virtual {p0}, LH1/q;->hashCode()I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    add-int/2addr v0, p0

    .line 43
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    .line 1
    iget v0, p0, LH1/e;->a:I

    .line 2
    .line 3
    iget-object v1, p0, LH1/e;->b:LH1/j$b;

    .line 4
    .line 5
    iget-object v2, p0, LH1/e;->c:LH1/j$a$a;

    .line 6
    .line 7
    iget-object v3, p0, LH1/e;->d:LH1/q;

    .line 8
    .line 9
    iget-object p0, p0, LH1/e;->e:LH1/q;

    .line 10
    .line 11
    new-instance v4, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v5, "HotseatSpec(maxAvailableSize="

    .line 17
    .line 18
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v0, ", dimensionType="

    .line 25
    .line 26
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v0, ", specType="

    .line 33
    .line 34
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v0, ", hotseatQsbSpace="

    .line 41
    .line 42
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string v0, ", edgePadding="

    .line 49
    .line 50
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string p0, ")"

    .line 57
    .line 58
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0
.end method
