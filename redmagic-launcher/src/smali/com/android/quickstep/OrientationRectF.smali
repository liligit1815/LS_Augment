.class public Lcom/android/quickstep/OrientationRectF;
.super Landroid/graphics/RectF;
.source "OrientationRectF.java"


# static fields
.field private static final DEBUG:Z = false

.field private static final TAG:Ljava/lang/String; = "OrientationRectF"


# instance fields
.field private final mHeight:F

.field protected final mRotation:I

.field private final mTmpMatrix:Landroid/graphics/Matrix;

.field private final mTmpPoint:[F

.field private final mWidth:F


# direct methods
.method public constructor <init>(FFFFI)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/graphics/Matrix;

    .line 5
    .line 6
    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/quickstep/OrientationRectF;->mTmpMatrix:Landroid/graphics/Matrix;

    .line 10
    .line 11
    const/4 p1, 0x2

    .line 12
    new-array p1, p1, [F

    .line 13
    .line 14
    iput-object p1, p0, Lcom/android/quickstep/OrientationRectF;->mTmpPoint:[F

    .line 15
    .line 16
    iput p5, p0, Lcom/android/quickstep/OrientationRectF;->mRotation:I

    .line 17
    .line 18
    iput p4, p0, Lcom/android/quickstep/OrientationRectF;->mHeight:F

    .line 19
    .line 20
    iput p3, p0, Lcom/android/quickstep/OrientationRectF;->mWidth:F

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public applyTransform(Landroid/view/MotionEvent;IZ)Z
    .locals 3

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {p0, p2, p1}, Lcom/android/quickstep/OrientationRectF;->contains(FF)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/OrientationRectF;->mTmpMatrix:Landroid/graphics/Matrix;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 19
    .line 20
    .line 21
    iget v0, p0, Lcom/android/quickstep/OrientationRectF;->mHeight:F

    .line 22
    .line 23
    iget v1, p0, Lcom/android/quickstep/OrientationRectF;->mWidth:F

    .line 24
    .line 25
    iget-object v2, p0, Lcom/android/quickstep/OrientationRectF;->mTmpMatrix:Landroid/graphics/Matrix;

    .line 26
    .line 27
    invoke-static {p2, v0, v1, v2}, Lcom/android/quickstep/util/RecentsOrientedState;->postDisplayRotation(IFFLandroid/graphics/Matrix;)V

    .line 28
    .line 29
    .line 30
    const/4 p2, 0x1

    .line 31
    if-eqz p3, :cond_1

    .line 32
    .line 33
    iget-object p0, p0, Lcom/android/quickstep/OrientationRectF;->mTmpMatrix:Landroid/graphics/Matrix;

    .line 34
    .line 35
    invoke-virtual {p1, p0}, Landroid/view/MotionEvent;->applyTransform(Landroid/graphics/Matrix;)V

    .line 36
    .line 37
    .line 38
    return p2

    .line 39
    :cond_1
    iget-object p3, p0, Lcom/android/quickstep/OrientationRectF;->mTmpPoint:[F

    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    const/4 v1, 0x0

    .line 46
    aput v0, p3, v1

    .line 47
    .line 48
    iget-object p3, p0, Lcom/android/quickstep/OrientationRectF;->mTmpPoint:[F

    .line 49
    .line 50
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    aput v0, p3, p2

    .line 55
    .line 56
    iget-object p3, p0, Lcom/android/quickstep/OrientationRectF;->mTmpMatrix:Landroid/graphics/Matrix;

    .line 57
    .line 58
    iget-object v0, p0, Lcom/android/quickstep/OrientationRectF;->mTmpPoint:[F

    .line 59
    .line 60
    invoke-virtual {p3, v0}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 61
    .line 62
    .line 63
    iget-object p3, p0, Lcom/android/quickstep/OrientationRectF;->mTmpPoint:[F

    .line 64
    .line 65
    aget v0, p3, v1

    .line 66
    .line 67
    aget p3, p3, p2

    .line 68
    .line 69
    invoke-virtual {p0, v0, p3}, Lcom/android/quickstep/OrientationRectF;->contains(FF)Z

    .line 70
    .line 71
    .line 72
    move-result p3

    .line 73
    if-eqz p3, :cond_2

    .line 74
    .line 75
    iget-object p0, p0, Lcom/android/quickstep/OrientationRectF;->mTmpMatrix:Landroid/graphics/Matrix;

    .line 76
    .line 77
    invoke-virtual {p1, p0}, Landroid/view/MotionEvent;->applyTransform(Landroid/graphics/Matrix;)V

    .line 78
    .line 79
    .line 80
    return p2

    .line 81
    :cond_2
    return v1
.end method

.method public applyTransformFromRotation(Landroid/view/MotionEvent;IZ)Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/quickstep/OrientationRectF;->mRotation:I

    .line 2
    .line 3
    invoke-static {p2, v0}, LQ1/d;->b(II)I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/quickstep/OrientationRectF;->applyTransform(Landroid/view/MotionEvent;IZ)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public applyTransformToRotation(Landroid/view/MotionEvent;IZ)Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/quickstep/OrientationRectF;->mRotation:I

    .line 2
    .line 3
    invoke-static {v0, p2}, LQ1/d;->b(II)I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/quickstep/OrientationRectF;->applyTransform(Landroid/view/MotionEvent;IZ)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public contains(FF)Z
    .locals 4

    .line 1
    iget v0, p0, Landroid/graphics/RectF;->left:F

    .line 2
    .line 3
    iget v1, p0, Landroid/graphics/RectF;->right:F

    .line 4
    .line 5
    cmpg-float v2, v0, v1

    .line 6
    .line 7
    if-gez v2, :cond_0

    .line 8
    .line 9
    iget v2, p0, Landroid/graphics/RectF;->top:F

    .line 10
    .line 11
    iget p0, p0, Landroid/graphics/RectF;->bottom:F

    .line 12
    .line 13
    cmpg-float v3, v2, p0

    .line 14
    .line 15
    if-gez v3, :cond_0

    .line 16
    .line 17
    cmpl-float v0, p1, v0

    .line 18
    .line 19
    if-ltz v0, :cond_0

    .line 20
    .line 21
    cmpg-float p1, p1, v1

    .line 22
    .line 23
    if-gtz p1, :cond_0

    .line 24
    .line 25
    cmpl-float p1, p2, v2

    .line 26
    .line 27
    if-ltz p1, :cond_0

    .line 28
    .line 29
    cmpg-float p0, p2, p0

    .line 30
    .line 31
    if-gtz p0, :cond_0

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    return p0
.end method

.method getRotation()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/OrientationRectF;->mRotation:I

    .line 2
    .line 3
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/graphics/RectF;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v0, " rotation: "

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget p0, p0, Lcom/android/quickstep/OrientationRectF;->mRotation:I

    .line 19
    .line 20
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method
