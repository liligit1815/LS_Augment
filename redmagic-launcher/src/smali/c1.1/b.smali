.class public Lc1/b;
.super Landroid/view/ViewGroup$MarginLayoutParams;
.source "CellLayoutLayoutParams.java"


# instance fields
.field private a:I
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
    .end annotation
.end field

.field private b:I
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
    .end annotation
.end field

.field private c:I

.field private d:I

.field public e:Z

.field public f:I
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
    .end annotation
.end field

.field public g:I
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
    .end annotation
.end field

.field public h:Z

.field public i:Z

.field public j:I
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
    .end annotation
.end field

.field public k:I
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
    .end annotation
.end field

.field public l:Z

.field public m:I

.field public n:I

.field public o:Z

.field public p:I


# direct methods
.method public constructor <init>(IIII)V
    .locals 2

    const/4 v0, -0x1

    .line 17
    invoke-direct {p0, v0, v0}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    const/4 v1, 0x1

    .line 18
    iput-boolean v1, p0, Lc1/b;->h:Z

    .line 19
    iput-boolean v1, p0, Lc1/b;->i:Z

    .line 20
    iput v0, p0, Lc1/b;->m:I

    .line 21
    iput v0, p0, Lc1/b;->n:I

    const/4 v0, 0x0

    .line 22
    iput-boolean v0, p0, Lc1/b;->o:Z

    .line 23
    iput p1, p0, Lc1/b;->a:I

    .line 24
    iput p2, p0, Lc1/b;->b:I

    .line 25
    iput p3, p0, Lc1/b;->f:I

    .line 26
    iput p4, p0, Lc1/b;->g:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lc1/b;->h:Z

    .line 3
    iput-boolean p1, p0, Lc1/b;->i:Z

    const/4 p2, -0x1

    .line 4
    iput p2, p0, Lc1/b;->m:I

    .line 5
    iput p2, p0, Lc1/b;->n:I

    const/4 p2, 0x0

    .line 6
    iput-boolean p2, p0, Lc1/b;->o:Z

    .line 7
    iput p1, p0, Lc1/b;->f:I

    .line 8
    iput p1, p0, Lc1/b;->g:I

    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup$LayoutParams;)V
    .locals 1

    .line 9
    invoke-direct {p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    const/4 p1, 0x1

    .line 10
    iput-boolean p1, p0, Lc1/b;->h:Z

    .line 11
    iput-boolean p1, p0, Lc1/b;->i:Z

    const/4 v0, -0x1

    .line 12
    iput v0, p0, Lc1/b;->m:I

    .line 13
    iput v0, p0, Lc1/b;->n:I

    const/4 v0, 0x0

    .line 14
    iput-boolean v0, p0, Lc1/b;->o:Z

    .line 15
    iput p1, p0, Lc1/b;->f:I

    .line 16
    iput p1, p0, Lc1/b;->g:I

    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget p0, p0, Lc1/b;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public b()I
    .locals 0

    .line 1
    iget p0, p0, Lc1/b;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Lc1/b;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget p0, p0, Lc1/b;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public e(I)V
    .locals 0

    .line 1
    iput p1, p0, Lc1/b;->a:I

    .line 2
    .line 3
    return-void
.end method

.method public f(Landroid/graphics/Point;)V
    .locals 1

    .line 1
    iget v0, p1, Landroid/graphics/Point;->x:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lc1/b;->e(I)V

    .line 4
    .line 5
    .line 6
    iget p1, p1, Landroid/graphics/Point;->y:I

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lc1/b;->g(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public g(I)V
    .locals 0

    .line 1
    iput p1, p0, Lc1/b;->b:I

    .line 2
    .line 3
    return-void
.end method

.method public h(I)V
    .locals 0

    .line 1
    iput p1, p0, Lc1/b;->c:I

    .line 2
    .line 3
    return-void
.end method

.method public i(I)V
    .locals 0

    .line 1
    iput p1, p0, Lc1/b;->d:I

    .line 2
    .line 3
    return-void
.end method

.method public j(IIZIIFFLandroid/graphics/Point;Landroid/graphics/Rect;)V
    .locals 4

    .line 1
    iget-boolean p5, p0, Lc1/b;->h:Z

    .line 2
    .line 3
    if-eqz p5, :cond_3

    .line 4
    .line 5
    iget p5, p0, Lc1/b;->f:I

    .line 6
    .line 7
    iget v0, p0, Lc1/b;->g:I

    .line 8
    .line 9
    iget-boolean v1, p0, Lc1/b;->e:Z

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lc1/b;->c()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p0}, Lc1/b;->a()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    :goto_0
    iget-boolean v2, p0, Lc1/b;->e:Z

    .line 23
    .line 24
    if-eqz v2, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Lc1/b;->d()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    goto :goto_1

    .line 31
    :cond_1
    invoke-virtual {p0}, Lc1/b;->b()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    :goto_1
    if-eqz p3, :cond_2

    .line 36
    .line 37
    sub-int/2addr p4, v1

    .line 38
    iget p3, p0, Lc1/b;->f:I

    .line 39
    .line 40
    sub-int v1, p4, p3

    .line 41
    .line 42
    :cond_2
    add-int/lit8 p3, p5, -0x1

    .line 43
    .line 44
    iget p4, p8, Landroid/graphics/Point;->x:I

    .line 45
    .line 46
    mul-int/2addr p3, p4

    .line 47
    add-int/lit8 p4, v0, -0x1

    .line 48
    .line 49
    iget v3, p8, Landroid/graphics/Point;->y:I

    .line 50
    .line 51
    mul-int/2addr p4, v3

    .line 52
    mul-int/2addr p5, p1

    .line 53
    add-int/2addr p5, p3

    .line 54
    int-to-float p3, p5

    .line 55
    div-float/2addr p3, p6

    .line 56
    mul-int/2addr v0, p2

    .line 57
    add-int/2addr v0, p4

    .line 58
    int-to-float p4, v0

    .line 59
    div-float/2addr p4, p7

    .line 60
    invoke-static {p3}, Ljava/lang/Math;->round(F)I

    .line 61
    .line 62
    .line 63
    move-result p3

    .line 64
    iget p5, p0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 65
    .line 66
    sub-int/2addr p3, p5

    .line 67
    iget p5, p0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 68
    .line 69
    sub-int/2addr p3, p5

    .line 70
    iput p3, p0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 71
    .line 72
    invoke-static {p4}, Ljava/lang/Math;->round(F)I

    .line 73
    .line 74
    .line 75
    move-result p3

    .line 76
    iget p4, p0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 77
    .line 78
    sub-int/2addr p3, p4

    .line 79
    iget p5, p0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 80
    .line 81
    sub-int/2addr p3, p5

    .line 82
    iput p3, p0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 83
    .line 84
    iget p5, p0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 85
    .line 86
    mul-int/2addr p1, v1

    .line 87
    add-int/2addr p5, p1

    .line 88
    iget p1, p8, Landroid/graphics/Point;->x:I

    .line 89
    .line 90
    mul-int/2addr v1, p1

    .line 91
    add-int/2addr p5, v1

    .line 92
    iput p5, p0, Lc1/b;->j:I

    .line 93
    .line 94
    mul-int/2addr p2, v2

    .line 95
    add-int/2addr p4, p2

    .line 96
    iget p1, p8, Landroid/graphics/Point;->y:I

    .line 97
    .line 98
    mul-int/2addr v2, p1

    .line 99
    add-int/2addr p4, v2

    .line 100
    iput p4, p0, Lc1/b;->k:I

    .line 101
    .line 102
    if-eqz p9, :cond_3

    .line 103
    .line 104
    iget p1, p9, Landroid/graphics/Rect;->left:I

    .line 105
    .line 106
    add-int/2addr p5, p1

    .line 107
    iput p5, p0, Lc1/b;->j:I

    .line 108
    .line 109
    iget p2, p9, Landroid/graphics/Rect;->top:I

    .line 110
    .line 111
    add-int/2addr p4, p2

    .line 112
    iput p4, p0, Lc1/b;->k:I

    .line 113
    .line 114
    iget p4, p0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 115
    .line 116
    iget p5, p9, Landroid/graphics/Rect;->right:I

    .line 117
    .line 118
    add-int/2addr p1, p5

    .line 119
    sub-int/2addr p4, p1

    .line 120
    iput p4, p0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 121
    .line 122
    iget p1, p9, Landroid/graphics/Rect;->bottom:I

    .line 123
    .line 124
    add-int/2addr p2, p1

    .line 125
    sub-int/2addr p3, p2

    .line 126
    iput p3, p0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 127
    .line 128
    :cond_3
    return-void
.end method

.method public k(IIZIILandroid/graphics/Point;)V
    .locals 10

    .line 1
    const/high16 v7, 0x3f800000    # 1.0f

    .line 2
    .line 3
    const/4 v9, 0x0

    .line 4
    const/high16 v6, 0x3f800000    # 1.0f

    .line 5
    .line 6
    move-object v0, p0

    .line 7
    move v1, p1

    .line 8
    move v2, p2

    .line 9
    move v3, p3

    .line 10
    move v4, p4

    .line 11
    move v5, p5

    .line 12
    move-object/from16 v8, p6

    .line 13
    .line 14
    invoke-virtual/range {v0 .. v9}, Lc1/b;->j(IIZIIFFLandroid/graphics/Point;Landroid/graphics/Rect;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public l(Landroid/content/Context;IIIIZIZ)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lc1/b;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    iput p7, p0, Lc1/b;->p:I

    .line 6
    .line 7
    iget v0, p0, Lc1/b;->f:I

    .line 8
    .line 9
    iget v1, p0, Lc1/b;->g:I

    .line 10
    .line 11
    iget-boolean v2, p0, Lc1/b;->e:Z

    .line 12
    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    iget v3, p0, Lc1/b;->c:I

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget v3, p0, Lc1/b;->a:I

    .line 19
    .line 20
    :goto_0
    if-eqz v2, :cond_1

    .line 21
    .line 22
    iget v2, p0, Lc1/b;->d:I

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_1
    iget v2, p0, Lc1/b;->b:I

    .line 26
    .line 27
    :goto_1
    if-eqz p6, :cond_2

    .line 28
    .line 29
    sub-int/2addr p7, v3

    .line 30
    sub-int v3, p7, v0

    .line 31
    .line 32
    :cond_2
    mul-int/2addr v0, p4

    .line 33
    iget p6, p0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 34
    .line 35
    sub-int/2addr v0, p6

    .line 36
    iget p6, p0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 37
    .line 38
    sub-int/2addr v0, p6

    .line 39
    iput v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 40
    .line 41
    mul-int/2addr v1, p5

    .line 42
    iget p6, p0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 43
    .line 44
    sub-int/2addr v1, p6

    .line 45
    iget p6, p0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 46
    .line 47
    sub-int/2addr v1, p6

    .line 48
    iput v1, p0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 49
    .line 50
    invoke-static {p1}, Lp1/f;->w(Landroid/content/Context;)Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-eqz p1, :cond_3

    .line 55
    .line 56
    mul-int/2addr v3, p4

    .line 57
    iget p1, p0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 58
    .line 59
    add-int/2addr v3, p1

    .line 60
    iput v3, p0, Lc1/b;->j:I

    .line 61
    .line 62
    mul-int/2addr v2, p3

    .line 63
    sub-int/2addr p3, p5

    .line 64
    div-int/lit8 p3, p3, 0x2

    .line 65
    .line 66
    add-int/2addr v2, p3

    .line 67
    iget p1, p0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 68
    .line 69
    add-int/2addr v2, p1

    .line 70
    iput v2, p0, Lc1/b;->k:I

    .line 71
    .line 72
    return-void

    .line 73
    :cond_3
    mul-int/2addr v3, p2

    .line 74
    sub-int/2addr p2, p4

    .line 75
    div-int/lit8 p2, p2, 0x2

    .line 76
    .line 77
    add-int/2addr v3, p2

    .line 78
    iget p1, p0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 79
    .line 80
    add-int/2addr v3, p1

    .line 81
    iput v3, p0, Lc1/b;->j:I

    .line 82
    .line 83
    mul-int/2addr v2, p5

    .line 84
    iget p1, p0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 85
    .line 86
    add-int/2addr v2, p1

    .line 87
    iput v2, p0, Lc1/b;->k:I

    .line 88
    .line 89
    if-eqz p8, :cond_4

    .line 90
    .line 91
    iget p1, p0, Lc1/b;->p:I

    .line 92
    .line 93
    mul-int/2addr p1, p4

    .line 94
    add-int/2addr v3, p1

    .line 95
    iput v3, p0, Lc1/b;->j:I

    .line 96
    .line 97
    :cond_4
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "("

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lc1/b;->a()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v1, ", "

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lc1/b;->b()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    iget v2, p0, Lc1/b;->f:I

    .line 34
    .line 35
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget p0, p0, Lc1/b;->g:I

    .line 42
    .line 43
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string p0, ")"

    .line 47
    .line 48
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

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
