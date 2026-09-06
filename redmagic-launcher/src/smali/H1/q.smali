.class public final LH1/q;
.super Ljava/lang/Object;
.source "SizeSpec.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LH1/q$a;
    }
.end annotation


# static fields
.field public static final f:LH1/q$a;


# instance fields
.field private final a:F

.field private final b:F

.field private final c:F

.field private final d:Z

.field private final e:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LH1/q$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, LH1/q$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LH1/q;->f:LH1/q$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 8

    const/16 v6, 0x1f

    const/4 v7, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    .line 1
    invoke-direct/range {v0 .. v7}, LH1/q;-><init>(FFFZIILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(FFFZI)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput p1, p0, LH1/q;->a:F

    .line 4
    iput p2, p0, LH1/q;->b:F

    .line 5
    iput p3, p0, LH1/q;->c:F

    .line 6
    iput-boolean p4, p0, LH1/q;->d:Z

    .line 7
    iput p5, p0, LH1/q;->e:I

    return-void
.end method

.method public synthetic constructor <init>(FFFZIILkotlin/jvm/internal/j;)V
    .locals 1

    and-int/lit8 p7, p6, 0x1

    const/4 v0, 0x0

    if-eqz p7, :cond_0

    move p1, v0

    :cond_0
    and-int/lit8 p7, p6, 0x2

    if-eqz p7, :cond_1

    move p2, v0

    :cond_1
    and-int/lit8 p7, p6, 0x4

    if-eqz p7, :cond_2

    move p3, v0

    :cond_2
    and-int/lit8 p7, p6, 0x8

    if-eqz p7, :cond_3

    const/4 p4, 0x0

    :cond_3
    and-int/lit8 p6, p6, 0x10

    if-eqz p6, :cond_4

    const p5, 0x7fffffff

    .line 8
    :cond_4
    invoke-direct/range {p0 .. p5}, LH1/q;-><init>(FFFZI)V

    return-void
.end method

.method public static synthetic b(LH1/q;IIILjava/lang/Object;)I
    .locals 0

    .line 1
    and-int/lit8 p3, p3, 0x2

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    :cond_0
    invoke-virtual {p0, p1, p2}, LH1/q;->a(II)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public static synthetic h(LH1/q;IIIILjava/lang/Object;)I
    .locals 0

    .line 1
    and-int/lit8 p4, p4, 0x4

    .line 2
    .line 3
    if-eqz p4, :cond_0

    .line 4
    .line 5
    const/4 p3, 0x1

    .line 6
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, LH1/q;->g(III)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method


# virtual methods
.method public final a(II)I
    .locals 3

    .line 1
    iget v0, p0, LH1/q;->a:F

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    cmpl-float v2, v0, v1

    .line 5
    .line 6
    if-lez v2, :cond_0

    .line 7
    .line 8
    invoke-static {v0}, Lx4/a;->a(F)I

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-boolean v0, p0, LH1/q;->d:Z

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    iget p2, p0, LH1/q;->b:F

    .line 19
    .line 20
    cmpl-float v0, p2, v1

    .line 21
    .line 22
    if-lez v0, :cond_2

    .line 23
    .line 24
    int-to-float p1, p1

    .line 25
    mul-float/2addr p2, p1

    .line 26
    invoke-static {p2}, Lx4/a;->a(F)I

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    goto :goto_0

    .line 31
    :cond_2
    const/4 p2, 0x0

    .line 32
    :goto_0
    iget p0, p0, LH1/q;->e:I

    .line 33
    .line 34
    invoke-static {p2, p0}, LA4/d;->e(II)I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0
.end method

.method public final c()F
    .locals 0

    .line 1
    iget p0, p0, LH1/q;->a:F

    .line 2
    .line 3
    return p0
.end method

.method public final d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LH1/q;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public final e()F
    .locals 0

    .line 1
    iget p0, p0, LH1/q;->b:F

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
    instance-of v1, p1, LH1/q;

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
    check-cast p1, LH1/q;

    .line 12
    .line 13
    iget v1, p0, LH1/q;->a:F

    .line 14
    .line 15
    iget v3, p1, LH1/q;->a:F

    .line 16
    .line 17
    invoke-static {v1, v3}, Ljava/lang/Float;->compare(FF)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    return v2

    .line 24
    :cond_2
    iget v1, p0, LH1/q;->b:F

    .line 25
    .line 26
    iget v3, p1, LH1/q;->b:F

    .line 27
    .line 28
    invoke-static {v1, v3}, Ljava/lang/Float;->compare(FF)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_3

    .line 33
    .line 34
    return v2

    .line 35
    :cond_3
    iget v1, p0, LH1/q;->c:F

    .line 36
    .line 37
    iget v3, p1, LH1/q;->c:F

    .line 38
    .line 39
    invoke-static {v1, v3}, Ljava/lang/Float;->compare(FF)I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_4

    .line 44
    .line 45
    return v2

    .line 46
    :cond_4
    iget-boolean v1, p0, LH1/q;->d:Z

    .line 47
    .line 48
    iget-boolean v3, p1, LH1/q;->d:Z

    .line 49
    .line 50
    if-eq v1, v3, :cond_5

    .line 51
    .line 52
    return v2

    .line 53
    :cond_5
    iget p0, p0, LH1/q;->e:I

    .line 54
    .line 55
    iget p1, p1, LH1/q;->e:I

    .line 56
    .line 57
    if-eq p0, p1, :cond_6

    .line 58
    .line 59
    return v2

    .line 60
    :cond_6
    return v0
.end method

.method public final f()F
    .locals 0

    .line 1
    iget p0, p0, LH1/q;->c:F

    .line 2
    .line 3
    return p0
.end method

.method public final g(III)I
    .locals 2

    .line 1
    iget v0, p0, LH1/q;->c:F

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    cmpl-float v1, v0, v1

    .line 5
    .line 6
    if-lez v1, :cond_0

    .line 7
    .line 8
    int-to-float p1, p1

    .line 9
    mul-float/2addr v0, p1

    .line 10
    int-to-float p1, p3

    .line 11
    div-float/2addr v0, p1

    .line 12
    invoke-static {v0}, Lx4/a;->a(F)I

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    :cond_0
    iget p0, p0, LH1/q;->e:I

    .line 17
    .line 18
    invoke-static {p2, p0}, LA4/d;->e(II)I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget v0, p0, LH1/q;->a:F

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Float;->hashCode(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    mul-int/lit8 v0, v0, 0x1f

    .line 8
    .line 9
    iget v1, p0, LH1/q;->b:F

    .line 10
    .line 11
    invoke-static {v1}, Ljava/lang/Float;->hashCode(F)I

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
    iget v1, p0, LH1/q;->c:F

    .line 19
    .line 20
    invoke-static {v1}, Ljava/lang/Float;->hashCode(F)I

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
    iget-boolean v1, p0, LH1/q;->d:Z

    .line 28
    .line 29
    invoke-static {v1}, Ljava/lang/Boolean;->hashCode(Z)I

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
    iget p0, p0, LH1/q;->e:I

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

.method public final i()Z
    .locals 9

    .line 1
    iget v0, p0, LH1/q;->a:F

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    cmpg-float v2, v0, v1

    .line 5
    .line 6
    const-string v3, "SizeSpec"

    .line 7
    .line 8
    const/4 v4, 0x0

    .line 9
    if-gez v2, :cond_0

    .line 10
    .line 11
    iget v2, p0, LH1/q;->b:F

    .line 12
    .line 13
    cmpg-float v2, v2, v1

    .line 14
    .line 15
    if-gtz v2, :cond_0

    .line 16
    .line 17
    iget v2, p0, LH1/q;->c:F

    .line 18
    .line 19
    cmpg-float v2, v2, v1

    .line 20
    .line 21
    if-gtz v2, :cond_0

    .line 22
    .line 23
    iget-boolean v2, p0, LH1/q;->d:Z

    .line 24
    .line 25
    if-nez v2, :cond_0

    .line 26
    .line 27
    const-string p0, "SizeSpec#isValid - all attributes are empty"

    .line 28
    .line 29
    invoke-static {v3, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    return v4

    .line 33
    :cond_0
    cmpl-float v2, v0, v1

    .line 34
    .line 35
    const/4 v5, 0x1

    .line 36
    if-lez v2, :cond_1

    .line 37
    .line 38
    move v2, v5

    .line 39
    goto :goto_0

    .line 40
    :cond_1
    move v2, v4

    .line 41
    :goto_0
    iget v6, p0, LH1/q;->b:F

    .line 42
    .line 43
    cmpl-float v7, v6, v1

    .line 44
    .line 45
    if-lez v7, :cond_2

    .line 46
    .line 47
    move v7, v5

    .line 48
    goto :goto_1

    .line 49
    :cond_2
    move v7, v4

    .line 50
    :goto_1
    add-int/2addr v2, v7

    .line 51
    iget v7, p0, LH1/q;->c:F

    .line 52
    .line 53
    cmpl-float v8, v7, v1

    .line 54
    .line 55
    if-lez v8, :cond_3

    .line 56
    .line 57
    move v8, v5

    .line 58
    goto :goto_2

    .line 59
    :cond_3
    move v8, v4

    .line 60
    :goto_2
    add-int/2addr v2, v8

    .line 61
    iget-boolean v8, p0, LH1/q;->d:Z

    .line 62
    .line 63
    add-int/2addr v2, v8

    .line 64
    if-le v2, v5, :cond_4

    .line 65
    .line 66
    const-string p0, "SizeSpec#isValid - more than one attribute is filled"

    .line 67
    .line 68
    invoke-static {v3, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    return v4

    .line 72
    :cond_4
    cmpg-float v2, v1, v6

    .line 73
    .line 74
    if-gtz v2, :cond_8

    .line 75
    .line 76
    const/high16 v2, 0x3f800000    # 1.0f

    .line 77
    .line 78
    cmpg-float v6, v6, v2

    .line 79
    .line 80
    if-gtz v6, :cond_8

    .line 81
    .line 82
    cmpg-float v6, v1, v7

    .line 83
    .line 84
    if-gtz v6, :cond_8

    .line 85
    .line 86
    cmpg-float v2, v7, v2

    .line 87
    .line 88
    if-gtz v2, :cond_8

    .line 89
    .line 90
    cmpg-float v2, v0, v1

    .line 91
    .line 92
    if-ltz v2, :cond_7

    .line 93
    .line 94
    iget p0, p0, LH1/q;->e:I

    .line 95
    .line 96
    int-to-float v2, p0

    .line 97
    cmpg-float v2, v2, v1

    .line 98
    .line 99
    if-gez v2, :cond_5

    .line 100
    .line 101
    goto :goto_3

    .line 102
    :cond_5
    cmpl-float v1, v0, v1

    .line 103
    .line 104
    if-lez v1, :cond_6

    .line 105
    .line 106
    int-to-float p0, p0

    .line 107
    cmpl-float p0, v0, p0

    .line 108
    .line 109
    if-lez p0, :cond_6

    .line 110
    .line 111
    const-string p0, "SizeSpec#isValid - fixed size should be smaller than the max size."

    .line 112
    .line 113
    invoke-static {v3, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    .line 115
    .line 116
    return v4

    .line 117
    :cond_6
    return v5

    .line 118
    :cond_7
    :goto_3
    const-string p0, "SizeSpec#isValid - values should be bigger or equal to zero."

    .line 119
    .line 120
    invoke-static {v3, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    .line 122
    .line 123
    return v4

    .line 124
    :cond_8
    const-string p0, "SizeSpec#isValid - values should be between 0 and 1"

    .line 125
    .line 126
    invoke-static {v3, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    .line 128
    .line 129
    return v4
.end method

.method public final j()Z
    .locals 2

    .line 1
    iget v0, p0, LH1/q;->b:F

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    cmpl-float v0, v0, v1

    .line 5
    .line 6
    if-gtz v0, :cond_1

    .line 7
    .line 8
    iget v0, p0, LH1/q;->c:F

    .line 9
    .line 10
    cmpl-float v0, v0, v1

    .line 11
    .line 12
    if-gtz v0, :cond_1

    .line 13
    .line 14
    iget-boolean p0, p0, LH1/q;->d:Z

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_1
    :goto_0
    const-string p0, "SizeSpec"

    .line 22
    .line 23
    const-string v0, "SizeSpec#onlyFixedSize - only fixed size allowed for this tag"

    .line 24
    .line 25
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    .line 1
    iget v0, p0, LH1/q;->a:F

    .line 2
    .line 3
    iget v1, p0, LH1/q;->b:F

    .line 4
    .line 5
    iget v2, p0, LH1/q;->c:F

    .line 6
    .line 7
    iget-boolean v3, p0, LH1/q;->d:Z

    .line 8
    .line 9
    iget p0, p0, LH1/q;->e:I

    .line 10
    .line 11
    new-instance v4, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v5, "SizeSpec(fixedSize="

    .line 17
    .line 18
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v0, ", ofAvailableSpace="

    .line 25
    .line 26
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v0, ", ofRemainderSpace="

    .line 33
    .line 34
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v0, ", matchWorkspace="

    .line 41
    .line 42
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string v0, ", maxSize="

    .line 49
    .line 50
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

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
