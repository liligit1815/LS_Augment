.class public Ln1/e;
.super Landroid/graphics/drawable/Drawable;
.source "FastScrollThumbDrawable.java"


# static fields
.field private static final d:Landroid/graphics/Matrix;


# instance fields
.field private final a:Landroid/graphics/Path;

.field private final b:Landroid/graphics/Paint;

.field private final c:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ln1/e;->d:Landroid/graphics/Matrix;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/graphics/Paint;Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

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
    iput-object v0, p0, Ln1/e;->a:Landroid/graphics/Path;

    .line 10
    .line 11
    iput-object p1, p0, Ln1/e;->b:Landroid/graphics/Paint;

    .line 12
    .line 13
    iput-boolean p2, p0, Ln1/e;->c:Z

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ln1/e;->a:Landroid/graphics/Path;

    .line 2
    .line 3
    iget-object p0, p0, Ln1/e;->b:Landroid/graphics/Paint;

    .line 4
    .line 5
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public getOpacity()I
    .locals 0

    .line 1
    const/4 p0, -0x3

    .line 2
    return p0
.end method

.method public getOutline(Landroid/graphics/Outline;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ln1/e;->a:Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Path;->isConvex()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ln1/e;->a:Landroid/graphics/Path;

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Landroid/graphics/Outline;->setConvexPath(Landroid/graphics/Path;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .locals 11

    .line 1
    iget-object v0, p0, Ln1/e;->a:Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    int-to-float v0, v0

    .line 11
    const/high16 v1, 0x3f000000    # 0.5f

    .line 12
    .line 13
    mul-float/2addr v0, v1

    .line 14
    const/high16 v1, 0x40000000    # 2.0f

    .line 15
    .line 16
    mul-float/2addr v1, v0

    .line 17
    const/high16 v2, 0x40a00000    # 5.0f

    .line 18
    .line 19
    div-float v2, v0, v2

    .line 20
    .line 21
    iget-object v3, p0, Ln1/e;->a:Landroid/graphics/Path;

    .line 22
    .line 23
    iget v4, p1, Landroid/graphics/Rect;->left:I

    .line 24
    .line 25
    move v5, v4

    .line 26
    int-to-float v4, v5

    .line 27
    iget v6, p1, Landroid/graphics/Rect;->top:I

    .line 28
    .line 29
    move v7, v5

    .line 30
    int-to-float v5, v6

    .line 31
    int-to-float v7, v7

    .line 32
    add-float/2addr v7, v1

    .line 33
    int-to-float v6, v6

    .line 34
    add-float/2addr v6, v1

    .line 35
    const/16 v1, 0x8

    .line 36
    .line 37
    new-array v8, v1, [F

    .line 38
    .line 39
    const/4 v1, 0x0

    .line 40
    aput v0, v8, v1

    .line 41
    .line 42
    const/4 v1, 0x1

    .line 43
    aput v0, v8, v1

    .line 44
    .line 45
    const/4 v1, 0x2

    .line 46
    aput v0, v8, v1

    .line 47
    .line 48
    const/4 v1, 0x3

    .line 49
    aput v0, v8, v1

    .line 50
    .line 51
    const/4 v1, 0x4

    .line 52
    aput v2, v8, v1

    .line 53
    .line 54
    const/4 v1, 0x5

    .line 55
    aput v2, v8, v1

    .line 56
    .line 57
    const/4 v1, 0x6

    .line 58
    aput v0, v8, v1

    .line 59
    .line 60
    const/4 v1, 0x7

    .line 61
    aput v0, v8, v1

    .line 62
    .line 63
    sget-object v9, Landroid/graphics/Path$Direction;->CCW:Landroid/graphics/Path$Direction;

    .line 64
    .line 65
    move v10, v7

    .line 66
    move v7, v6

    .line 67
    move v6, v10

    .line 68
    invoke-virtual/range {v3 .. v9}, Landroid/graphics/Path;->addRoundRect(FFFF[FLandroid/graphics/Path$Direction;)V

    .line 69
    .line 70
    .line 71
    sget-object v1, Ln1/e;->d:Landroid/graphics/Matrix;

    .line 72
    .line 73
    iget v2, p1, Landroid/graphics/Rect;->left:I

    .line 74
    .line 75
    int-to-float v2, v2

    .line 76
    add-float/2addr v2, v0

    .line 77
    iget v3, p1, Landroid/graphics/Rect;->top:I

    .line 78
    .line 79
    int-to-float v3, v3

    .line 80
    add-float/2addr v3, v0

    .line 81
    const/high16 v0, -0x3dcc0000    # -45.0f

    .line 82
    .line 83
    invoke-virtual {v1, v0, v2, v3}, Landroid/graphics/Matrix;->setRotate(FFF)V

    .line 84
    .line 85
    .line 86
    iget-boolean v0, p0, Ln1/e;->c:Z

    .line 87
    .line 88
    if-eqz v0, :cond_0

    .line 89
    .line 90
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    int-to-float v0, v0

    .line 95
    const/4 v2, 0x0

    .line 96
    invoke-virtual {v1, v0, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 97
    .line 98
    .line 99
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    int-to-float p1, p1

    .line 104
    const/high16 v0, -0x40800000    # -1.0f

    .line 105
    .line 106
    const/high16 v3, 0x3f800000    # 1.0f

    .line 107
    .line 108
    invoke-virtual {v1, v0, v3, p1, v2}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 109
    .line 110
    .line 111
    :cond_0
    iget-object p0, p0, Ln1/e;->a:Landroid/graphics/Path;

    .line 112
    .line 113
    invoke-virtual {p0, v1}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    .line 114
    .line 115
    .line 116
    return-void
.end method

.method public setAlpha(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    .line 1
    return-void
.end method
