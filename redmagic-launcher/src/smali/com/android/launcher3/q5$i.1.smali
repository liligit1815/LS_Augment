.class Lcom/android/launcher3/q5$i;
.super Lcom/android/quickstep/util/MultiValueUpdateListener;
.source "QuickstepTransitionManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/q5;->p0([Landroid/view/RemoteAnimationTarget;)Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field g:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field i:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field j:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field final synthetic k:F

.field final synthetic l:F

.field final synthetic m:Landroid/view/animation/Interpolator;

.field final synthetic n:F

.field final synthetic o:[Landroid/view/RemoteAnimationTarget;

.field final synthetic p:Landroid/graphics/Point;

.field final synthetic q:Landroid/graphics/Rect;

.field final synthetic r:I

.field final synthetic s:Landroid/graphics/Matrix;

.field final synthetic t:F

.field final synthetic u:Lcom/android/quickstep/util/SurfaceTransactionApplier;


# direct methods
.method constructor <init>(Lcom/android/launcher3/q5;FFLandroid/view/animation/Interpolator;F[Landroid/view/RemoteAnimationTarget;Landroid/graphics/Point;Landroid/graphics/Rect;ILandroid/graphics/Matrix;FLcom/android/quickstep/util/SurfaceTransactionApplier;)V
    .locals 0

    .line 1
    iput p2, p0, Lcom/android/launcher3/q5$i;->k:F

    .line 2
    .line 3
    iput p3, p0, Lcom/android/launcher3/q5$i;->l:F

    .line 4
    .line 5
    iput-object p4, p0, Lcom/android/launcher3/q5$i;->m:Landroid/view/animation/Interpolator;

    .line 6
    .line 7
    iput p5, p0, Lcom/android/launcher3/q5$i;->n:F

    .line 8
    .line 9
    iput-object p6, p0, Lcom/android/launcher3/q5$i;->o:[Landroid/view/RemoteAnimationTarget;

    .line 10
    .line 11
    iput-object p7, p0, Lcom/android/launcher3/q5$i;->p:Landroid/graphics/Point;

    .line 12
    .line 13
    iput-object p8, p0, Lcom/android/launcher3/q5$i;->q:Landroid/graphics/Rect;

    .line 14
    .line 15
    iput p9, p0, Lcom/android/launcher3/q5$i;->r:I

    .line 16
    .line 17
    iput-object p10, p0, Lcom/android/launcher3/q5$i;->s:Landroid/graphics/Matrix;

    .line 18
    .line 19
    iput p11, p0, Lcom/android/launcher3/q5$i;->t:F

    .line 20
    .line 21
    iput-object p12, p0, Lcom/android/launcher3/q5$i;->u:Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 22
    .line 23
    invoke-direct {p0}, Lcom/android/quickstep/util/MultiValueUpdateListener;-><init>()V

    .line 24
    .line 25
    .line 26
    new-instance p1, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 27
    .line 28
    sget-object p6, LJ0/h;->K:Landroid/view/animation/Interpolator;

    .line 29
    .line 30
    const/4 p7, 0x0

    .line 31
    invoke-direct {p1, p0, p7, p2, p6}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, Lcom/android/launcher3/q5$i;->g:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 35
    .line 36
    new-instance p1, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 37
    .line 38
    const/high16 p2, 0x3f800000    # 1.0f

    .line 39
    .line 40
    invoke-direct {p1, p0, p2, p3, p6}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    .line 41
    .line 42
    .line 43
    iput-object p1, p0, Lcom/android/launcher3/q5$i;->h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 44
    .line 45
    new-instance p1, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 46
    .line 47
    invoke-direct {p1, p0, p2, p7, p4}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    .line 48
    .line 49
    .line 50
    iput-object p1, p0, Lcom/android/launcher3/q5$i;->i:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 51
    .line 52
    new-instance p1, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 53
    .line 54
    invoke-direct {p1, p0, p5, p7, p6}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    .line 55
    .line 56
    .line 57
    iput-object p1, p0, Lcom/android/launcher3/q5$i;->j:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 58
    .line 59
    return-void
.end method


# virtual methods
.method public onUpdate(FZ)V
    .locals 7

    .line 1
    new-instance p1, Lcom/android/quickstep/util/SurfaceTransaction;

    .line 2
    .line 3
    invoke-direct {p1}, Lcom/android/quickstep/util/SurfaceTransaction;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p2, p0, Lcom/android/launcher3/q5$i;->o:[Landroid/view/RemoteAnimationTarget;

    .line 7
    .line 8
    array-length p2, p2

    .line 9
    const/4 v0, 0x1

    .line 10
    sub-int/2addr p2, v0

    .line 11
    :goto_0
    if-ltz p2, :cond_4

    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/launcher3/q5$i;->o:[Landroid/view/RemoteAnimationTarget;

    .line 14
    .line 15
    aget-object v1, v1, p2

    .line 16
    .line 17
    iget-object v2, v1, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 18
    .line 19
    invoke-virtual {p1, v2}, Lcom/android/quickstep/util/SurfaceTransaction;->forSurface(Landroid/view/SurfaceControl;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    iget-object v3, v1, Landroid/view/RemoteAnimationTarget;->screenSpaceBounds:Landroid/graphics/Rect;

    .line 24
    .line 25
    if-eqz v3, :cond_0

    .line 26
    .line 27
    iget-object v4, p0, Lcom/android/launcher3/q5$i;->p:Landroid/graphics/Point;

    .line 28
    .line 29
    iget v5, v3, Landroid/graphics/Rect;->left:I

    .line 30
    .line 31
    iget v3, v3, Landroid/graphics/Rect;->top:I

    .line 32
    .line 33
    invoke-virtual {v4, v5, v3}, Landroid/graphics/Point;->set(II)V

    .line 34
    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_0
    iget-object v3, p0, Lcom/android/launcher3/q5$i;->p:Landroid/graphics/Point;

    .line 38
    .line 39
    iget-object v4, v1, Landroid/view/RemoteAnimationTarget;->position:Landroid/graphics/Point;

    .line 40
    .line 41
    iget v5, v4, Landroid/graphics/Point;->x:I

    .line 42
    .line 43
    iget v4, v4, Landroid/graphics/Point;->y:I

    .line 44
    .line 45
    invoke-virtual {v3, v5, v4}, Landroid/graphics/Point;->set(II)V

    .line 46
    .line 47
    .line 48
    :goto_1
    new-instance v3, Landroid/graphics/Rect;

    .line 49
    .line 50
    iget-object v4, v1, Landroid/view/RemoteAnimationTarget;->localBounds:Landroid/graphics/Rect;

    .line 51
    .line 52
    invoke-direct {v3, v4}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 53
    .line 54
    .line 55
    const/4 v4, 0x0

    .line 56
    invoke-virtual {v3, v4, v4}, Landroid/graphics/Rect;->offsetTo(II)V

    .line 57
    .line 58
    .line 59
    iget v4, v1, Landroid/view/RemoteAnimationTarget;->mode:I

    .line 60
    .line 61
    if-ne v4, v0, :cond_2

    .line 62
    .line 63
    iget-object v4, p0, Lcom/android/launcher3/q5$i;->q:Landroid/graphics/Rect;

    .line 64
    .line 65
    iget-object v1, v1, Landroid/view/RemoteAnimationTarget;->screenSpaceBounds:Landroid/graphics/Rect;

    .line 66
    .line 67
    invoke-virtual {v4, v1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 68
    .line 69
    .line 70
    iget v1, p0, Lcom/android/launcher3/q5$i;->r:I

    .line 71
    .line 72
    rem-int/lit8 v1, v1, 0x2

    .line 73
    .line 74
    if-eqz v1, :cond_1

    .line 75
    .line 76
    iget v1, v3, Landroid/graphics/Rect;->right:I

    .line 77
    .line 78
    iget v4, v3, Landroid/graphics/Rect;->bottom:I

    .line 79
    .line 80
    iput v4, v3, Landroid/graphics/Rect;->right:I

    .line 81
    .line 82
    iput v1, v3, Landroid/graphics/Rect;->bottom:I

    .line 83
    .line 84
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/q5$i;->s:Landroid/graphics/Matrix;

    .line 85
    .line 86
    iget-object v4, p0, Lcom/android/launcher3/q5$i;->h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 87
    .line 88
    iget v4, v4, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 89
    .line 90
    iget-object v5, p0, Lcom/android/launcher3/q5$i;->q:Landroid/graphics/Rect;

    .line 91
    .line 92
    invoke-virtual {v5}, Landroid/graphics/Rect;->centerX()I

    .line 93
    .line 94
    .line 95
    move-result v5

    .line 96
    int-to-float v5, v5

    .line 97
    iget-object v6, p0, Lcom/android/launcher3/q5$i;->q:Landroid/graphics/Rect;

    .line 98
    .line 99
    invoke-virtual {v6}, Landroid/graphics/Rect;->centerY()I

    .line 100
    .line 101
    .line 102
    move-result v6

    .line 103
    int-to-float v6, v6

    .line 104
    invoke-virtual {v1, v4, v4, v5, v6}, Landroid/graphics/Matrix;->setScale(FFFF)V

    .line 105
    .line 106
    .line 107
    iget-object v1, p0, Lcom/android/launcher3/q5$i;->s:Landroid/graphics/Matrix;

    .line 108
    .line 109
    iget-object v4, p0, Lcom/android/launcher3/q5$i;->g:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 110
    .line 111
    iget v4, v4, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 112
    .line 113
    const/4 v5, 0x0

    .line 114
    invoke-virtual {v1, v5, v4}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 115
    .line 116
    .line 117
    iget-object v1, p0, Lcom/android/launcher3/q5$i;->s:Landroid/graphics/Matrix;

    .line 118
    .line 119
    iget-object v4, p0, Lcom/android/launcher3/q5$i;->p:Landroid/graphics/Point;

    .line 120
    .line 121
    iget v5, v4, Landroid/graphics/Point;->x:I

    .line 122
    .line 123
    int-to-float v5, v5

    .line 124
    iget v4, v4, Landroid/graphics/Point;->y:I

    .line 125
    .line 126
    int-to-float v4, v4

    .line 127
    invoke-virtual {v1, v5, v4}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 128
    .line 129
    .line 130
    iget-object v1, p0, Lcom/android/launcher3/q5$i;->s:Landroid/graphics/Matrix;

    .line 131
    .line 132
    invoke-virtual {v2, v1}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setMatrix(Landroid/graphics/Matrix;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    invoke-virtual {v1, v3}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setWindowCrop(Landroid/graphics/Rect;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    iget-object v2, p0, Lcom/android/launcher3/q5$i;->i:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 141
    .line 142
    iget v2, v2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 143
    .line 144
    invoke-virtual {v1, v2}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setAlpha(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    iget v2, p0, Lcom/android/launcher3/q5$i;->t:F

    .line 149
    .line 150
    invoke-virtual {v1, v2}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setCornerRadius(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    iget-object v2, p0, Lcom/android/launcher3/q5$i;->j:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 155
    .line 156
    iget v2, v2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 157
    .line 158
    invoke-virtual {v1, v2}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setShadowRadius(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 159
    .line 160
    .line 161
    goto :goto_2

    .line 162
    :cond_2
    if-nez v4, :cond_3

    .line 163
    .line 164
    iget-object v1, p0, Lcom/android/launcher3/q5$i;->s:Landroid/graphics/Matrix;

    .line 165
    .line 166
    iget-object v4, p0, Lcom/android/launcher3/q5$i;->p:Landroid/graphics/Point;

    .line 167
    .line 168
    iget v5, v4, Landroid/graphics/Point;->x:I

    .line 169
    .line 170
    int-to-float v5, v5

    .line 171
    iget v4, v4, Landroid/graphics/Point;->y:I

    .line 172
    .line 173
    int-to-float v4, v4

    .line 174
    invoke-virtual {v1, v5, v4}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 175
    .line 176
    .line 177
    iget-object v1, p0, Lcom/android/launcher3/q5$i;->s:Landroid/graphics/Matrix;

    .line 178
    .line 179
    invoke-virtual {v2, v1}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setMatrix(Landroid/graphics/Matrix;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    invoke-virtual {v1, v3}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setWindowCrop(Landroid/graphics/Rect;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    const/high16 v2, 0x3f800000    # 1.0f

    .line 188
    .line 189
    invoke-virtual {v1, v2}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setAlpha(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 190
    .line 191
    .line 192
    :cond_3
    :goto_2
    add-int/lit8 p2, p2, -0x1

    .line 193
    .line 194
    goto/16 :goto_0

    .line 195
    .line 196
    :cond_4
    iget-object p0, p0, Lcom/android/launcher3/q5$i;->u:Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 197
    .line 198
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/SurfaceTransactionApplier;->scheduleApply(Lcom/android/quickstep/util/SurfaceTransaction;)V

    .line 199
    .line 200
    .line 201
    return-void
.end method
