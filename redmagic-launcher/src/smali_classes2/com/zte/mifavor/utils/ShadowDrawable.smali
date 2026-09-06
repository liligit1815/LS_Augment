.class public Lcom/zte/mifavor/utils/ShadowDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "ShadowDrawable.java"


# instance fields
.field private a:Landroid/graphics/Path;

.field private b:Landroid/graphics/Paint;

.field private c:I

.field private d:I

.field private e:I

.field private f:I

.field private g:I

.field private final h:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "ShadowDrawable"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->h:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method private a(Landroid/content/res/TypedArray;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    sget p2, LR3/m;->N:I

    .line 2
    .line 3
    iget v0, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->f:I

    .line 4
    .line 5
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    iput p2, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->f:I

    .line 10
    .line 11
    sget p2, LR3/m;->P:I

    .line 12
    .line 13
    iget v0, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->g:I

    .line 14
    .line 15
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    iput p2, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->g:I

    .line 20
    .line 21
    sget p2, LR3/m;->R:I

    .line 22
    .line 23
    iget v0, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->d:I

    .line 24
    .line 25
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    iput p2, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->d:I

    .line 30
    .line 31
    sget p2, LR3/m;->O:I

    .line 32
    .line 33
    iget v0, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->c:I

    .line 34
    .line 35
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    iput p2, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->c:I

    .line 40
    .line 41
    sget p2, LR3/m;->Q:I

    .line 42
    .line 43
    iget v0, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->e:I

    .line 44
    .line 45
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    iput p2, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->e:I

    .line 50
    .line 51
    new-instance p2, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 54
    .line 55
    .line 56
    const-string v0, "initCustomAttr mBgColor:"

    .line 57
    .line 58
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    iget v0, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->f:I

    .line 62
    .line 63
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string v0, " mShadowColor:"

    .line 67
    .line 68
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    iget v0, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->g:I

    .line 72
    .line 73
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    const-string v0, " mShadowSize:"

    .line 77
    .line 78
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    iget v0, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->d:I

    .line 82
    .line 83
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    const-string v0, " mRadius:"

    .line 87
    .line 88
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    iget v0, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->c:I

    .line 92
    .line 93
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    const-string v0, " mShadowoffsetY:"

    .line 97
    .line 98
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    iget p0, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->e:I

    .line 102
    .line 103
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    const-string p2, "ShadowDrawable"

    .line 111
    .line 112
    invoke-static {p2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    .line 114
    .line 115
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method private b(Landroid/content/res/Resources;)V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 5
    .line 6
    .line 7
    iput-object v0, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->b:Landroid/graphics/Paint;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 10
    .line 11
    .line 12
    const/4 v0, -0x1

    .line 13
    iput v0, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->f:I

    .line 14
    .line 15
    sget v0, LR3/d;->a:I

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iput v0, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->g:I

    .line 22
    .line 23
    sget v0, LR3/e;->c:I

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iput v0, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->c:I

    .line 30
    .line 31
    sget v0, LR3/e;->b:I

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iput v0, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->d:I

    .line 38
    .line 39
    sget v0, LR3/e;->e:I

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    iput p1, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->e:I

    .line 46
    .line 47
    return-void
.end method

.method private c(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;
    .locals 0

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1, p3, p4}, Landroid/content/res/Resources;->obtainAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    invoke-virtual {p2, p3, p4, p0, p0}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->a:Landroid/graphics/Path;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget v0, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->d:I

    .line 6
    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->b:Landroid/graphics/Paint;

    .line 10
    .line 11
    int-to-float v0, v0

    .line 12
    iget v2, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->e:I

    .line 13
    .line 14
    int-to-float v2, v2

    .line 15
    iget v3, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->g:I

    .line 16
    .line 17
    const/4 v4, 0x0

    .line 18
    invoke-virtual {v1, v0, v4, v2, v3}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->b:Landroid/graphics/Paint;

    .line 22
    .line 23
    iget v1, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->g:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->a:Landroid/graphics/Path;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->b:Landroid/graphics/Paint;

    .line 31
    .line 32
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->b:Landroid/graphics/Paint;

    .line 36
    .line 37
    const/4 v1, 0x0

    .line 38
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setMaskFilter(Landroid/graphics/MaskFilter;)Landroid/graphics/MaskFilter;

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->b:Landroid/graphics/Paint;

    .line 42
    .line 43
    iget v1, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->f:I

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->a:Landroid/graphics/Path;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->b:Landroid/graphics/Paint;

    .line 51
    .line 52
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method

.method public getOpacity()I
    .locals 0

    .line 1
    const/4 p0, -0x3

    .line 2
    return p0
.end method

.method public inflate(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    sget-object v0, LR3/m;->M:[I

    .line 2
    .line 3
    invoke-direct {p0, p1, p4, p3, v0}, Lcom/zte/mifavor/utils/ShadowDrawable;->c(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p0, p1}, Lcom/zte/mifavor/utils/ShadowDrawable;->b(Landroid/content/res/Resources;)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0, v0, p3}, Lcom/zte/mifavor/utils/ShadowDrawable;->a(Landroid/content/res/TypedArray;Landroid/util/AttributeSet;)V

    .line 11
    .line 12
    .line 13
    invoke-super {p0, p1, p2, p3, p4}, Landroid/graphics/drawable/Drawable;->inflate(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->a:Landroid/graphics/Path;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/graphics/Path;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->a:Landroid/graphics/Path;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 14
    .line 15
    .line 16
    :goto_0
    new-instance v0, Landroid/graphics/RectF;

    .line 17
    .line 18
    invoke-direct {v0, p1}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 19
    .line 20
    .line 21
    iget p1, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->d:I

    .line 22
    .line 23
    int-to-float v1, p1

    .line 24
    int-to-float p1, p1

    .line 25
    invoke-virtual {v0, v1, p1}, Landroid/graphics/RectF;->inset(FF)V

    .line 26
    .line 27
    .line 28
    new-instance p1, Landroid/graphics/PointF;

    .line 29
    .line 30
    invoke-direct {p1}, Landroid/graphics/PointF;-><init>()V

    .line 31
    .line 32
    .line 33
    iget v1, p1, Landroid/graphics/PointF;->x:F

    .line 34
    .line 35
    iget v2, v0, Landroid/graphics/RectF;->left:F

    .line 36
    .line 37
    iget v3, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->c:I

    .line 38
    .line 39
    int-to-float v3, v3

    .line 40
    add-float/2addr v2, v3

    .line 41
    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    iput v1, p1, Landroid/graphics/PointF;->x:F

    .line 46
    .line 47
    iget v2, v0, Landroid/graphics/RectF;->right:F

    .line 48
    .line 49
    iget v3, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->c:I

    .line 50
    .line 51
    int-to-float v3, v3

    .line 52
    sub-float/2addr v2, v3

    .line 53
    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    iput v1, p1, Landroid/graphics/PointF;->x:F

    .line 58
    .line 59
    iget v1, p1, Landroid/graphics/PointF;->y:F

    .line 60
    .line 61
    iget v2, v0, Landroid/graphics/RectF;->top:F

    .line 62
    .line 63
    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    iput v1, p1, Landroid/graphics/PointF;->y:F

    .line 68
    .line 69
    iget v2, v0, Landroid/graphics/RectF;->bottom:F

    .line 70
    .line 71
    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    iput v1, p1, Landroid/graphics/PointF;->y:F

    .line 76
    .line 77
    new-instance v1, Landroid/graphics/Path;

    .line 78
    .line 79
    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    .line 80
    .line 81
    .line 82
    iget v2, p1, Landroid/graphics/PointF;->x:F

    .line 83
    .line 84
    iget v3, p1, Landroid/graphics/PointF;->y:F

    .line 85
    .line 86
    invoke-virtual {v1, v2, v3}, Landroid/graphics/Path;->moveTo(FF)V

    .line 87
    .line 88
    .line 89
    iget v2, p1, Landroid/graphics/PointF;->x:F

    .line 90
    .line 91
    iget v3, p1, Landroid/graphics/PointF;->y:F

    .line 92
    .line 93
    invoke-virtual {v1, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 94
    .line 95
    .line 96
    iget v2, p1, Landroid/graphics/PointF;->x:F

    .line 97
    .line 98
    iget v3, p1, Landroid/graphics/PointF;->y:F

    .line 99
    .line 100
    invoke-virtual {v1, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 101
    .line 102
    .line 103
    iget v2, p1, Landroid/graphics/PointF;->x:F

    .line 104
    .line 105
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 106
    .line 107
    invoke-virtual {v1, v2, p1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v1}, Landroid/graphics/Path;->close()V

    .line 111
    .line 112
    .line 113
    iget-object p1, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->a:Landroid/graphics/Path;

    .line 114
    .line 115
    iget v2, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->c:I

    .line 116
    .line 117
    int-to-float v3, v2

    .line 118
    int-to-float v2, v2

    .line 119
    sget-object v4, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 120
    .line 121
    invoke-virtual {p1, v0, v3, v2, v4}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V

    .line 122
    .line 123
    .line 124
    iget-object p1, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->a:Landroid/graphics/Path;

    .line 125
    .line 126
    invoke-virtual {p1, v1}, Landroid/graphics/Path;->addPath(Landroid/graphics/Path;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 130
    .line 131
    .line 132
    return-void
.end method

.method public setAlpha(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->b:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/utils/ShadowDrawable;->b:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 4
    .line 5
    .line 6
    return-void
.end method
