.class Lcom/android/launcher3/q5$t;
.super Lcom/android/quickstep/util/MultiValueUpdateListener;
.source "QuickstepTransitionManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/q5;->r0([Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Z)Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final g:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field final h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field final synthetic i:F

.field final synthetic j:F

.field final synthetic k:J

.field final synthetic l:Landroid/view/animation/Interpolator;

.field final synthetic m:F

.field final synthetic n:F

.field final synthetic o:Landroid/view/animation/Interpolator;

.field final synthetic p:[Landroid/view/RemoteAnimationTarget;

.field final synthetic q:I

.field final synthetic r:Landroid/graphics/Matrix;

.field final synthetic s:F

.field final synthetic t:Landroid/graphics/Point;

.field final synthetic u:I

.field final synthetic v:Lcom/android/quickstep/util/SurfaceTransactionApplier;


# direct methods
.method constructor <init>(Lcom/android/launcher3/q5;FFJLandroid/view/animation/Interpolator;FFLandroid/view/animation/Interpolator;[Landroid/view/RemoteAnimationTarget;ILandroid/graphics/Matrix;FLandroid/graphics/Point;ILcom/android/quickstep/util/SurfaceTransactionApplier;)V
    .locals 6

    .line 1
    iput p2, p0, Lcom/android/launcher3/q5$t;->i:F

    .line 2
    .line 3
    iput p3, p0, Lcom/android/launcher3/q5$t;->j:F

    .line 4
    .line 5
    iput-wide p4, p0, Lcom/android/launcher3/q5$t;->k:J

    .line 6
    .line 7
    iput-object p6, p0, Lcom/android/launcher3/q5$t;->l:Landroid/view/animation/Interpolator;

    .line 8
    .line 9
    iput p7, p0, Lcom/android/launcher3/q5$t;->m:F

    .line 10
    .line 11
    move v1, p8

    .line 12
    iput v1, p0, Lcom/android/launcher3/q5$t;->n:F

    .line 13
    .line 14
    move-object v2, p9

    .line 15
    iput-object v2, p0, Lcom/android/launcher3/q5$t;->o:Landroid/view/animation/Interpolator;

    .line 16
    .line 17
    move-object/from16 v3, p10

    .line 18
    .line 19
    iput-object v3, p0, Lcom/android/launcher3/q5$t;->p:[Landroid/view/RemoteAnimationTarget;

    .line 20
    .line 21
    move/from16 v3, p11

    .line 22
    .line 23
    iput v3, p0, Lcom/android/launcher3/q5$t;->q:I

    .line 24
    .line 25
    move-object/from16 v3, p12

    .line 26
    .line 27
    iput-object v3, p0, Lcom/android/launcher3/q5$t;->r:Landroid/graphics/Matrix;

    .line 28
    .line 29
    move/from16 v3, p13

    .line 30
    .line 31
    iput v3, p0, Lcom/android/launcher3/q5$t;->s:F

    .line 32
    .line 33
    move-object/from16 v3, p14

    .line 34
    .line 35
    iput-object v3, p0, Lcom/android/launcher3/q5$t;->t:Landroid/graphics/Point;

    .line 36
    .line 37
    move/from16 v3, p15

    .line 38
    .line 39
    iput v3, p0, Lcom/android/launcher3/q5$t;->u:I

    .line 40
    .line 41
    move-object/from16 v3, p16

    .line 42
    .line 43
    iput-object v3, p0, Lcom/android/launcher3/q5$t;->v:Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 44
    .line 45
    invoke-direct {p0}, Lcom/android/quickstep/util/MultiValueUpdateListener;-><init>()V

    .line 46
    .line 47
    .line 48
    new-instance v3, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 49
    .line 50
    const/4 v4, 0x0

    .line 51
    long-to-float v5, p4

    .line 52
    move-object/from16 p11, p0

    .line 53
    .line 54
    move/from16 p12, p2

    .line 55
    .line 56
    move/from16 p13, p3

    .line 57
    .line 58
    move-object/from16 p16, p6

    .line 59
    .line 60
    move-object/from16 p10, v3

    .line 61
    .line 62
    move/from16 p14, v4

    .line 63
    .line 64
    move/from16 p15, v5

    .line 65
    .line 66
    invoke-direct/range {p10 .. p16}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFFFLandroid/view/animation/Interpolator;)V

    .line 67
    .line 68
    .line 69
    move-object/from16 p2, p10

    .line 70
    .line 71
    iput-object p2, p0, Lcom/android/launcher3/q5$t;->g:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 72
    .line 73
    new-instance p2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 74
    .line 75
    const/4 p3, 0x0

    .line 76
    long-to-float v0, p4

    .line 77
    move-object/from16 p10, p2

    .line 78
    .line 79
    move/from16 p14, p3

    .line 80
    .line 81
    move/from16 p12, p7

    .line 82
    .line 83
    move/from16 p15, v0

    .line 84
    .line 85
    move/from16 p13, v1

    .line 86
    .line 87
    move-object/from16 p16, v2

    .line 88
    .line 89
    invoke-direct/range {p10 .. p16}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFFFLandroid/view/animation/Interpolator;)V

    .line 90
    .line 91
    .line 92
    iput-object p2, p0, Lcom/android/launcher3/q5$t;->h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 93
    .line 94
    return-void
.end method


# virtual methods
.method public onUpdate(FZ)V
    .locals 6

    .line 1
    new-instance p1, Lcom/android/quickstep/util/SurfaceTransaction;

    .line 2
    .line 3
    invoke-direct {p1}, Lcom/android/quickstep/util/SurfaceTransaction;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p2, p0, Lcom/android/launcher3/q5$t;->p:[Landroid/view/RemoteAnimationTarget;

    .line 7
    .line 8
    array-length p2, p2

    .line 9
    const/4 v0, 0x1

    .line 10
    sub-int/2addr p2, v0

    .line 11
    :goto_0
    if-ltz p2, :cond_5

    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/launcher3/q5$t;->p:[Landroid/view/RemoteAnimationTarget;

    .line 14
    .line 15
    aget-object v1, v1, p2

    .line 16
    .line 17
    iget-object v2, v1, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 18
    .line 19
    if-eqz v2, :cond_4

    .line 20
    .line 21
    invoke-virtual {v2}, Landroid/view/SurfaceControl;->isValid()Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-nez v2, :cond_0

    .line 26
    .line 27
    goto/16 :goto_2

    .line 28
    .line 29
    :cond_0
    iget-object v2, v1, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 30
    .line 31
    invoke-virtual {p1, v2}, Lcom/android/quickstep/util/SurfaceTransaction;->forSurface(Landroid/view/SurfaceControl;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    iget v3, v1, Landroid/view/RemoteAnimationTarget;->mode:I

    .line 36
    .line 37
    iget v4, p0, Lcom/android/launcher3/q5$t;->q:I

    .line 38
    .line 39
    if-ne v3, v4, :cond_1

    .line 40
    .line 41
    iget-object v3, p0, Lcom/android/launcher3/q5$t;->r:Landroid/graphics/Matrix;

    .line 42
    .line 43
    iget-object v4, p0, Lcom/android/launcher3/q5$t;->g:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 44
    .line 45
    iget v4, v4, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 46
    .line 47
    iget-object v5, v1, Landroid/view/RemoteAnimationTarget;->sourceContainerBounds:Landroid/graphics/Rect;

    .line 48
    .line 49
    invoke-virtual {v5}, Landroid/graphics/Rect;->centerX()I

    .line 50
    .line 51
    .line 52
    move-result v5

    .line 53
    int-to-float v5, v5

    .line 54
    iget-object v1, v1, Landroid/view/RemoteAnimationTarget;->sourceContainerBounds:Landroid/graphics/Rect;

    .line 55
    .line 56
    invoke-virtual {v1}, Landroid/graphics/Rect;->centerY()I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    int-to-float v1, v1

    .line 61
    invoke-virtual {v3, v4, v4, v5, v1}, Landroid/graphics/Matrix;->setScale(FFFF)V

    .line 62
    .line 63
    .line 64
    iget-object v1, p0, Lcom/android/launcher3/q5$t;->r:Landroid/graphics/Matrix;

    .line 65
    .line 66
    invoke-virtual {v2, v1}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setMatrix(Landroid/graphics/Matrix;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    iget-object v2, p0, Lcom/android/launcher3/q5$t;->h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 71
    .line 72
    iget v2, v2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 73
    .line 74
    invoke-virtual {v1, v2}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setAlpha(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    iget v2, p0, Lcom/android/launcher3/q5$t;->s:F

    .line 79
    .line 80
    invoke-virtual {v1, v2}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setCornerRadius(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 81
    .line 82
    .line 83
    goto :goto_3

    .line 84
    :cond_1
    iget-object v3, v1, Landroid/view/RemoteAnimationTarget;->localBounds:Landroid/graphics/Rect;

    .line 85
    .line 86
    if-eqz v3, :cond_2

    .line 87
    .line 88
    iget-object v4, p0, Lcom/android/launcher3/q5$t;->t:Landroid/graphics/Point;

    .line 89
    .line 90
    iget v5, v3, Landroid/graphics/Rect;->left:I

    .line 91
    .line 92
    iget v3, v3, Landroid/graphics/Rect;->top:I

    .line 93
    .line 94
    invoke-virtual {v4, v5, v3}, Landroid/graphics/Point;->set(II)V

    .line 95
    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_2
    iget-object v3, p0, Lcom/android/launcher3/q5$t;->t:Landroid/graphics/Point;

    .line 99
    .line 100
    iget-object v4, v1, Landroid/view/RemoteAnimationTarget;->position:Landroid/graphics/Point;

    .line 101
    .line 102
    iget v5, v4, Landroid/graphics/Point;->x:I

    .line 103
    .line 104
    iget v4, v4, Landroid/graphics/Point;->y:I

    .line 105
    .line 106
    invoke-virtual {v3, v5, v4}, Landroid/graphics/Point;->set(II)V

    .line 107
    .line 108
    .line 109
    :goto_1
    new-instance v3, Landroid/graphics/Rect;

    .line 110
    .line 111
    iget-object v1, v1, Landroid/view/RemoteAnimationTarget;->screenSpaceBounds:Landroid/graphics/Rect;

    .line 112
    .line 113
    invoke-direct {v3, v1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 114
    .line 115
    .line 116
    const/4 v1, 0x0

    .line 117
    invoke-virtual {v3, v1, v1}, Landroid/graphics/Rect;->offsetTo(II)V

    .line 118
    .line 119
    .line 120
    iget v1, p0, Lcom/android/launcher3/q5$t;->u:I

    .line 121
    .line 122
    rem-int/lit8 v1, v1, 0x2

    .line 123
    .line 124
    if-ne v1, v0, :cond_3

    .line 125
    .line 126
    iget v1, v3, Landroid/graphics/Rect;->right:I

    .line 127
    .line 128
    iget v4, v3, Landroid/graphics/Rect;->bottom:I

    .line 129
    .line 130
    iput v4, v3, Landroid/graphics/Rect;->right:I

    .line 131
    .line 132
    iput v1, v3, Landroid/graphics/Rect;->bottom:I

    .line 133
    .line 134
    iget-object v1, p0, Lcom/android/launcher3/q5$t;->t:Landroid/graphics/Point;

    .line 135
    .line 136
    iget v4, v1, Landroid/graphics/Point;->x:I

    .line 137
    .line 138
    iget v5, v1, Landroid/graphics/Point;->y:I

    .line 139
    .line 140
    iput v5, v1, Landroid/graphics/Point;->x:I

    .line 141
    .line 142
    iput v4, v1, Landroid/graphics/Point;->y:I

    .line 143
    .line 144
    :cond_3
    iget-object v1, p0, Lcom/android/launcher3/q5$t;->r:Landroid/graphics/Matrix;

    .line 145
    .line 146
    iget-object v4, p0, Lcom/android/launcher3/q5$t;->t:Landroid/graphics/Point;

    .line 147
    .line 148
    iget v5, v4, Landroid/graphics/Point;->x:I

    .line 149
    .line 150
    int-to-float v5, v5

    .line 151
    iget v4, v4, Landroid/graphics/Point;->y:I

    .line 152
    .line 153
    int-to-float v4, v4

    .line 154
    invoke-virtual {v1, v5, v4}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 155
    .line 156
    .line 157
    iget-object v1, p0, Lcom/android/launcher3/q5$t;->r:Landroid/graphics/Matrix;

    .line 158
    .line 159
    invoke-virtual {v2, v1}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setMatrix(Landroid/graphics/Matrix;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    invoke-virtual {v1, v3}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setWindowCrop(Landroid/graphics/Rect;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    const/high16 v2, 0x3f800000    # 1.0f

    .line 168
    .line 169
    invoke-virtual {v1, v2}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setAlpha(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 170
    .line 171
    .line 172
    goto :goto_3

    .line 173
    :cond_4
    :goto_2
    const-string v1, "QuickstepTransitionManager"

    .line 174
    .line 175
    const-string v2, "onUpdate: app.leash null or inValid"

    .line 176
    .line 177
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 178
    .line 179
    .line 180
    :goto_3
    add-int/lit8 p2, p2, -0x1

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :cond_5
    iget-object p0, p0, Lcom/android/launcher3/q5$t;->v:Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 185
    .line 186
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/SurfaceTransactionApplier;->scheduleApply(Lcom/android/quickstep/util/SurfaceTransaction;)V

    .line 187
    .line 188
    .line 189
    return-void
.end method
