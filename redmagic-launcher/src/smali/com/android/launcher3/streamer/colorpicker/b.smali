.class public Lcom/android/launcher3/streamer/colorpicker/b;
.super Landroid/graphics/drawable/Drawable;
.source "CheckerboardDrawable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/streamer/colorpicker/b$a;
    }
.end annotation


# instance fields
.field private a:Landroid/graphics/Paint;

.field private b:I

.field private c:I

.field private d:I

.field private e:Landroid/graphics/RectF;

.field private f:F


# direct methods
.method private constructor <init>(Lcom/android/launcher3/streamer/colorpicker/b$a;)V
    .locals 2

    .line 2
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 3
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/android/launcher3/streamer/colorpicker/b;->a:Landroid/graphics/Paint;

    .line 4
    invoke-static {p1}, Lcom/android/launcher3/streamer/colorpicker/b$a;->c(Lcom/android/launcher3/streamer/colorpicker/b$a;)I

    move-result v0

    iput v0, p0, Lcom/android/launcher3/streamer/colorpicker/b;->b:I

    .line 5
    invoke-static {p1}, Lcom/android/launcher3/streamer/colorpicker/b$a;->b(Lcom/android/launcher3/streamer/colorpicker/b$a;)I

    move-result v0

    iput v0, p0, Lcom/android/launcher3/streamer/colorpicker/b;->c:I

    .line 6
    invoke-static {p1}, Lcom/android/launcher3/streamer/colorpicker/b$a;->a(Lcom/android/launcher3/streamer/colorpicker/b$a;)I

    move-result p1

    iput p1, p0, Lcom/android/launcher3/streamer/colorpicker/b;->d:I

    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/streamer/colorpicker/b;->a()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher3/streamer/colorpicker/b$a;LT1/b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/streamer/colorpicker/b;-><init>(Lcom/android/launcher3/streamer/colorpicker/b$a;)V

    return-void
.end method

.method private a()V
    .locals 6

    .line 1
    iget v0, p0, Lcom/android/launcher3/streamer/colorpicker/b;->b:I

    .line 2
    .line 3
    mul-int/lit8 v1, v0, 0x2

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x2

    .line 6
    .line 7
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 8
    .line 9
    invoke-static {v1, v0, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Landroid/graphics/Paint;

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v1, v2}, Landroid/graphics/Paint;-><init>(I)V

    .line 17
    .line 18
    .line 19
    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 22
    .line 23
    .line 24
    new-instance v2, Landroid/graphics/Canvas;

    .line 25
    .line 26
    invoke-direct {v2, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 27
    .line 28
    .line 29
    new-instance v3, Landroid/graphics/Rect;

    .line 30
    .line 31
    iget v4, p0, Lcom/android/launcher3/streamer/colorpicker/b;->b:I

    .line 32
    .line 33
    const/4 v5, 0x0

    .line 34
    invoke-direct {v3, v5, v5, v4, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 35
    .line 36
    .line 37
    iget v4, p0, Lcom/android/launcher3/streamer/colorpicker/b;->c:I

    .line 38
    .line 39
    invoke-virtual {v1, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v2, v3, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 43
    .line 44
    .line 45
    iget v4, p0, Lcom/android/launcher3/streamer/colorpicker/b;->b:I

    .line 46
    .line 47
    invoke-virtual {v3, v4, v4}, Landroid/graphics/Rect;->offset(II)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v2, v3, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 51
    .line 52
    .line 53
    iget v4, p0, Lcom/android/launcher3/streamer/colorpicker/b;->d:I

    .line 54
    .line 55
    invoke-virtual {v1, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 56
    .line 57
    .line 58
    iget v4, p0, Lcom/android/launcher3/streamer/colorpicker/b;->b:I

    .line 59
    .line 60
    neg-int v4, v4

    .line 61
    invoke-virtual {v3, v4, v5}, Landroid/graphics/Rect;->offset(II)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v2, v3, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 65
    .line 66
    .line 67
    iget v4, p0, Lcom/android/launcher3/streamer/colorpicker/b;->b:I

    .line 68
    .line 69
    neg-int v5, v4

    .line 70
    invoke-virtual {v3, v4, v5}, Landroid/graphics/Rect;->offset(II)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v2, v3, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 74
    .line 75
    .line 76
    iget-object p0, p0, Lcom/android/launcher3/streamer/colorpicker/b;->a:Landroid/graphics/Paint;

    .line 77
    .line 78
    new-instance v1, Landroid/graphics/BitmapShader;

    .line 79
    .line 80
    sget-object v2, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    .line 81
    .line 82
    invoke-direct {v1, v0, v2, v2}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 86
    .line 87
    .line 88
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/streamer/colorpicker/b;->e:Landroid/graphics/RectF;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/streamer/colorpicker/b;->f:F

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/streamer/colorpicker/b;->a:Landroid/graphics/Paint;

    .line 6
    .line 7
    invoke-virtual {p1, v0, v1, v1, p0}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public getOpacity()I
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    return p0
.end method

.method public setAlpha(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/streamer/colorpicker/b;->a:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setBounds(IIII)V
    .locals 5

    .line 1
    new-instance v0, Landroid/graphics/RectF;

    .line 2
    .line 3
    int-to-float v1, p1

    .line 4
    int-to-float v2, p2

    .line 5
    int-to-float v3, p3

    .line 6
    int-to-float v4, p4

    .line 7
    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/android/launcher3/streamer/colorpicker/b;->e:Landroid/graphics/RectF;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/high16 v1, 0x40000000    # 2.0f

    .line 17
    .line 18
    div-float/2addr v0, v1

    .line 19
    iput v0, p0, Lcom/android/launcher3/streamer/colorpicker/b;->f:F

    .line 20
    .line 21
    invoke-super {p0, p1, p2, p3, p4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/streamer/colorpicker/b;->a:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 4
    .line 5
    .line 6
    return-void
.end method
