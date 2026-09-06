.class public final Lcom/android/launcher3/anim/y$a;
.super Lcom/android/quickstep/util/MultiValueUpdateListener;
.source "AppLaunchAnimUtil.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/anim/y;->b([Lu2/s;ZLcom/android/launcher3/C2;FZ)Landroid/animation/ValueAnimator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field private g:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field private h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field final synthetic i:Z

.field final synthetic j:[Lu2/s;

.field final synthetic k:Lkotlin/jvm/internal/A;

.field final synthetic l:Lkotlin/jvm/internal/A;

.field final synthetic m:Z

.field final synthetic n:Z

.field final synthetic o:Landroid/graphics/Matrix;

.field final synthetic p:F

.field final synthetic q:Lcom/android/launcher3/C2;

.field final synthetic r:Landroid/graphics/Point;

.field final synthetic s:Landroid/graphics/Rect;

.field final synthetic t:Lcom/android/quickstep/util/SurfaceTransactionApplier;


# direct methods
.method constructor <init>(ZJLandroid/view/animation/PathInterpolator;[Lu2/s;Lkotlin/jvm/internal/A;Lkotlin/jvm/internal/A;ZZLandroid/graphics/Matrix;FLcom/android/launcher3/C2;Landroid/graphics/Point;Landroid/graphics/Rect;Lcom/android/quickstep/util/SurfaceTransactionApplier;)V
    .locals 3

    iput-boolean p1, p0, Lcom/android/launcher3/anim/y$a;->i:Z

    iput-object p5, p0, Lcom/android/launcher3/anim/y$a;->j:[Lu2/s;

    iput-object p6, p0, Lcom/android/launcher3/anim/y$a;->k:Lkotlin/jvm/internal/A;

    iput-object p7, p0, Lcom/android/launcher3/anim/y$a;->l:Lkotlin/jvm/internal/A;

    iput-boolean p8, p0, Lcom/android/launcher3/anim/y$a;->m:Z

    iput-boolean p9, p0, Lcom/android/launcher3/anim/y$a;->n:Z

    iput-object p10, p0, Lcom/android/launcher3/anim/y$a;->o:Landroid/graphics/Matrix;

    iput p11, p0, Lcom/android/launcher3/anim/y$a;->p:F

    iput-object p12, p0, Lcom/android/launcher3/anim/y$a;->q:Lcom/android/launcher3/C2;

    move-object/from16 p5, p13

    iput-object p5, p0, Lcom/android/launcher3/anim/y$a;->r:Landroid/graphics/Point;

    move-object/from16 p5, p14

    iput-object p5, p0, Lcom/android/launcher3/anim/y$a;->s:Landroid/graphics/Rect;

    move-object/from16 p5, p15

    iput-object p5, p0, Lcom/android/launcher3/anim/y$a;->t:Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/MultiValueUpdateListener;-><init>()V

    if-eqz p1, :cond_0

    .line 2
    new-instance p5, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    const/4 p6, 0x0

    long-to-float v0, p2

    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    move-object p11, p4

    move p9, p6

    move p10, v0

    move p7, v1

    move p8, v2

    move-object p6, p0

    invoke-direct/range {p5 .. p11}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFFFLandroid/view/animation/Interpolator;)V

    move-object p6, p5

    goto :goto_0

    .line 3
    :cond_0
    new-instance p6, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    const/4 p5, 0x0

    long-to-float v0, p2

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    move-object p7, p0

    move-object p12, p4

    move p10, p5

    move p11, v0

    move p8, v1

    move p9, v2

    invoke-direct/range {p6 .. p12}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFFFLandroid/view/animation/Interpolator;)V

    .line 4
    :goto_0
    iput-object p6, p0, Lcom/android/launcher3/anim/y$a;->g:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    if-eqz p1, :cond_1

    .line 5
    new-instance p6, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    const/4 p1, 0x0

    long-to-float p2, p2

    const p3, 0x3f59999a    # 0.85f

    const/high16 v0, 0x3f800000    # 1.0f

    move-object p7, p0

    move p10, p1

    move p11, p2

    move p8, p3

    move-object p12, p4

    move p9, v0

    invoke-direct/range {p6 .. p12}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFFFLandroid/view/animation/Interpolator;)V

    goto :goto_1

    .line 6
    :cond_1
    new-instance p6, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    const/4 p1, 0x0

    long-to-float p2, p2

    const/high16 p3, 0x3f800000    # 1.0f

    const p5, 0x3f59999a    # 0.85f

    move-object p7, p0

    move p10, p1

    move p11, p2

    move p8, p3

    move-object p12, p4

    move p9, p5

    invoke-direct/range {p6 .. p12}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFFFLandroid/view/animation/Interpolator;)V

    .line 7
    :goto_1
    iput-object p6, p0, Lcom/android/launcher3/anim/y$a;->h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    return-void
.end method


# virtual methods
.method public onUpdate(FZ)V
    .locals 12

    .line 1
    new-instance p2, Lcom/android/quickstep/util/SurfaceTransaction;

    .line 2
    .line 3
    invoke-direct {p2}, Lcom/android/quickstep/util/SurfaceTransaction;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/anim/y$a;->j:[Lu2/s;

    .line 7
    .line 8
    array-length v1, v0

    .line 9
    const/4 v2, 0x0

    .line 10
    move v3, v2

    .line 11
    :goto_0
    if-ge v3, v1, :cond_8

    .line 12
    .line 13
    aget-object v4, v0, v3

    .line 14
    .line 15
    iget-object v5, v4, Lu2/s;->h:Landroid/view/SurfaceControl;

    .line 16
    .line 17
    invoke-virtual {p2, v5}, Lcom/android/quickstep/util/SurfaceTransaction;->forSurface(Landroid/view/SurfaceControl;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 18
    .line 19
    .line 20
    move-result-object v5

    .line 21
    const-string v6, "forSurface(...)"

    .line 22
    .line 23
    invoke-static {v5, v6}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget v6, v4, Lu2/s;->m:I

    .line 27
    .line 28
    const/4 v7, 0x0

    .line 29
    if-nez v6, :cond_0

    .line 30
    .line 31
    iget-boolean v8, p0, Lcom/android/launcher3/anim/y$a;->i:Z

    .line 32
    .line 33
    if-nez v8, :cond_1

    .line 34
    .line 35
    :cond_0
    const/4 v8, 0x1

    .line 36
    if-ne v6, v8, :cond_7

    .line 37
    .line 38
    iget-boolean v6, p0, Lcom/android/launcher3/anim/y$a;->i:Z

    .line 39
    .line 40
    if-eqz v6, :cond_1

    .line 41
    .line 42
    goto/16 :goto_4

    .line 43
    .line 44
    :cond_1
    iget-object v6, p0, Lcom/android/launcher3/anim/y$a;->k:Lkotlin/jvm/internal/A;

    .line 45
    .line 46
    iget-object v8, v4, Lu2/s;->r:Landroid/graphics/Rect;

    .line 47
    .line 48
    invoke-virtual {v8}, Landroid/graphics/Rect;->centerX()I

    .line 49
    .line 50
    .line 51
    move-result v8

    .line 52
    int-to-float v8, v8

    .line 53
    iput v8, v6, Lkotlin/jvm/internal/A;->g:F

    .line 54
    .line 55
    iget-object v6, p0, Lcom/android/launcher3/anim/y$a;->l:Lkotlin/jvm/internal/A;

    .line 56
    .line 57
    iget-object v8, v4, Lu2/s;->r:Landroid/graphics/Rect;

    .line 58
    .line 59
    invoke-virtual {v8}, Landroid/graphics/Rect;->centerY()I

    .line 60
    .line 61
    .line 62
    move-result v8

    .line 63
    int-to-float v8, v8

    .line 64
    iput v8, v6, Lkotlin/jvm/internal/A;->g:F

    .line 65
    .line 66
    iget-boolean v6, p0, Lcom/android/launcher3/anim/y$a;->m:Z

    .line 67
    .line 68
    if-eqz v6, :cond_2

    .line 69
    .line 70
    iget-object v8, v4, Lu2/s;->u:Landroid/graphics/Rect;

    .line 71
    .line 72
    if-eqz v8, :cond_2

    .line 73
    .line 74
    iget-object v9, p0, Lcom/android/launcher3/anim/y$a;->k:Lkotlin/jvm/internal/A;

    .line 75
    .line 76
    iget v10, v9, Lkotlin/jvm/internal/A;->g:F

    .line 77
    .line 78
    iget v11, v8, Landroid/graphics/Rect;->left:I

    .line 79
    .line 80
    int-to-float v11, v11

    .line 81
    sub-float/2addr v10, v11

    .line 82
    iput v10, v9, Lkotlin/jvm/internal/A;->g:F

    .line 83
    .line 84
    iget-object v9, p0, Lcom/android/launcher3/anim/y$a;->l:Lkotlin/jvm/internal/A;

    .line 85
    .line 86
    iget v10, v9, Lkotlin/jvm/internal/A;->g:F

    .line 87
    .line 88
    iget v8, v8, Landroid/graphics/Rect;->top:I

    .line 89
    .line 90
    int-to-float v8, v8

    .line 91
    sub-float/2addr v10, v8

    .line 92
    iput v10, v9, Lkotlin/jvm/internal/A;->g:F

    .line 93
    .line 94
    :cond_2
    iget-boolean v8, p0, Lcom/android/launcher3/anim/y$a;->i:Z

    .line 95
    .line 96
    if-nez v8, :cond_4

    .line 97
    .line 98
    if-nez v6, :cond_4

    .line 99
    .line 100
    iget-boolean v6, p0, Lcom/android/launcher3/anim/y$a;->n:Z

    .line 101
    .line 102
    if-nez v6, :cond_3

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_3
    iget-object v6, p0, Lcom/android/launcher3/anim/y$a;->k:Lkotlin/jvm/internal/A;

    .line 106
    .line 107
    iget v6, v6, Lkotlin/jvm/internal/A;->g:F

    .line 108
    .line 109
    iget-object v8, v4, Lu2/s;->r:Landroid/graphics/Rect;

    .line 110
    .line 111
    invoke-virtual {v8}, Landroid/graphics/Rect;->width()I

    .line 112
    .line 113
    .line 114
    move-result v8

    .line 115
    int-to-float v8, v8

    .line 116
    iget-object v9, p0, Lcom/android/launcher3/anim/y$a;->h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 117
    .line 118
    iget v9, v9, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 119
    .line 120
    mul-float/2addr v8, v9

    .line 121
    const/high16 v9, 0x40000000    # 2.0f

    .line 122
    .line 123
    div-float/2addr v8, v9

    .line 124
    sub-float/2addr v6, v8

    .line 125
    iget-object v8, v4, Lu2/s;->r:Landroid/graphics/Rect;

    .line 126
    .line 127
    invoke-virtual {v8}, Landroid/graphics/Rect;->height()I

    .line 128
    .line 129
    .line 130
    move-result v8

    .line 131
    int-to-float v8, v8

    .line 132
    iget-object v10, p0, Lcom/android/launcher3/anim/y$a;->l:Lkotlin/jvm/internal/A;

    .line 133
    .line 134
    iget v10, v10, Lkotlin/jvm/internal/A;->g:F

    .line 135
    .line 136
    iget-object v11, p0, Lcom/android/launcher3/anim/y$a;->h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 137
    .line 138
    iget v11, v11, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 139
    .line 140
    mul-float/2addr v8, v11

    .line 141
    div-float/2addr v8, v9

    .line 142
    sub-float/2addr v10, v8

    .line 143
    iget-object v8, p0, Lcom/android/launcher3/anim/y$a;->o:Landroid/graphics/Matrix;

    .line 144
    .line 145
    invoke-virtual {v8, v11, v11}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 146
    .line 147
    .line 148
    iget-object v8, p0, Lcom/android/launcher3/anim/y$a;->o:Landroid/graphics/Matrix;

    .line 149
    .line 150
    invoke-virtual {v8, v6, v10}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 151
    .line 152
    .line 153
    goto :goto_2

    .line 154
    :cond_4
    :goto_1
    iget-object v6, p0, Lcom/android/launcher3/anim/y$a;->h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 155
    .line 156
    iget v6, v6, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 157
    .line 158
    iget-object v8, p0, Lcom/android/launcher3/anim/y$a;->o:Landroid/graphics/Matrix;

    .line 159
    .line 160
    iget-object v9, p0, Lcom/android/launcher3/anim/y$a;->k:Lkotlin/jvm/internal/A;

    .line 161
    .line 162
    iget v9, v9, Lkotlin/jvm/internal/A;->g:F

    .line 163
    .line 164
    iget-object v10, p0, Lcom/android/launcher3/anim/y$a;->l:Lkotlin/jvm/internal/A;

    .line 165
    .line 166
    iget v10, v10, Lkotlin/jvm/internal/A;->g:F

    .line 167
    .line 168
    invoke-virtual {v8, v6, v6, v9, v10}, Landroid/graphics/Matrix;->setScale(FFFF)V

    .line 169
    .line 170
    .line 171
    :goto_2
    iget v6, p0, Lcom/android/launcher3/anim/y$a;->p:F

    .line 172
    .line 173
    iget-object v8, p0, Lcom/android/launcher3/anim/y$a;->q:Lcom/android/launcher3/C2;

    .line 174
    .line 175
    invoke-virtual {v8}, Landroid/app/Activity;->isInMultiWindowMode()Z

    .line 176
    .line 177
    .line 178
    move-result v8

    .line 179
    if-eqz v8, :cond_6

    .line 180
    .line 181
    iget-boolean v6, p0, Lcom/android/launcher3/anim/y$a;->i:Z

    .line 182
    .line 183
    if-eqz v6, :cond_5

    .line 184
    .line 185
    iget v6, p0, Lcom/android/launcher3/anim/y$a;->p:F

    .line 186
    .line 187
    invoke-static {p1, v6, v7}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 188
    .line 189
    .line 190
    move-result v6

    .line 191
    goto :goto_3

    .line 192
    :cond_5
    iget v6, p0, Lcom/android/launcher3/anim/y$a;->p:F

    .line 193
    .line 194
    invoke-static {p1, v7, v6}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 195
    .line 196
    .line 197
    move-result v6

    .line 198
    :cond_6
    :goto_3
    new-instance v7, Landroid/graphics/Rect;

    .line 199
    .line 200
    iget-object v4, v4, Lu2/s;->r:Landroid/graphics/Rect;

    .line 201
    .line 202
    invoke-direct {v7, v4}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {v7, v2, v2}, Landroid/graphics/Rect;->offsetTo(II)V

    .line 206
    .line 207
    .line 208
    iget-object v4, p0, Lcom/android/launcher3/anim/y$a;->o:Landroid/graphics/Matrix;

    .line 209
    .line 210
    invoke-virtual {v5, v4}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setMatrix(Landroid/graphics/Matrix;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 211
    .line 212
    .line 213
    move-result-object v4

    .line 214
    iget-object v8, p0, Lcom/android/launcher3/anim/y$a;->g:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 215
    .line 216
    iget v8, v8, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 217
    .line 218
    invoke-virtual {v4, v8}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setAlpha(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 219
    .line 220
    .line 221
    invoke-virtual {v5, v6}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setCornerRadius(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 222
    .line 223
    .line 224
    invoke-virtual {v5, v7}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setWindowCrop(Landroid/graphics/Rect;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 225
    .line 226
    .line 227
    goto :goto_5

    .line 228
    :cond_7
    :goto_4
    iget-object v6, v4, Lu2/s;->j:Landroid/graphics/Rect;

    .line 229
    .line 230
    const-string v8, "localBounds"

    .line 231
    .line 232
    invoke-static {v6, v8}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    iget-object v9, p0, Lcom/android/launcher3/anim/y$a;->r:Landroid/graphics/Point;

    .line 236
    .line 237
    iget v10, v6, Landroid/graphics/Rect;->left:I

    .line 238
    .line 239
    iget v6, v6, Landroid/graphics/Rect;->top:I

    .line 240
    .line 241
    invoke-virtual {v9, v10, v6}, Landroid/graphics/Point;->set(II)V

    .line 242
    .line 243
    .line 244
    iget-object v6, p0, Lcom/android/launcher3/anim/y$a;->o:Landroid/graphics/Matrix;

    .line 245
    .line 246
    iget-object v9, p0, Lcom/android/launcher3/anim/y$a;->r:Landroid/graphics/Point;

    .line 247
    .line 248
    iget v10, v9, Landroid/graphics/Point;->x:I

    .line 249
    .line 250
    int-to-float v10, v10

    .line 251
    iget v9, v9, Landroid/graphics/Point;->y:I

    .line 252
    .line 253
    int-to-float v9, v9

    .line 254
    invoke-virtual {v6, v10, v9}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 255
    .line 256
    .line 257
    iget-object v4, v4, Lu2/s;->j:Landroid/graphics/Rect;

    .line 258
    .line 259
    invoke-static {v4, v8}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 260
    .line 261
    .line 262
    iget-object v6, p0, Lcom/android/launcher3/anim/y$a;->s:Landroid/graphics/Rect;

    .line 263
    .line 264
    invoke-virtual {v6, v4}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 265
    .line 266
    .line 267
    iget-object v4, p0, Lcom/android/launcher3/anim/y$a;->o:Landroid/graphics/Matrix;

    .line 268
    .line 269
    invoke-virtual {v5, v4}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setMatrix(Landroid/graphics/Matrix;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 270
    .line 271
    .line 272
    move-result-object v4

    .line 273
    const/high16 v5, 0x3f800000    # 1.0f

    .line 274
    .line 275
    invoke-virtual {v4, v5}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setAlpha(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 276
    .line 277
    .line 278
    move-result-object v4

    .line 279
    invoke-virtual {v4, v7}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setCornerRadius(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 280
    .line 281
    .line 282
    move-result-object v4

    .line 283
    iget-object v5, p0, Lcom/android/launcher3/anim/y$a;->s:Landroid/graphics/Rect;

    .line 284
    .line 285
    invoke-virtual {v4, v5}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setWindowCrop(Landroid/graphics/Rect;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 286
    .line 287
    .line 288
    :goto_5
    add-int/lit8 v3, v3, 0x1

    .line 289
    .line 290
    goto/16 :goto_0

    .line 291
    .line 292
    :cond_8
    iget-object p0, p0, Lcom/android/launcher3/anim/y$a;->t:Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 293
    .line 294
    invoke-virtual {p0, p2}, Lcom/android/quickstep/util/SurfaceTransactionApplier;->scheduleApply(Lcom/android/quickstep/util/SurfaceTransaction;)V

    .line 295
    .line 296
    .line 297
    return-void
.end method
