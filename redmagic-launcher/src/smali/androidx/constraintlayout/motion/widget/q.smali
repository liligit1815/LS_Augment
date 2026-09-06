.class Landroidx/constraintlayout/motion/widget/q;
.super Ljava/lang/Object;
.source "MotionPaths.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Landroidx/constraintlayout/motion/widget/q;",
        ">;"
    }
.end annotation


# static fields
.field static y:[Ljava/lang/String;


# instance fields
.field g:Lr/c;

.field h:I

.field i:F

.field j:F

.field k:F

.field l:F

.field m:F

.field n:F

.field o:F

.field p:F

.field q:I

.field r:I

.field s:F

.field t:Landroidx/constraintlayout/motion/widget/m;

.field u:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Landroidx/constraintlayout/widget/a;",
            ">;"
        }
    .end annotation
.end field

.field v:I

.field w:[D

.field x:[D


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    const-string v4, "height"

    .line 2
    .line 3
    const-string v5, "pathRotate"

    .line 4
    .line 5
    const-string v0, "position"

    .line 6
    .line 7
    const-string v1, "x"

    .line 8
    .line 9
    const-string v2, "y"

    .line 10
    .line 11
    const-string v3, "width"

    .line 12
    .line 13
    filled-new-array/range {v0 .. v5}, [Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sput-object v0, Landroidx/constraintlayout/motion/widget/q;->y:[Ljava/lang/String;

    .line 18
    .line 19
    return-void
.end method

.method constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput v0, p0, Landroidx/constraintlayout/motion/widget/q;->h:I

    const/high16 v1, 0x7fc00000    # Float.NaN

    .line 3
    iput v1, p0, Landroidx/constraintlayout/motion/widget/q;->o:F

    .line 4
    iput v1, p0, Landroidx/constraintlayout/motion/widget/q;->p:F

    .line 5
    sget v2, Landroidx/constraintlayout/motion/widget/d;->f:I

    iput v2, p0, Landroidx/constraintlayout/motion/widget/q;->q:I

    .line 6
    iput v2, p0, Landroidx/constraintlayout/motion/widget/q;->r:I

    .line 7
    iput v1, p0, Landroidx/constraintlayout/motion/widget/q;->s:F

    const/4 v1, 0x0

    .line 8
    iput-object v1, p0, Landroidx/constraintlayout/motion/widget/q;->t:Landroidx/constraintlayout/motion/widget/m;

    .line 9
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v1, p0, Landroidx/constraintlayout/motion/widget/q;->u:Ljava/util/LinkedHashMap;

    .line 10
    iput v0, p0, Landroidx/constraintlayout/motion/widget/q;->v:I

    const/16 v0, 0x12

    .line 11
    new-array v1, v0, [D

    iput-object v1, p0, Landroidx/constraintlayout/motion/widget/q;->w:[D

    .line 12
    new-array v0, v0, [D

    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/q;->x:[D

    return-void
.end method

.method constructor <init>(IILandroidx/constraintlayout/motion/widget/h;Landroidx/constraintlayout/motion/widget/q;Landroidx/constraintlayout/motion/widget/q;)V
    .locals 3

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 14
    iput v0, p0, Landroidx/constraintlayout/motion/widget/q;->h:I

    const/high16 v1, 0x7fc00000    # Float.NaN

    .line 15
    iput v1, p0, Landroidx/constraintlayout/motion/widget/q;->o:F

    .line 16
    iput v1, p0, Landroidx/constraintlayout/motion/widget/q;->p:F

    .line 17
    sget v2, Landroidx/constraintlayout/motion/widget/d;->f:I

    iput v2, p0, Landroidx/constraintlayout/motion/widget/q;->q:I

    .line 18
    iput v2, p0, Landroidx/constraintlayout/motion/widget/q;->r:I

    .line 19
    iput v1, p0, Landroidx/constraintlayout/motion/widget/q;->s:F

    const/4 v1, 0x0

    .line 20
    iput-object v1, p0, Landroidx/constraintlayout/motion/widget/q;->t:Landroidx/constraintlayout/motion/widget/m;

    .line 21
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v1, p0, Landroidx/constraintlayout/motion/widget/q;->u:Ljava/util/LinkedHashMap;

    .line 22
    iput v0, p0, Landroidx/constraintlayout/motion/widget/q;->v:I

    const/16 v0, 0x12

    .line 23
    new-array v1, v0, [D

    iput-object v1, p0, Landroidx/constraintlayout/motion/widget/q;->w:[D

    .line 24
    new-array v0, v0, [D

    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/q;->x:[D

    .line 25
    iget v0, p4, Landroidx/constraintlayout/motion/widget/q;->r:I

    sget v1, Landroidx/constraintlayout/motion/widget/d;->f:I

    if-eq v0, v1, :cond_0

    .line 26
    invoke-virtual/range {p0 .. p5}, Landroidx/constraintlayout/motion/widget/q;->s(IILandroidx/constraintlayout/motion/widget/h;Landroidx/constraintlayout/motion/widget/q;Landroidx/constraintlayout/motion/widget/q;)V

    return-void

    .line 27
    :cond_0
    iget v0, p3, Landroidx/constraintlayout/motion/widget/h;->q:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_3

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2

    const/4 p1, 0x3

    if-eq v0, p1, :cond_1

    .line 28
    invoke-virtual {p0, p3, p4, p5}, Landroidx/constraintlayout/motion/widget/q;->o(Landroidx/constraintlayout/motion/widget/h;Landroidx/constraintlayout/motion/widget/q;Landroidx/constraintlayout/motion/widget/q;)V

    return-void

    .line 29
    :cond_1
    invoke-virtual {p0, p3, p4, p5}, Landroidx/constraintlayout/motion/widget/q;->n(Landroidx/constraintlayout/motion/widget/h;Landroidx/constraintlayout/motion/widget/q;Landroidx/constraintlayout/motion/widget/q;)V

    return-void

    .line 30
    :cond_2
    invoke-virtual/range {p0 .. p5}, Landroidx/constraintlayout/motion/widget/q;->t(IILandroidx/constraintlayout/motion/widget/h;Landroidx/constraintlayout/motion/widget/q;Landroidx/constraintlayout/motion/widget/q;)V

    return-void

    .line 31
    :cond_3
    invoke-virtual {p0, p3, p4, p5}, Landroidx/constraintlayout/motion/widget/q;->p(Landroidx/constraintlayout/motion/widget/h;Landroidx/constraintlayout/motion/widget/q;Landroidx/constraintlayout/motion/widget/q;)V

    return-void
.end method

.method private c(FF)Z
    .locals 2

    .line 1
    invoke-static {p1}, Ljava/lang/Float;->isNaN(F)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    const/4 v1, 0x1

    .line 7
    if-nez p0, :cond_2

    .line 8
    .line 9
    invoke-static {p2}, Ljava/lang/Float;->isNaN(F)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    sub-float/2addr p1, p2

    .line 17
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    const p1, 0x358637bd    # 1.0E-6f

    .line 22
    .line 23
    .line 24
    cmpl-float p0, p0, p1

    .line 25
    .line 26
    if-lez p0, :cond_1

    .line 27
    .line 28
    return v1

    .line 29
    :cond_1
    return v0

    .line 30
    :cond_2
    :goto_0
    invoke-static {p1}, Ljava/lang/Float;->isNaN(F)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    invoke-static {p2}, Ljava/lang/Float;->isNaN(F)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eq p0, p1, :cond_3

    .line 39
    .line 40
    return v1

    .line 41
    :cond_3
    return v0
.end method


# virtual methods
.method public a(Landroidx/constraintlayout/motion/widget/q;)I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/motion/widget/q;->j:F

    .line 2
    .line 3
    iget p1, p1, Landroidx/constraintlayout/motion/widget/q;->j:F

    .line 4
    .line 5
    invoke-static {p0, p1}, Ljava/lang/Float;->compare(FF)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Landroidx/constraintlayout/motion/widget/q;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/motion/widget/q;->a(Landroidx/constraintlayout/motion/widget/q;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method d(Landroidx/constraintlayout/motion/widget/q;[Z[Ljava/lang/String;Z)V
    .locals 5

    .line 1
    iget p3, p0, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 2
    .line 3
    iget v0, p1, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 4
    .line 5
    invoke-direct {p0, p3, v0}, Landroidx/constraintlayout/motion/widget/q;->c(FF)Z

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    iget v0, p0, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 10
    .line 11
    iget v1, p1, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 12
    .line 13
    invoke-direct {p0, v0, v1}, Landroidx/constraintlayout/motion/widget/q;->c(FF)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x0

    .line 18
    aget-boolean v2, p2, v1

    .line 19
    .line 20
    iget v3, p0, Landroidx/constraintlayout/motion/widget/q;->j:F

    .line 21
    .line 22
    iget v4, p1, Landroidx/constraintlayout/motion/widget/q;->j:F

    .line 23
    .line 24
    invoke-direct {p0, v3, v4}, Landroidx/constraintlayout/motion/widget/q;->c(FF)Z

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    or-int/2addr v2, v3

    .line 29
    aput-boolean v2, p2, v1

    .line 30
    .line 31
    const/4 v1, 0x1

    .line 32
    aget-boolean v2, p2, v1

    .line 33
    .line 34
    or-int/2addr p3, v0

    .line 35
    or-int/2addr p3, p4

    .line 36
    or-int p4, v2, p3

    .line 37
    .line 38
    aput-boolean p4, p2, v1

    .line 39
    .line 40
    const/4 p4, 0x2

    .line 41
    aget-boolean v0, p2, p4

    .line 42
    .line 43
    or-int/2addr p3, v0

    .line 44
    aput-boolean p3, p2, p4

    .line 45
    .line 46
    const/4 p3, 0x3

    .line 47
    aget-boolean p4, p2, p3

    .line 48
    .line 49
    iget v0, p0, Landroidx/constraintlayout/motion/widget/q;->m:F

    .line 50
    .line 51
    iget v1, p1, Landroidx/constraintlayout/motion/widget/q;->m:F

    .line 52
    .line 53
    invoke-direct {p0, v0, v1}, Landroidx/constraintlayout/motion/widget/q;->c(FF)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    or-int/2addr p4, v0

    .line 58
    aput-boolean p4, p2, p3

    .line 59
    .line 60
    const/4 p3, 0x4

    .line 61
    aget-boolean p4, p2, p3

    .line 62
    .line 63
    iget v0, p0, Landroidx/constraintlayout/motion/widget/q;->n:F

    .line 64
    .line 65
    iget p1, p1, Landroidx/constraintlayout/motion/widget/q;->n:F

    .line 66
    .line 67
    invoke-direct {p0, v0, p1}, Landroidx/constraintlayout/motion/widget/q;->c(FF)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    or-int/2addr p0, p4

    .line 72
    aput-boolean p0, p2, p3

    .line 73
    .line 74
    return-void
.end method

.method e([D[I)V
    .locals 8

    .line 1
    iget v0, p0, Landroidx/constraintlayout/motion/widget/q;->j:F

    .line 2
    .line 3
    iget v1, p0, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 4
    .line 5
    iget v2, p0, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 6
    .line 7
    iget v3, p0, Landroidx/constraintlayout/motion/widget/q;->m:F

    .line 8
    .line 9
    iget v4, p0, Landroidx/constraintlayout/motion/widget/q;->n:F

    .line 10
    .line 11
    iget p0, p0, Landroidx/constraintlayout/motion/widget/q;->o:F

    .line 12
    .line 13
    const/4 v5, 0x6

    .line 14
    new-array v6, v5, [F

    .line 15
    .line 16
    const/4 v7, 0x0

    .line 17
    aput v0, v6, v7

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    aput v1, v6, v0

    .line 21
    .line 22
    const/4 v1, 0x2

    .line 23
    aput v2, v6, v1

    .line 24
    .line 25
    const/4 v1, 0x3

    .line 26
    aput v3, v6, v1

    .line 27
    .line 28
    const/4 v1, 0x4

    .line 29
    aput v4, v6, v1

    .line 30
    .line 31
    const/4 v1, 0x5

    .line 32
    aput p0, v6, v1

    .line 33
    .line 34
    move p0, v7

    .line 35
    :goto_0
    array-length v1, p2

    .line 36
    if-ge v7, v1, :cond_1

    .line 37
    .line 38
    aget v1, p2, v7

    .line 39
    .line 40
    if-ge v1, v5, :cond_0

    .line 41
    .line 42
    add-int/lit8 v2, p0, 0x1

    .line 43
    .line 44
    aget v1, v6, v1

    .line 45
    .line 46
    float-to-double v3, v1

    .line 47
    aput-wide v3, p1, p0

    .line 48
    .line 49
    move p0, v2

    .line 50
    :cond_0
    add-int/2addr v7, v0

    .line 51
    goto :goto_0

    .line 52
    :cond_1
    return-void
.end method

.method f(D[I[D[FI)V
    .locals 14

    .line 1
    move-object/from16 v0, p3

    .line 2
    .line 3
    iget v1, p0, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 4
    .line 5
    iget v2, p0, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 6
    .line 7
    iget v3, p0, Landroidx/constraintlayout/motion/widget/q;->m:F

    .line 8
    .line 9
    iget v4, p0, Landroidx/constraintlayout/motion/widget/q;->n:F

    .line 10
    .line 11
    const/4 v5, 0x0

    .line 12
    move v6, v5

    .line 13
    :goto_0
    array-length v7, v0

    .line 14
    const/4 v8, 0x2

    .line 15
    const/4 v9, 0x1

    .line 16
    if-ge v6, v7, :cond_4

    .line 17
    .line 18
    aget-wide v10, p4, v6

    .line 19
    .line 20
    double-to-float v7, v10

    .line 21
    aget v10, v0, v6

    .line 22
    .line 23
    if-eq v10, v9, :cond_3

    .line 24
    .line 25
    if-eq v10, v8, :cond_2

    .line 26
    .line 27
    const/4 v8, 0x3

    .line 28
    if-eq v10, v8, :cond_1

    .line 29
    .line 30
    const/4 v8, 0x4

    .line 31
    if-eq v10, v8, :cond_0

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_0
    move v4, v7

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    move v3, v7

    .line 37
    goto :goto_1

    .line 38
    :cond_2
    move v2, v7

    .line 39
    goto :goto_1

    .line 40
    :cond_3
    move v1, v7

    .line 41
    :goto_1
    add-int/lit8 v6, v6, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_4
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/q;->t:Landroidx/constraintlayout/motion/widget/m;

    .line 45
    .line 46
    const/high16 v0, 0x40000000    # 2.0f

    .line 47
    .line 48
    if-eqz p0, :cond_5

    .line 49
    .line 50
    new-array v6, v8, [F

    .line 51
    .line 52
    new-array v7, v8, [F

    .line 53
    .line 54
    move-wide v10, p1

    .line 55
    invoke-virtual {p0, v10, v11, v6, v7}, Landroidx/constraintlayout/motion/widget/m;->h(D[F[F)V

    .line 56
    .line 57
    .line 58
    aget p0, v6, v5

    .line 59
    .line 60
    aget v5, v6, v9

    .line 61
    .line 62
    float-to-double v6, p0

    .line 63
    float-to-double v10, v1

    .line 64
    float-to-double v1, v2

    .line 65
    invoke-static {v1, v2}, Ljava/lang/Math;->sin(D)D

    .line 66
    .line 67
    .line 68
    move-result-wide v12

    .line 69
    mul-double/2addr v12, v10

    .line 70
    add-double/2addr v6, v12

    .line 71
    div-float p0, v3, v0

    .line 72
    .line 73
    float-to-double v12, p0

    .line 74
    sub-double/2addr v6, v12

    .line 75
    double-to-float p0, v6

    .line 76
    float-to-double v5, v5

    .line 77
    invoke-static {v1, v2}, Ljava/lang/Math;->cos(D)D

    .line 78
    .line 79
    .line 80
    move-result-wide v1

    .line 81
    mul-double/2addr v10, v1

    .line 82
    sub-double/2addr v5, v10

    .line 83
    div-float v1, v4, v0

    .line 84
    .line 85
    float-to-double v1, v1

    .line 86
    sub-double/2addr v5, v1

    .line 87
    double-to-float v2, v5

    .line 88
    move v1, p0

    .line 89
    :cond_5
    div-float/2addr v3, v0

    .line 90
    add-float/2addr v1, v3

    .line 91
    const/4 p0, 0x0

    .line 92
    add-float/2addr v1, p0

    .line 93
    aput v1, p5, p6

    .line 94
    .line 95
    add-int/lit8 v1, p6, 0x1

    .line 96
    .line 97
    div-float/2addr v4, v0

    .line 98
    add-float/2addr v2, v4

    .line 99
    add-float/2addr v2, p0

    .line 100
    aput v2, p5, v1

    .line 101
    .line 102
    return-void
.end method

.method g(D[I[D[F[D[F)V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p3

    .line 4
    .line 5
    iget v2, v0, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 6
    .line 7
    iget v3, v0, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 8
    .line 9
    iget v4, v0, Landroidx/constraintlayout/motion/widget/q;->m:F

    .line 10
    .line 11
    iget v5, v0, Landroidx/constraintlayout/motion/widget/q;->n:F

    .line 12
    .line 13
    const/4 v8, 0x0

    .line 14
    const/4 v9, 0x0

    .line 15
    const/4 v10, 0x0

    .line 16
    const/4 v11, 0x0

    .line 17
    const/4 v12, 0x0

    .line 18
    :goto_0
    array-length v13, v1

    .line 19
    const/4 v15, 0x1

    .line 20
    if-ge v8, v13, :cond_4

    .line 21
    .line 22
    const/4 v13, 0x0

    .line 23
    const/16 v16, 0x0

    .line 24
    .line 25
    aget-wide v6, p4, v8

    .line 26
    .line 27
    double-to-float v6, v6

    .line 28
    move/from16 v17, v13

    .line 29
    .line 30
    aget-wide v13, p6, v8

    .line 31
    .line 32
    double-to-float v13, v13

    .line 33
    aget v14, v1, v8

    .line 34
    .line 35
    if-eq v14, v15, :cond_3

    .line 36
    .line 37
    const/4 v7, 0x2

    .line 38
    if-eq v14, v7, :cond_2

    .line 39
    .line 40
    const/4 v7, 0x3

    .line 41
    if-eq v14, v7, :cond_1

    .line 42
    .line 43
    const/4 v7, 0x4

    .line 44
    if-eq v14, v7, :cond_0

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_0
    move v5, v6

    .line 48
    move v12, v13

    .line 49
    goto :goto_1

    .line 50
    :cond_1
    move v4, v6

    .line 51
    move v10, v13

    .line 52
    goto :goto_1

    .line 53
    :cond_2
    move v3, v6

    .line 54
    move v11, v13

    .line 55
    goto :goto_1

    .line 56
    :cond_3
    move v2, v6

    .line 57
    move v9, v13

    .line 58
    :goto_1
    add-int/lit8 v8, v8, 0x1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_4
    const/16 v16, 0x0

    .line 62
    .line 63
    const/16 v17, 0x0

    .line 64
    .line 65
    const/high16 v1, 0x40000000    # 2.0f

    .line 66
    .line 67
    div-float/2addr v10, v1

    .line 68
    add-float/2addr v10, v9

    .line 69
    div-float/2addr v12, v1

    .line 70
    add-float/2addr v12, v11

    .line 71
    iget-object v0, v0, Landroidx/constraintlayout/motion/widget/q;->t:Landroidx/constraintlayout/motion/widget/m;

    .line 72
    .line 73
    if-eqz v0, :cond_5

    .line 74
    .line 75
    const/4 v7, 0x2

    .line 76
    new-array v6, v7, [F

    .line 77
    .line 78
    new-array v7, v7, [F

    .line 79
    .line 80
    move-wide/from16 v12, p1

    .line 81
    .line 82
    invoke-virtual {v0, v12, v13, v6, v7}, Landroidx/constraintlayout/motion/widget/m;->h(D[F[F)V

    .line 83
    .line 84
    .line 85
    aget v0, v6, v16

    .line 86
    .line 87
    aget v6, v6, v15

    .line 88
    .line 89
    aget v8, v7, v16

    .line 90
    .line 91
    aget v7, v7, v15

    .line 92
    .line 93
    float-to-double v12, v0

    .line 94
    move/from16 p3, v1

    .line 95
    .line 96
    float-to-double v1, v2

    .line 97
    move-wide/from16 p0, v1

    .line 98
    .line 99
    float-to-double v0, v3

    .line 100
    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    .line 101
    .line 102
    .line 103
    move-result-wide v2

    .line 104
    mul-double v2, v2, p0

    .line 105
    .line 106
    add-double/2addr v12, v2

    .line 107
    div-float v2, v4, p3

    .line 108
    .line 109
    float-to-double v2, v2

    .line 110
    sub-double/2addr v12, v2

    .line 111
    double-to-float v2, v12

    .line 112
    float-to-double v12, v6

    .line 113
    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    .line 114
    .line 115
    .line 116
    move-result-wide v18

    .line 117
    mul-double v18, v18, p0

    .line 118
    .line 119
    sub-double v12, v12, v18

    .line 120
    .line 121
    div-float v3, v5, p3

    .line 122
    .line 123
    move-wide/from16 v18, v0

    .line 124
    .line 125
    float-to-double v0, v3

    .line 126
    sub-double/2addr v12, v0

    .line 127
    double-to-float v3, v12

    .line 128
    float-to-double v0, v8

    .line 129
    float-to-double v8, v9

    .line 130
    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->sin(D)D

    .line 131
    .line 132
    .line 133
    move-result-wide v12

    .line 134
    mul-double/2addr v12, v8

    .line 135
    add-double/2addr v0, v12

    .line 136
    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->cos(D)D

    .line 137
    .line 138
    .line 139
    move-result-wide v12

    .line 140
    float-to-double v10, v11

    .line 141
    mul-double/2addr v12, v10

    .line 142
    add-double/2addr v0, v12

    .line 143
    double-to-float v0, v0

    .line 144
    float-to-double v6, v7

    .line 145
    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->cos(D)D

    .line 146
    .line 147
    .line 148
    move-result-wide v12

    .line 149
    mul-double/2addr v8, v12

    .line 150
    sub-double/2addr v6, v8

    .line 151
    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->sin(D)D

    .line 152
    .line 153
    .line 154
    move-result-wide v8

    .line 155
    mul-double/2addr v8, v10

    .line 156
    add-double/2addr v6, v8

    .line 157
    double-to-float v12, v6

    .line 158
    move v10, v0

    .line 159
    goto :goto_2

    .line 160
    :cond_5
    move/from16 p3, v1

    .line 161
    .line 162
    :goto_2
    div-float v4, v4, p3

    .line 163
    .line 164
    add-float/2addr v2, v4

    .line 165
    add-float v2, v2, v17

    .line 166
    .line 167
    aput v2, p5, v16

    .line 168
    .line 169
    div-float v5, v5, p3

    .line 170
    .line 171
    add-float/2addr v3, v5

    .line 172
    add-float v3, v3, v17

    .line 173
    .line 174
    aput v3, p5, v15

    .line 175
    .line 176
    aput v10, p7, v16

    .line 177
    .line 178
    aput v12, p7, v15

    .line 179
    .line 180
    return-void
.end method

.method i(Ljava/lang/String;[DI)I
    .locals 4

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/q;->u:Ljava/util/LinkedHashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroidx/constraintlayout/widget/a;

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    return p1

    .line 13
    :cond_0
    invoke-virtual {p0}, Landroidx/constraintlayout/widget/a;->g()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x1

    .line 18
    if-ne v0, v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Landroidx/constraintlayout/widget/a;->e()F

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    float-to-double p0, p0

    .line 25
    aput-wide p0, p2, p3

    .line 26
    .line 27
    return v1

    .line 28
    :cond_1
    invoke-virtual {p0}, Landroidx/constraintlayout/widget/a;->g()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    new-array v1, v0, [F

    .line 33
    .line 34
    invoke-virtual {p0, v1}, Landroidx/constraintlayout/widget/a;->f([F)V

    .line 35
    .line 36
    .line 37
    :goto_0
    if-ge p1, v0, :cond_2

    .line 38
    .line 39
    add-int/lit8 p0, p3, 0x1

    .line 40
    .line 41
    aget v2, v1, p1

    .line 42
    .line 43
    float-to-double v2, v2

    .line 44
    aput-wide v2, p2, p3

    .line 45
    .line 46
    add-int/lit8 p1, p1, 0x1

    .line 47
    .line 48
    move p3, p0

    .line 49
    goto :goto_0

    .line 50
    :cond_2
    return v0
.end method

.method j(Ljava/lang/String;)I
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/q;->u:Ljava/util/LinkedHashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroidx/constraintlayout/widget/a;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_0
    invoke-virtual {p0}, Landroidx/constraintlayout/widget/a;->g()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method k([I[D[FI)V
    .locals 9

    .line 1
    iget v0, p0, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 2
    .line 3
    iget v1, p0, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 4
    .line 5
    iget v2, p0, Landroidx/constraintlayout/motion/widget/q;->m:F

    .line 6
    .line 7
    iget v3, p0, Landroidx/constraintlayout/motion/widget/q;->n:F

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    :goto_0
    array-length v5, p1

    .line 11
    if-ge v4, v5, :cond_4

    .line 12
    .line 13
    aget-wide v5, p2, v4

    .line 14
    .line 15
    double-to-float v5, v5

    .line 16
    aget v6, p1, v4

    .line 17
    .line 18
    const/4 v7, 0x1

    .line 19
    if-eq v6, v7, :cond_3

    .line 20
    .line 21
    const/4 v7, 0x2

    .line 22
    if-eq v6, v7, :cond_2

    .line 23
    .line 24
    const/4 v7, 0x3

    .line 25
    if-eq v6, v7, :cond_1

    .line 26
    .line 27
    const/4 v7, 0x4

    .line 28
    if-eq v6, v7, :cond_0

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_0
    move v3, v5

    .line 32
    goto :goto_1

    .line 33
    :cond_1
    move v2, v5

    .line 34
    goto :goto_1

    .line 35
    :cond_2
    move v1, v5

    .line 36
    goto :goto_1

    .line 37
    :cond_3
    move v0, v5

    .line 38
    :goto_1
    add-int/lit8 v4, v4, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_4
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/q;->t:Landroidx/constraintlayout/motion/widget/m;

    .line 42
    .line 43
    if-eqz p1, :cond_5

    .line 44
    .line 45
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/m;->i()F

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/q;->t:Landroidx/constraintlayout/motion/widget/m;

    .line 50
    .line 51
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/m;->j()F

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    float-to-double p1, p1

    .line 56
    float-to-double v4, v0

    .line 57
    float-to-double v0, v1

    .line 58
    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    .line 59
    .line 60
    .line 61
    move-result-wide v6

    .line 62
    mul-double/2addr v6, v4

    .line 63
    add-double/2addr p1, v6

    .line 64
    const/high16 v6, 0x40000000    # 2.0f

    .line 65
    .line 66
    div-float v7, v2, v6

    .line 67
    .line 68
    float-to-double v7, v7

    .line 69
    sub-double/2addr p1, v7

    .line 70
    double-to-float p1, p1

    .line 71
    float-to-double v7, p0

    .line 72
    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    .line 73
    .line 74
    .line 75
    move-result-wide v0

    .line 76
    mul-double/2addr v4, v0

    .line 77
    sub-double/2addr v7, v4

    .line 78
    div-float p0, v3, v6

    .line 79
    .line 80
    float-to-double v0, p0

    .line 81
    sub-double/2addr v7, v0

    .line 82
    double-to-float v1, v7

    .line 83
    move v0, p1

    .line 84
    :cond_5
    add-float/2addr v2, v0

    .line 85
    add-float/2addr v3, v1

    .line 86
    const/high16 p0, 0x7fc00000    # Float.NaN

    .line 87
    .line 88
    invoke-static {p0}, Ljava/lang/Float;->isNaN(F)Z

    .line 89
    .line 90
    .line 91
    invoke-static {p0}, Ljava/lang/Float;->isNaN(F)Z

    .line 92
    .line 93
    .line 94
    const/4 p0, 0x0

    .line 95
    add-float p1, v0, p0

    .line 96
    .line 97
    add-float p2, v1, p0

    .line 98
    .line 99
    add-float v4, v2, p0

    .line 100
    .line 101
    add-float/2addr v1, p0

    .line 102
    add-float/2addr v2, p0

    .line 103
    add-float v5, v3, p0

    .line 104
    .line 105
    add-float/2addr v0, p0

    .line 106
    add-float/2addr v3, p0

    .line 107
    add-int/lit8 p0, p4, 0x1

    .line 108
    .line 109
    aput p1, p3, p4

    .line 110
    .line 111
    add-int/lit8 p1, p4, 0x2

    .line 112
    .line 113
    aput p2, p3, p0

    .line 114
    .line 115
    add-int/lit8 p0, p4, 0x3

    .line 116
    .line 117
    aput v4, p3, p1

    .line 118
    .line 119
    add-int/lit8 p1, p4, 0x4

    .line 120
    .line 121
    aput v1, p3, p0

    .line 122
    .line 123
    add-int/lit8 p0, p4, 0x5

    .line 124
    .line 125
    aput v2, p3, p1

    .line 126
    .line 127
    add-int/lit8 p1, p4, 0x6

    .line 128
    .line 129
    aput v5, p3, p0

    .line 130
    .line 131
    add-int/lit8 p4, p4, 0x7

    .line 132
    .line 133
    aput v0, p3, p1

    .line 134
    .line 135
    aput v3, p3, p4

    .line 136
    .line 137
    return-void
.end method

.method m(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/q;->u:Ljava/util/LinkedHashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method n(Landroidx/constraintlayout/motion/widget/h;Landroidx/constraintlayout/motion/widget/q;Landroidx/constraintlayout/motion/widget/q;)V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    move-object/from16 v3, p3

    .line 8
    .line 9
    iget v4, v1, Landroidx/constraintlayout/motion/widget/d;->a:I

    .line 10
    .line 11
    int-to-float v4, v4

    .line 12
    const/high16 v5, 0x42c80000    # 100.0f

    .line 13
    .line 14
    div-float/2addr v4, v5

    .line 15
    iput v4, v0, Landroidx/constraintlayout/motion/widget/q;->i:F

    .line 16
    .line 17
    iget v5, v1, Landroidx/constraintlayout/motion/widget/h;->j:I

    .line 18
    .line 19
    iput v5, v0, Landroidx/constraintlayout/motion/widget/q;->h:I

    .line 20
    .line 21
    iget v5, v1, Landroidx/constraintlayout/motion/widget/h;->k:F

    .line 22
    .line 23
    invoke-static {v5}, Ljava/lang/Float;->isNaN(F)Z

    .line 24
    .line 25
    .line 26
    move-result v5

    .line 27
    if-eqz v5, :cond_0

    .line 28
    .line 29
    move v5, v4

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget v5, v1, Landroidx/constraintlayout/motion/widget/h;->k:F

    .line 32
    .line 33
    :goto_0
    iget v6, v1, Landroidx/constraintlayout/motion/widget/h;->l:F

    .line 34
    .line 35
    invoke-static {v6}, Ljava/lang/Float;->isNaN(F)Z

    .line 36
    .line 37
    .line 38
    move-result v6

    .line 39
    if-eqz v6, :cond_1

    .line 40
    .line 41
    move v6, v4

    .line 42
    goto :goto_1

    .line 43
    :cond_1
    iget v6, v1, Landroidx/constraintlayout/motion/widget/h;->l:F

    .line 44
    .line 45
    :goto_1
    iget v7, v3, Landroidx/constraintlayout/motion/widget/q;->m:F

    .line 46
    .line 47
    iget v8, v2, Landroidx/constraintlayout/motion/widget/q;->m:F

    .line 48
    .line 49
    sub-float v9, v7, v8

    .line 50
    .line 51
    iget v10, v3, Landroidx/constraintlayout/motion/widget/q;->n:F

    .line 52
    .line 53
    iget v11, v2, Landroidx/constraintlayout/motion/widget/q;->n:F

    .line 54
    .line 55
    sub-float v12, v10, v11

    .line 56
    .line 57
    iget v13, v0, Landroidx/constraintlayout/motion/widget/q;->i:F

    .line 58
    .line 59
    iput v13, v0, Landroidx/constraintlayout/motion/widget/q;->j:F

    .line 60
    .line 61
    iget v13, v2, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 62
    .line 63
    const/high16 v14, 0x40000000    # 2.0f

    .line 64
    .line 65
    div-float v15, v8, v14

    .line 66
    .line 67
    add-float/2addr v15, v13

    .line 68
    move/from16 v16, v14

    .line 69
    .line 70
    iget v14, v2, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 71
    .line 72
    div-float v17, v11, v16

    .line 73
    .line 74
    add-float v17, v14, v17

    .line 75
    .line 76
    move/from16 v18, v4

    .line 77
    .line 78
    iget v4, v3, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 79
    .line 80
    div-float v7, v7, v16

    .line 81
    .line 82
    add-float/2addr v4, v7

    .line 83
    iget v3, v3, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 84
    .line 85
    div-float v10, v10, v16

    .line 86
    .line 87
    add-float/2addr v3, v10

    .line 88
    cmpl-float v7, v15, v4

    .line 89
    .line 90
    if-lez v7, :cond_2

    .line 91
    .line 92
    move/from16 v19, v15

    .line 93
    .line 94
    move v15, v4

    .line 95
    move/from16 v4, v19

    .line 96
    .line 97
    :cond_2
    cmpl-float v7, v17, v3

    .line 98
    .line 99
    if-lez v7, :cond_3

    .line 100
    .line 101
    goto :goto_2

    .line 102
    :cond_3
    move/from16 v19, v17

    .line 103
    .line 104
    move/from16 v17, v3

    .line 105
    .line 106
    move/from16 v3, v19

    .line 107
    .line 108
    :goto_2
    sub-float/2addr v4, v15

    .line 109
    sub-float v17, v17, v3

    .line 110
    .line 111
    mul-float v3, v4, v18

    .line 112
    .line 113
    add-float/2addr v13, v3

    .line 114
    mul-float/2addr v9, v5

    .line 115
    div-float v3, v9, v16

    .line 116
    .line 117
    sub-float/2addr v13, v3

    .line 118
    float-to-int v5, v13

    .line 119
    int-to-float v5, v5

    .line 120
    iput v5, v0, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 121
    .line 122
    mul-float v5, v17, v18

    .line 123
    .line 124
    add-float/2addr v14, v5

    .line 125
    mul-float/2addr v12, v6

    .line 126
    div-float v5, v12, v16

    .line 127
    .line 128
    sub-float/2addr v14, v5

    .line 129
    float-to-int v6, v14

    .line 130
    int-to-float v6, v6

    .line 131
    iput v6, v0, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 132
    .line 133
    add-float/2addr v8, v9

    .line 134
    float-to-int v6, v8

    .line 135
    int-to-float v6, v6

    .line 136
    iput v6, v0, Landroidx/constraintlayout/motion/widget/q;->m:F

    .line 137
    .line 138
    add-float/2addr v11, v12

    .line 139
    float-to-int v6, v11

    .line 140
    int-to-float v6, v6

    .line 141
    iput v6, v0, Landroidx/constraintlayout/motion/widget/q;->n:F

    .line 142
    .line 143
    iget v6, v1, Landroidx/constraintlayout/motion/widget/h;->m:F

    .line 144
    .line 145
    invoke-static {v6}, Ljava/lang/Float;->isNaN(F)Z

    .line 146
    .line 147
    .line 148
    move-result v6

    .line 149
    if-eqz v6, :cond_4

    .line 150
    .line 151
    move/from16 v6, v18

    .line 152
    .line 153
    goto :goto_3

    .line 154
    :cond_4
    iget v6, v1, Landroidx/constraintlayout/motion/widget/h;->m:F

    .line 155
    .line 156
    :goto_3
    iget v7, v1, Landroidx/constraintlayout/motion/widget/h;->p:F

    .line 157
    .line 158
    invoke-static {v7}, Ljava/lang/Float;->isNaN(F)Z

    .line 159
    .line 160
    .line 161
    move-result v7

    .line 162
    const/4 v8, 0x0

    .line 163
    if-eqz v7, :cond_5

    .line 164
    .line 165
    move v7, v8

    .line 166
    goto :goto_4

    .line 167
    :cond_5
    iget v7, v1, Landroidx/constraintlayout/motion/widget/h;->p:F

    .line 168
    .line 169
    :goto_4
    iget v9, v1, Landroidx/constraintlayout/motion/widget/h;->n:F

    .line 170
    .line 171
    invoke-static {v9}, Ljava/lang/Float;->isNaN(F)Z

    .line 172
    .line 173
    .line 174
    move-result v9

    .line 175
    if-eqz v9, :cond_6

    .line 176
    .line 177
    goto :goto_5

    .line 178
    :cond_6
    iget v9, v1, Landroidx/constraintlayout/motion/widget/h;->n:F

    .line 179
    .line 180
    move/from16 v18, v9

    .line 181
    .line 182
    :goto_5
    iget v9, v1, Landroidx/constraintlayout/motion/widget/h;->o:F

    .line 183
    .line 184
    invoke-static {v9}, Ljava/lang/Float;->isNaN(F)Z

    .line 185
    .line 186
    .line 187
    move-result v9

    .line 188
    if-eqz v9, :cond_7

    .line 189
    .line 190
    goto :goto_6

    .line 191
    :cond_7
    iget v8, v1, Landroidx/constraintlayout/motion/widget/h;->o:F

    .line 192
    .line 193
    :goto_6
    const/4 v9, 0x0

    .line 194
    iput v9, v0, Landroidx/constraintlayout/motion/widget/q;->v:I

    .line 195
    .line 196
    iget v9, v2, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 197
    .line 198
    mul-float/2addr v6, v4

    .line 199
    add-float/2addr v9, v6

    .line 200
    mul-float v8, v8, v17

    .line 201
    .line 202
    add-float/2addr v9, v8

    .line 203
    sub-float/2addr v9, v3

    .line 204
    float-to-int v3, v9

    .line 205
    int-to-float v3, v3

    .line 206
    iput v3, v0, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 207
    .line 208
    iget v2, v2, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 209
    .line 210
    mul-float/2addr v4, v7

    .line 211
    add-float/2addr v2, v4

    .line 212
    mul-float v17, v17, v18

    .line 213
    .line 214
    add-float v2, v2, v17

    .line 215
    .line 216
    sub-float/2addr v2, v5

    .line 217
    float-to-int v2, v2

    .line 218
    int-to-float v2, v2

    .line 219
    iput v2, v0, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 220
    .line 221
    iget-object v2, v1, Landroidx/constraintlayout/motion/widget/h;->h:Ljava/lang/String;

    .line 222
    .line 223
    invoke-static {v2}, Lr/c;->c(Ljava/lang/String;)Lr/c;

    .line 224
    .line 225
    .line 226
    move-result-object v2

    .line 227
    iput-object v2, v0, Landroidx/constraintlayout/motion/widget/q;->g:Lr/c;

    .line 228
    .line 229
    iget v1, v1, Landroidx/constraintlayout/motion/widget/h;->i:I

    .line 230
    .line 231
    iput v1, v0, Landroidx/constraintlayout/motion/widget/q;->q:I

    .line 232
    .line 233
    return-void
.end method

.method o(Landroidx/constraintlayout/motion/widget/h;Landroidx/constraintlayout/motion/widget/q;Landroidx/constraintlayout/motion/widget/q;)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    move-object/from16 v3, p3

    .line 8
    .line 9
    iget v4, v1, Landroidx/constraintlayout/motion/widget/d;->a:I

    .line 10
    .line 11
    int-to-float v4, v4

    .line 12
    const/high16 v5, 0x42c80000    # 100.0f

    .line 13
    .line 14
    div-float/2addr v4, v5

    .line 15
    iput v4, v0, Landroidx/constraintlayout/motion/widget/q;->i:F

    .line 16
    .line 17
    iget v5, v1, Landroidx/constraintlayout/motion/widget/h;->j:I

    .line 18
    .line 19
    iput v5, v0, Landroidx/constraintlayout/motion/widget/q;->h:I

    .line 20
    .line 21
    iget v5, v1, Landroidx/constraintlayout/motion/widget/h;->k:F

    .line 22
    .line 23
    invoke-static {v5}, Ljava/lang/Float;->isNaN(F)Z

    .line 24
    .line 25
    .line 26
    move-result v5

    .line 27
    if-eqz v5, :cond_0

    .line 28
    .line 29
    move v5, v4

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget v5, v1, Landroidx/constraintlayout/motion/widget/h;->k:F

    .line 32
    .line 33
    :goto_0
    iget v6, v1, Landroidx/constraintlayout/motion/widget/h;->l:F

    .line 34
    .line 35
    invoke-static {v6}, Ljava/lang/Float;->isNaN(F)Z

    .line 36
    .line 37
    .line 38
    move-result v6

    .line 39
    if-eqz v6, :cond_1

    .line 40
    .line 41
    move v6, v4

    .line 42
    goto :goto_1

    .line 43
    :cond_1
    iget v6, v1, Landroidx/constraintlayout/motion/widget/h;->l:F

    .line 44
    .line 45
    :goto_1
    iget v7, v3, Landroidx/constraintlayout/motion/widget/q;->m:F

    .line 46
    .line 47
    iget v8, v2, Landroidx/constraintlayout/motion/widget/q;->m:F

    .line 48
    .line 49
    sub-float v9, v7, v8

    .line 50
    .line 51
    iget v10, v3, Landroidx/constraintlayout/motion/widget/q;->n:F

    .line 52
    .line 53
    iget v11, v2, Landroidx/constraintlayout/motion/widget/q;->n:F

    .line 54
    .line 55
    sub-float v12, v10, v11

    .line 56
    .line 57
    iget v13, v0, Landroidx/constraintlayout/motion/widget/q;->i:F

    .line 58
    .line 59
    iput v13, v0, Landroidx/constraintlayout/motion/widget/q;->j:F

    .line 60
    .line 61
    iget v13, v2, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 62
    .line 63
    const/high16 v14, 0x40000000    # 2.0f

    .line 64
    .line 65
    div-float v15, v8, v14

    .line 66
    .line 67
    add-float/2addr v15, v13

    .line 68
    move/from16 v16, v14

    .line 69
    .line 70
    iget v14, v2, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 71
    .line 72
    div-float v17, v11, v16

    .line 73
    .line 74
    add-float v17, v14, v17

    .line 75
    .line 76
    move/from16 v18, v4

    .line 77
    .line 78
    iget v4, v3, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 79
    .line 80
    div-float v7, v7, v16

    .line 81
    .line 82
    add-float/2addr v4, v7

    .line 83
    iget v3, v3, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 84
    .line 85
    div-float v10, v10, v16

    .line 86
    .line 87
    add-float/2addr v3, v10

    .line 88
    sub-float/2addr v4, v15

    .line 89
    sub-float v3, v3, v17

    .line 90
    .line 91
    mul-float v7, v4, v18

    .line 92
    .line 93
    add-float/2addr v13, v7

    .line 94
    mul-float/2addr v9, v5

    .line 95
    div-float v5, v9, v16

    .line 96
    .line 97
    sub-float/2addr v13, v5

    .line 98
    float-to-int v7, v13

    .line 99
    int-to-float v7, v7

    .line 100
    iput v7, v0, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 101
    .line 102
    mul-float v7, v3, v18

    .line 103
    .line 104
    add-float/2addr v14, v7

    .line 105
    mul-float/2addr v12, v6

    .line 106
    div-float v6, v12, v16

    .line 107
    .line 108
    sub-float/2addr v14, v6

    .line 109
    float-to-int v7, v14

    .line 110
    int-to-float v7, v7

    .line 111
    iput v7, v0, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 112
    .line 113
    add-float/2addr v8, v9

    .line 114
    float-to-int v7, v8

    .line 115
    int-to-float v7, v7

    .line 116
    iput v7, v0, Landroidx/constraintlayout/motion/widget/q;->m:F

    .line 117
    .line 118
    add-float/2addr v11, v12

    .line 119
    float-to-int v7, v11

    .line 120
    int-to-float v7, v7

    .line 121
    iput v7, v0, Landroidx/constraintlayout/motion/widget/q;->n:F

    .line 122
    .line 123
    iget v7, v1, Landroidx/constraintlayout/motion/widget/h;->m:F

    .line 124
    .line 125
    invoke-static {v7}, Ljava/lang/Float;->isNaN(F)Z

    .line 126
    .line 127
    .line 128
    move-result v7

    .line 129
    if-eqz v7, :cond_2

    .line 130
    .line 131
    move/from16 v7, v18

    .line 132
    .line 133
    goto :goto_2

    .line 134
    :cond_2
    iget v7, v1, Landroidx/constraintlayout/motion/widget/h;->m:F

    .line 135
    .line 136
    :goto_2
    iget v8, v1, Landroidx/constraintlayout/motion/widget/h;->p:F

    .line 137
    .line 138
    invoke-static {v8}, Ljava/lang/Float;->isNaN(F)Z

    .line 139
    .line 140
    .line 141
    move-result v8

    .line 142
    const/4 v9, 0x0

    .line 143
    if-eqz v8, :cond_3

    .line 144
    .line 145
    move v8, v9

    .line 146
    goto :goto_3

    .line 147
    :cond_3
    iget v8, v1, Landroidx/constraintlayout/motion/widget/h;->p:F

    .line 148
    .line 149
    :goto_3
    iget v10, v1, Landroidx/constraintlayout/motion/widget/h;->n:F

    .line 150
    .line 151
    invoke-static {v10}, Ljava/lang/Float;->isNaN(F)Z

    .line 152
    .line 153
    .line 154
    move-result v10

    .line 155
    if-eqz v10, :cond_4

    .line 156
    .line 157
    goto :goto_4

    .line 158
    :cond_4
    iget v10, v1, Landroidx/constraintlayout/motion/widget/h;->n:F

    .line 159
    .line 160
    move/from16 v18, v10

    .line 161
    .line 162
    :goto_4
    iget v10, v1, Landroidx/constraintlayout/motion/widget/h;->o:F

    .line 163
    .line 164
    invoke-static {v10}, Ljava/lang/Float;->isNaN(F)Z

    .line 165
    .line 166
    .line 167
    move-result v10

    .line 168
    if-eqz v10, :cond_5

    .line 169
    .line 170
    goto :goto_5

    .line 171
    :cond_5
    iget v9, v1, Landroidx/constraintlayout/motion/widget/h;->o:F

    .line 172
    .line 173
    :goto_5
    const/4 v10, 0x0

    .line 174
    iput v10, v0, Landroidx/constraintlayout/motion/widget/q;->v:I

    .line 175
    .line 176
    iget v10, v2, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 177
    .line 178
    mul-float/2addr v7, v4

    .line 179
    add-float/2addr v10, v7

    .line 180
    mul-float/2addr v9, v3

    .line 181
    add-float/2addr v10, v9

    .line 182
    sub-float/2addr v10, v5

    .line 183
    float-to-int v5, v10

    .line 184
    int-to-float v5, v5

    .line 185
    iput v5, v0, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 186
    .line 187
    iget v2, v2, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 188
    .line 189
    mul-float/2addr v4, v8

    .line 190
    add-float/2addr v2, v4

    .line 191
    mul-float v3, v3, v18

    .line 192
    .line 193
    add-float/2addr v2, v3

    .line 194
    sub-float/2addr v2, v6

    .line 195
    float-to-int v2, v2

    .line 196
    int-to-float v2, v2

    .line 197
    iput v2, v0, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 198
    .line 199
    iget-object v2, v1, Landroidx/constraintlayout/motion/widget/h;->h:Ljava/lang/String;

    .line 200
    .line 201
    invoke-static {v2}, Lr/c;->c(Ljava/lang/String;)Lr/c;

    .line 202
    .line 203
    .line 204
    move-result-object v2

    .line 205
    iput-object v2, v0, Landroidx/constraintlayout/motion/widget/q;->g:Lr/c;

    .line 206
    .line 207
    iget v1, v1, Landroidx/constraintlayout/motion/widget/h;->i:I

    .line 208
    .line 209
    iput v1, v0, Landroidx/constraintlayout/motion/widget/q;->q:I

    .line 210
    .line 211
    return-void
.end method

.method p(Landroidx/constraintlayout/motion/widget/h;Landroidx/constraintlayout/motion/widget/q;Landroidx/constraintlayout/motion/widget/q;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    move-object/from16 v3, p3

    .line 8
    .line 9
    iget v4, v1, Landroidx/constraintlayout/motion/widget/d;->a:I

    .line 10
    .line 11
    int-to-float v4, v4

    .line 12
    const/high16 v5, 0x42c80000    # 100.0f

    .line 13
    .line 14
    div-float/2addr v4, v5

    .line 15
    iput v4, v0, Landroidx/constraintlayout/motion/widget/q;->i:F

    .line 16
    .line 17
    iget v5, v1, Landroidx/constraintlayout/motion/widget/h;->j:I

    .line 18
    .line 19
    iput v5, v0, Landroidx/constraintlayout/motion/widget/q;->h:I

    .line 20
    .line 21
    iget v5, v1, Landroidx/constraintlayout/motion/widget/h;->k:F

    .line 22
    .line 23
    invoke-static {v5}, Ljava/lang/Float;->isNaN(F)Z

    .line 24
    .line 25
    .line 26
    move-result v5

    .line 27
    if-eqz v5, :cond_0

    .line 28
    .line 29
    move v5, v4

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget v5, v1, Landroidx/constraintlayout/motion/widget/h;->k:F

    .line 32
    .line 33
    :goto_0
    iget v6, v1, Landroidx/constraintlayout/motion/widget/h;->l:F

    .line 34
    .line 35
    invoke-static {v6}, Ljava/lang/Float;->isNaN(F)Z

    .line 36
    .line 37
    .line 38
    move-result v6

    .line 39
    if-eqz v6, :cond_1

    .line 40
    .line 41
    move v6, v4

    .line 42
    goto :goto_1

    .line 43
    :cond_1
    iget v6, v1, Landroidx/constraintlayout/motion/widget/h;->l:F

    .line 44
    .line 45
    :goto_1
    iget v7, v3, Landroidx/constraintlayout/motion/widget/q;->m:F

    .line 46
    .line 47
    iget v8, v2, Landroidx/constraintlayout/motion/widget/q;->m:F

    .line 48
    .line 49
    sub-float/2addr v7, v8

    .line 50
    iget v8, v3, Landroidx/constraintlayout/motion/widget/q;->n:F

    .line 51
    .line 52
    iget v9, v2, Landroidx/constraintlayout/motion/widget/q;->n:F

    .line 53
    .line 54
    sub-float/2addr v8, v9

    .line 55
    iget v9, v0, Landroidx/constraintlayout/motion/widget/q;->i:F

    .line 56
    .line 57
    iput v9, v0, Landroidx/constraintlayout/motion/widget/q;->j:F

    .line 58
    .line 59
    iget v9, v1, Landroidx/constraintlayout/motion/widget/h;->m:F

    .line 60
    .line 61
    invoke-static {v9}, Ljava/lang/Float;->isNaN(F)Z

    .line 62
    .line 63
    .line 64
    move-result v9

    .line 65
    if-eqz v9, :cond_2

    .line 66
    .line 67
    goto :goto_2

    .line 68
    :cond_2
    iget v4, v1, Landroidx/constraintlayout/motion/widget/h;->m:F

    .line 69
    .line 70
    :goto_2
    iget v9, v2, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 71
    .line 72
    iget v10, v2, Landroidx/constraintlayout/motion/widget/q;->m:F

    .line 73
    .line 74
    const/high16 v11, 0x40000000    # 2.0f

    .line 75
    .line 76
    div-float v12, v10, v11

    .line 77
    .line 78
    add-float/2addr v12, v9

    .line 79
    iget v13, v2, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 80
    .line 81
    iget v14, v2, Landroidx/constraintlayout/motion/widget/q;->n:F

    .line 82
    .line 83
    div-float v15, v14, v11

    .line 84
    .line 85
    add-float/2addr v15, v13

    .line 86
    move/from16 v16, v11

    .line 87
    .line 88
    iget v11, v3, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 89
    .line 90
    move/from16 v17, v4

    .line 91
    .line 92
    iget v4, v3, Landroidx/constraintlayout/motion/widget/q;->m:F

    .line 93
    .line 94
    div-float v4, v4, v16

    .line 95
    .line 96
    add-float/2addr v11, v4

    .line 97
    iget v4, v3, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 98
    .line 99
    iget v3, v3, Landroidx/constraintlayout/motion/widget/q;->n:F

    .line 100
    .line 101
    div-float v3, v3, v16

    .line 102
    .line 103
    add-float/2addr v4, v3

    .line 104
    sub-float/2addr v11, v12

    .line 105
    sub-float/2addr v4, v15

    .line 106
    mul-float v3, v11, v17

    .line 107
    .line 108
    add-float/2addr v9, v3

    .line 109
    mul-float/2addr v7, v5

    .line 110
    div-float v5, v7, v16

    .line 111
    .line 112
    sub-float/2addr v9, v5

    .line 113
    float-to-int v9, v9

    .line 114
    int-to-float v9, v9

    .line 115
    iput v9, v0, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 116
    .line 117
    mul-float v9, v4, v17

    .line 118
    .line 119
    add-float/2addr v13, v9

    .line 120
    mul-float/2addr v8, v6

    .line 121
    div-float v6, v8, v16

    .line 122
    .line 123
    sub-float/2addr v13, v6

    .line 124
    float-to-int v12, v13

    .line 125
    int-to-float v12, v12

    .line 126
    iput v12, v0, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 127
    .line 128
    add-float/2addr v10, v7

    .line 129
    float-to-int v7, v10

    .line 130
    int-to-float v7, v7

    .line 131
    iput v7, v0, Landroidx/constraintlayout/motion/widget/q;->m:F

    .line 132
    .line 133
    add-float/2addr v14, v8

    .line 134
    float-to-int v7, v14

    .line 135
    int-to-float v7, v7

    .line 136
    iput v7, v0, Landroidx/constraintlayout/motion/widget/q;->n:F

    .line 137
    .line 138
    iget v7, v1, Landroidx/constraintlayout/motion/widget/h;->n:F

    .line 139
    .line 140
    invoke-static {v7}, Ljava/lang/Float;->isNaN(F)Z

    .line 141
    .line 142
    .line 143
    move-result v7

    .line 144
    if-eqz v7, :cond_3

    .line 145
    .line 146
    const/4 v7, 0x0

    .line 147
    goto :goto_3

    .line 148
    :cond_3
    iget v7, v1, Landroidx/constraintlayout/motion/widget/h;->n:F

    .line 149
    .line 150
    :goto_3
    neg-float v4, v4

    .line 151
    mul-float/2addr v4, v7

    .line 152
    mul-float/2addr v11, v7

    .line 153
    const/4 v7, 0x1

    .line 154
    iput v7, v0, Landroidx/constraintlayout/motion/widget/q;->v:I

    .line 155
    .line 156
    iget v7, v2, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 157
    .line 158
    add-float/2addr v7, v3

    .line 159
    sub-float/2addr v7, v5

    .line 160
    float-to-int v3, v7

    .line 161
    int-to-float v3, v3

    .line 162
    iget v2, v2, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 163
    .line 164
    add-float/2addr v2, v9

    .line 165
    sub-float/2addr v2, v6

    .line 166
    float-to-int v2, v2

    .line 167
    int-to-float v2, v2

    .line 168
    add-float/2addr v3, v4

    .line 169
    iput v3, v0, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 170
    .line 171
    add-float/2addr v2, v11

    .line 172
    iput v2, v0, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 173
    .line 174
    iget v2, v0, Landroidx/constraintlayout/motion/widget/q;->r:I

    .line 175
    .line 176
    iput v2, v0, Landroidx/constraintlayout/motion/widget/q;->r:I

    .line 177
    .line 178
    iget-object v2, v1, Landroidx/constraintlayout/motion/widget/h;->h:Ljava/lang/String;

    .line 179
    .line 180
    invoke-static {v2}, Lr/c;->c(Ljava/lang/String;)Lr/c;

    .line 181
    .line 182
    .line 183
    move-result-object v2

    .line 184
    iput-object v2, v0, Landroidx/constraintlayout/motion/widget/q;->g:Lr/c;

    .line 185
    .line 186
    iget v1, v1, Landroidx/constraintlayout/motion/widget/h;->i:I

    .line 187
    .line 188
    iput v1, v0, Landroidx/constraintlayout/motion/widget/q;->q:I

    .line 189
    .line 190
    return-void
.end method

.method s(IILandroidx/constraintlayout/motion/widget/h;Landroidx/constraintlayout/motion/widget/q;Landroidx/constraintlayout/motion/widget/q;)V
    .locals 6

    .line 1
    iget p1, p3, Landroidx/constraintlayout/motion/widget/d;->a:I

    .line 2
    .line 3
    int-to-float p1, p1

    .line 4
    const/high16 p2, 0x42c80000    # 100.0f

    .line 5
    .line 6
    div-float/2addr p1, p2

    .line 7
    iput p1, p0, Landroidx/constraintlayout/motion/widget/q;->i:F

    .line 8
    .line 9
    iget p2, p3, Landroidx/constraintlayout/motion/widget/h;->j:I

    .line 10
    .line 11
    iput p2, p0, Landroidx/constraintlayout/motion/widget/q;->h:I

    .line 12
    .line 13
    iget p2, p3, Landroidx/constraintlayout/motion/widget/h;->q:I

    .line 14
    .line 15
    iput p2, p0, Landroidx/constraintlayout/motion/widget/q;->v:I

    .line 16
    .line 17
    iget p2, p3, Landroidx/constraintlayout/motion/widget/h;->k:F

    .line 18
    .line 19
    invoke-static {p2}, Ljava/lang/Float;->isNaN(F)Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-eqz p2, :cond_0

    .line 24
    .line 25
    move p2, p1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget p2, p3, Landroidx/constraintlayout/motion/widget/h;->k:F

    .line 28
    .line 29
    :goto_0
    iget v0, p3, Landroidx/constraintlayout/motion/widget/h;->l:F

    .line 30
    .line 31
    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    move v0, p1

    .line 38
    goto :goto_1

    .line 39
    :cond_1
    iget v0, p3, Landroidx/constraintlayout/motion/widget/h;->l:F

    .line 40
    .line 41
    :goto_1
    iget v1, p5, Landroidx/constraintlayout/motion/widget/q;->m:F

    .line 42
    .line 43
    iget v2, p4, Landroidx/constraintlayout/motion/widget/q;->m:F

    .line 44
    .line 45
    sub-float/2addr v1, v2

    .line 46
    iget v3, p5, Landroidx/constraintlayout/motion/widget/q;->n:F

    .line 47
    .line 48
    iget v4, p4, Landroidx/constraintlayout/motion/widget/q;->n:F

    .line 49
    .line 50
    sub-float/2addr v3, v4

    .line 51
    iget v5, p0, Landroidx/constraintlayout/motion/widget/q;->i:F

    .line 52
    .line 53
    iput v5, p0, Landroidx/constraintlayout/motion/widget/q;->j:F

    .line 54
    .line 55
    mul-float/2addr v1, p2

    .line 56
    add-float/2addr v2, v1

    .line 57
    float-to-int v1, v2

    .line 58
    int-to-float v1, v1

    .line 59
    iput v1, p0, Landroidx/constraintlayout/motion/widget/q;->m:F

    .line 60
    .line 61
    mul-float/2addr v3, v0

    .line 62
    add-float/2addr v4, v3

    .line 63
    float-to-int v1, v4

    .line 64
    int-to-float v1, v1

    .line 65
    iput v1, p0, Landroidx/constraintlayout/motion/widget/q;->n:F

    .line 66
    .line 67
    iget v1, p3, Landroidx/constraintlayout/motion/widget/h;->q:I

    .line 68
    .line 69
    const/4 v2, 0x2

    .line 70
    if-eq v1, v2, :cond_4

    .line 71
    .line 72
    iget p2, p3, Landroidx/constraintlayout/motion/widget/h;->m:F

    .line 73
    .line 74
    invoke-static {p2}, Ljava/lang/Float;->isNaN(F)Z

    .line 75
    .line 76
    .line 77
    move-result p2

    .line 78
    if-eqz p2, :cond_2

    .line 79
    .line 80
    move p2, p1

    .line 81
    goto :goto_2

    .line 82
    :cond_2
    iget p2, p3, Landroidx/constraintlayout/motion/widget/h;->m:F

    .line 83
    .line 84
    :goto_2
    iget v0, p5, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 85
    .line 86
    iget v1, p4, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 87
    .line 88
    sub-float/2addr v0, v1

    .line 89
    mul-float/2addr p2, v0

    .line 90
    add-float/2addr p2, v1

    .line 91
    iput p2, p0, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 92
    .line 93
    iget p2, p3, Landroidx/constraintlayout/motion/widget/h;->n:F

    .line 94
    .line 95
    invoke-static {p2}, Ljava/lang/Float;->isNaN(F)Z

    .line 96
    .line 97
    .line 98
    move-result p2

    .line 99
    if-eqz p2, :cond_3

    .line 100
    .line 101
    goto :goto_3

    .line 102
    :cond_3
    iget p1, p3, Landroidx/constraintlayout/motion/widget/h;->n:F

    .line 103
    .line 104
    :goto_3
    iget p2, p5, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 105
    .line 106
    iget p5, p4, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 107
    .line 108
    sub-float/2addr p2, p5

    .line 109
    mul-float/2addr p1, p2

    .line 110
    add-float/2addr p1, p5

    .line 111
    iput p1, p0, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 112
    .line 113
    goto :goto_6

    .line 114
    :cond_4
    iget v1, p3, Landroidx/constraintlayout/motion/widget/h;->m:F

    .line 115
    .line 116
    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    if-eqz v1, :cond_5

    .line 121
    .line 122
    iget p2, p5, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 123
    .line 124
    iget v0, p4, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 125
    .line 126
    sub-float/2addr p2, v0

    .line 127
    mul-float/2addr p2, p1

    .line 128
    add-float/2addr p2, v0

    .line 129
    goto :goto_4

    .line 130
    :cond_5
    iget v1, p3, Landroidx/constraintlayout/motion/widget/h;->m:F

    .line 131
    .line 132
    invoke-static {v0, p2}, Ljava/lang/Math;->min(FF)F

    .line 133
    .line 134
    .line 135
    move-result p2

    .line 136
    mul-float/2addr p2, v1

    .line 137
    :goto_4
    iput p2, p0, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 138
    .line 139
    iget p2, p3, Landroidx/constraintlayout/motion/widget/h;->n:F

    .line 140
    .line 141
    invoke-static {p2}, Ljava/lang/Float;->isNaN(F)Z

    .line 142
    .line 143
    .line 144
    move-result p2

    .line 145
    if-eqz p2, :cond_6

    .line 146
    .line 147
    iget p2, p5, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 148
    .line 149
    iget p5, p4, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 150
    .line 151
    sub-float/2addr p2, p5

    .line 152
    mul-float/2addr p1, p2

    .line 153
    add-float/2addr p1, p5

    .line 154
    goto :goto_5

    .line 155
    :cond_6
    iget p1, p3, Landroidx/constraintlayout/motion/widget/h;->n:F

    .line 156
    .line 157
    :goto_5
    iput p1, p0, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 158
    .line 159
    :goto_6
    iget p1, p4, Landroidx/constraintlayout/motion/widget/q;->r:I

    .line 160
    .line 161
    iput p1, p0, Landroidx/constraintlayout/motion/widget/q;->r:I

    .line 162
    .line 163
    iget-object p1, p3, Landroidx/constraintlayout/motion/widget/h;->h:Ljava/lang/String;

    .line 164
    .line 165
    invoke-static {p1}, Lr/c;->c(Ljava/lang/String;)Lr/c;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/q;->g:Lr/c;

    .line 170
    .line 171
    iget p1, p3, Landroidx/constraintlayout/motion/widget/h;->i:I

    .line 172
    .line 173
    iput p1, p0, Landroidx/constraintlayout/motion/widget/q;->q:I

    .line 174
    .line 175
    return-void
.end method

.method t(IILandroidx/constraintlayout/motion/widget/h;Landroidx/constraintlayout/motion/widget/q;Landroidx/constraintlayout/motion/widget/q;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p3

    .line 4
    .line 5
    move-object/from16 v2, p4

    .line 6
    .line 7
    move-object/from16 v3, p5

    .line 8
    .line 9
    iget v4, v1, Landroidx/constraintlayout/motion/widget/d;->a:I

    .line 10
    .line 11
    int-to-float v4, v4

    .line 12
    const/high16 v5, 0x42c80000    # 100.0f

    .line 13
    .line 14
    div-float/2addr v4, v5

    .line 15
    iput v4, v0, Landroidx/constraintlayout/motion/widget/q;->i:F

    .line 16
    .line 17
    iget v5, v1, Landroidx/constraintlayout/motion/widget/h;->j:I

    .line 18
    .line 19
    iput v5, v0, Landroidx/constraintlayout/motion/widget/q;->h:I

    .line 20
    .line 21
    iget v5, v1, Landroidx/constraintlayout/motion/widget/h;->k:F

    .line 22
    .line 23
    invoke-static {v5}, Ljava/lang/Float;->isNaN(F)Z

    .line 24
    .line 25
    .line 26
    move-result v5

    .line 27
    if-eqz v5, :cond_0

    .line 28
    .line 29
    move v5, v4

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget v5, v1, Landroidx/constraintlayout/motion/widget/h;->k:F

    .line 32
    .line 33
    :goto_0
    iget v6, v1, Landroidx/constraintlayout/motion/widget/h;->l:F

    .line 34
    .line 35
    invoke-static {v6}, Ljava/lang/Float;->isNaN(F)Z

    .line 36
    .line 37
    .line 38
    move-result v6

    .line 39
    if-eqz v6, :cond_1

    .line 40
    .line 41
    move v6, v4

    .line 42
    goto :goto_1

    .line 43
    :cond_1
    iget v6, v1, Landroidx/constraintlayout/motion/widget/h;->l:F

    .line 44
    .line 45
    :goto_1
    iget v7, v3, Landroidx/constraintlayout/motion/widget/q;->m:F

    .line 46
    .line 47
    iget v8, v2, Landroidx/constraintlayout/motion/widget/q;->m:F

    .line 48
    .line 49
    sub-float v9, v7, v8

    .line 50
    .line 51
    iget v10, v3, Landroidx/constraintlayout/motion/widget/q;->n:F

    .line 52
    .line 53
    iget v11, v2, Landroidx/constraintlayout/motion/widget/q;->n:F

    .line 54
    .line 55
    sub-float v12, v10, v11

    .line 56
    .line 57
    iget v13, v0, Landroidx/constraintlayout/motion/widget/q;->i:F

    .line 58
    .line 59
    iput v13, v0, Landroidx/constraintlayout/motion/widget/q;->j:F

    .line 60
    .line 61
    iget v13, v2, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 62
    .line 63
    const/high16 v14, 0x40000000    # 2.0f

    .line 64
    .line 65
    div-float v15, v8, v14

    .line 66
    .line 67
    add-float/2addr v15, v13

    .line 68
    iget v2, v2, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 69
    .line 70
    div-float v16, v11, v14

    .line 71
    .line 72
    add-float v16, v2, v16

    .line 73
    .line 74
    move/from16 v17, v14

    .line 75
    .line 76
    iget v14, v3, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 77
    .line 78
    div-float v7, v7, v17

    .line 79
    .line 80
    add-float/2addr v14, v7

    .line 81
    iget v3, v3, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 82
    .line 83
    div-float v10, v10, v17

    .line 84
    .line 85
    add-float/2addr v3, v10

    .line 86
    sub-float/2addr v14, v15

    .line 87
    sub-float v3, v3, v16

    .line 88
    .line 89
    mul-float/2addr v14, v4

    .line 90
    add-float/2addr v13, v14

    .line 91
    mul-float/2addr v9, v5

    .line 92
    div-float v5, v9, v17

    .line 93
    .line 94
    sub-float/2addr v13, v5

    .line 95
    float-to-int v5, v13

    .line 96
    int-to-float v5, v5

    .line 97
    iput v5, v0, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 98
    .line 99
    mul-float/2addr v3, v4

    .line 100
    add-float/2addr v2, v3

    .line 101
    mul-float/2addr v12, v6

    .line 102
    div-float v3, v12, v17

    .line 103
    .line 104
    sub-float/2addr v2, v3

    .line 105
    float-to-int v2, v2

    .line 106
    int-to-float v2, v2

    .line 107
    iput v2, v0, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 108
    .line 109
    add-float/2addr v8, v9

    .line 110
    float-to-int v2, v8

    .line 111
    int-to-float v2, v2

    .line 112
    iput v2, v0, Landroidx/constraintlayout/motion/widget/q;->m:F

    .line 113
    .line 114
    add-float/2addr v11, v12

    .line 115
    float-to-int v2, v11

    .line 116
    int-to-float v2, v2

    .line 117
    iput v2, v0, Landroidx/constraintlayout/motion/widget/q;->n:F

    .line 118
    .line 119
    const/4 v2, 0x2

    .line 120
    iput v2, v0, Landroidx/constraintlayout/motion/widget/q;->v:I

    .line 121
    .line 122
    iget v2, v1, Landroidx/constraintlayout/motion/widget/h;->m:F

    .line 123
    .line 124
    invoke-static {v2}, Ljava/lang/Float;->isNaN(F)Z

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    if-nez v2, :cond_2

    .line 129
    .line 130
    iget v2, v0, Landroidx/constraintlayout/motion/widget/q;->m:F

    .line 131
    .line 132
    float-to-int v2, v2

    .line 133
    sub-int v2, p1, v2

    .line 134
    .line 135
    iget v3, v1, Landroidx/constraintlayout/motion/widget/h;->m:F

    .line 136
    .line 137
    int-to-float v2, v2

    .line 138
    mul-float/2addr v3, v2

    .line 139
    float-to-int v2, v3

    .line 140
    int-to-float v2, v2

    .line 141
    iput v2, v0, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 142
    .line 143
    :cond_2
    iget v2, v1, Landroidx/constraintlayout/motion/widget/h;->n:F

    .line 144
    .line 145
    invoke-static {v2}, Ljava/lang/Float;->isNaN(F)Z

    .line 146
    .line 147
    .line 148
    move-result v2

    .line 149
    if-nez v2, :cond_3

    .line 150
    .line 151
    iget v2, v0, Landroidx/constraintlayout/motion/widget/q;->n:F

    .line 152
    .line 153
    float-to-int v2, v2

    .line 154
    sub-int v2, p2, v2

    .line 155
    .line 156
    iget v3, v1, Landroidx/constraintlayout/motion/widget/h;->n:F

    .line 157
    .line 158
    int-to-float v2, v2

    .line 159
    mul-float/2addr v3, v2

    .line 160
    float-to-int v2, v3

    .line 161
    int-to-float v2, v2

    .line 162
    iput v2, v0, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 163
    .line 164
    :cond_3
    iget v2, v0, Landroidx/constraintlayout/motion/widget/q;->r:I

    .line 165
    .line 166
    iput v2, v0, Landroidx/constraintlayout/motion/widget/q;->r:I

    .line 167
    .line 168
    iget-object v2, v1, Landroidx/constraintlayout/motion/widget/h;->h:Ljava/lang/String;

    .line 169
    .line 170
    invoke-static {v2}, Lr/c;->c(Ljava/lang/String;)Lr/c;

    .line 171
    .line 172
    .line 173
    move-result-object v2

    .line 174
    iput-object v2, v0, Landroidx/constraintlayout/motion/widget/q;->g:Lr/c;

    .line 175
    .line 176
    iget v1, v1, Landroidx/constraintlayout/motion/widget/h;->i:I

    .line 177
    .line 178
    iput v1, v0, Landroidx/constraintlayout/motion/widget/q;->q:I

    .line 179
    .line 180
    return-void
.end method

.method u(FFFF)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 2
    .line 3
    iput p2, p0, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 4
    .line 5
    iput p3, p0, Landroidx/constraintlayout/motion/widget/q;->m:F

    .line 6
    .line 7
    iput p4, p0, Landroidx/constraintlayout/motion/widget/q;->n:F

    .line 8
    .line 9
    return-void
.end method

.method v(FF[F[I[D[D)V
    .locals 11

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x0

    .line 3
    move v3, v0

    .line 4
    move v4, v3

    .line 5
    move v5, v4

    .line 6
    move v6, v5

    .line 7
    move v2, v1

    .line 8
    :goto_0
    array-length v7, p4

    .line 9
    const/4 v8, 0x1

    .line 10
    if-ge v2, v7, :cond_4

    .line 11
    .line 12
    aget-wide v9, p5, v2

    .line 13
    .line 14
    double-to-float v7, v9

    .line 15
    aget-wide v9, p6, v2

    .line 16
    .line 17
    aget v9, p4, v2

    .line 18
    .line 19
    if-eq v9, v8, :cond_3

    .line 20
    .line 21
    const/4 v8, 0x2

    .line 22
    if-eq v9, v8, :cond_2

    .line 23
    .line 24
    const/4 v8, 0x3

    .line 25
    if-eq v9, v8, :cond_1

    .line 26
    .line 27
    const/4 v8, 0x4

    .line 28
    if-eq v9, v8, :cond_0

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_0
    move v6, v7

    .line 32
    goto :goto_1

    .line 33
    :cond_1
    move v4, v7

    .line 34
    goto :goto_1

    .line 35
    :cond_2
    move v5, v7

    .line 36
    goto :goto_1

    .line 37
    :cond_3
    move v3, v7

    .line 38
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_4
    mul-float p0, v0, v4

    .line 42
    .line 43
    const/high16 v2, 0x40000000    # 2.0f

    .line 44
    .line 45
    div-float/2addr p0, v2

    .line 46
    sub-float/2addr v3, p0

    .line 47
    mul-float p0, v0, v6

    .line 48
    .line 49
    div-float/2addr p0, v2

    .line 50
    sub-float/2addr v5, p0

    .line 51
    const/high16 p0, 0x3f800000    # 1.0f

    .line 52
    .line 53
    mul-float/2addr v4, p0

    .line 54
    mul-float/2addr v6, p0

    .line 55
    add-float/2addr v4, v3

    .line 56
    add-float/2addr v6, v5

    .line 57
    sub-float v2, p0, p1

    .line 58
    .line 59
    mul-float/2addr v3, v2

    .line 60
    mul-float/2addr v4, p1

    .line 61
    add-float/2addr v3, v4

    .line 62
    add-float/2addr v3, v0

    .line 63
    aput v3, p3, v1

    .line 64
    .line 65
    sub-float/2addr p0, p2

    .line 66
    mul-float/2addr v5, p0

    .line 67
    mul-float/2addr v6, p2

    .line 68
    add-float/2addr v5, v6

    .line 69
    add-float/2addr v5, v0

    .line 70
    aput v5, p3, v8

    .line 71
    .line 72
    return-void
.end method

.method w(FLandroid/view/View;[I[D[D[DZ)V
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    move-object/from16 v2, p3

    .line 6
    .line 7
    iget v4, v0, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 8
    .line 9
    iget v5, v0, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 10
    .line 11
    iget v6, v0, Landroidx/constraintlayout/motion/widget/q;->m:F

    .line 12
    .line 13
    iget v7, v0, Landroidx/constraintlayout/motion/widget/q;->n:F

    .line 14
    .line 15
    array-length v8, v2

    .line 16
    const/4 v9, 0x1

    .line 17
    if-eqz v8, :cond_0

    .line 18
    .line 19
    iget-object v8, v0, Landroidx/constraintlayout/motion/widget/q;->w:[D

    .line 20
    .line 21
    array-length v8, v8

    .line 22
    array-length v10, v2

    .line 23
    sub-int/2addr v10, v9

    .line 24
    aget v10, v2, v10

    .line 25
    .line 26
    if-gt v8, v10, :cond_0

    .line 27
    .line 28
    array-length v8, v2

    .line 29
    sub-int/2addr v8, v9

    .line 30
    aget v8, v2, v8

    .line 31
    .line 32
    add-int/2addr v8, v9

    .line 33
    new-array v10, v8, [D

    .line 34
    .line 35
    iput-object v10, v0, Landroidx/constraintlayout/motion/widget/q;->w:[D

    .line 36
    .line 37
    new-array v8, v8, [D

    .line 38
    .line 39
    iput-object v8, v0, Landroidx/constraintlayout/motion/widget/q;->x:[D

    .line 40
    .line 41
    :cond_0
    iget-object v8, v0, Landroidx/constraintlayout/motion/widget/q;->w:[D

    .line 42
    .line 43
    const-wide/high16 v10, 0x7ff8000000000000L    # Double.NaN

    .line 44
    .line 45
    invoke-static {v8, v10, v11}, Ljava/util/Arrays;->fill([DD)V

    .line 46
    .line 47
    .line 48
    const/4 v10, 0x0

    .line 49
    :goto_0
    array-length v11, v2

    .line 50
    if-ge v10, v11, :cond_1

    .line 51
    .line 52
    iget-object v11, v0, Landroidx/constraintlayout/motion/widget/q;->w:[D

    .line 53
    .line 54
    aget v12, v2, v10

    .line 55
    .line 56
    aget-wide v13, p4, v10

    .line 57
    .line 58
    aput-wide v13, v11, v12

    .line 59
    .line 60
    iget-object v11, v0, Landroidx/constraintlayout/motion/widget/q;->x:[D

    .line 61
    .line 62
    aget-wide v13, p5, v10

    .line 63
    .line 64
    aput-wide v13, v11, v12

    .line 65
    .line 66
    add-int/lit8 v10, v10, 0x1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_1
    const/high16 v10, 0x7fc00000    # Float.NaN

    .line 70
    .line 71
    const/16 p3, 0x0

    .line 72
    .line 73
    const/4 v11, 0x0

    .line 74
    const/4 v12, 0x0

    .line 75
    const/4 v13, 0x0

    .line 76
    const/4 v14, 0x0

    .line 77
    const/4 v15, 0x0

    .line 78
    :goto_1
    iget-object v2, v0, Landroidx/constraintlayout/motion/widget/q;->w:[D

    .line 79
    .line 80
    const/16 v16, 0x0

    .line 81
    .line 82
    array-length v8, v2

    .line 83
    if-ge v11, v8, :cond_b

    .line 84
    .line 85
    aget-wide v18, v2, v11

    .line 86
    .line 87
    invoke-static/range {v18 .. v19}, Ljava/lang/Double;->isNaN(D)Z

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    const-wide/16 v18, 0x0

    .line 92
    .line 93
    if-eqz v2, :cond_3

    .line 94
    .line 95
    if-eqz p6, :cond_2

    .line 96
    .line 97
    aget-wide v20, p6, v11

    .line 98
    .line 99
    cmpl-double v2, v20, v18

    .line 100
    .line 101
    if-nez v2, :cond_3

    .line 102
    .line 103
    :cond_2
    move/from16 p4, v10

    .line 104
    .line 105
    goto :goto_4

    .line 106
    :cond_3
    if-eqz p6, :cond_4

    .line 107
    .line 108
    aget-wide v18, p6, v11

    .line 109
    .line 110
    :cond_4
    iget-object v2, v0, Landroidx/constraintlayout/motion/widget/q;->w:[D

    .line 111
    .line 112
    aget-wide v20, v2, v11

    .line 113
    .line 114
    invoke-static/range {v20 .. v21}, Ljava/lang/Double;->isNaN(D)Z

    .line 115
    .line 116
    .line 117
    move-result v2

    .line 118
    if-eqz v2, :cond_5

    .line 119
    .line 120
    :goto_2
    move/from16 p4, v10

    .line 121
    .line 122
    move-wide/from16 v9, v18

    .line 123
    .line 124
    goto :goto_3

    .line 125
    :cond_5
    iget-object v2, v0, Landroidx/constraintlayout/motion/widget/q;->w:[D

    .line 126
    .line 127
    aget-wide v20, v2, v11

    .line 128
    .line 129
    add-double v18, v20, v18

    .line 130
    .line 131
    goto :goto_2

    .line 132
    :goto_3
    double-to-float v8, v9

    .line 133
    iget-object v9, v0, Landroidx/constraintlayout/motion/widget/q;->x:[D

    .line 134
    .line 135
    aget-wide v9, v9, v11

    .line 136
    .line 137
    double-to-float v9, v9

    .line 138
    const/4 v10, 0x1

    .line 139
    if-eq v11, v10, :cond_a

    .line 140
    .line 141
    const/4 v2, 0x2

    .line 142
    if-eq v11, v2, :cond_9

    .line 143
    .line 144
    const/4 v2, 0x3

    .line 145
    if-eq v11, v2, :cond_8

    .line 146
    .line 147
    const/4 v2, 0x4

    .line 148
    if-eq v11, v2, :cond_7

    .line 149
    .line 150
    const/4 v2, 0x5

    .line 151
    if-eq v11, v2, :cond_6

    .line 152
    .line 153
    :goto_4
    move/from16 v10, p4

    .line 154
    .line 155
    goto :goto_5

    .line 156
    :cond_6
    move v10, v8

    .line 157
    goto :goto_5

    .line 158
    :cond_7
    move/from16 v10, p4

    .line 159
    .line 160
    move v7, v8

    .line 161
    move v15, v9

    .line 162
    goto :goto_5

    .line 163
    :cond_8
    move/from16 v10, p4

    .line 164
    .line 165
    move v6, v8

    .line 166
    move v14, v9

    .line 167
    goto :goto_5

    .line 168
    :cond_9
    move/from16 v10, p4

    .line 169
    .line 170
    move v5, v8

    .line 171
    move v13, v9

    .line 172
    goto :goto_5

    .line 173
    :cond_a
    move/from16 v10, p4

    .line 174
    .line 175
    move v4, v8

    .line 176
    move v12, v9

    .line 177
    :goto_5
    add-int/lit8 v11, v11, 0x1

    .line 178
    .line 179
    const/4 v9, 0x1

    .line 180
    goto :goto_1

    .line 181
    :cond_b
    move/from16 p4, v10

    .line 182
    .line 183
    iget-object v0, v0, Landroidx/constraintlayout/motion/widget/q;->t:Landroidx/constraintlayout/motion/widget/m;

    .line 184
    .line 185
    const/high16 v8, 0x40000000    # 2.0f

    .line 186
    .line 187
    if-eqz v0, :cond_e

    .line 188
    .line 189
    const/4 v2, 0x2

    .line 190
    new-array v9, v2, [F

    .line 191
    .line 192
    new-array v10, v2, [F

    .line 193
    .line 194
    move/from16 v11, p1

    .line 195
    .line 196
    float-to-double v14, v11

    .line 197
    invoke-virtual {v0, v14, v15, v9, v10}, Landroidx/constraintlayout/motion/widget/m;->h(D[F[F)V

    .line 198
    .line 199
    .line 200
    aget v0, v9, v16

    .line 201
    .line 202
    const/16 v17, 0x1

    .line 203
    .line 204
    aget v9, v9, v17

    .line 205
    .line 206
    aget v11, v10, v16

    .line 207
    .line 208
    aget v10, v10, v17

    .line 209
    .line 210
    float-to-double v14, v0

    .line 211
    float-to-double v2, v4

    .line 212
    float-to-double v4, v5

    .line 213
    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    .line 214
    .line 215
    .line 216
    move-result-wide v18

    .line 217
    mul-double v18, v18, v2

    .line 218
    .line 219
    add-double v14, v14, v18

    .line 220
    .line 221
    div-float v0, v6, v8

    .line 222
    .line 223
    move/from16 p6, v8

    .line 224
    .line 225
    move/from16 p1, v9

    .line 226
    .line 227
    float-to-double v8, v0

    .line 228
    sub-double/2addr v14, v8

    .line 229
    double-to-float v0, v14

    .line 230
    move/from16 v8, p1

    .line 231
    .line 232
    float-to-double v8, v8

    .line 233
    invoke-static {v4, v5}, Ljava/lang/Math;->cos(D)D

    .line 234
    .line 235
    .line 236
    move-result-wide v14

    .line 237
    mul-double/2addr v14, v2

    .line 238
    sub-double/2addr v8, v14

    .line 239
    div-float v14, v7, p6

    .line 240
    .line 241
    float-to-double v14, v14

    .line 242
    sub-double/2addr v8, v14

    .line 243
    double-to-float v8, v8

    .line 244
    float-to-double v14, v11

    .line 245
    float-to-double v11, v12

    .line 246
    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    .line 247
    .line 248
    .line 249
    move-result-wide v18

    .line 250
    mul-double v18, v18, v11

    .line 251
    .line 252
    add-double v14, v14, v18

    .line 253
    .line 254
    invoke-static {v4, v5}, Ljava/lang/Math;->cos(D)D

    .line 255
    .line 256
    .line 257
    move-result-wide v18

    .line 258
    mul-double v18, v18, v2

    .line 259
    .line 260
    move-wide/from16 v20, v2

    .line 261
    .line 262
    float-to-double v2, v13

    .line 263
    mul-double v18, v18, v2

    .line 264
    .line 265
    add-double v14, v14, v18

    .line 266
    .line 267
    double-to-float v9, v14

    .line 268
    float-to-double v13, v10

    .line 269
    invoke-static {v4, v5}, Ljava/lang/Math;->cos(D)D

    .line 270
    .line 271
    .line 272
    move-result-wide v18

    .line 273
    mul-double v11, v11, v18

    .line 274
    .line 275
    sub-double/2addr v13, v11

    .line 276
    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    .line 277
    .line 278
    .line 279
    move-result-wide v4

    .line 280
    mul-double v4, v4, v20

    .line 281
    .line 282
    mul-double/2addr v4, v2

    .line 283
    add-double/2addr v13, v4

    .line 284
    double-to-float v2, v13

    .line 285
    move-object/from16 v3, p5

    .line 286
    .line 287
    array-length v4, v3

    .line 288
    const/4 v5, 0x2

    .line 289
    if-lt v4, v5, :cond_c

    .line 290
    .line 291
    float-to-double v4, v9

    .line 292
    aput-wide v4, v3, v16

    .line 293
    .line 294
    float-to-double v4, v2

    .line 295
    const/16 v17, 0x1

    .line 296
    .line 297
    aput-wide v4, v3, v17

    .line 298
    .line 299
    :cond_c
    invoke-static/range {p4 .. p4}, Ljava/lang/Float;->isNaN(F)Z

    .line 300
    .line 301
    .line 302
    move-result v3

    .line 303
    if-nez v3, :cond_d

    .line 304
    .line 305
    move/from16 v10, p4

    .line 306
    .line 307
    float-to-double v3, v10

    .line 308
    float-to-double v10, v2

    .line 309
    float-to-double v12, v9

    .line 310
    invoke-static {v10, v11, v12, v13}, Ljava/lang/Math;->atan2(DD)D

    .line 311
    .line 312
    .line 313
    move-result-wide v9

    .line 314
    invoke-static {v9, v10}, Ljava/lang/Math;->toDegrees(D)D

    .line 315
    .line 316
    .line 317
    move-result-wide v9

    .line 318
    add-double/2addr v3, v9

    .line 319
    double-to-float v2, v3

    .line 320
    invoke-virtual {v1, v2}, Landroid/view/View;->setRotation(F)V

    .line 321
    .line 322
    .line 323
    :cond_d
    move v4, v0

    .line 324
    move v5, v8

    .line 325
    goto :goto_6

    .line 326
    :cond_e
    move/from16 v10, p4

    .line 327
    .line 328
    move/from16 p6, v8

    .line 329
    .line 330
    invoke-static {v10}, Ljava/lang/Float;->isNaN(F)Z

    .line 331
    .line 332
    .line 333
    move-result v0

    .line 334
    if-nez v0, :cond_f

    .line 335
    .line 336
    div-float v14, v14, p6

    .line 337
    .line 338
    add-float/2addr v12, v14

    .line 339
    div-float v15, v15, p6

    .line 340
    .line 341
    add-float/2addr v13, v15

    .line 342
    float-to-double v2, v13

    .line 343
    float-to-double v8, v12

    .line 344
    invoke-static {v2, v3, v8, v9}, Ljava/lang/Math;->atan2(DD)D

    .line 345
    .line 346
    .line 347
    move-result-wide v2

    .line 348
    invoke-static {v2, v3}, Ljava/lang/Math;->toDegrees(D)D

    .line 349
    .line 350
    .line 351
    move-result-wide v2

    .line 352
    double-to-float v0, v2

    .line 353
    add-float/2addr v10, v0

    .line 354
    add-float v10, v10, p3

    .line 355
    .line 356
    invoke-virtual {v1, v10}, Landroid/view/View;->setRotation(F)V

    .line 357
    .line 358
    .line 359
    :cond_f
    :goto_6
    instance-of v0, v1, Landroidx/constraintlayout/motion/widget/c;

    .line 360
    .line 361
    if-eqz v0, :cond_10

    .line 362
    .line 363
    add-float/2addr v6, v4

    .line 364
    add-float/2addr v7, v5

    .line 365
    move-object v0, v1

    .line 366
    check-cast v0, Landroidx/constraintlayout/motion/widget/c;

    .line 367
    .line 368
    invoke-interface {v0, v4, v5, v6, v7}, Landroidx/constraintlayout/motion/widget/c;->a(FFFF)V

    .line 369
    .line 370
    .line 371
    return-void

    .line 372
    :cond_10
    const/high16 v0, 0x3f000000    # 0.5f

    .line 373
    .line 374
    add-float/2addr v4, v0

    .line 375
    float-to-int v2, v4

    .line 376
    add-float/2addr v5, v0

    .line 377
    float-to-int v0, v5

    .line 378
    add-float/2addr v4, v6

    .line 379
    float-to-int v3, v4

    .line 380
    add-float/2addr v5, v7

    .line 381
    float-to-int v4, v5

    .line 382
    sub-int v5, v3, v2

    .line 383
    .line 384
    sub-int v6, v4, v0

    .line 385
    .line 386
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    .line 387
    .line 388
    .line 389
    move-result v7

    .line 390
    if-ne v5, v7, :cond_12

    .line 391
    .line 392
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    .line 393
    .line 394
    .line 395
    move-result v7

    .line 396
    if-eq v6, v7, :cond_11

    .line 397
    .line 398
    goto :goto_7

    .line 399
    :cond_11
    if-eqz p7, :cond_13

    .line 400
    .line 401
    :cond_12
    :goto_7
    const/high16 v7, 0x40000000    # 2.0f

    .line 402
    .line 403
    invoke-static {v5, v7}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 404
    .line 405
    .line 406
    move-result v5

    .line 407
    invoke-static {v6, v7}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 408
    .line 409
    .line 410
    move-result v6

    .line 411
    invoke-virtual {v1, v5, v6}, Landroid/view/View;->measure(II)V

    .line 412
    .line 413
    .line 414
    :cond_13
    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/view/View;->layout(IIII)V

    .line 415
    .line 416
    .line 417
    return-void
.end method
