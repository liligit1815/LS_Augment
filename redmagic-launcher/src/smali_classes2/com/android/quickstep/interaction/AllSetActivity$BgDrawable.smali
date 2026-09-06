.class Lcom/android/quickstep/interaction/AllSetActivity$BgDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "AllSetActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/interaction/AllSetActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BgDrawable"
.end annotation


# static fields
.field private static final END_SIZE_FACTOR:F = 2.0f

.field private static final GRADIENT_END_PROGRESS:F = 0.5f

.field private static final START_SIZE_FACTOR:F = 0.5f


# instance fields
.field private final mColor:I

.field private final mColorFilter:Landroid/graphics/ColorMatrixColorFilter;

.field private final mColorMatrix:Landroid/graphics/ColorMatrix;

.field private final mMaskGrad:Landroid/graphics/RadialGradient;

.field private final mMatrix:Landroid/graphics/Matrix;

.field private final mPaint:Landroid/graphics/Paint;

.field private mProgress:F


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 10

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Paint;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/quickstep/interaction/AllSetActivity$BgDrawable;->mPaint:Landroid/graphics/Paint;

    .line 10
    .line 11
    new-instance v1, Landroid/graphics/Matrix;

    .line 12
    .line 13
    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Lcom/android/quickstep/interaction/AllSetActivity$BgDrawable;->mMatrix:Landroid/graphics/Matrix;

    .line 17
    .line 18
    new-instance v1, Landroid/graphics/ColorMatrix;

    .line 19
    .line 20
    invoke-direct {v1}, Landroid/graphics/ColorMatrix;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Lcom/android/quickstep/interaction/AllSetActivity$BgDrawable;->mColorMatrix:Landroid/graphics/ColorMatrix;

    .line 24
    .line 25
    new-instance v2, Landroid/graphics/ColorMatrixColorFilter;

    .line 26
    .line 27
    invoke-direct {v2, v1}, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V

    .line 28
    .line 29
    .line 30
    iput-object v2, p0, Lcom/android/quickstep/interaction/AllSetActivity$BgDrawable;->mColorFilter:Landroid/graphics/ColorMatrixColorFilter;

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    iput v1, p0, Lcom/android/quickstep/interaction/AllSetActivity$BgDrawable;->mProgress:F

    .line 34
    .line 35
    const v1, 0x7f060054

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1, v1}, Landroid/content/Context;->getColor(I)I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    iput p1, p0, Lcom/android/quickstep/interaction/AllSetActivity$BgDrawable;->mColor:I

    .line 43
    .line 44
    new-instance v3, Landroid/graphics/RadialGradient;

    .line 45
    .line 46
    const/4 v1, 0x0

    .line 47
    invoke-static {p1, v1}, LB/a;->r(II)I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    filled-new-array {v1, p1}, [I

    .line 52
    .line 53
    .line 54
    move-result-object v7

    .line 55
    const/4 p1, 0x2

    .line 56
    new-array v8, p1, [F

    .line 57
    .line 58
    fill-array-data v8, :array_0

    .line 59
    .line 60
    .line 61
    sget-object v9, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 62
    .line 63
    const/4 v4, 0x0

    .line 64
    const/4 v5, 0x0

    .line 65
    const/high16 v6, 0x3f800000    # 1.0f

    .line 66
    .line 67
    invoke-direct/range {v3 .. v9}, Landroid/graphics/RadialGradient;-><init>(FFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 68
    .line 69
    .line 70
    iput-object v3, p0, Lcom/android/quickstep/interaction/AllSetActivity$BgDrawable;->mMaskGrad:Landroid/graphics/RadialGradient;

    .line 71
    .line 72
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 7

    .line 1
    iget v0, p0, Lcom/android/quickstep/interaction/AllSetActivity$BgDrawable;->mProgress:F

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    cmpg-float v1, v0, v1

    .line 5
    .line 6
    if-gtz v1, :cond_0

    .line 7
    .line 8
    iget p0, p0, Lcom/android/quickstep/interaction/AllSetActivity$BgDrawable;->mColor:I

    .line 9
    .line 10
    invoke-virtual {p1, p0}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    sget-object v5, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    const/high16 v2, 0x3f000000    # 0.5f

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    const/high16 v4, 0x3f800000    # 1.0f

    .line 21
    .line 22
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1}, Landroid/graphics/Rect;->exactCenterX()F

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    int-to-float v1, v1

    .line 39
    invoke-static {v2, v1}, Landroid/graphics/PointF;->length(FF)F

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    const/high16 v4, 0x3f000000    # 0.5f

    .line 44
    .line 45
    const/high16 v6, 0x40000000    # 2.0f

    .line 46
    .line 47
    invoke-static {v0, v4, v6}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    mul-float/2addr v3, v4

    .line 52
    add-float v4, v1, v3

    .line 53
    .line 54
    div-float/2addr v1, v6

    .line 55
    invoke-static {v0, v4, v1}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    iget-object v1, p0, Lcom/android/quickstep/interaction/AllSetActivity$BgDrawable;->mMatrix:Landroid/graphics/Matrix;

    .line 60
    .line 61
    invoke-virtual {v1, v2, v0}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 62
    .line 63
    .line 64
    iget-object v1, p0, Lcom/android/quickstep/interaction/AllSetActivity$BgDrawable;->mMatrix:Landroid/graphics/Matrix;

    .line 65
    .line 66
    invoke-virtual {v1, v3, v3, v2, v0}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Lcom/android/quickstep/interaction/AllSetActivity$BgDrawable;->mMaskGrad:Landroid/graphics/RadialGradient;

    .line 70
    .line 71
    iget-object v1, p0, Lcom/android/quickstep/interaction/AllSetActivity$BgDrawable;->mMatrix:Landroid/graphics/Matrix;

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Landroid/graphics/RadialGradient;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/android/quickstep/interaction/AllSetActivity$BgDrawable;->mColorMatrix:Landroid/graphics/ColorMatrix;

    .line 77
    .line 78
    invoke-virtual {v0}, Landroid/graphics/ColorMatrix;->getArray()[F

    .line 79
    .line 80
    .line 81
    move-result-object v6

    .line 82
    iget v0, p0, Lcom/android/quickstep/interaction/AllSetActivity$BgDrawable;->mProgress:F

    .line 83
    .line 84
    const/4 v3, 0x0

    .line 85
    const/high16 v4, -0x3c810000    # -255.0f

    .line 86
    .line 87
    const/4 v1, 0x0

    .line 88
    const/high16 v2, 0x3f800000    # 1.0f

    .line 89
    .line 90
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    const/16 v1, 0x13

    .line 95
    .line 96
    aput v0, v6, v1

    .line 97
    .line 98
    iget-object v0, p0, Lcom/android/quickstep/interaction/AllSetActivity$BgDrawable;->mColorFilter:Landroid/graphics/ColorMatrixColorFilter;

    .line 99
    .line 100
    iget-object v1, p0, Lcom/android/quickstep/interaction/AllSetActivity$BgDrawable;->mColorMatrix:Landroid/graphics/ColorMatrix;

    .line 101
    .line 102
    invoke-virtual {v0, v1}, Landroid/graphics/ColorMatrixColorFilter;->setColorMatrix(Landroid/graphics/ColorMatrix;)V

    .line 103
    .line 104
    .line 105
    iget-object p0, p0, Lcom/android/quickstep/interaction/AllSetActivity$BgDrawable;->mPaint:Landroid/graphics/Paint;

    .line 106
    .line 107
    invoke-virtual {p1, p0}, Landroid/graphics/Canvas;->drawPaint(Landroid/graphics/Paint;)V

    .line 108
    .line 109
    .line 110
    return-void
.end method

.method public getOpacity()I
    .locals 0

    .line 1
    const/4 p0, -0x3

    .line 2
    return p0
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

.method public setProgress(F)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/quickstep/interaction/AllSetActivity$BgDrawable;->mProgress:F

    .line 2
    .line 3
    cmpl-float v0, v0, p1

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput p1, p0, Lcom/android/quickstep/interaction/AllSetActivity$BgDrawable;->mProgress:F

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method
