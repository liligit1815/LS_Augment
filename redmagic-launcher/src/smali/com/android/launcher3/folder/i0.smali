.class public Lcom/android/launcher3/folder/i0;
.super Ljava/lang/Object;
.source "MifavorFolderIconLayoutRule.java"


# static fields
.field public static volatile k:I = 0x9

.field public static volatile l:I

.field public static volatile m:F

.field public static volatile n:F

.field public static final o:F

.field public static final p:F


# instance fields
.field private a:I

.field private b:I

.field private c:I

.field public d:I

.field private e:[F

.field private f:F

.field private g:Z

.field private h:F

.field private i:I

.field private j:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x3

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 v0, 0x4

    .line 10
    :goto_0
    sput v0, Lcom/android/launcher3/folder/i0;->l:I

    .line 11
    .line 12
    const v0, 0x3e570a3d    # 0.21f

    .line 13
    .line 14
    .line 15
    sput v0, Lcom/android/launcher3/folder/i0;->m:F

    .line 16
    .line 17
    const v1, 0x3cc56d5d    # 0.0241f

    .line 18
    .line 19
    .line 20
    sput v1, Lcom/android/launcher3/folder/i0;->n:F

    .line 21
    .line 22
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-nez v2, :cond_1

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_1
    const v0, 0x3e23d70a    # 0.16f

    .line 30
    .line 31
    .line 32
    :goto_1
    sput v0, Lcom/android/launcher3/folder/i0;->o:F

    .line 33
    .line 34
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_2

    .line 39
    .line 40
    goto :goto_2

    .line 41
    :cond_2
    const v1, 0x3cf5c28f    # 0.03f

    .line 42
    .line 43
    .line 44
    :goto_2
    sput v1, Lcom/android/launcher3/folder/i0;->p:F

    .line 45
    .line 46
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    new-array v0, v0, [F

    .line 6
    .line 7
    iput-object v0, p0, Lcom/android/launcher3/folder/i0;->e:[F

    .line 8
    .line 9
    return-void
.end method

.method private e(Lcom/android/launcher3/h0;Lcom/android/launcher3/folder/FolderIcon;)V
    .locals 2

    .line 1
    iget v0, p1, Lcom/android/launcher3/h0;->Q1:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    iput v0, p0, Lcom/android/launcher3/folder/i0;->f:F

    .line 5
    .line 6
    invoke-static {}, Lx1/O;->C3()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p2}, Lcom/android/launcher3/folder/FolderIcon;->getIconSize()I

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    int-to-float p2, p2

    .line 17
    iput p2, p0, Lcom/android/launcher3/folder/i0;->f:F

    .line 18
    .line 19
    :cond_0
    iget-object p2, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 20
    .line 21
    iget-object v0, p2, Lcom/android/launcher3/F1;->K0:[I

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    aget v0, v0, v1

    .line 25
    .line 26
    iput v0, p0, Lcom/android/launcher3/folder/i0;->i:I

    .line 27
    .line 28
    iget p2, p2, Lcom/android/launcher3/r4;->U:I

    .line 29
    .line 30
    iput p2, p0, Lcom/android/launcher3/folder/i0;->j:I

    .line 31
    .line 32
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    if-eqz p2, :cond_1

    .line 37
    .line 38
    iget p2, p0, Lcom/android/launcher3/folder/i0;->i:I

    .line 39
    .line 40
    sput p2, Lcom/android/launcher3/folder/i0;->l:I

    .line 41
    .line 42
    iget p2, p0, Lcom/android/launcher3/folder/i0;->j:I

    .line 43
    .line 44
    sput p2, Lcom/android/launcher3/folder/i0;->k:I

    .line 45
    .line 46
    const p2, 0x3e23d70a    # 0.16f

    .line 47
    .line 48
    .line 49
    sput p2, Lcom/android/launcher3/folder/i0;->m:F

    .line 50
    .line 51
    iget v0, p0, Lcom/android/launcher3/folder/i0;->f:F

    .line 52
    .line 53
    mul-float/2addr v0, p2

    .line 54
    float-to-int p2, v0

    .line 55
    iput p2, p0, Lcom/android/launcher3/folder/i0;->a:I

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    iget p2, p0, Lcom/android/launcher3/folder/i0;->f:F

    .line 59
    .line 60
    sget v0, Lcom/android/launcher3/folder/i0;->o:F

    .line 61
    .line 62
    mul-float/2addr p2, v0

    .line 63
    float-to-int p2, p2

    .line 64
    iput p2, p0, Lcom/android/launcher3/folder/i0;->a:I

    .line 65
    .line 66
    :goto_0
    iget p2, p0, Lcom/android/launcher3/folder/i0;->f:F

    .line 67
    .line 68
    sget v0, Lcom/android/launcher3/folder/i0;->p:F

    .line 69
    .line 70
    mul-float/2addr v0, p2

    .line 71
    float-to-int v0, v0

    .line 72
    iput v0, p0, Lcom/android/launcher3/folder/i0;->b:I

    .line 73
    .line 74
    iget v0, p0, Lcom/android/launcher3/folder/i0;->a:I

    .line 75
    .line 76
    if-lez v0, :cond_2

    .line 77
    .line 78
    const/4 v1, 0x0

    .line 79
    cmpl-float v1, p2, v1

    .line 80
    .line 81
    if-lez v1, :cond_2

    .line 82
    .line 83
    int-to-float v0, v0

    .line 84
    const/high16 v1, 0x3f800000    # 1.0f

    .line 85
    .line 86
    mul-float/2addr v0, v1

    .line 87
    div-float/2addr v0, p2

    .line 88
    sput v0, Lcom/android/launcher3/folder/i0;->m:F

    .line 89
    .line 90
    iget p2, p0, Lcom/android/launcher3/folder/i0;->b:I

    .line 91
    .line 92
    int-to-float p2, p2

    .line 93
    mul-float/2addr p2, v1

    .line 94
    iget v0, p0, Lcom/android/launcher3/folder/i0;->f:F

    .line 95
    .line 96
    div-float/2addr p2, v0

    .line 97
    sput p2, Lcom/android/launcher3/folder/i0;->n:F

    .line 98
    .line 99
    :cond_2
    iget p2, p0, Lcom/android/launcher3/folder/i0;->i:I

    .line 100
    .line 101
    iget v0, p0, Lcom/android/launcher3/folder/i0;->a:I

    .line 102
    .line 103
    mul-int/2addr v0, p2

    .line 104
    add-int/lit8 p2, p2, -0x1

    .line 105
    .line 106
    iget v1, p0, Lcom/android/launcher3/folder/i0;->b:I

    .line 107
    .line 108
    mul-int/2addr p2, v1

    .line 109
    add-int/2addr v0, p2

    .line 110
    iput v0, p0, Lcom/android/launcher3/folder/i0;->d:I

    .line 111
    .line 112
    iget p2, p0, Lcom/android/launcher3/folder/i0;->f:F

    .line 113
    .line 114
    int-to-float v0, v0

    .line 115
    sub-float/2addr p2, v0

    .line 116
    const/high16 v0, 0x40000000    # 2.0f

    .line 117
    .line 118
    div-float/2addr p2, v0

    .line 119
    float-to-int p2, p2

    .line 120
    iput p2, p0, Lcom/android/launcher3/folder/i0;->c:I

    .line 121
    .line 122
    invoke-direct {p0, p1}, Lcom/android/launcher3/folder/i0;->f(Lcom/android/launcher3/h0;)V

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method private f(Lcom/android/launcher3/h0;)V
    .locals 3

    .line 1
    sget v0, Lcom/android/launcher3/folder/i0;->m:F

    .line 2
    .line 3
    iput v0, p0, Lcom/android/launcher3/folder/i0;->h:F

    .line 4
    .line 5
    iget-object v1, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 6
    .line 7
    iget-boolean v1, v1, Lcom/android/launcher3/r4;->c:Z

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/launcher3/X3;->l()F

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    mul-float/2addr v0, p1

    .line 16
    iput v0, p0, Lcom/android/launcher3/folder/i0;->h:F

    .line 17
    .line 18
    :cond_0
    iget p1, p0, Lcom/android/launcher3/folder/i0;->c:I

    .line 19
    .line 20
    mul-int/lit8 p1, p1, 0x2

    .line 21
    .line 22
    iget v0, p0, Lcom/android/launcher3/folder/i0;->b:I

    .line 23
    .line 24
    iget v1, p0, Lcom/android/launcher3/folder/i0;->i:I

    .line 25
    .line 26
    add-int/lit8 v2, v1, -0x1

    .line 27
    .line 28
    mul-int/2addr v0, v2

    .line 29
    add-int/2addr p1, v0

    .line 30
    iget v0, p0, Lcom/android/launcher3/folder/i0;->a:I

    .line 31
    .line 32
    mul-int/2addr v0, v1

    .line 33
    add-int/2addr p1, v0

    .line 34
    int-to-float p1, p1

    .line 35
    iget v0, p0, Lcom/android/launcher3/folder/i0;->f:F

    .line 36
    .line 37
    cmpl-float v1, p1, v0

    .line 38
    .line 39
    if-lez v1, :cond_1

    .line 40
    .line 41
    iget v1, p0, Lcom/android/launcher3/folder/i0;->h:F

    .line 42
    .line 43
    div-float/2addr v0, p1

    .line 44
    mul-float/2addr v1, v0

    .line 45
    iput v1, p0, Lcom/android/launcher3/folder/i0;->h:F

    .line 46
    .line 47
    :cond_1
    return-void
.end method


# virtual methods
.method public a(ILcom/android/launcher3/folder/y0;Lcom/android/launcher3/h0;Lcom/android/launcher3/folder/FolderIcon;)Lcom/android/launcher3/folder/y0;
    .locals 0

    .line 1
    invoke-direct {p0, p3, p4}, Lcom/android/launcher3/folder/i0;->e(Lcom/android/launcher3/h0;Lcom/android/launcher3/folder/FolderIcon;)V

    .line 2
    .line 3
    .line 4
    iget p3, p0, Lcom/android/launcher3/folder/i0;->h:F

    .line 5
    .line 6
    iget-object p4, p0, Lcom/android/launcher3/folder/i0;->e:[F

    .line 7
    .line 8
    invoke-virtual {p0, p1, p4}, Lcom/android/launcher3/folder/i0;->b(I[F)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/folder/i0;->e:[F

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    aget p1, p0, p1

    .line 15
    .line 16
    const/4 p4, 0x1

    .line 17
    aget p0, p0, p4

    .line 18
    .line 19
    if-nez p2, :cond_0

    .line 20
    .line 21
    new-instance p2, Lcom/android/launcher3/folder/y0;

    .line 22
    .line 23
    invoke-direct {p2, p1, p0, p3}, Lcom/android/launcher3/folder/y0;-><init>(FFF)V

    .line 24
    .line 25
    .line 26
    return-object p2

    .line 27
    :cond_0
    invoke-virtual {p2, p1, p0, p3}, Lcom/android/launcher3/folder/y0;->a(FFF)V

    .line 28
    .line 29
    .line 30
    return-object p2
.end method

.method public b(I[F)V
    .locals 5

    .line 1
    iget v0, p0, Lcom/android/launcher3/folder/i0;->j:I

    .line 2
    .line 3
    rem-int/2addr p1, v0

    .line 4
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget v0, p0, Lcom/android/launcher3/folder/i0;->i:I

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    sget v0, Lcom/android/launcher3/folder/i0;->l:I

    .line 14
    .line 15
    :goto_0
    div-int v0, p1, v0

    .line 16
    .line 17
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    iget v1, p0, Lcom/android/launcher3/folder/i0;->i:I

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_1
    sget v1, Lcom/android/launcher3/folder/i0;->l:I

    .line 27
    .line 28
    :goto_1
    rem-int/2addr p1, v1

    .line 29
    iget-boolean v1, p0, Lcom/android/launcher3/folder/i0;->g:Z

    .line 30
    .line 31
    const/4 v2, 0x1

    .line 32
    if-eqz v1, :cond_2

    .line 33
    .line 34
    sget v1, Lcom/android/launcher3/folder/i0;->l:I

    .line 35
    .line 36
    sub-int/2addr v1, v2

    .line 37
    sub-int p1, v1, p1

    .line 38
    .line 39
    :cond_2
    iget v1, p0, Lcom/android/launcher3/folder/i0;->c:I

    .line 40
    .line 41
    iget v3, p0, Lcom/android/launcher3/folder/i0;->a:I

    .line 42
    .line 43
    mul-int v4, p1, v3

    .line 44
    .line 45
    add-int/2addr v4, v1

    .line 46
    iget p0, p0, Lcom/android/launcher3/folder/i0;->b:I

    .line 47
    .line 48
    mul-int/2addr p1, p0

    .line 49
    add-int/2addr v4, p1

    .line 50
    int-to-float p1, v4

    .line 51
    const/4 v4, 0x0

    .line 52
    aput p1, p2, v4

    .line 53
    .line 54
    mul-int/2addr v3, v0

    .line 55
    add-int/2addr v1, v3

    .line 56
    mul-int/2addr v0, p0

    .line 57
    add-int/2addr v1, v0

    .line 58
    int-to-float p0, v1

    .line 59
    aput p0, p2, v2

    .line 60
    .line 61
    return-void
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/folder/i0;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public d(IZ)V
    .locals 0

    .line 1
    int-to-float p1, p1

    .line 2
    iput p1, p0, Lcom/android/launcher3/folder/i0;->f:F

    .line 3
    .line 4
    iput-boolean p2, p0, Lcom/android/launcher3/folder/i0;->g:Z

    .line 5
    .line 6
    return-void
.end method
