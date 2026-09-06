.class public final LH1/c;
.super Ljava/lang/Object;
.source "ResponsiveSpec.kt"


# instance fields
.field private a:F

.field private b:I

.field private c:I

.field private d:I

.field private e:I

.field private f:I

.field private g:I

.field private h:LH1/j;


# direct methods
.method public constructor <init>(FIILH1/j;)V
    .locals 3

    const-string v0, "spec"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput p1, p0, LH1/c;->a:F

    .line 18
    iput p2, p0, LH1/c;->b:I

    .line 19
    iput p3, p0, LH1/c;->c:I

    .line 20
    iput-object p4, p0, LH1/c;->h:LH1/j;

    .line 21
    invoke-virtual {p4}, LH1/j;->h()LH1/q;

    move-result-object p1

    const/4 v0, 0x0

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-static {p1, p2, v0, v1, v2}, LH1/q;->b(LH1/q;IIILjava/lang/Object;)I

    move-result p1

    iput p1, p0, LH1/c;->d:I

    .line 22
    invoke-virtual {p4}, LH1/j;->f()LH1/q;

    move-result-object p1

    invoke-static {p1, p2, v0, v1, v2}, LH1/q;->b(LH1/q;IIILjava/lang/Object;)I

    move-result p1

    iput p1, p0, LH1/c;->e:I

    .line 23
    invoke-virtual {p4}, LH1/j;->g()LH1/q;

    move-result-object p1

    invoke-static {p1, p2, v0, v1, v2}, LH1/q;->b(LH1/q;IIILjava/lang/Object;)I

    move-result p1

    iput p1, p0, LH1/c;->f:I

    .line 24
    invoke-virtual {p4}, LH1/j;->e()LH1/q;

    move-result-object p1

    invoke-static {p1, p2, v0, v1, v2}, LH1/q;->b(LH1/q;IIILjava/lang/Object;)I

    move-result p1

    iput p1, p0, LH1/c;->g:I

    .line 25
    invoke-direct {p0, p2, p3, p4}, LH1/c;->h(IILH1/j;)V

    return-void
.end method

.method public constructor <init>(FIILH1/j;LH1/c;)V
    .locals 1

    const-string v0, "spec"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "calculatedWorkspaceSpec"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput p1, p0, LH1/c;->a:F

    .line 3
    iput p2, p0, LH1/c;->b:I

    .line 4
    iput p3, p0, LH1/c;->c:I

    .line 5
    iput-object p4, p0, LH1/c;->h:LH1/j;

    .line 6
    invoke-virtual {p4}, LH1/j;->h()LH1/q;

    move-result-object p1

    .line 7
    iget v0, p5, LH1/c;->d:I

    .line 8
    invoke-virtual {p1, p2, v0}, LH1/q;->a(II)I

    move-result p1

    .line 9
    iput p1, p0, LH1/c;->d:I

    .line 10
    invoke-virtual {p4}, LH1/j;->f()LH1/q;

    move-result-object p1

    iget v0, p5, LH1/c;->e:I

    invoke-virtual {p1, p2, v0}, LH1/q;->a(II)I

    move-result p1

    .line 11
    iput p1, p0, LH1/c;->e:I

    .line 12
    invoke-virtual {p4}, LH1/j;->g()LH1/q;

    move-result-object p1

    iget v0, p5, LH1/c;->f:I

    invoke-virtual {p1, p2, v0}, LH1/q;->a(II)I

    move-result p1

    iput p1, p0, LH1/c;->f:I

    .line 13
    invoke-virtual {p4}, LH1/j;->e()LH1/q;

    move-result-object p1

    iget p5, p5, LH1/c;->g:I

    invoke-virtual {p1, p2, p5}, LH1/q;->a(II)I

    move-result p1

    .line 14
    iput p1, p0, LH1/c;->g:I

    .line 15
    invoke-direct {p0, p2, p3, p4}, LH1/c;->h(IILH1/j;)V

    return-void
.end method

.method private final h(IILH1/j;)V
    .locals 8

    .line 1
    add-int/lit8 v0, p2, -0x1

    .line 2
    .line 3
    iget v1, p0, LH1/c;->d:I

    .line 4
    .line 5
    iget v2, p0, LH1/c;->e:I

    .line 6
    .line 7
    add-int/2addr v1, v2

    .line 8
    iget v2, p0, LH1/c;->f:I

    .line 9
    .line 10
    mul-int/2addr v2, v0

    .line 11
    add-int/2addr v1, v2

    .line 12
    iget v2, p0, LH1/c;->g:I

    .line 13
    .line 14
    mul-int/2addr v2, p2

    .line 15
    add-int/2addr v1, v2

    .line 16
    sub-int v3, p1, v1

    .line 17
    .line 18
    invoke-virtual {p3}, LH1/j;->h()LH1/q;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    iget v4, p0, LH1/c;->d:I

    .line 23
    .line 24
    const/4 v6, 0x4

    .line 25
    const/4 v7, 0x0

    .line 26
    const/4 v5, 0x0

    .line 27
    invoke-static/range {v2 .. v7}, LH1/q;->h(LH1/q;IIIILjava/lang/Object;)I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    iput p1, p0, LH1/c;->d:I

    .line 32
    .line 33
    invoke-virtual {p3}, LH1/j;->f()LH1/q;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    iget v4, p0, LH1/c;->e:I

    .line 38
    .line 39
    invoke-static/range {v2 .. v7}, LH1/q;->h(LH1/q;IIIILjava/lang/Object;)I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    iput p1, p0, LH1/c;->e:I

    .line 44
    .line 45
    invoke-virtual {p3}, LH1/j;->g()LH1/q;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iget v1, p0, LH1/c;->f:I

    .line 50
    .line 51
    invoke-virtual {p1, v3, v1, v0}, LH1/q;->g(III)I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    iput p1, p0, LH1/c;->f:I

    .line 56
    .line 57
    invoke-virtual {p3}, LH1/j;->e()LH1/q;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iget p3, p0, LH1/c;->g:I

    .line 62
    .line 63
    invoke-virtual {p1, v3, p3, p2}, LH1/q;->g(III)I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    iput p1, p0, LH1/c;->g:I

    .line 68
    .line 69
    return-void
.end method


# virtual methods
.method public final a()I
    .locals 0

    .line 1
    iget p0, p0, LH1/c;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public final b()I
    .locals 0

    .line 1
    iget p0, p0, LH1/c;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public final c()I
    .locals 0

    .line 1
    iget p0, p0, LH1/c;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public final d()I
    .locals 0

    .line 1
    iget p0, p0, LH1/c;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public final e()LH1/j;
    .locals 0

    .line 1
    iget-object p0, p0, LH1/c;->h:LH1/j;

    .line 2
    .line 3
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2

    .line 1
    instance-of v0, p1, LH1/c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, LH1/c;->b:I

    .line 6
    .line 7
    check-cast p1, LH1/c;

    .line 8
    .line 9
    iget v1, p1, LH1/c;->b:I

    .line 10
    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    iget v0, p0, LH1/c;->c:I

    .line 14
    .line 15
    iget v1, p1, LH1/c;->c:I

    .line 16
    .line 17
    if-ne v0, v1, :cond_0

    .line 18
    .line 19
    iget v0, p0, LH1/c;->d:I

    .line 20
    .line 21
    iget v1, p1, LH1/c;->d:I

    .line 22
    .line 23
    if-ne v0, v1, :cond_0

    .line 24
    .line 25
    iget v0, p0, LH1/c;->e:I

    .line 26
    .line 27
    iget v1, p1, LH1/c;->e:I

    .line 28
    .line 29
    if-ne v0, v1, :cond_0

    .line 30
    .line 31
    iget v0, p0, LH1/c;->f:I

    .line 32
    .line 33
    iget v1, p1, LH1/c;->f:I

    .line 34
    .line 35
    if-ne v0, v1, :cond_0

    .line 36
    .line 37
    iget v0, p0, LH1/c;->g:I

    .line 38
    .line 39
    iget v1, p1, LH1/c;->g:I

    .line 40
    .line 41
    if-ne v0, v1, :cond_0

    .line 42
    .line 43
    iget-object p0, p0, LH1/c;->h:LH1/j;

    .line 44
    .line 45
    iget-object p1, p1, LH1/c;->h:LH1/j;

    .line 46
    .line 47
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_0

    .line 52
    .line 53
    const/4 p0, 0x1

    .line 54
    return p0

    .line 55
    :cond_0
    const/4 p0, 0x0

    .line 56
    return p0
.end method

.method public final f()I
    .locals 0

    .line 1
    iget p0, p0, LH1/c;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public final g(LH1/j$a$a;)Z
    .locals 1

    .line 1
    const-string v0, "type"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, LH1/c;->h:LH1/j;

    .line 7
    .line 8
    invoke-virtual {p0}, LH1/j;->b()LH1/j$a$a;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    if-ne p0, p1, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget v0, p0, LH1/c;->b:I

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
    iget v1, p0, LH1/c;->c:I

    .line 10
    .line 11
    invoke-static {v1}, Ljava/lang/Integer;->hashCode(I)I

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
    iget v1, p0, LH1/c;->d:I

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
    iget v1, p0, LH1/c;->e:I

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
    iget v1, p0, LH1/c;->f:I

    .line 37
    .line 38
    invoke-static {v1}, Ljava/lang/Integer;->hashCode(I)I

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
    iget v1, p0, LH1/c;->g:I

    .line 46
    .line 47
    invoke-static {v1}, Ljava/lang/Integer;->hashCode(I)I

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
    iget-object p0, p0, LH1/c;->h:LH1/j;

    .line 55
    .line 56
    invoke-virtual {p0}, LH1/j;->hashCode()I

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    add-int/2addr v0, p0

    .line 61
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 11

    .line 1
    iget-object v0, p0, LH1/c;->h:LH1/j;

    .line 2
    .line 3
    invoke-virtual {v0}, LH1/j;->b()LH1/j$a$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v1, p0, LH1/c;->b:I

    .line 8
    .line 9
    iget v2, p0, LH1/c;->c:I

    .line 10
    .line 11
    iget v3, p0, LH1/c;->d:I

    .line 12
    .line 13
    iget v4, p0, LH1/c;->e:I

    .line 14
    .line 15
    iget v5, p0, LH1/c;->f:I

    .line 16
    .line 17
    iget v6, p0, LH1/c;->g:I

    .line 18
    .line 19
    iget v7, p0, LH1/c;->a:F

    .line 20
    .line 21
    iget-object v8, p0, LH1/c;->h:LH1/j;

    .line 22
    .line 23
    invoke-virtual {v8}, LH1/j;->b()LH1/j$a$a;

    .line 24
    .line 25
    .line 26
    move-result-object v8

    .line 27
    iget-object p0, p0, LH1/c;->h:LH1/j;

    .line 28
    .line 29
    invoke-virtual {p0}, LH1/j;->a()I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    new-instance v9, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 36
    .line 37
    .line 38
    const-string v10, "Calculated"

    .line 39
    .line 40
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v0, "Spec(availableSpace="

    .line 47
    .line 48
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v0, ", cells="

    .line 55
    .line 56
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string v0, ", startPaddingPx="

    .line 63
    .line 64
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    const-string v0, ", endPaddingPx="

    .line 71
    .line 72
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    const-string v0, ", gutterPx="

    .line 79
    .line 80
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    const-string v0, ", cellSizePx="

    .line 87
    .line 88
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    const-string v0, ", aspectRatio="

    .line 95
    .line 96
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    const-string v0, ", "

    .line 103
    .line 104
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    const-string v0, "Spec.maxAvailableSize="

    .line 111
    .line 112
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {v9, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    const-string p0, ")"

    .line 119
    .line 120
    invoke-virtual {v9, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    return-object p0
.end method
