.class public LT2/c$b;
.super Landroid/view/View;
.source "SplashScreenExitAnimationUtils.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "ViewConstructor"
    }
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = LT2/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field private final g:Landroid/view/ViewGroup;

.field private h:I

.field private i:I

.field private final j:Landroid/graphics/Point;

.field private final k:Landroid/graphics/Matrix;

.field private final l:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Landroid/graphics/Point;

    .line 9
    .line 10
    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, LT2/c$b;->j:Landroid/graphics/Point;

    .line 14
    .line 15
    new-instance v0, Landroid/graphics/Matrix;

    .line 16
    .line 17
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, LT2/c$b;->k:Landroid/graphics/Matrix;

    .line 21
    .line 22
    new-instance v0, Landroid/graphics/Paint;

    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, LT2/c$b;->l:Landroid/graphics/Paint;

    .line 29
    .line 30
    iput-object p1, p0, LT2/c$b;->g:Landroid/view/ViewGroup;

    .line 31
    .line 32
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    instance-of p1, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    if-eqz p1, :cond_0

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    check-cast p0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 49
    .line 50
    invoke-virtual {p0, v1, v1, v1, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 51
    .line 52
    .line 53
    :cond_0
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 54
    .line 55
    .line 56
    return-void
.end method


# virtual methods
.method a(F)V
    .locals 4

    .line 1
    iget-object v0, p0, LT2/c$b;->l:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Paint;->getShader()Landroid/graphics/Shader;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-static {}, LT2/c;->c()Landroid/view/animation/Interpolator;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {v0, p1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    sget-object v1, LM2/a;->c:Landroid/view/animation/Interpolator;

    .line 19
    .line 20
    invoke-interface {v1, p1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    iget v1, p0, LT2/c$b;->h:I

    .line 25
    .line 26
    int-to-float v2, v1

    .line 27
    iget v3, p0, LT2/c$b;->i:I

    .line 28
    .line 29
    sub-int/2addr v3, v1

    .line 30
    int-to-float v1, v3

    .line 31
    mul-float/2addr v1, v0

    .line 32
    add-float/2addr v2, v1

    .line 33
    iget-object v0, p0, LT2/c$b;->k:Landroid/graphics/Matrix;

    .line 34
    .line 35
    invoke-virtual {v0, v2, v2}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, LT2/c$b;->k:Landroid/graphics/Matrix;

    .line 39
    .line 40
    iget-object v1, p0, LT2/c$b;->j:Landroid/graphics/Point;

    .line 41
    .line 42
    iget v2, v1, Landroid/graphics/Point;->x:I

    .line 43
    .line 44
    int-to-float v2, v2

    .line 45
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 46
    .line 47
    int-to-float v1, v1

    .line 48
    invoke-virtual {v0, v2, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, LT2/c$b;->l:Landroid/graphics/Paint;

    .line 52
    .line 53
    invoke-virtual {v0}, Landroid/graphics/Paint;->getShader()Landroid/graphics/Shader;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iget-object v1, p0, LT2/c$b;->k:Landroid/graphics/Matrix;

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, LT2/c$b;->l:Landroid/graphics/Paint;

    .line 63
    .line 64
    const/high16 v1, 0x437f0000    # 255.0f

    .line 65
    .line 66
    mul-float/2addr p1, v1

    .line 67
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method b(II)V
    .locals 0

    .line 1
    iget-object p0, p0, LT2/c$b;->j:Landroid/graphics/Point;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Landroid/graphics/Point;->set(II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method c([I[F)V
    .locals 7

    .line 1
    new-instance v0, Landroid/graphics/RadialGradient;

    .line 2
    .line 3
    const/high16 v3, 0x3f800000    # 1.0f

    .line 4
    .line 5
    sget-object v6, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x0

    .line 9
    move-object v4, p1

    .line 10
    move-object v5, p2

    .line 11
    invoke-direct/range {v0 .. v6}, Landroid/graphics/RadialGradient;-><init>(FFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, LT2/c$b;->l:Landroid/graphics/Paint;

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, LT2/c$b;->l:Landroid/graphics/Paint;

    .line 20
    .line 21
    sget-object p1, Landroid/graphics/BlendMode;->DST_OUT:Landroid/graphics/BlendMode;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setBlendMode(Landroid/graphics/BlendMode;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method d(II)V
    .locals 0

    .line 1
    iput p1, p0, LT2/c$b;->h:I

    .line 2
    .line 3
    iput p2, p0, LT2/c$b;->i:I

    .line 4
    .line 5
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 7

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, LT2/c$b;->g:Landroid/view/ViewGroup;

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getWidth()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    int-to-float v4, v0

    .line 11
    iget-object v0, p0, LT2/c$b;->g:Landroid/view/ViewGroup;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getHeight()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    int-to-float v5, v0

    .line 18
    iget-object v6, p0, LT2/c$b;->l:Landroid/graphics/Paint;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    const/4 v3, 0x0

    .line 22
    move-object v1, p1

    .line 23
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
