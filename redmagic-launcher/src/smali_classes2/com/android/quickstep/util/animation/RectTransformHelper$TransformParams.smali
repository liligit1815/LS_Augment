.class public final Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;
.super Ljava/lang/Object;
.source "RectTransformHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/animation/RectTransformHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "TransformParams"
.end annotation


# instance fields
.field private alpha:F

.field private centerScale:Z

.field private isClipFromLeftOrTop:Z

.field private isVerticalClip:Z

.field private mode:I

.field private originHeight:F

.field private originWidth:F

.field private radio:F

.field private radius:F

.field private radiusWeight:F

.field private scale:F

.field private surfaceTransactionApplier:Lcom/android/quickstep/util/SurfaceTransactionApplier;

.field private workspaceScrollOffset:I

.field private x:F

.field private y:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    iput v0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->scale:F

    .line 7
    .line 8
    iput v0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->alpha:F

    .line 9
    .line 10
    iput v0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->originWidth:F

    .line 11
    .line 12
    iput v0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->originHeight:F

    .line 13
    .line 14
    iput v0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->radio:F

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput v0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->radiusWeight:F

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    iput-boolean v0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->isVerticalClip:Z

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public final getAlpha()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->alpha:F

    .line 2
    .line 3
    return p0
.end method

.method public final getCenterScale()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->centerScale:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getIsClipFromLeftOrTop()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->isClipFromLeftOrTop:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getIsVerticalClip()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->isVerticalClip:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getMode()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->mode:I

    .line 2
    .line 3
    return p0
.end method

.method public final getOriginHeight()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->originHeight:F

    .line 2
    .line 3
    return p0
.end method

.method public final getOriginWidth()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->originWidth:F

    .line 2
    .line 3
    return p0
.end method

.method public final getRadio()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->radio:F

    .line 2
    .line 3
    return p0
.end method

.method public final getRadius()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->radius:F

    .line 2
    .line 3
    return p0
.end method

.method public final getRadiusWeight()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->radiusWeight:F

    .line 2
    .line 3
    return p0
.end method

.method public final getScale()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->scale:F

    .line 2
    .line 3
    return p0
.end method

.method public final getSurfaceTransactionApplier()Lcom/android/quickstep/util/SurfaceTransactionApplier;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->surfaceTransactionApplier:Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getWorkspaceScrollOffset()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->workspaceScrollOffset:I

    .line 2
    .line 3
    return p0
.end method

.method public final getX()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->x:F

    .line 2
    .line 3
    return p0
.end method

.method public final getY()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->y:F

    .line 2
    .line 3
    return p0
.end method

.method public final setAlpha(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->alpha:F

    .line 2
    .line 3
    return-void
.end method

.method public final setCenterScale(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->centerScale:Z

    .line 2
    .line 3
    return-void
.end method

.method public final setClipFromLeftOrTop(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->isClipFromLeftOrTop:Z

    .line 2
    .line 3
    return-void
.end method

.method public final setMode(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->mode:I

    .line 2
    .line 3
    return-void
.end method

.method public final setOriginHeight(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->originHeight:F

    .line 2
    .line 3
    return-void
.end method

.method public final setOriginWidth(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->originWidth:F

    .line 2
    .line 3
    return-void
.end method

.method public final setRadio(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->radio:F

    .line 2
    .line 3
    return-void
.end method

.method public final setRadius(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->radius:F

    .line 2
    .line 3
    return-void
.end method

.method public final setRadiusWeight(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->radiusWeight:F

    .line 2
    .line 3
    return-void
.end method

.method public final setScale(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->scale:F

    .line 2
    .line 3
    return-void
.end method

.method public final setSurfaceTransactionApplier(Lcom/android/quickstep/util/SurfaceTransactionApplier;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->surfaceTransactionApplier:Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 2
    .line 3
    return-void
.end method

.method public final setVerticalClip(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->isVerticalClip:Z

    .line 2
    .line 3
    return-void
.end method

.method public final setWorkspaceScrollOffset(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->workspaceScrollOffset:I

    .line 2
    .line 3
    return-void
.end method

.method public final setX(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->x:F

    .line 2
    .line 3
    return-void
.end method

.method public final setY(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->y:F

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 11

    .line 1
    iget v0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->x:F

    .line 2
    .line 3
    iget v1, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->y:F

    .line 4
    .line 5
    iget v2, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->alpha:F

    .line 6
    .line 7
    iget v3, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->scale:F

    .line 8
    .line 9
    iget v4, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->radio:F

    .line 10
    .line 11
    iget v5, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->radius:F

    .line 12
    .line 13
    iget v6, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->radiusWeight:F

    .line 14
    .line 15
    iget v7, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->workspaceScrollOffset:I

    .line 16
    .line 17
    iget-boolean v8, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->isVerticalClip:Z

    .line 18
    .line 19
    iget-boolean p0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->isClipFromLeftOrTop:Z

    .line 20
    .line 21
    new-instance v9, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string v10, "TransformParams(x="

    .line 24
    .line 25
    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v0, ", y="

    .line 32
    .line 33
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v0, ", alpha="

    .line 40
    .line 41
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v0, ", scale="

    .line 48
    .line 49
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string v0, ", radio="

    .line 56
    .line 57
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v0, ", radius="

    .line 64
    .line 65
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string v0, ",weight="

    .line 72
    .line 73
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string v0, ", workspaceScrollOffset="

    .line 80
    .line 81
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    const-string v0, ", isVerticalClip="

    .line 88
    .line 89
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    const-string v0, ", isClipFromLeftOrTop="

    .line 96
    .line 97
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v9, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    return-object p0
.end method
