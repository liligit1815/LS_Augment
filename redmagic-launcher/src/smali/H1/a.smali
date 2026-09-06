.class public final LH1/a;
.super Ljava/lang/Object;
.source "ResponsiveCellSpecsProvider.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LH1/a$a;
    }
.end annotation


# static fields
.field public static final f:LH1/a$a;


# instance fields
.field private final a:I

.field private final b:LH1/d;

.field private final c:I

.field private final d:I

.field private final e:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LH1/a$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, LH1/a$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LH1/a;->f:LH1/a$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(ILH1/d;)V
    .locals 10

    const-string v0, "spec"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 7
    invoke-virtual {p2}, LH1/d;->f()LH1/q;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-static {v0, p1, v1, v2, v3}, LH1/q;->b(LH1/q;IIILjava/lang/Object;)I

    move-result v7

    .line 8
    invoke-virtual {p2}, LH1/d;->g()LH1/q;

    move-result-object v0

    invoke-static {v0, p1, v1, v2, v3}, LH1/q;->b(LH1/q;IIILjava/lang/Object;)I

    move-result v8

    .line 9
    invoke-virtual {p2}, LH1/d;->e()LH1/q;

    move-result-object v0

    invoke-static {v0, p1, v1, v2, v3}, LH1/q;->b(LH1/q;IIILjava/lang/Object;)I

    move-result v9

    move-object v4, p0

    move v5, p1

    move-object v6, p2

    .line 10
    invoke-direct/range {v4 .. v9}, LH1/a;-><init>(ILH1/d;III)V

    return-void
.end method

.method public constructor <init>(ILH1/d;III)V
    .locals 1

    const-string v0, "spec"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput p1, p0, LH1/a;->a:I

    .line 3
    iput-object p2, p0, LH1/a;->b:LH1/d;

    .line 4
    iput p3, p0, LH1/a;->c:I

    .line 5
    iput p4, p0, LH1/a;->d:I

    .line 6
    iput p5, p0, LH1/a;->e:I

    return-void
.end method

.method public constructor <init>(ILH1/d;LH1/a;)V
    .locals 9

    const-string v0, "spec"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "workspaceCellSpec"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 11
    sget-object v0, LH1/a;->f:LH1/a$a;

    invoke-virtual {p2}, LH1/d;->f()LH1/q;

    move-result-object v1

    iget v2, p3, LH1/a;->c:I

    invoke-static {v0, p1, v1, v2}, LH1/a$a;->a(LH1/a$a;ILH1/q;I)I

    move-result v6

    .line 12
    invoke-virtual {p2}, LH1/d;->g()LH1/q;

    move-result-object v1

    iget v2, p3, LH1/a;->d:I

    invoke-static {v0, p1, v1, v2}, LH1/a$a;->a(LH1/a$a;ILH1/q;I)I

    move-result v7

    .line 13
    invoke-virtual {p2}, LH1/d;->e()LH1/q;

    move-result-object v1

    .line 14
    iget p3, p3, LH1/a;->e:I

    .line 15
    invoke-static {v0, p1, v1, p3}, LH1/a$a;->a(LH1/a$a;ILH1/q;I)I

    move-result v8

    move-object v3, p0

    move v4, p1

    move-object v5, p2

    .line 16
    invoke-direct/range {v3 .. v8}, LH1/a;-><init>(ILH1/d;III)V

    return-void
.end method


# virtual methods
.method public final a()I
    .locals 0

    .line 1
    iget p0, p0, LH1/a;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public final b()I
    .locals 0

    .line 1
    iget p0, p0, LH1/a;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public final c()I
    .locals 0

    .line 1
    iget p0, p0, LH1/a;->d:I

    .line 2
    .line 3
    return p0
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
    instance-of v1, p1, LH1/a;

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
    check-cast p1, LH1/a;

    .line 12
    .line 13
    iget v1, p0, LH1/a;->a:I

    .line 14
    .line 15
    iget v3, p1, LH1/a;->a:I

    .line 16
    .line 17
    if-eq v1, v3, :cond_2

    .line 18
    .line 19
    return v2

    .line 20
    :cond_2
    iget-object v1, p0, LH1/a;->b:LH1/d;

    .line 21
    .line 22
    iget-object v3, p1, LH1/a;->b:LH1/d;

    .line 23
    .line 24
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_3

    .line 29
    .line 30
    return v2

    .line 31
    :cond_3
    iget v1, p0, LH1/a;->c:I

    .line 32
    .line 33
    iget v3, p1, LH1/a;->c:I

    .line 34
    .line 35
    if-eq v1, v3, :cond_4

    .line 36
    .line 37
    return v2

    .line 38
    :cond_4
    iget v1, p0, LH1/a;->d:I

    .line 39
    .line 40
    iget v3, p1, LH1/a;->d:I

    .line 41
    .line 42
    if-eq v1, v3, :cond_5

    .line 43
    .line 44
    return v2

    .line 45
    :cond_5
    iget p0, p0, LH1/a;->e:I

    .line 46
    .line 47
    iget p1, p1, LH1/a;->e:I

    .line 48
    .line 49
    if-eq p0, p1, :cond_6

    .line 50
    .line 51
    return v2

    .line 52
    :cond_6
    return v0
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget v0, p0, LH1/a;->a:I

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
    iget-object v1, p0, LH1/a;->b:LH1/d;

    .line 10
    .line 11
    invoke-virtual {v1}, LH1/d;->hashCode()I

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
    iget v1, p0, LH1/a;->c:I

    .line 19
    .line 20
    invoke-static {v1}, Ljava/lang/Integer;->hashCode(I)I

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
    iget v1, p0, LH1/a;->d:I

    .line 28
    .line 29
    invoke-static {v1}, Ljava/lang/Integer;->hashCode(I)I

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
    iget p0, p0, LH1/a;->e:I

    .line 37
    .line 38
    invoke-static {p0}, Ljava/lang/Integer;->hashCode(I)I

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
    iget v0, p0, LH1/a;->a:I

    .line 2
    .line 3
    iget v1, p0, LH1/a;->c:I

    .line 4
    .line 5
    iget v2, p0, LH1/a;->d:I

    .line 6
    .line 7
    iget v3, p0, LH1/a;->e:I

    .line 8
    .line 9
    iget-object p0, p0, LH1/a;->b:LH1/d;

    .line 10
    .line 11
    invoke-virtual {p0}, LH1/d;->a()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    new-instance v4, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string v5, "CalculatedCellSpec(availableSpace="

    .line 21
    .line 22
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v0, ", iconSize="

    .line 29
    .line 30
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v0, ", iconTextSize="

    .line 37
    .line 38
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v0, ", iconDrawablePadding="

    .line 45
    .line 46
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v0, ", CellSpec.maxAvailableSize="

    .line 53
    .line 54
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    const-string p0, ")"

    .line 61
    .line 62
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    return-object p0
.end method
