.class public final Lcom/android/launcher3/util/D;
.super Ljava/lang/Object;
.source "CellContentDimensions.kt"


# instance fields
.field private a:I

.field private b:I

.field private c:I


# direct methods
.method public constructor <init>(III)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/android/launcher3/util/D;->a:I

    .line 5
    .line 6
    iput p2, p0, Lcom/android/launcher3/util/D;->b:I

    .line 7
    .line 8
    iput p3, p0, Lcom/android/launcher3/util/D;->c:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/util/D;->c:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    invoke-static {v0}, Lcom/android/launcher3/N5;->f(F)I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    iget v1, p0, Lcom/android/launcher3/util/D;->a:I

    .line 9
    .line 10
    iget p0, p0, Lcom/android/launcher3/util/D;->b:I

    .line 11
    .line 12
    add-int/2addr v1, p0

    .line 13
    add-int/2addr v1, v0

    .line 14
    return v1
.end method

.method public final b()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/util/D;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public final c()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/util/D;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public final d()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/util/D;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public final e(ILcom/android/launcher3/util/w0;)I
    .locals 3

    .line 1
    const-string v0, "iconSizeSteps"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/util/D;->a()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-le v0, p1, :cond_0

    .line 11
    .line 12
    sub-int/2addr v0, p1

    .line 13
    iget v1, p0, Lcom/android/launcher3/util/D;->b:I

    .line 14
    .line 15
    sub-int/2addr v1, v0

    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iput v0, p0, Lcom/android/launcher3/util/D;->b:I

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/android/launcher3/util/D;->a()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    :cond_0
    :goto_0
    iget v1, p0, Lcom/android/launcher3/util/D;->c:I

    .line 28
    .line 29
    invoke-virtual {p2}, Lcom/android/launcher3/util/w0;->c()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-gt v1, v2, :cond_1

    .line 34
    .line 35
    iget v1, p0, Lcom/android/launcher3/util/D;->a:I

    .line 36
    .line 37
    invoke-virtual {p2}, Lcom/android/launcher3/util/w0;->e()I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-le v1, v2, :cond_2

    .line 42
    .line 43
    :cond_1
    if-le v0, p1, :cond_2

    .line 44
    .line 45
    iget v0, p0, Lcom/android/launcher3/util/D;->a:I

    .line 46
    .line 47
    invoke-virtual {p2, v0}, Lcom/android/launcher3/util/w0;->d(I)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    iput v0, p0, Lcom/android/launcher3/util/D;->a:I

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/android/launcher3/util/D;->a()I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-le v0, p1, :cond_0

    .line 58
    .line 59
    iget v1, p0, Lcom/android/launcher3/util/D;->c:I

    .line 60
    .line 61
    invoke-virtual {p2}, Lcom/android/launcher3/util/w0;->c()I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-le v1, v2, :cond_0

    .line 66
    .line 67
    invoke-virtual {p2}, Lcom/android/launcher3/util/w0;->c()I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    iget v1, p0, Lcom/android/launcher3/util/D;->c:I

    .line 72
    .line 73
    add-int/lit8 v1, v1, -0x1

    .line 74
    .line 75
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    iput v0, p0, Lcom/android/launcher3/util/D;->c:I

    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/android/launcher3/util/D;->a()I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    goto :goto_0

    .line 86
    :cond_2
    :goto_1
    if-le v0, p1, :cond_3

    .line 87
    .line 88
    iget p2, p0, Lcom/android/launcher3/util/D;->a:I

    .line 89
    .line 90
    const/4 v1, 0x2

    .line 91
    if-le p2, v1, :cond_3

    .line 92
    .line 93
    add-int/lit8 p2, p2, -0x2

    .line 94
    .line 95
    iput p2, p0, Lcom/android/launcher3/util/D;->a:I

    .line 96
    .line 97
    invoke-virtual {p0}, Lcom/android/launcher3/util/D;->a()I

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    goto :goto_1

    .line 102
    :cond_3
    return v0
.end method

.method public final f(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/util/D;->a:I

    .line 2
    .line 3
    return-void
.end method
