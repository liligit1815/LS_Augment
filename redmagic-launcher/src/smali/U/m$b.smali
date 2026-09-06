.class public final LU/m$b;
.super Ljava/lang/Object;
.source "PolygonMeasure.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LU/m;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "b"
.end annotation


# instance fields
.field private final a:LU/c;

.field private final b:F

.field private c:F

.field private d:F

.field final synthetic e:LU/m;


# direct methods
.method public constructor <init>(LU/m;LU/c;FF)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LU/c;",
            "FF)V"
        }
    .end annotation

    .line 1
    const-string v0, "cubic"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, LU/m$b;->e:LU/m;

    .line 7
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p2, p0, LU/m$b;->a:LU/c;

    .line 12
    .line 13
    cmpl-float v0, p4, p3

    .line 14
    .line 15
    if-ltz v0, :cond_0

    .line 16
    .line 17
    invoke-static {p1}, LU/m;->g(LU/m;)LU/n;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-interface {p1, p2}, LU/n;->b(LU/c;)F

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    iput p1, p0, LU/m$b;->b:F

    .line 26
    .line 27
    iput p3, p0, LU/m$b;->c:F

    .line 28
    .line 29
    iput p4, p0, LU/m$b;->d:F

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 33
    .line 34
    const-string p1, "endOutlineProgress is expected to be equal or greater than startOutlineProgress"

    .line 35
    .line 36
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    throw p0
.end method

.method public static synthetic f(LU/m$b;FFILjava/lang/Object;)V
    .locals 0

    .line 1
    and-int/lit8 p4, p3, 0x1

    .line 2
    .line 3
    if-eqz p4, :cond_0

    .line 4
    .line 5
    iget p1, p0, LU/m$b;->c:F

    .line 6
    .line 7
    :cond_0
    and-int/lit8 p3, p3, 0x2

    .line 8
    .line 9
    if-eqz p3, :cond_1

    .line 10
    .line 11
    iget p2, p0, LU/m$b;->d:F

    .line 12
    .line 13
    :cond_1
    invoke-virtual {p0, p1, p2}, LU/m$b;->e(FF)V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final a(F)Lh4/l;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)",
            "Lh4/l<",
            "LU/m$b;",
            "LU/m$b;",
            ">;"
        }
    .end annotation

    .line 1
    iget v0, p0, LU/m$b;->c:F

    .line 2
    .line 3
    iget v1, p0, LU/m$b;->d:F

    .line 4
    .line 5
    invoke-static {p1, v0, v1}, LA4/d;->g(FFF)F

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iget v0, p0, LU/m$b;->d:F

    .line 10
    .line 11
    iget v1, p0, LU/m$b;->c:F

    .line 12
    .line 13
    sub-float/2addr v0, v1

    .line 14
    sub-float v1, p1, v1

    .line 15
    .line 16
    div-float/2addr v1, v0

    .line 17
    iget-object v0, p0, LU/m$b;->e:LU/m;

    .line 18
    .line 19
    invoke-static {v0}, LU/m;->g(LU/m;)LU/n;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v2, p0, LU/m$b;->a:LU/c;

    .line 24
    .line 25
    iget v3, p0, LU/m$b;->b:F

    .line 26
    .line 27
    mul-float/2addr v1, v3

    .line 28
    invoke-interface {v0, v2, v1}, LU/n;->a(LU/c;F)F

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    const/4 v1, 0x0

    .line 33
    cmpg-float v1, v1, v0

    .line 34
    .line 35
    if-gtz v1, :cond_0

    .line 36
    .line 37
    const/high16 v1, 0x3f800000    # 1.0f

    .line 38
    .line 39
    cmpg-float v1, v0, v1

    .line 40
    .line 41
    if-gtz v1, :cond_0

    .line 42
    .line 43
    invoke-static {}, LU/t;->a()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, LU/m$b;->a:LU/c;

    .line 47
    .line 48
    invoke-virtual {v1, v0}, LU/c;->m(F)Lh4/l;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Lh4/l;->a()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    check-cast v1, LU/c;

    .line 57
    .line 58
    invoke-virtual {v0}, Lh4/l;->b()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    check-cast v0, LU/c;

    .line 63
    .line 64
    new-instance v2, LU/m$b;

    .line 65
    .line 66
    iget-object v3, p0, LU/m$b;->e:LU/m;

    .line 67
    .line 68
    iget v4, p0, LU/m$b;->c:F

    .line 69
    .line 70
    invoke-direct {v2, v3, v1, v4, p1}, LU/m$b;-><init>(LU/m;LU/c;FF)V

    .line 71
    .line 72
    .line 73
    new-instance v1, LU/m$b;

    .line 74
    .line 75
    iget-object v3, p0, LU/m$b;->e:LU/m;

    .line 76
    .line 77
    iget p0, p0, LU/m$b;->d:F

    .line 78
    .line 79
    invoke-direct {v1, v3, v0, p1, p0}, LU/m$b;-><init>(LU/m;LU/c;FF)V

    .line 80
    .line 81
    .line 82
    invoke-static {v2, v1}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    return-object p0

    .line 87
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 88
    .line 89
    const-string p1, "Cubic cut point is expected to be between 0 and 1"

    .line 90
    .line 91
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    throw p0
.end method

.method public final b()LU/c;
    .locals 0

    .line 1
    iget-object p0, p0, LU/m$b;->a:LU/c;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()F
    .locals 0

    .line 1
    iget p0, p0, LU/m$b;->d:F

    .line 2
    .line 3
    return p0
.end method

.method public final d()F
    .locals 0

    .line 1
    iget p0, p0, LU/m$b;->c:F

    .line 2
    .line 3
    return p0
.end method

.method public final e(FF)V
    .locals 1

    .line 1
    cmpl-float v0, p2, p1

    .line 2
    .line 3
    if-ltz v0, :cond_0

    .line 4
    .line 5
    iput p1, p0, LU/m$b;->c:F

    .line 6
    .line 7
    iput p2, p0, LU/m$b;->d:F

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 11
    .line 12
    const-string p1, "endOutlineProgress is expected to be equal or greater than startOutlineProgress"

    .line 13
    .line 14
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    throw p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "MeasuredCubic(outlineProgress=["

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget v1, p0, LU/m$b;->c:F

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, " .. "

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget v1, p0, LU/m$b;->d:F

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v1, "], size="

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget v1, p0, LU/m$b;->b:F

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v1, ", cubic="

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, LU/m$b;->a:LU/c;

    .line 42
    .line 43
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const/16 p0, 0x29

    .line 47
    .line 48
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0
.end method
