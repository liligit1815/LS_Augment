.class Lcom/android/launcher3/q5$q;
.super Lcom/android/quickstep/util/MultiValueUpdateListener;
.source "QuickstepTransitionManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/q5;->u0(Landroid/view/View;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Z)Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic A:[I

.field final synthetic B:[Landroid/view/RemoteAnimationTarget;

.field final synthetic C:Landroid/graphics/Matrix;

.field final synthetic D:Landroid/graphics/Point;

.field final synthetic E:Landroid/view/RemoteAnimationTarget;

.field final synthetic F:Lcom/android/quickstep/util/SurfaceTransactionApplier;

.field final synthetic G:Lcom/android/launcher3/q5;

.field g:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field i:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field j:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field k:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field l:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field m:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field n:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field o:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field p:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field final synthetic q:Landroid/graphics/RectF;

.field final synthetic r:Landroid/graphics/Rect;

.field final synthetic s:F

.field final synthetic t:F

.field final synthetic u:F

.field final synthetic v:F

.field final synthetic w:F

.field final synthetic x:Landroid/graphics/Rect;

.field final synthetic y:I

.field final synthetic z:Landroid/graphics/RectF;


# direct methods
.method constructor <init>(Lcom/android/launcher3/q5;Landroid/graphics/RectF;Landroid/graphics/Rect;FFFFFLandroid/graphics/Rect;ILandroid/graphics/RectF;[I[Landroid/view/RemoteAnimationTarget;Landroid/graphics/Matrix;Landroid/graphics/Point;Landroid/view/RemoteAnimationTarget;Lcom/android/quickstep/util/SurfaceTransactionApplier;)V
    .locals 13

    move-object/from16 v1, p3

    move/from16 v2, p4

    move/from16 v3, p5

    move/from16 v4, p6

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/q5$q;->G:Lcom/android/launcher3/q5;

    iput-object p2, p0, Lcom/android/launcher3/q5$q;->q:Landroid/graphics/RectF;

    iput-object v1, p0, Lcom/android/launcher3/q5$q;->r:Landroid/graphics/Rect;

    iput v2, p0, Lcom/android/launcher3/q5$q;->s:F

    iput v3, p0, Lcom/android/launcher3/q5$q;->t:F

    iput v4, p0, Lcom/android/launcher3/q5$q;->u:F

    move/from16 p1, p7

    iput p1, p0, Lcom/android/launcher3/q5$q;->v:F

    move/from16 p1, p8

    iput p1, p0, Lcom/android/launcher3/q5$q;->w:F

    move-object/from16 p1, p9

    iput-object p1, p0, Lcom/android/launcher3/q5$q;->x:Landroid/graphics/Rect;

    move/from16 p1, p10

    iput p1, p0, Lcom/android/launcher3/q5$q;->y:I

    move-object/from16 p1, p11

    iput-object p1, p0, Lcom/android/launcher3/q5$q;->z:Landroid/graphics/RectF;

    move-object/from16 p1, p12

    iput-object p1, p0, Lcom/android/launcher3/q5$q;->A:[I

    move-object/from16 p1, p13

    iput-object p1, p0, Lcom/android/launcher3/q5$q;->B:[Landroid/view/RemoteAnimationTarget;

    move-object/from16 p1, p14

    iput-object p1, p0, Lcom/android/launcher3/q5$q;->C:Landroid/graphics/Matrix;

    move-object/from16 p1, p15

    iput-object p1, p0, Lcom/android/launcher3/q5$q;->D:Landroid/graphics/Point;

    move-object/from16 p1, p16

    iput-object p1, p0, Lcom/android/launcher3/q5$q;->E:Landroid/view/RemoteAnimationTarget;

    move-object/from16 p1, p17

    iput-object p1, p0, Lcom/android/launcher3/q5$q;->F:Lcom/android/quickstep/util/SurfaceTransactionApplier;

    invoke-direct {p0}, Lcom/android/quickstep/util/MultiValueUpdateListener;-><init>()V

    .line 2
    new-instance p1, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    sget-object v5, LJ0/h;->q:Landroid/view/animation/Interpolator;

    sget-wide v6, Lcom/android/launcher3/q5;->V:J

    long-to-float v8, v6

    const/high16 v9, 0x41a00000    # 20.0f

    const/high16 v10, 0x42480000    # 50.0f

    .line 3
    invoke-static {v5, v9, v10, v8}, Lcom/android/quickstep/util/AnimUtils;->clampToDuration(Landroid/view/animation/Interpolator;FFF)Landroid/view/animation/Interpolator;

    move-result-object v8

    const/4 v9, 0x0

    const/high16 v10, 0x3f800000    # 1.0f

    invoke-direct {p1, p0, v9, v10, v8}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    iput-object p1, p0, Lcom/android/launcher3/q5$q;->g:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 4
    new-instance p1, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    iget v8, p2, Landroid/graphics/RectF;->left:F

    iget v11, v1, Landroid/graphics/Rect;->left:I

    int-to-float v11, v11

    sget-object v12, Lcom/android/launcher3/anim/L;->S:Landroid/view/animation/Interpolator;

    invoke-direct {p1, p0, v8, v11, v12}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    iput-object p1, p0, Lcom/android/launcher3/q5$q;->h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 5
    new-instance p1, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    iget v8, p2, Landroid/graphics/RectF;->top:F

    iget v11, v1, Landroid/graphics/Rect;->top:I

    int-to-float v11, v11

    invoke-direct {p1, p0, v8, v11, v12}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    iput-object p1, p0, Lcom/android/launcher3/q5$q;->i:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 6
    new-instance p1, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    iget v8, p2, Landroid/graphics/RectF;->right:F

    iget v11, v1, Landroid/graphics/Rect;->right:I

    int-to-float v11, v11

    invoke-direct {p1, p0, v8, v11, v12}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    iput-object p1, p0, Lcom/android/launcher3/q5$q;->j:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 7
    new-instance p1, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    iget v0, p2, Landroid/graphics/RectF;->bottom:F

    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    int-to-float v1, v1

    invoke-direct {p1, p0, v0, v1, v12}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    iput-object p1, p0, Lcom/android/launcher3/q5$q;->k:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 8
    new-instance p1, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    invoke-direct {p1, p0, v2, v3, v12}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    iput-object p1, p0, Lcom/android/launcher3/q5$q;->l:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 9
    new-instance p1, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    invoke-direct {p1, p0, v9, v4, v12}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    iput-object p1, p0, Lcom/android/launcher3/q5$q;->m:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 10
    new-instance p1, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    sget-object v0, Lcom/android/launcher3/q5;->Y:Landroid/view/animation/Interpolator;

    long-to-float v1, v6

    const/high16 v2, 0x43050000    # 133.0f

    invoke-static {v0, v9, v2, v1}, Lcom/android/quickstep/util/AnimUtils;->clampToDuration(Landroid/view/animation/Interpolator;FFF)Landroid/view/animation/Interpolator;

    move-result-object v0

    invoke-direct {p1, p0, v10, v9, v0}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    iput-object p1, p0, Lcom/android/launcher3/q5$q;->n:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 11
    new-instance p1, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    sget-object v0, Lcom/android/launcher3/q5;->X:Landroid/view/animation/Interpolator;

    sget-wide v3, Lcom/android/launcher3/q5;->W:J

    long-to-float v1, v3

    long-to-float v3, v6

    invoke-static {v0, v1, v2, v3}, Lcom/android/quickstep/util/AnimUtils;->clampToDuration(Landroid/view/animation/Interpolator;FFF)Landroid/view/animation/Interpolator;

    move-result-object v0

    invoke-direct {p1, p0, v9, v10, v0}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    iput-object p1, p0, Lcom/android/launcher3/q5$q;->o:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 12
    new-instance p1, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    const/4 v0, 0x0

    const/high16 v1, 0x41f00000    # 30.0f

    const/4 v2, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    move-object/from16 p3, p0

    move-object p2, p1

    move/from16 p6, v0

    move/from16 p7, v1

    move/from16 p4, v2

    move/from16 p5, v3

    move-object/from16 p8, v5

    invoke-direct/range {p2 .. p8}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFFFLandroid/view/animation/Interpolator;)V

    move-object v0, p2

    iput-object v0, p0, Lcom/android/launcher3/q5$q;->p:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    return-void
.end method


# virtual methods
.method public onUpdate(FZ)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/android/launcher3/q5$q;->j:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 4
    .line 5
    iget v1, v1, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 6
    .line 7
    iget-object v2, v0, Lcom/android/launcher3/q5$q;->h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 8
    .line 9
    iget v2, v2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 10
    .line 11
    sub-float/2addr v1, v2

    .line 12
    iget-object v2, v0, Lcom/android/launcher3/q5$q;->k:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 13
    .line 14
    iget v2, v2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 15
    .line 16
    iget-object v3, v0, Lcom/android/launcher3/q5$q;->i:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 17
    .line 18
    iget v3, v3, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 19
    .line 20
    sub-float/2addr v2, v3

    .line 21
    div-float v3, v2, v1

    .line 22
    .line 23
    const/4 v4, 0x0

    .line 24
    int-to-float v5, v4

    .line 25
    iget v6, v0, Lcom/android/launcher3/q5$q;->v:F

    .line 26
    .line 27
    iget v7, v0, Lcom/android/launcher3/q5$q;->w:F

    .line 28
    .line 29
    cmpg-float v6, v6, v7

    .line 30
    .line 31
    if-gez v6, :cond_0

    .line 32
    .line 33
    iget-object v6, v0, Lcom/android/launcher3/q5$q;->r:Landroid/graphics/Rect;

    .line 34
    .line 35
    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    .line 36
    .line 37
    .line 38
    move-result v6

    .line 39
    int-to-float v6, v6

    .line 40
    goto :goto_0

    .line 41
    :cond_0
    iget-object v6, v0, Lcom/android/launcher3/q5$q;->r:Landroid/graphics/Rect;

    .line 42
    .line 43
    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    .line 44
    .line 45
    .line 46
    move-result v6

    .line 47
    int-to-float v6, v6

    .line 48
    div-float/2addr v6, v3

    .line 49
    :goto_0
    add-float/2addr v6, v5

    .line 50
    float-to-int v6, v6

    .line 51
    iget v7, v0, Lcom/android/launcher3/q5$q;->v:F

    .line 52
    .line 53
    iget v8, v0, Lcom/android/launcher3/q5$q;->w:F

    .line 54
    .line 55
    cmpg-float v7, v7, v8

    .line 56
    .line 57
    if-gez v7, :cond_1

    .line 58
    .line 59
    iget-object v7, v0, Lcom/android/launcher3/q5$q;->r:Landroid/graphics/Rect;

    .line 60
    .line 61
    invoke-virtual {v7}, Landroid/graphics/Rect;->width()I

    .line 62
    .line 63
    .line 64
    move-result v7

    .line 65
    int-to-float v7, v7

    .line 66
    mul-float/2addr v7, v3

    .line 67
    goto :goto_1

    .line 68
    :cond_1
    iget-object v3, v0, Lcom/android/launcher3/q5$q;->r:Landroid/graphics/Rect;

    .line 69
    .line 70
    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    int-to-float v7, v3

    .line 75
    :goto_1
    add-float/2addr v5, v7

    .line 76
    float-to-int v3, v5

    .line 77
    iget-object v5, v0, Lcom/android/launcher3/q5$q;->x:Landroid/graphics/Rect;

    .line 78
    .line 79
    invoke-virtual {v5, v4, v4, v6, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 80
    .line 81
    .line 82
    iget-object v3, v0, Lcom/android/launcher3/q5$q;->x:Landroid/graphics/Rect;

    .line 83
    .line 84
    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    iget-object v5, v0, Lcom/android/launcher3/q5$q;->x:Landroid/graphics/Rect;

    .line 89
    .line 90
    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    .line 91
    .line 92
    .line 93
    move-result v5

    .line 94
    iget v6, v0, Lcom/android/launcher3/q5$q;->y:I

    .line 95
    .line 96
    if-eqz v6, :cond_2

    .line 97
    .line 98
    iget-object v6, v0, Lcom/android/launcher3/q5$q;->x:Landroid/graphics/Rect;

    .line 99
    .line 100
    iget-object v7, v0, Lcom/android/launcher3/q5$q;->G:Lcom/android/launcher3/q5;

    .line 101
    .line 102
    invoke-static {v7}, Lcom/android/launcher3/q5;->o(Lcom/android/launcher3/q5;)Lcom/android/launcher3/h0;

    .line 103
    .line 104
    .line 105
    move-result-object v7

    .line 106
    iget v7, v7, Lcom/android/launcher3/h0;->T0:I

    .line 107
    .line 108
    iget-object v8, v0, Lcom/android/launcher3/q5$q;->G:Lcom/android/launcher3/q5;

    .line 109
    .line 110
    invoke-static {v8}, Lcom/android/launcher3/q5;->o(Lcom/android/launcher3/q5;)Lcom/android/launcher3/h0;

    .line 111
    .line 112
    .line 113
    move-result-object v8

    .line 114
    iget v8, v8, Lcom/android/launcher3/h0;->U0:I

    .line 115
    .line 116
    iget v9, v0, Lcom/android/launcher3/q5$q;->y:I

    .line 117
    .line 118
    invoke-static {v6, v7, v8, v9}, Lcom/android/launcher3/N5;->X(Landroid/graphics/Rect;III)V

    .line 119
    .line 120
    .line 121
    :cond_2
    int-to-float v3, v3

    .line 122
    div-float/2addr v1, v3

    .line 123
    int-to-float v5, v5

    .line 124
    div-float/2addr v2, v5

    .line 125
    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    const/high16 v2, 0x3f800000    # 1.0f

    .line 130
    .line 131
    invoke-static {v2, v1}, Ljava/lang/Math;->min(FF)F

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    mul-float/2addr v3, v1

    .line 136
    mul-float/2addr v5, v1

    .line 137
    iget-object v6, v0, Lcom/android/launcher3/q5$q;->z:Landroid/graphics/RectF;

    .line 138
    .line 139
    iget-object v7, v0, Lcom/android/launcher3/q5$q;->h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 140
    .line 141
    iget v7, v7, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 142
    .line 143
    iget-object v8, v0, Lcom/android/launcher3/q5$q;->i:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 144
    .line 145
    iget v8, v8, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 146
    .line 147
    iget-object v9, v0, Lcom/android/launcher3/q5$q;->j:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 148
    .line 149
    iget v9, v9, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 150
    .line 151
    iget-object v10, v0, Lcom/android/launcher3/q5$q;->k:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 152
    .line 153
    iget v10, v10, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 154
    .line 155
    invoke-virtual {v6, v7, v8, v9, v10}, Landroid/graphics/RectF;->set(FFFF)V

    .line 156
    .line 157
    .line 158
    iget-object v6, v0, Lcom/android/launcher3/q5$q;->z:Landroid/graphics/RectF;

    .line 159
    .line 160
    iget-object v7, v0, Lcom/android/launcher3/q5$q;->A:[I

    .line 161
    .line 162
    aget v8, v7, v4

    .line 163
    .line 164
    int-to-float v8, v8

    .line 165
    const/4 v9, 0x1

    .line 166
    aget v7, v7, v9

    .line 167
    .line 168
    int-to-float v7, v7

    .line 169
    invoke-virtual {v6, v8, v7}, Landroid/graphics/RectF;->offset(FF)V

    .line 170
    .line 171
    .line 172
    iget-object v6, v0, Lcom/android/launcher3/q5$q;->z:Landroid/graphics/RectF;

    .line 173
    .line 174
    iget v7, v6, Landroid/graphics/RectF;->left:F

    .line 175
    .line 176
    iget v6, v6, Landroid/graphics/RectF;->top:F

    .line 177
    .line 178
    if-eqz p2, :cond_3

    .line 179
    .line 180
    return-void

    .line 181
    :cond_3
    new-instance v8, Lcom/android/quickstep/util/SurfaceTransaction;

    .line 182
    .line 183
    invoke-direct {v8}, Lcom/android/quickstep/util/SurfaceTransaction;-><init>()V

    .line 184
    .line 185
    .line 186
    iget-object v10, v0, Lcom/android/launcher3/q5$q;->B:[Landroid/view/RemoteAnimationTarget;

    .line 187
    .line 188
    array-length v10, v10

    .line 189
    sub-int/2addr v10, v9

    .line 190
    :goto_2
    if-ltz v10, :cond_b

    .line 191
    .line 192
    iget-object v11, v0, Lcom/android/launcher3/q5$q;->B:[Landroid/view/RemoteAnimationTarget;

    .line 193
    .line 194
    aget-object v11, v11, v10

    .line 195
    .line 196
    iget-object v12, v11, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 197
    .line 198
    invoke-virtual {v8, v12}, Lcom/android/quickstep/util/SurfaceTransaction;->forSurface(Landroid/view/SurfaceControl;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 199
    .line 200
    .line 201
    move-result-object v12

    .line 202
    iget v13, v11, Landroid/view/RemoteAnimationTarget;->mode:I

    .line 203
    .line 204
    const/4 v14, 0x2

    .line 205
    if-nez v13, :cond_7

    .line 206
    .line 207
    iget-object v11, v0, Lcom/android/launcher3/q5$q;->C:Landroid/graphics/Matrix;

    .line 208
    .line 209
    invoke-virtual {v11, v1, v1}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 210
    .line 211
    .line 212
    iget v11, v0, Lcom/android/launcher3/q5$q;->y:I

    .line 213
    .line 214
    if-ne v11, v9, :cond_4

    .line 215
    .line 216
    iget-object v11, v0, Lcom/android/launcher3/q5$q;->C:Landroid/graphics/Matrix;

    .line 217
    .line 218
    iget-object v13, v0, Lcom/android/launcher3/q5$q;->G:Lcom/android/launcher3/q5;

    .line 219
    .line 220
    invoke-static {v13}, Lcom/android/launcher3/q5;->o(Lcom/android/launcher3/q5;)Lcom/android/launcher3/h0;

    .line 221
    .line 222
    .line 223
    move-result-object v13

    .line 224
    iget v13, v13, Lcom/android/launcher3/h0;->T0:I

    .line 225
    .line 226
    int-to-float v13, v13

    .line 227
    add-float v14, v7, v3

    .line 228
    .line 229
    sub-float/2addr v13, v14

    .line 230
    invoke-virtual {v11, v6, v13}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 231
    .line 232
    .line 233
    goto :goto_3

    .line 234
    :cond_4
    if-ne v11, v14, :cond_5

    .line 235
    .line 236
    iget-object v11, v0, Lcom/android/launcher3/q5$q;->C:Landroid/graphics/Matrix;

    .line 237
    .line 238
    iget-object v13, v0, Lcom/android/launcher3/q5$q;->G:Lcom/android/launcher3/q5;

    .line 239
    .line 240
    invoke-static {v13}, Lcom/android/launcher3/q5;->o(Lcom/android/launcher3/q5;)Lcom/android/launcher3/h0;

    .line 241
    .line 242
    .line 243
    move-result-object v13

    .line 244
    iget v13, v13, Lcom/android/launcher3/h0;->T0:I

    .line 245
    .line 246
    int-to-float v13, v13

    .line 247
    add-float v14, v7, v3

    .line 248
    .line 249
    sub-float/2addr v13, v14

    .line 250
    iget-object v14, v0, Lcom/android/launcher3/q5$q;->G:Lcom/android/launcher3/q5;

    .line 251
    .line 252
    invoke-static {v14}, Lcom/android/launcher3/q5;->o(Lcom/android/launcher3/q5;)Lcom/android/launcher3/h0;

    .line 253
    .line 254
    .line 255
    move-result-object v14

    .line 256
    iget v14, v14, Lcom/android/launcher3/h0;->U0:I

    .line 257
    .line 258
    int-to-float v14, v14

    .line 259
    add-float v15, v6, v5

    .line 260
    .line 261
    sub-float/2addr v14, v15

    .line 262
    invoke-virtual {v11, v13, v14}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 263
    .line 264
    .line 265
    goto :goto_3

    .line 266
    :cond_5
    const/4 v13, 0x3

    .line 267
    if-ne v11, v13, :cond_6

    .line 268
    .line 269
    iget-object v11, v0, Lcom/android/launcher3/q5$q;->C:Landroid/graphics/Matrix;

    .line 270
    .line 271
    iget-object v13, v0, Lcom/android/launcher3/q5$q;->G:Lcom/android/launcher3/q5;

    .line 272
    .line 273
    invoke-static {v13}, Lcom/android/launcher3/q5;->o(Lcom/android/launcher3/q5;)Lcom/android/launcher3/h0;

    .line 274
    .line 275
    .line 276
    move-result-object v13

    .line 277
    iget v13, v13, Lcom/android/launcher3/h0;->U0:I

    .line 278
    .line 279
    int-to-float v13, v13

    .line 280
    add-float v14, v6, v5

    .line 281
    .line 282
    sub-float/2addr v13, v14

    .line 283
    invoke-virtual {v11, v13, v7}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 284
    .line 285
    .line 286
    goto :goto_3

    .line 287
    :cond_6
    iget-object v11, v0, Lcom/android/launcher3/q5$q;->C:Landroid/graphics/Matrix;

    .line 288
    .line 289
    invoke-virtual {v11, v7, v6}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 290
    .line 291
    .line 292
    :goto_3
    iget-object v11, v0, Lcom/android/launcher3/q5$q;->C:Landroid/graphics/Matrix;

    .line 293
    .line 294
    invoke-virtual {v12, v11}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setMatrix(Landroid/graphics/Matrix;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 295
    .line 296
    .line 297
    move-result-object v11

    .line 298
    iget-object v12, v0, Lcom/android/launcher3/q5$q;->x:Landroid/graphics/Rect;

    .line 299
    .line 300
    invoke-virtual {v11, v12}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setWindowCrop(Landroid/graphics/Rect;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 301
    .line 302
    .line 303
    move-result-object v11

    .line 304
    iget-object v12, v0, Lcom/android/launcher3/q5$q;->p:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 305
    .line 306
    iget v12, v12, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 307
    .line 308
    invoke-virtual {v11, v12}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setAlpha(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 309
    .line 310
    .line 311
    move-result-object v11

    .line 312
    iget-object v12, v0, Lcom/android/launcher3/q5$q;->l:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 313
    .line 314
    iget v12, v12, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 315
    .line 316
    invoke-virtual {v11, v12}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setCornerRadius(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 317
    .line 318
    .line 319
    move-result-object v11

    .line 320
    iget-object v12, v0, Lcom/android/launcher3/q5$q;->m:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 321
    .line 322
    iget v12, v12, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 323
    .line 324
    invoke-virtual {v11, v12}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setShadowRadius(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 325
    .line 326
    .line 327
    goto :goto_5

    .line 328
    :cond_7
    if-ne v13, v9, :cond_a

    .line 329
    .line 330
    iget-object v13, v11, Landroid/view/RemoteAnimationTarget;->localBounds:Landroid/graphics/Rect;

    .line 331
    .line 332
    if-eqz v13, :cond_8

    .line 333
    .line 334
    iget-object v15, v0, Lcom/android/launcher3/q5$q;->D:Landroid/graphics/Point;

    .line 335
    .line 336
    move/from16 p1, v14

    .line 337
    .line 338
    iget v14, v13, Landroid/graphics/Rect;->left:I

    .line 339
    .line 340
    iget v13, v13, Landroid/graphics/Rect;->top:I

    .line 341
    .line 342
    invoke-virtual {v15, v14, v13}, Landroid/graphics/Point;->set(II)V

    .line 343
    .line 344
    .line 345
    goto :goto_4

    .line 346
    :cond_8
    move/from16 p1, v14

    .line 347
    .line 348
    iget-object v13, v0, Lcom/android/launcher3/q5$q;->D:Landroid/graphics/Point;

    .line 349
    .line 350
    iget-object v14, v11, Landroid/view/RemoteAnimationTarget;->position:Landroid/graphics/Point;

    .line 351
    .line 352
    iget v15, v14, Landroid/graphics/Point;->x:I

    .line 353
    .line 354
    iget v14, v14, Landroid/graphics/Point;->y:I

    .line 355
    .line 356
    invoke-virtual {v13, v15, v14}, Landroid/graphics/Point;->set(II)V

    .line 357
    .line 358
    .line 359
    :goto_4
    new-instance v13, Landroid/graphics/Rect;

    .line 360
    .line 361
    iget-object v11, v11, Landroid/view/RemoteAnimationTarget;->screenSpaceBounds:Landroid/graphics/Rect;

    .line 362
    .line 363
    invoke-direct {v13, v11}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 364
    .line 365
    .line 366
    invoke-virtual {v13, v4, v4}, Landroid/graphics/Rect;->offsetTo(II)V

    .line 367
    .line 368
    .line 369
    iget v11, v0, Lcom/android/launcher3/q5$q;->y:I

    .line 370
    .line 371
    rem-int/lit8 v11, v11, 0x2

    .line 372
    .line 373
    if-ne v11, v9, :cond_9

    .line 374
    .line 375
    iget v11, v13, Landroid/graphics/Rect;->right:I

    .line 376
    .line 377
    iget v14, v13, Landroid/graphics/Rect;->bottom:I

    .line 378
    .line 379
    iput v14, v13, Landroid/graphics/Rect;->right:I

    .line 380
    .line 381
    iput v11, v13, Landroid/graphics/Rect;->bottom:I

    .line 382
    .line 383
    iget-object v11, v0, Lcom/android/launcher3/q5$q;->D:Landroid/graphics/Point;

    .line 384
    .line 385
    iget v14, v11, Landroid/graphics/Point;->x:I

    .line 386
    .line 387
    iget v15, v11, Landroid/graphics/Point;->y:I

    .line 388
    .line 389
    iput v15, v11, Landroid/graphics/Point;->x:I

    .line 390
    .line 391
    iput v14, v11, Landroid/graphics/Point;->y:I

    .line 392
    .line 393
    :cond_9
    iget-object v11, v0, Lcom/android/launcher3/q5$q;->C:Landroid/graphics/Matrix;

    .line 394
    .line 395
    iget-object v14, v0, Lcom/android/launcher3/q5$q;->D:Landroid/graphics/Point;

    .line 396
    .line 397
    iget v15, v14, Landroid/graphics/Point;->x:I

    .line 398
    .line 399
    int-to-float v15, v15

    .line 400
    iget v14, v14, Landroid/graphics/Point;->y:I

    .line 401
    .line 402
    int-to-float v14, v14

    .line 403
    invoke-virtual {v11, v15, v14}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 404
    .line 405
    .line 406
    iget-object v11, v0, Lcom/android/launcher3/q5$q;->C:Landroid/graphics/Matrix;

    .line 407
    .line 408
    invoke-virtual {v12, v11}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setMatrix(Landroid/graphics/Matrix;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 409
    .line 410
    .line 411
    move-result-object v11

    .line 412
    invoke-virtual {v11, v13}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setWindowCrop(Landroid/graphics/Rect;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 413
    .line 414
    .line 415
    move-result-object v11

    .line 416
    invoke-virtual {v11, v2}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setAlpha(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 417
    .line 418
    .line 419
    :cond_a
    :goto_5
    add-int/lit8 v10, v10, -0x1

    .line 420
    .line 421
    goto/16 :goto_2

    .line 422
    .line 423
    :cond_b
    iget-object v2, v0, Lcom/android/launcher3/q5$q;->E:Landroid/view/RemoteAnimationTarget;

    .line 424
    .line 425
    if-eqz v2, :cond_d

    .line 426
    .line 427
    iget-object v2, v2, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 428
    .line 429
    invoke-virtual {v8, v2}, Lcom/android/quickstep/util/SurfaceTransaction;->forSurface(Landroid/view/SurfaceControl;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 430
    .line 431
    .line 432
    move-result-object v2

    .line 433
    iget-object v3, v0, Lcom/android/launcher3/q5$q;->o:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 434
    .line 435
    iget v4, v3, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 436
    .line 437
    invoke-virtual {v3}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->getStartValue()F

    .line 438
    .line 439
    .line 440
    move-result v3

    .line 441
    cmpl-float v3, v4, v3

    .line 442
    .line 443
    if-lez v3, :cond_c

    .line 444
    .line 445
    iget-object v3, v0, Lcom/android/launcher3/q5$q;->C:Landroid/graphics/Matrix;

    .line 446
    .line 447
    invoke-virtual {v3, v1, v1}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 448
    .line 449
    .line 450
    iget-object v1, v0, Lcom/android/launcher3/q5$q;->C:Landroid/graphics/Matrix;

    .line 451
    .line 452
    invoke-virtual {v1, v7, v6}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 453
    .line 454
    .line 455
    iget-object v1, v0, Lcom/android/launcher3/q5$q;->C:Landroid/graphics/Matrix;

    .line 456
    .line 457
    invoke-virtual {v2, v1}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setMatrix(Landroid/graphics/Matrix;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 458
    .line 459
    .line 460
    move-result-object v1

    .line 461
    iget-object v2, v0, Lcom/android/launcher3/q5$q;->x:Landroid/graphics/Rect;

    .line 462
    .line 463
    invoke-virtual {v1, v2}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setWindowCrop(Landroid/graphics/Rect;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 464
    .line 465
    .line 466
    move-result-object v1

    .line 467
    iget-object v2, v0, Lcom/android/launcher3/q5$q;->o:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 468
    .line 469
    iget v2, v2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 470
    .line 471
    invoke-virtual {v1, v2}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setAlpha(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 472
    .line 473
    .line 474
    goto :goto_6

    .line 475
    :cond_c
    iget-object v1, v0, Lcom/android/launcher3/q5$q;->n:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 476
    .line 477
    iget v1, v1, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 478
    .line 479
    invoke-virtual {v2, v1}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setAlpha(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 480
    .line 481
    .line 482
    :cond_d
    :goto_6
    iget-object v0, v0, Lcom/android/launcher3/q5$q;->F:Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 483
    .line 484
    invoke-virtual {v0, v8}, Lcom/android/quickstep/util/SurfaceTransactionApplier;->scheduleApply(Lcom/android/quickstep/util/SurfaceTransaction;)V

    .line 485
    .line 486
    .line 487
    return-void
.end method
