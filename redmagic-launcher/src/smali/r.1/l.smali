.class public abstract Lr/l;
.super Ljava/lang/Object;
.source "TimeCycleSplineSet.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lr/l$a;
    }
.end annotation


# static fields
.field protected static k:F = 6.2831855f


# instance fields
.field protected a:Lr/b;

.field protected b:I

.field protected c:[I

.field protected d:[[F

.field protected e:I

.field protected f:Ljava/lang/String;

.field protected g:[F

.field protected h:Z

.field protected i:J

.field protected j:F


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lr/l;->b:I

    .line 6
    .line 7
    const/16 v1, 0xa

    .line 8
    .line 9
    new-array v2, v1, [I

    .line 10
    .line 11
    iput-object v2, p0, Lr/l;->c:[I

    .line 12
    .line 13
    const/4 v2, 0x2

    .line 14
    new-array v2, v2, [I

    .line 15
    .line 16
    const/4 v3, 0x1

    .line 17
    const/4 v4, 0x3

    .line 18
    aput v4, v2, v3

    .line 19
    .line 20
    aput v1, v2, v0

    .line 21
    .line 22
    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 23
    .line 24
    invoke-static {v1, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, [[F

    .line 29
    .line 30
    iput-object v1, p0, Lr/l;->d:[[F

    .line 31
    .line 32
    new-array v1, v4, [F

    .line 33
    .line 34
    iput-object v1, p0, Lr/l;->g:[F

    .line 35
    .line 36
    iput-boolean v0, p0, Lr/l;->h:Z

    .line 37
    .line 38
    const/high16 v0, 0x7fc00000    # Float.NaN

    .line 39
    .line 40
    iput v0, p0, Lr/l;->j:F

    .line 41
    .line 42
    return-void
.end method


# virtual methods
.method protected a(F)F
    .locals 2

    .line 1
    iget p0, p0, Lr/l;->b:I

    .line 2
    .line 3
    const/high16 v0, 0x40000000    # 2.0f

    .line 4
    .line 5
    const/high16 v1, 0x3f800000    # 1.0f

    .line 6
    .line 7
    packed-switch p0, :pswitch_data_0

    .line 8
    .line 9
    .line 10
    sget p0, Lr/l;->k:F

    .line 11
    .line 12
    mul-float/2addr p1, p0

    .line 13
    float-to-double p0, p1

    .line 14
    invoke-static {p0, p1}, Ljava/lang/Math;->sin(D)D

    .line 15
    .line 16
    .line 17
    move-result-wide p0

    .line 18
    double-to-float p0, p0

    .line 19
    return p0

    .line 20
    :pswitch_0
    const/high16 p0, 0x40800000    # 4.0f

    .line 21
    .line 22
    mul-float/2addr p1, p0

    .line 23
    rem-float/2addr p1, p0

    .line 24
    sub-float/2addr p1, v0

    .line 25
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    sub-float p0, v1, p0

    .line 30
    .line 31
    mul-float/2addr p0, p0

    .line 32
    sub-float/2addr v1, p0

    .line 33
    return v1

    .line 34
    :pswitch_1
    sget p0, Lr/l;->k:F

    .line 35
    .line 36
    mul-float/2addr p1, p0

    .line 37
    float-to-double p0, p1

    .line 38
    invoke-static {p0, p1}, Ljava/lang/Math;->cos(D)D

    .line 39
    .line 40
    .line 41
    move-result-wide p0

    .line 42
    double-to-float p0, p0

    .line 43
    return p0

    .line 44
    :pswitch_2
    mul-float/2addr p1, v0

    .line 45
    add-float/2addr p1, v1

    .line 46
    rem-float/2addr p1, v0

    .line 47
    sub-float/2addr v1, p1

    .line 48
    return v1

    .line 49
    :pswitch_3
    mul-float/2addr p1, v0

    .line 50
    add-float/2addr p1, v1

    .line 51
    rem-float/2addr p1, v0

    .line 52
    sub-float/2addr p1, v1

    .line 53
    return p1

    .line 54
    :pswitch_4
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    sub-float/2addr v1, p0

    .line 59
    return v1

    .line 60
    :pswitch_5
    sget p0, Lr/l;->k:F

    .line 61
    .line 62
    mul-float/2addr p1, p0

    .line 63
    invoke-static {p1}, Ljava/lang/Math;->signum(F)F

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    return p0

    .line 68
    nop

    .line 69
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public b(IFFIF)V
    .locals 2

    .line 1
    iget-object v0, p0, Lr/l;->c:[I

    .line 2
    .line 3
    iget v1, p0, Lr/l;->e:I

    .line 4
    .line 5
    aput p1, v0, v1

    .line 6
    .line 7
    iget-object p1, p0, Lr/l;->d:[[F

    .line 8
    .line 9
    aget-object p1, p1, v1

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    aput p2, p1, v0

    .line 13
    .line 14
    const/4 p2, 0x1

    .line 15
    aput p3, p1, p2

    .line 16
    .line 17
    const/4 p3, 0x2

    .line 18
    aput p5, p1, p3

    .line 19
    .line 20
    iget p1, p0, Lr/l;->b:I

    .line 21
    .line 22
    invoke-static {p1, p4}, Ljava/lang/Math;->max(II)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    iput p1, p0, Lr/l;->b:I

    .line 27
    .line 28
    iget p1, p0, Lr/l;->e:I

    .line 29
    .line 30
    add-int/2addr p1, p2

    .line 31
    iput p1, p0, Lr/l;->e:I

    .line 32
    .line 33
    return-void
.end method

.method protected c(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lr/l;->i:J

    .line 2
    .line 3
    return-void
.end method

.method public d(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lr/l;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public e(I)V
    .locals 11

    .line 1
    iget v0, p0, Lr/l;->e:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object p1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    .line 6
    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v1, "Error no points added to "

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lr/l;->f:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p1, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object v1, p0, Lr/l;->c:[I

    .line 31
    .line 32
    iget-object v2, p0, Lr/l;->d:[[F

    .line 33
    .line 34
    const/4 v3, 0x1

    .line 35
    sub-int/2addr v0, v3

    .line 36
    const/4 v4, 0x0

    .line 37
    invoke-static {v1, v2, v4, v0}, Lr/l$a;->a([I[[FII)V

    .line 38
    .line 39
    .line 40
    move v0, v3

    .line 41
    move v1, v4

    .line 42
    :goto_0
    iget-object v2, p0, Lr/l;->c:[I

    .line 43
    .line 44
    array-length v5, v2

    .line 45
    if-ge v0, v5, :cond_2

    .line 46
    .line 47
    aget v5, v2, v0

    .line 48
    .line 49
    add-int/lit8 v6, v0, -0x1

    .line 50
    .line 51
    aget v2, v2, v6

    .line 52
    .line 53
    if-eq v5, v2, :cond_1

    .line 54
    .line 55
    add-int/lit8 v1, v1, 0x1

    .line 56
    .line 57
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    if-nez v1, :cond_3

    .line 61
    .line 62
    move v1, v3

    .line 63
    :cond_3
    new-array v0, v1, [D

    .line 64
    .line 65
    const/4 v2, 0x2

    .line 66
    new-array v5, v2, [I

    .line 67
    .line 68
    const/4 v6, 0x3

    .line 69
    aput v6, v5, v3

    .line 70
    .line 71
    aput v1, v5, v4

    .line 72
    .line 73
    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    .line 74
    .line 75
    invoke-static {v1, v5}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    check-cast v1, [[D

    .line 80
    .line 81
    move v5, v4

    .line 82
    move v6, v5

    .line 83
    :goto_1
    iget v7, p0, Lr/l;->e:I

    .line 84
    .line 85
    if-ge v5, v7, :cond_5

    .line 86
    .line 87
    if-lez v5, :cond_4

    .line 88
    .line 89
    iget-object v7, p0, Lr/l;->c:[I

    .line 90
    .line 91
    aget v8, v7, v5

    .line 92
    .line 93
    add-int/lit8 v9, v5, -0x1

    .line 94
    .line 95
    aget v7, v7, v9

    .line 96
    .line 97
    if-ne v8, v7, :cond_4

    .line 98
    .line 99
    goto :goto_2

    .line 100
    :cond_4
    iget-object v7, p0, Lr/l;->c:[I

    .line 101
    .line 102
    aget v7, v7, v5

    .line 103
    .line 104
    int-to-double v7, v7

    .line 105
    const-wide v9, 0x3f847ae147ae147bL    # 0.01

    .line 106
    .line 107
    .line 108
    .line 109
    .line 110
    mul-double/2addr v7, v9

    .line 111
    aput-wide v7, v0, v6

    .line 112
    .line 113
    aget-object v7, v1, v6

    .line 114
    .line 115
    iget-object v8, p0, Lr/l;->d:[[F

    .line 116
    .line 117
    aget-object v8, v8, v5

    .line 118
    .line 119
    aget v9, v8, v4

    .line 120
    .line 121
    float-to-double v9, v9

    .line 122
    aput-wide v9, v7, v4

    .line 123
    .line 124
    aget v9, v8, v3

    .line 125
    .line 126
    float-to-double v9, v9

    .line 127
    aput-wide v9, v7, v3

    .line 128
    .line 129
    aget v8, v8, v2

    .line 130
    .line 131
    float-to-double v8, v8

    .line 132
    aput-wide v8, v7, v2

    .line 133
    .line 134
    add-int/lit8 v6, v6, 0x1

    .line 135
    .line 136
    :goto_2
    add-int/lit8 v5, v5, 0x1

    .line 137
    .line 138
    goto :goto_1

    .line 139
    :cond_5
    invoke-static {p1, v0, v1}, Lr/b;->a(I[D[[D)Lr/b;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    iput-object p1, p0, Lr/l;->a:Lr/b;

    .line 144
    .line 145
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 1
    iget-object v0, p0, Lr/l;->f:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/text/DecimalFormat;

    .line 4
    .line 5
    const-string v2, "##.##"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    :goto_0
    iget v3, p0, Lr/l;->e:I

    .line 12
    .line 13
    if-ge v2, v3, :cond_0

    .line 14
    .line 15
    new-instance v3, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v0, "["

    .line 24
    .line 25
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lr/l;->c:[I

    .line 29
    .line 30
    aget v0, v0, v2

    .line 31
    .line 32
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v0, " , "

    .line 36
    .line 37
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lr/l;->d:[[F

    .line 41
    .line 42
    aget-object v0, v0, v2

    .line 43
    .line 44
    invoke-virtual {v1, v0}, Ljava/text/DecimalFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string v0, "] "

    .line 52
    .line 53
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    add-int/lit8 v2, v2, 0x1

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_0
    return-object v0
.end method
