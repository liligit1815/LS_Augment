.class public Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;
.super Ljava/lang/Object;
.source "PipSurfaceTransactionHelper.java"


# instance fields
.field private final mCornerRadius:I

.field private final mShadowRadius:I

.field private final mTmpDestinationRect:Landroid/graphics/Rect;

.field private final mTmpDestinationRectF:Landroid/graphics/RectF;

.field private final mTmpFloat9:[F

.field private final mTmpSourceRectF:Landroid/graphics/RectF;

.field private final mTmpTransform:Landroid/graphics/Matrix;


# direct methods
.method public constructor <init>(II)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Matrix;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpTransform:Landroid/graphics/Matrix;

    .line 10
    .line 11
    const/16 v0, 0x9

    .line 12
    .line 13
    new-array v0, v0, [F

    .line 14
    .line 15
    iput-object v0, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpFloat9:[F

    .line 16
    .line 17
    new-instance v0, Landroid/graphics/RectF;

    .line 18
    .line 19
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpSourceRectF:Landroid/graphics/RectF;

    .line 23
    .line 24
    new-instance v0, Landroid/graphics/RectF;

    .line 25
    .line 26
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpDestinationRectF:Landroid/graphics/RectF;

    .line 30
    .line 31
    new-instance v0, Landroid/graphics/Rect;

    .line 32
    .line 33
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpDestinationRect:Landroid/graphics/Rect;

    .line 37
    .line 38
    iput p1, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mCornerRadius:I

    .line 39
    .line 40
    iput p2, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mShadowRadius:I

    .line 41
    .line 42
    return-void
.end method

.method private getScaledCornerRadius(Landroid/graphics/Rect;Landroid/graphics/Rect;)F
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-double v0, v0

    .line 6
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    int-to-double v2, p1

    .line 11
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->hypot(DD)D

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    int-to-double v2, p1

    .line 20
    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    int-to-double p1, p1

    .line 25
    invoke-static {v2, v3, p1, p2}, Ljava/lang/Math;->hypot(DD)D

    .line 26
    .line 27
    .line 28
    move-result-wide p1

    .line 29
    div-double/2addr v0, p1

    .line 30
    double-to-float p1, v0

    .line 31
    iget p0, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mCornerRadius:I

    .line 32
    .line 33
    int-to-float p0, p0

    .line 34
    mul-float/2addr p0, p1

    .line 35
    return p0
.end method

.method private static newPipSurfaceTransaction(FF[FFFFLandroid/graphics/Rect;)Landroid/window/PictureInPictureSurfaceTransaction;
    .locals 1

    .line 1
    new-instance v0, Landroid/window/PictureInPictureSurfaceTransaction$Builder;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/window/PictureInPictureSurfaceTransaction$Builder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0, p1}, Landroid/window/PictureInPictureSurfaceTransaction$Builder;->setPosition(FF)Landroid/window/PictureInPictureSurfaceTransaction$Builder;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0, p2, p3}, Landroid/window/PictureInPictureSurfaceTransaction$Builder;->setTransform([FF)Landroid/window/PictureInPictureSurfaceTransaction$Builder;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0, p4}, Landroid/window/PictureInPictureSurfaceTransaction$Builder;->setCornerRadius(F)Landroid/window/PictureInPictureSurfaceTransaction$Builder;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0, p5}, Landroid/window/PictureInPictureSurfaceTransaction$Builder;->setShadowRadius(F)Landroid/window/PictureInPictureSurfaceTransaction$Builder;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0, p6}, Landroid/window/PictureInPictureSurfaceTransaction$Builder;->setWindowCrop(Landroid/graphics/Rect;)Landroid/window/PictureInPictureSurfaceTransaction$Builder;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Landroid/window/PictureInPictureSurfaceTransaction$Builder;->build()Landroid/window/PictureInPictureSurfaceTransaction;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public static newSurfaceControlTransaction()Landroid/view/SurfaceControl$Transaction;
    .locals 3

    .line 1
    new-instance v0, Landroid/view/SurfaceControl$Transaction;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/view/SurfaceControl$Transaction;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Landroid/view/Choreographer;->getVsyncId()J

    .line 11
    .line 12
    .line 13
    move-result-wide v1

    .line 14
    invoke-virtual {v0, v1, v2}, Landroid/view/SurfaceControl$Transaction;->setFrameTimelineVsync(J)Landroid/view/SurfaceControl$Transaction;

    .line 15
    .line 16
    .line 17
    return-object v0
.end method


# virtual methods
.method public scale(Landroid/view/SurfaceControl$Transaction;Landroid/view/SurfaceControl;Landroid/graphics/Rect;Landroid/graphics/Rect;)Landroid/window/PictureInPictureSurfaceTransaction;
    .locals 8

    .line 1
    iget v0, p4, Landroid/graphics/Rect;->left:I

    int-to-float v1, v0

    .line 2
    iget v0, p4, Landroid/graphics/Rect;->top:I

    int-to-float v2, v0

    .line 3
    iget-object v0, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpSourceRectF:Landroid/graphics/RectF;

    invoke-virtual {v0, p3}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 4
    iget-object v0, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpDestinationRectF:Landroid/graphics/RectF;

    invoke-virtual {v0, p4}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 5
    iget-object v0, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpDestinationRectF:Landroid/graphics/RectF;

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v3}, Landroid/graphics/RectF;->offsetTo(FF)V

    .line 6
    iget-object v0, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpTransform:Landroid/graphics/Matrix;

    iget-object v3, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpSourceRectF:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpDestinationRectF:Landroid/graphics/RectF;

    sget-object v5, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v0, v3, v4, v5}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 7
    invoke-direct {p0, p3, p4}, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->getScaledCornerRadius(Landroid/graphics/Rect;Landroid/graphics/Rect;)F

    move-result v5

    .line 8
    iget-object p4, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpTransform:Landroid/graphics/Matrix;

    iget-object v0, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpFloat9:[F

    invoke-virtual {p1, p2, p4, v0}, Landroid/view/SurfaceControl$Transaction;->setMatrix(Landroid/view/SurfaceControl;Landroid/graphics/Matrix;[F)Landroid/view/SurfaceControl$Transaction;

    move-result-object p1

    .line 9
    invoke-virtual {p1, p2, v1, v2}, Landroid/view/SurfaceControl$Transaction;->setPosition(Landroid/view/SurfaceControl;FF)Landroid/view/SurfaceControl$Transaction;

    move-result-object p1

    .line 10
    invoke-virtual {p1, p2, v5}, Landroid/view/SurfaceControl$Transaction;->setCornerRadius(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    move-result-object p1

    iget p4, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mShadowRadius:I

    int-to-float p4, p4

    .line 11
    invoke-virtual {p1, p2, p4}, Landroid/view/SurfaceControl$Transaction;->setShadowRadius(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    .line 12
    iget-object v3, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpFloat9:[F

    iget p0, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mShadowRadius:I

    int-to-float v6, p0

    const/4 v4, 0x0

    move-object v7, p3

    invoke-static/range {v1 .. v7}, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->newPipSurfaceTransaction(FF[FFFFLandroid/graphics/Rect;)Landroid/window/PictureInPictureSurfaceTransaction;

    move-result-object p0

    return-object p0
.end method

.method public scale(Landroid/view/SurfaceControl$Transaction;Landroid/view/SurfaceControl;Landroid/graphics/Rect;Landroid/graphics/Rect;FFF)Landroid/window/PictureInPictureSurfaceTransaction;
    .locals 5

    .line 13
    iget-object v0, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpSourceRectF:Landroid/graphics/RectF;

    invoke-virtual {v0, p3}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 14
    iget-object v0, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpDestinationRectF:Landroid/graphics/RectF;

    invoke-virtual {v0, p4}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 15
    iget-object v0, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpDestinationRectF:Landroid/graphics/RectF;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1}, Landroid/graphics/RectF;->offsetTo(FF)V

    .line 16
    iget-object v0, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpTransform:Landroid/graphics/Matrix;

    iget-object v2, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpSourceRectF:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpDestinationRectF:Landroid/graphics/RectF;

    sget-object v4, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v0, v2, v3, v4}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 17
    iget-object v0, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpTransform:Landroid/graphics/Matrix;

    invoke-virtual {v0, p5, v1, v1}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    .line 18
    invoke-direct {p0, p3, p4}, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->getScaledCornerRadius(Landroid/graphics/Rect;Landroid/graphics/Rect;)F

    move-result p4

    .line 19
    iget-object v0, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpTransform:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpFloat9:[F

    invoke-virtual {p1, p2, v0, v1}, Landroid/view/SurfaceControl$Transaction;->setMatrix(Landroid/view/SurfaceControl;Landroid/graphics/Matrix;[F)Landroid/view/SurfaceControl$Transaction;

    move-result-object p1

    .line 20
    invoke-virtual {p1, p2, p6, p7}, Landroid/view/SurfaceControl$Transaction;->setPosition(Landroid/view/SurfaceControl;FF)Landroid/view/SurfaceControl$Transaction;

    move-result-object p1

    .line 21
    invoke-virtual {p1, p2, p4}, Landroid/view/SurfaceControl$Transaction;->setCornerRadius(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    move-result-object p1

    iget v0, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mShadowRadius:I

    int-to-float v0, v0

    .line 22
    invoke-virtual {p1, p2, v0}, Landroid/view/SurfaceControl$Transaction;->setShadowRadius(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    .line 23
    iget-object p2, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpFloat9:[F

    iget p0, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mShadowRadius:I

    int-to-float p0, p0

    move p1, p5

    move p5, p0

    move p0, p6

    move-object p6, p3

    move p3, p1

    move p1, p7

    invoke-static/range {p0 .. p6}, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->newPipSurfaceTransaction(FF[FFFFLandroid/graphics/Rect;)Landroid/window/PictureInPictureSurfaceTransaction;

    move-result-object p0

    return-object p0
.end method

.method public scaleAndCrop(Landroid/view/SurfaceControl$Transaction;Landroid/view/SurfaceControl;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Rect;F)Landroid/window/PictureInPictureSurfaceTransaction;
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpSourceRectF:Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-virtual {v0, p4}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpDestinationRect:Landroid/graphics/Rect;

    .line 7
    .line 8
    invoke-virtual {v0, p4}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpDestinationRect:Landroid/graphics/Rect;

    .line 12
    .line 13
    invoke-virtual {v0, p6}, Landroid/graphics/Rect;->inset(Landroid/graphics/Rect;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p3}, Landroid/graphics/Rect;->isEmpty()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/high16 v1, 0x3f800000    # 1.0f

    .line 21
    .line 22
    if-nez v0, :cond_3

    .line 23
    .line 24
    invoke-virtual {p3}, Landroid/graphics/Rect;->width()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    invoke-virtual {p4}, Landroid/graphics/Rect;->width()I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-ne v0, v2, :cond_0

    .line 33
    .line 34
    goto :goto_4

    .line 35
    :cond_0
    invoke-virtual {p3}, Landroid/graphics/Rect;->width()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-virtual {p3}, Landroid/graphics/Rect;->height()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-gt v0, v2, :cond_1

    .line 44
    .line 45
    invoke-virtual {p5}, Landroid/graphics/Rect;->width()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    int-to-float v0, v0

    .line 50
    invoke-virtual {p3}, Landroid/graphics/Rect;->width()I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    :goto_0
    int-to-float v2, v2

    .line 55
    div-float/2addr v0, v2

    .line 56
    goto :goto_1

    .line 57
    :cond_1
    invoke-virtual {p5}, Landroid/graphics/Rect;->height()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    int-to-float v0, v0

    .line 62
    invoke-virtual {p3}, Landroid/graphics/Rect;->height()I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    goto :goto_0

    .line 67
    :goto_1
    invoke-virtual {p3}, Landroid/graphics/Rect;->width()I

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    invoke-virtual {p3}, Landroid/graphics/Rect;->height()I

    .line 72
    .line 73
    .line 74
    move-result p3

    .line 75
    if-gt v2, p3, :cond_2

    .line 76
    .line 77
    invoke-virtual {p5}, Landroid/graphics/Rect;->width()I

    .line 78
    .line 79
    .line 80
    move-result p3

    .line 81
    int-to-float p3, p3

    .line 82
    invoke-virtual {p4}, Landroid/graphics/Rect;->width()I

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    :goto_2
    int-to-float v2, v2

    .line 87
    div-float/2addr p3, v2

    .line 88
    goto :goto_3

    .line 89
    :cond_2
    invoke-virtual {p5}, Landroid/graphics/Rect;->height()I

    .line 90
    .line 91
    .line 92
    move-result p3

    .line 93
    int-to-float p3, p3

    .line 94
    invoke-virtual {p4}, Landroid/graphics/Rect;->height()I

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    goto :goto_2

    .line 99
    :goto_3
    sub-float v2, v1, p7

    .line 100
    .line 101
    mul-float/2addr v2, p3

    .line 102
    mul-float/2addr p7, v0

    .line 103
    add-float/2addr v2, p7

    .line 104
    invoke-static {v2, v1}, Ljava/lang/Math;->min(FF)F

    .line 105
    .line 106
    .line 107
    move-result p3

    .line 108
    iget p7, p5, Landroid/graphics/Rect;->left:I

    .line 109
    .line 110
    int-to-float p7, p7

    .line 111
    iget v0, p6, Landroid/graphics/Rect;->left:I

    .line 112
    .line 113
    iget v1, p4, Landroid/graphics/Rect;->left:I

    .line 114
    .line 115
    add-int/2addr v0, v1

    .line 116
    int-to-float v0, v0

    .line 117
    mul-float/2addr v0, p3

    .line 118
    sub-float/2addr p7, v0

    .line 119
    iget v0, p5, Landroid/graphics/Rect;->top:I

    .line 120
    .line 121
    int-to-float v0, v0

    .line 122
    iget p6, p6, Landroid/graphics/Rect;->top:I

    .line 123
    .line 124
    iget p4, p4, Landroid/graphics/Rect;->top:I

    .line 125
    .line 126
    add-int/2addr p6, p4

    .line 127
    int-to-float p4, p6

    .line 128
    mul-float/2addr p4, p3

    .line 129
    sub-float/2addr v0, p4

    .line 130
    move v1, v0

    .line 131
    move v0, p7

    .line 132
    goto :goto_7

    .line 133
    :cond_3
    :goto_4
    invoke-virtual {p5}, Landroid/graphics/Rect;->width()I

    .line 134
    .line 135
    .line 136
    move-result p3

    .line 137
    int-to-float p3, p3

    .line 138
    invoke-virtual {p4}, Landroid/graphics/Rect;->width()I

    .line 139
    .line 140
    .line 141
    move-result p7

    .line 142
    int-to-float p7, p7

    .line 143
    div-float/2addr p3, p7

    .line 144
    invoke-virtual {p5}, Landroid/graphics/Rect;->height()I

    .line 145
    .line 146
    .line 147
    move-result p7

    .line 148
    int-to-float p7, p7

    .line 149
    invoke-virtual {p4}, Landroid/graphics/Rect;->height()I

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    int-to-float v0, v0

    .line 154
    div-float/2addr p7, v0

    .line 155
    invoke-static {p3, p7}, Ljava/lang/Math;->max(FF)F

    .line 156
    .line 157
    .line 158
    move-result p3

    .line 159
    cmpl-float p7, p3, v1

    .line 160
    .line 161
    const/4 v0, 0x0

    .line 162
    if-nez p7, :cond_4

    .line 163
    .line 164
    move v1, v0

    .line 165
    goto :goto_5

    .line 166
    :cond_4
    iget v1, p5, Landroid/graphics/Rect;->left:I

    .line 167
    .line 168
    int-to-float v1, v1

    .line 169
    iget v2, p6, Landroid/graphics/Rect;->left:I

    .line 170
    .line 171
    iget v3, p4, Landroid/graphics/Rect;->left:I

    .line 172
    .line 173
    add-int/2addr v2, v3

    .line 174
    int-to-float v2, v2

    .line 175
    mul-float/2addr v2, p3

    .line 176
    sub-float/2addr v1, v2

    .line 177
    :goto_5
    if-nez p7, :cond_5

    .line 178
    .line 179
    goto :goto_6

    .line 180
    :cond_5
    iget p7, p5, Landroid/graphics/Rect;->top:I

    .line 181
    .line 182
    int-to-float p7, p7

    .line 183
    iget p6, p6, Landroid/graphics/Rect;->top:I

    .line 184
    .line 185
    iget p4, p4, Landroid/graphics/Rect;->top:I

    .line 186
    .line 187
    add-int/2addr p6, p4

    .line 188
    int-to-float p4, p6

    .line 189
    mul-float/2addr p4, p3

    .line 190
    sub-float/2addr p7, p4

    .line 191
    move v0, p7

    .line 192
    :goto_6
    move v7, v1

    .line 193
    move v1, v0

    .line 194
    move v0, v7

    .line 195
    :goto_7
    iget-object p4, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpTransform:Landroid/graphics/Matrix;

    .line 196
    .line 197
    invoke-virtual {p4, p3, p3}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 198
    .line 199
    .line 200
    iget-object p3, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpDestinationRect:Landroid/graphics/Rect;

    .line 201
    .line 202
    invoke-direct {p0, p3, p5}, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->getScaledCornerRadius(Landroid/graphics/Rect;Landroid/graphics/Rect;)F

    .line 203
    .line 204
    .line 205
    move-result v4

    .line 206
    iget-object p3, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpTransform:Landroid/graphics/Matrix;

    .line 207
    .line 208
    iget-object p4, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpFloat9:[F

    .line 209
    .line 210
    invoke-virtual {p1, p2, p3, p4}, Landroid/view/SurfaceControl$Transaction;->setMatrix(Landroid/view/SurfaceControl;Landroid/graphics/Matrix;[F)Landroid/view/SurfaceControl$Transaction;

    .line 211
    .line 212
    .line 213
    move-result-object p1

    .line 214
    iget-object p3, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpDestinationRect:Landroid/graphics/Rect;

    .line 215
    .line 216
    invoke-virtual {p1, p2, p3}, Landroid/view/SurfaceControl$Transaction;->setCrop(Landroid/view/SurfaceControl;Landroid/graphics/Rect;)Landroid/view/SurfaceControl$Transaction;

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    invoke-virtual {p1, p2, v0, v1}, Landroid/view/SurfaceControl$Transaction;->setPosition(Landroid/view/SurfaceControl;FF)Landroid/view/SurfaceControl$Transaction;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    invoke-virtual {p1, p2, v4}, Landroid/view/SurfaceControl$Transaction;->setCornerRadius(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    .line 225
    .line 226
    .line 227
    move-result-object p1

    .line 228
    iget p3, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mShadowRadius:I

    .line 229
    .line 230
    int-to-float p3, p3

    .line 231
    invoke-virtual {p1, p2, p3}, Landroid/view/SurfaceControl$Transaction;->setShadowRadius(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    .line 232
    .line 233
    .line 234
    iget-object v2, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpFloat9:[F

    .line 235
    .line 236
    iget p1, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mShadowRadius:I

    .line 237
    .line 238
    int-to-float v5, p1

    .line 239
    iget-object v6, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpDestinationRect:Landroid/graphics/Rect;

    .line 240
    .line 241
    const/4 v3, 0x0

    .line 242
    invoke-static/range {v0 .. v6}, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->newPipSurfaceTransaction(FF[FFFFLandroid/graphics/Rect;)Landroid/window/PictureInPictureSurfaceTransaction;

    .line 243
    .line 244
    .line 245
    move-result-object p0

    .line 246
    return-object p0
.end method

.method public scaleAndRotate(Landroid/view/SurfaceControl$Transaction;Landroid/view/SurfaceControl;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Rect;FFF)Landroid/window/PictureInPictureSurfaceTransaction;
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpSourceRectF:Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-virtual {v0, p3}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpDestinationRect:Landroid/graphics/Rect;

    .line 7
    .line 8
    invoke-virtual {v0, p3}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpDestinationRect:Landroid/graphics/Rect;

    .line 12
    .line 13
    invoke-virtual {v0, p5}, Landroid/graphics/Rect;->inset(Landroid/graphics/Rect;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p4}, Landroid/graphics/Rect;->width()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    int-to-float v0, v0

    .line 21
    invoke-virtual {p3}, Landroid/graphics/Rect;->width()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    int-to-float v1, v1

    .line 26
    div-float/2addr v0, v1

    .line 27
    invoke-virtual {p4}, Landroid/graphics/Rect;->height()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    int-to-float v1, v1

    .line 32
    invoke-virtual {p3}, Landroid/graphics/Rect;->height()I

    .line 33
    .line 34
    .line 35
    move-result p3

    .line 36
    int-to-float p3, p3

    .line 37
    div-float/2addr v1, p3

    .line 38
    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    .line 39
    .line 40
    .line 41
    move-result p3

    .line 42
    iget-object v0, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpTransform:Landroid/graphics/Matrix;

    .line 43
    .line 44
    const/4 v1, 0x0

    .line 45
    invoke-virtual {v0, p6, v1, v1}, Landroid/graphics/Matrix;->setRotate(FFF)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpTransform:Landroid/graphics/Matrix;

    .line 49
    .line 50
    invoke-virtual {v0, p3, p3}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpDestinationRect:Landroid/graphics/Rect;

    .line 54
    .line 55
    invoke-direct {p0, v0, p4}, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->getScaledCornerRadius(Landroid/graphics/Rect;Landroid/graphics/Rect;)F

    .line 56
    .line 57
    .line 58
    move-result v6

    .line 59
    cmpg-float p4, p6, v1

    .line 60
    .line 61
    if-gez p4, :cond_0

    .line 62
    .line 63
    iget p4, p5, Landroid/graphics/Rect;->top:I

    .line 64
    .line 65
    int-to-float p4, p4

    .line 66
    mul-float/2addr p4, p3

    .line 67
    sub-float p4, p7, p4

    .line 68
    .line 69
    iget p5, p5, Landroid/graphics/Rect;->left:I

    .line 70
    .line 71
    int-to-float p5, p5

    .line 72
    mul-float/2addr p5, p3

    .line 73
    add-float p3, p8, p5

    .line 74
    .line 75
    :goto_0
    move v3, p3

    .line 76
    move v2, p4

    .line 77
    goto :goto_1

    .line 78
    :cond_0
    iget p4, p5, Landroid/graphics/Rect;->top:I

    .line 79
    .line 80
    int-to-float p4, p4

    .line 81
    mul-float/2addr p4, p3

    .line 82
    add-float p4, p7, p4

    .line 83
    .line 84
    iget p5, p5, Landroid/graphics/Rect;->left:I

    .line 85
    .line 86
    int-to-float p5, p5

    .line 87
    mul-float/2addr p5, p3

    .line 88
    sub-float p3, p8, p5

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :goto_1
    iget-object p3, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpTransform:Landroid/graphics/Matrix;

    .line 92
    .line 93
    iget-object p4, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpFloat9:[F

    .line 94
    .line 95
    invoke-virtual {p1, p2, p3, p4}, Landroid/view/SurfaceControl$Transaction;->setMatrix(Landroid/view/SurfaceControl;Landroid/graphics/Matrix;[F)Landroid/view/SurfaceControl$Transaction;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    iget-object p3, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpDestinationRect:Landroid/graphics/Rect;

    .line 100
    .line 101
    invoke-virtual {p1, p2, p3}, Landroid/view/SurfaceControl$Transaction;->setCrop(Landroid/view/SurfaceControl;Landroid/graphics/Rect;)Landroid/view/SurfaceControl$Transaction;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-virtual {p1, p2, v2, v3}, Landroid/view/SurfaceControl$Transaction;->setPosition(Landroid/view/SurfaceControl;FF)Landroid/view/SurfaceControl$Transaction;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    invoke-virtual {p1, p2, v6}, Landroid/view/SurfaceControl$Transaction;->setCornerRadius(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    iget p3, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mShadowRadius:I

    .line 114
    .line 115
    int-to-float p3, p3

    .line 116
    invoke-virtual {p1, p2, p3}, Landroid/view/SurfaceControl$Transaction;->setShadowRadius(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    .line 117
    .line 118
    .line 119
    iget-object v4, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpFloat9:[F

    .line 120
    .line 121
    iget p1, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mShadowRadius:I

    .line 122
    .line 123
    int-to-float v7, p1

    .line 124
    iget-object v8, p0, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->mTmpDestinationRect:Landroid/graphics/Rect;

    .line 125
    .line 126
    move v5, p6

    .line 127
    invoke-static/range {v2 .. v8}, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->newPipSurfaceTransaction(FF[FFFFLandroid/graphics/Rect;)Landroid/window/PictureInPictureSurfaceTransaction;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    return-object p0
.end method
