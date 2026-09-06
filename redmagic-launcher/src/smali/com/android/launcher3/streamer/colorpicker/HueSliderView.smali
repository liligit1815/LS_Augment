.class public Lcom/android/launcher3/streamer/colorpicker/HueSliderView;
.super Lcom/android/launcher3/streamer/colorpicker/a;
.source "HueSliderView.java"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/streamer/colorpicker/HueSliderView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/streamer/colorpicker/a;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private l()[I
    .locals 7

    .line 1
    const/4 p0, 0x1

    .line 2
    const/high16 v0, 0x3f800000    # 1.0f

    .line 3
    .line 4
    const/16 v1, 0x168

    .line 5
    .line 6
    new-array v2, v1, [I

    .line 7
    .line 8
    const/4 v3, 0x0

    .line 9
    move v4, v3

    .line 10
    :goto_0
    if-ge v4, v1, :cond_0

    .line 11
    .line 12
    int-to-float v5, v4

    .line 13
    const/4 v6, 0x3

    .line 14
    new-array v6, v6, [F

    .line 15
    .line 16
    aput v5, v6, v3

    .line 17
    .line 18
    aput v0, v6, p0

    .line 19
    .line 20
    const/4 v5, 0x2

    .line 21
    aput v0, v6, v5

    .line 22
    .line 23
    invoke-static {v6}, Landroid/graphics/Color;->HSVToColor([F)I

    .line 24
    .line 25
    .line 26
    move-result v5

    .line 27
    aput v5, v2, v4

    .line 28
    .line 29
    add-int/2addr v4, p0

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    return-object v2
.end method


# virtual methods
.method public a(Landroid/view/MotionEvent;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/streamer/colorpicker/a;->a(Landroid/view/MotionEvent;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/streamer/colorpicker/a;->h:LT1/h;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/colorpicker/HueSliderView;->c()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-virtual {p1, p0}, LT1/h;->a(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method protected c()I
    .locals 4

    .line 1
    const/4 v0, 0x3

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    const/4 v2, 0x0

    .line 6
    aput v1, v0, v2

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    const/high16 v3, 0x3f800000    # 1.0f

    .line 10
    .line 11
    aput v3, v0, v1

    .line 12
    .line 13
    const/4 v1, 0x2

    .line 14
    aput v3, v0, v1

    .line 15
    .line 16
    iget p0, p0, Lcom/android/launcher3/streamer/colorpicker/a;->j:F

    .line 17
    .line 18
    const/high16 v1, 0x43b40000    # 360.0f

    .line 19
    .line 20
    mul-float/2addr p0, v1

    .line 21
    aput p0, v0, v2

    .line 22
    .line 23
    invoke-static {v0}, Landroid/graphics/Color;->HSVToColor([F)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0
.end method

.method protected e(Landroid/graphics/Paint;)V
    .locals 8

    .line 1
    new-instance v0, Landroid/graphics/LinearGradient;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    int-to-float v3, v1

    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    int-to-float v4, v1

    .line 13
    invoke-direct {p0}, Lcom/android/launcher3/streamer/colorpicker/HueSliderView;->l()[I

    .line 14
    .line 15
    .line 16
    move-result-object v5

    .line 17
    const/4 v6, 0x0

    .line 18
    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    const/4 v2, 0x0

    .line 22
    invoke-direct/range {v0 .. v7}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method protected g(I)F
    .locals 0

    .line 1
    const/4 p0, 0x3

    .line 2
    new-array p0, p0, [F

    .line 3
    .line 4
    invoke-static {p1, p0}, Landroid/graphics/Color;->colorToHSV(I[F)V

    .line 5
    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    aget p0, p0, p1

    .line 9
    .line 10
    const/high16 p1, 0x43b40000    # 360.0f

    .line 11
    .line 12
    div-float/2addr p0, p1

    .line 13
    return p0
.end method

.method protected i()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/streamer/colorpicker/a;->h:LT1/h;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/colorpicker/HueSliderView;->c()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-virtual {v0, p0}, LT1/h;->a(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
