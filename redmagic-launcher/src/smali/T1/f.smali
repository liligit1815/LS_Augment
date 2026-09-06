.class public LT1/f;
.super Landroid/view/View;
.source "ColorRoundRectPalette.java"


# instance fields
.field private g:Landroid/graphics/Paint;

.field private h:I

.field private i:Landroid/graphics/RectF;

.field private j:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, LT1/f;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, LT1/f;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 3
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/high16 p1, -0x10000

    .line 4
    iput p1, p0, LT1/f;->h:I

    .line 5
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, LT1/f;->i:Landroid/graphics/RectF;

    .line 6
    new-instance p1, Landroid/graphics/Paint;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, LT1/f;->g:Landroid/graphics/Paint;

    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0701d3

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, LT1/f;->j:I

    return-void
.end method

.method private a()V
    .locals 11

    .line 1
    const/4 v0, 0x3

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    iget v1, p0, LT1/f;->h:I

    .line 5
    .line 6
    invoke-static {v1, v0}, Landroid/graphics/Color;->colorToHSV(I[F)V

    .line 7
    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    const/high16 v2, 0x3f800000    # 1.0f

    .line 11
    .line 12
    aput v2, v0, v1

    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    aput v2, v0, v1

    .line 16
    .line 17
    invoke-static {v0}, Landroid/graphics/Color;->HSVToColor([F)I

    .line 18
    .line 19
    .line 20
    move-result v9

    .line 21
    new-instance v0, Landroid/graphics/LinearGradient;

    .line 22
    .line 23
    iget-object v1, p0, LT1/f;->i:Landroid/graphics/RectF;

    .line 24
    .line 25
    move-object v2, v1

    .line 26
    iget v1, v2, Landroid/graphics/RectF;->left:F

    .line 27
    .line 28
    move-object v3, v2

    .line 29
    iget v2, v3, Landroid/graphics/RectF;->top:F

    .line 30
    .line 31
    iget v4, v3, Landroid/graphics/RectF;->bottom:F

    .line 32
    .line 33
    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 34
    .line 35
    const/4 v5, -0x1

    .line 36
    const/high16 v6, -0x1000000

    .line 37
    .line 38
    move v3, v1

    .line 39
    invoke-direct/range {v0 .. v7}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    .line 40
    .line 41
    .line 42
    new-instance v3, Landroid/graphics/LinearGradient;

    .line 43
    .line 44
    iget-object v1, p0, LT1/f;->i:Landroid/graphics/RectF;

    .line 45
    .line 46
    iget v4, v1, Landroid/graphics/RectF;->left:F

    .line 47
    .line 48
    iget v5, v1, Landroid/graphics/RectF;->top:F

    .line 49
    .line 50
    iget v6, v1, Landroid/graphics/RectF;->right:F

    .line 51
    .line 52
    const/4 v8, -0x1

    .line 53
    move-object v10, v7

    .line 54
    move v7, v5

    .line 55
    invoke-direct/range {v3 .. v10}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    .line 56
    .line 57
    .line 58
    new-instance v1, Landroid/graphics/ComposeShader;

    .line 59
    .line 60
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    .line 61
    .line 62
    invoke-direct {v1, v0, v3, v2}, Landroid/graphics/ComposeShader;-><init>(Landroid/graphics/Shader;Landroid/graphics/Shader;Landroid/graphics/PorterDuff$Mode;)V

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, LT1/f;->g:Landroid/graphics/Paint;

    .line 66
    .line 67
    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 68
    .line 69
    .line 70
    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    iget-object v0, p0, LT1/f;->i:Landroid/graphics/RectF;

    .line 2
    .line 3
    iget v1, p0, LT1/f;->j:I

    .line 4
    .line 5
    int-to-float v2, v1

    .line 6
    int-to-float v1, v1

    .line 7
    iget-object p0, p0, LT1/f;->g:Landroid/graphics/Paint;

    .line 8
    .line 9
    invoke-virtual {p1, v0, v2, v1, p0}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    sub-int/2addr p1, p3

    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 7
    .line 8
    .line 9
    move-result p3

    .line 10
    sub-int/2addr p1, p3

    .line 11
    int-to-float p1, p1

    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 13
    .line 14
    .line 15
    move-result p3

    .line 16
    sub-int/2addr p2, p3

    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 18
    .line 19
    .line 20
    move-result p3

    .line 21
    sub-int/2addr p2, p3

    .line 22
    int-to-float p2, p2

    .line 23
    iget-object p3, p0, LT1/f;->i:Landroid/graphics/RectF;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 26
    .line 27
    .line 28
    move-result p4

    .line 29
    int-to-float p4, p4

    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    int-to-float v0, v0

    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    int-to-float v1, v1

    .line 40
    add-float/2addr p1, v1

    .line 41
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    int-to-float v1, v1

    .line 46
    add-float/2addr p2, v1

    .line 47
    invoke-virtual {p3, p4, v0, p1, p2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 48
    .line 49
    .line 50
    invoke-direct {p0}, LT1/f;->a()V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public setBaseColor(I)V
    .locals 0

    .line 1
    iput p1, p0, LT1/f;->h:I

    .line 2
    .line 3
    invoke-direct {p0}, LT1/f;->a()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setRadius(I)V
    .locals 0

    .line 1
    iput p1, p0, LT1/f;->j:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
