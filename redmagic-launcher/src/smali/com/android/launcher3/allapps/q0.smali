.class public Lcom/android/launcher3/allapps/q0;
.super Ljava/lang/Object;
.source "SectionDecorationHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/allapps/q0$a;
    }
.end annotation


# instance fields
.field protected final a:Landroid/graphics/Path;

.field protected final b:Landroid/graphics/RectF;

.field protected final c:I

.field protected final d:I

.field protected final e:Landroid/graphics/RectF;

.field protected final f:Landroid/graphics/Paint;

.field protected final g:I

.field protected h:I

.field protected i:I

.field protected j:F

.field protected k:I

.field protected l:Landroid/content/Context;

.field protected m:[F

.field protected n:I

.field protected o:Z

.field protected p:Z

.field protected q:Z

.field protected r:Z

.field protected s:Z

.field protected t:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;IZZZZ)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Path;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/allapps/q0;->a:Landroid/graphics/Path;

    .line 10
    .line 11
    new-instance v0, Landroid/graphics/RectF;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/launcher3/allapps/q0;->b:Landroid/graphics/RectF;

    .line 17
    .line 18
    new-instance v0, Landroid/graphics/RectF;

    .line 19
    .line 20
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/android/launcher3/allapps/q0;->e:Landroid/graphics/RectF;

    .line 24
    .line 25
    new-instance v0, Landroid/graphics/Paint;

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/android/launcher3/allapps/q0;->f:Landroid/graphics/Paint;

    .line 32
    .line 33
    const/16 v0, 0xff

    .line 34
    .line 35
    iput v0, p0, Lcom/android/launcher3/allapps/q0;->g:I

    .line 36
    .line 37
    iput-object p1, p0, Lcom/android/launcher3/allapps/q0;->l:Landroid/content/Context;

    .line 38
    .line 39
    iput p2, p0, Lcom/android/launcher3/allapps/q0;->n:I

    .line 40
    .line 41
    const p2, 0x7f06045b

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, p2}, Landroid/content/Context;->getColor(I)I

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    iput p2, p0, Lcom/android/launcher3/allapps/q0;->i:I

    .line 49
    .line 50
    const p2, 0x7f06045d

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1, p2}, Landroid/content/Context;->getColor(I)I

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    iput p2, p0, Lcom/android/launcher3/allapps/q0;->h:I

    .line 58
    .line 59
    iput-boolean p3, p0, Lcom/android/launcher3/allapps/q0;->o:Z

    .line 60
    .line 61
    iput-boolean p4, p0, Lcom/android/launcher3/allapps/q0;->p:Z

    .line 62
    .line 63
    iput-boolean p5, p0, Lcom/android/launcher3/allapps/q0;->q:Z

    .line 64
    .line 65
    iput-boolean p6, p0, Lcom/android/launcher3/allapps/q0;->r:Z

    .line 66
    .line 67
    const/4 p2, 0x0

    .line 68
    if-eqz p5, :cond_0

    .line 69
    .line 70
    if-eqz p6, :cond_0

    .line 71
    .line 72
    move p5, v1

    .line 73
    goto :goto_0

    .line 74
    :cond_0
    move p5, p2

    .line 75
    :goto_0
    iput-boolean p5, p0, Lcom/android/launcher3/allapps/q0;->s:Z

    .line 76
    .line 77
    if-eqz p3, :cond_1

    .line 78
    .line 79
    if-eqz p4, :cond_1

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_1
    move v1, p2

    .line 83
    :goto_1
    iput-boolean v1, p0, Lcom/android/launcher3/allapps/q0;->t:Z

    .line 84
    .line 85
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 86
    .line 87
    .line 88
    move-result-object p3

    .line 89
    const p4, 0x7f0700e1

    .line 90
    .line 91
    .line 92
    invoke-virtual {p3, p4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 93
    .line 94
    .line 95
    move-result p3

    .line 96
    iput p3, p0, Lcom/android/launcher3/allapps/q0;->c:I

    .line 97
    .line 98
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    const p3, 0x7f0700e3

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    iput p1, p0, Lcom/android/launcher3/allapps/q0;->d:I

    .line 110
    .line 111
    iput p2, p0, Lcom/android/launcher3/allapps/q0;->k:I

    .line 112
    .line 113
    const/4 p1, 0x0

    .line 114
    iput p1, p0, Lcom/android/launcher3/allapps/q0;->j:F

    .line 115
    .line 116
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/q0;->a()V

    .line 117
    .line 118
    .line 119
    return-void
.end method


# virtual methods
.method protected a()V
    .locals 10

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/allapps/q0;->o:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget v2, p0, Lcom/android/launcher3/allapps/q0;->c:I

    .line 7
    .line 8
    int-to-float v2, v2

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move v2, v1

    .line 11
    :goto_0
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget v0, p0, Lcom/android/launcher3/allapps/q0;->c:I

    .line 14
    .line 15
    int-to-float v0, v0

    .line 16
    goto :goto_1

    .line 17
    :cond_1
    move v0, v1

    .line 18
    :goto_1
    iget-boolean v3, p0, Lcom/android/launcher3/allapps/q0;->p:Z

    .line 19
    .line 20
    if-eqz v3, :cond_2

    .line 21
    .line 22
    iget v4, p0, Lcom/android/launcher3/allapps/q0;->c:I

    .line 23
    .line 24
    int-to-float v4, v4

    .line 25
    goto :goto_2

    .line 26
    :cond_2
    move v4, v1

    .line 27
    :goto_2
    if-eqz v3, :cond_3

    .line 28
    .line 29
    iget v3, p0, Lcom/android/launcher3/allapps/q0;->c:I

    .line 30
    .line 31
    int-to-float v3, v3

    .line 32
    goto :goto_3

    .line 33
    :cond_3
    move v3, v1

    .line 34
    :goto_3
    iget-boolean v5, p0, Lcom/android/launcher3/allapps/q0;->r:Z

    .line 35
    .line 36
    if-eqz v5, :cond_4

    .line 37
    .line 38
    iget v6, p0, Lcom/android/launcher3/allapps/q0;->c:I

    .line 39
    .line 40
    int-to-float v6, v6

    .line 41
    goto :goto_4

    .line 42
    :cond_4
    move v6, v1

    .line 43
    :goto_4
    if-eqz v5, :cond_5

    .line 44
    .line 45
    iget v5, p0, Lcom/android/launcher3/allapps/q0;->c:I

    .line 46
    .line 47
    int-to-float v5, v5

    .line 48
    goto :goto_5

    .line 49
    :cond_5
    move v5, v1

    .line 50
    :goto_5
    iget-boolean v7, p0, Lcom/android/launcher3/allapps/q0;->q:Z

    .line 51
    .line 52
    if-eqz v7, :cond_6

    .line 53
    .line 54
    iget v8, p0, Lcom/android/launcher3/allapps/q0;->c:I

    .line 55
    .line 56
    int-to-float v8, v8

    .line 57
    goto :goto_6

    .line 58
    :cond_6
    move v8, v1

    .line 59
    :goto_6
    if-eqz v7, :cond_7

    .line 60
    .line 61
    iget v1, p0, Lcom/android/launcher3/allapps/q0;->c:I

    .line 62
    .line 63
    int-to-float v1, v1

    .line 64
    :cond_7
    const/16 v7, 0x8

    .line 65
    .line 66
    new-array v7, v7, [F

    .line 67
    .line 68
    const/4 v9, 0x0

    .line 69
    aput v2, v7, v9

    .line 70
    .line 71
    const/4 v2, 0x1

    .line 72
    aput v0, v7, v2

    .line 73
    .line 74
    const/4 v0, 0x2

    .line 75
    aput v4, v7, v0

    .line 76
    .line 77
    const/4 v0, 0x3

    .line 78
    aput v3, v7, v0

    .line 79
    .line 80
    const/4 v0, 0x4

    .line 81
    aput v6, v7, v0

    .line 82
    .line 83
    const/4 v0, 0x5

    .line 84
    aput v5, v7, v0

    .line 85
    .line 86
    const/4 v0, 0x6

    .line 87
    aput v8, v7, v0

    .line 88
    .line 89
    const/4 v0, 0x7

    .line 90
    aput v1, v7, v0

    .line 91
    .line 92
    iput-object v7, p0, Lcom/android/launcher3/allapps/q0;->m:[F

    .line 93
    .line 94
    return-void
.end method

.method protected b(Landroid/graphics/Canvas;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/q0;->a:Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/allapps/q0;->b:Landroid/graphics/RectF;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/android/launcher3/allapps/q0;->e:Landroid/graphics/RectF;

    .line 9
    .line 10
    iget v2, v1, Landroid/graphics/RectF;->left:F

    .line 11
    .line 12
    iget v3, p0, Lcom/android/launcher3/allapps/q0;->j:F

    .line 13
    .line 14
    add-float/2addr v2, v3

    .line 15
    iget v4, v1, Landroid/graphics/RectF;->top:F

    .line 16
    .line 17
    add-float/2addr v4, v3

    .line 18
    iget v5, v1, Landroid/graphics/RectF;->right:F

    .line 19
    .line 20
    sub-float/2addr v5, v3

    .line 21
    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    .line 22
    .line 23
    sub-float/2addr v1, v3

    .line 24
    invoke-virtual {v0, v2, v4, v5, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/launcher3/allapps/q0;->a:Landroid/graphics/Path;

    .line 28
    .line 29
    iget-object v1, p0, Lcom/android/launcher3/allapps/q0;->b:Landroid/graphics/RectF;

    .line 30
    .line 31
    iget-object v2, p0, Lcom/android/launcher3/allapps/q0;->m:[F

    .line 32
    .line 33
    sget-object v3, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 34
    .line 35
    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;[FLandroid/graphics/Path$Direction;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/android/launcher3/allapps/q0;->a:Landroid/graphics/Path;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/android/launcher3/allapps/q0;->f:Landroid/graphics/Paint;

    .line 41
    .line 42
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method protected c(Landroid/graphics/Canvas;Landroid/view/View;)V
    .locals 5

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/allapps/q0;->f:Landroid/graphics/Paint;

    .line 5
    .line 6
    iget v1, p0, Lcom/android/launcher3/allapps/q0;->h:I

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/allapps/q0;->f:Landroid/graphics/Paint;

    .line 12
    .line 13
    iget v1, p0, Lcom/android/launcher3/allapps/q0;->n:I

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    int-to-float v0, v0

    .line 23
    invoke-virtual {p2}, Landroid/view/View;->getScaleY()F

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    mul-float/2addr v0, v1

    .line 28
    float-to-int v0, v0

    .line 29
    iget-object v1, p0, Lcom/android/launcher3/allapps/q0;->e:Landroid/graphics/RectF;

    .line 30
    .line 31
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    int-to-float v2, v2

    .line 36
    invoke-virtual {p2}, Landroid/view/View;->getY()F

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    invoke-virtual {p2}, Landroid/view/View;->getRight()I

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    int-to-float v4, v4

    .line 45
    invoke-virtual {p2}, Landroid/view/View;->getY()F

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    int-to-float v0, v0

    .line 50
    add-float/2addr p2, v0

    .line 51
    invoke-virtual {v1, v2, v3, v4, p2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, p1}, Lcom/android/launcher3/allapps/q0;->b(Landroid/graphics/Canvas;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method protected d(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/allapps/q0;->n:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/allapps/q0;->f:Landroid/graphics/Paint;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
