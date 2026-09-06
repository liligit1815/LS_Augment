.class Lcom/android/launcher3/anim/P$c;
.super Ljava/lang/Object;
.source "MFVLauncherAppTransitionHelper.java"

# interfaces
.implements Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$OnAnimUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/anim/P;->p([Lu2/s;[Lu2/s;[Lu2/s;Landroid/graphics/RectF;Landroid/view/View;Lcom/android/quickstep/util/animation/MultiAnimatorSet;Lcom/android/launcher3/M2$a;Landroid/graphics/RectF;F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Z

.field final synthetic b:F

.field final synthetic c:Ljava/util/concurrent/atomic/AtomicBoolean;

.field final synthetic d:Landroid/graphics/Matrix;

.field final synthetic e:Landroid/graphics/RectF;

.field final synthetic f:Lcom/android/quickstep/utils/CreateTransactionHelper;

.field final synthetic g:Z

.field final synthetic h:Lcom/android/quickstep/util/animation/RectTransformHelper;

.field final synthetic i:Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;

.field final synthetic j:Landroid/graphics/RectF;

.field final synthetic k:[Lu2/s;

.field final synthetic l:Lcom/android/launcher3/M2$a;

.field final synthetic m:Landroid/graphics/RectF;

.field final synthetic n:Lcom/android/launcher3/views/FloatingIconView;

.field final synthetic o:Lcom/android/quickstep/views/FloatingWidgetView;

.field final synthetic p:F

.field final synthetic q:Landroid/view/View;

.field final synthetic r:Lcom/android/launcher3/anim/P;


# direct methods
.method constructor <init>(Lcom/android/launcher3/anim/P;ZFLjava/util/concurrent/atomic/AtomicBoolean;Landroid/graphics/Matrix;Landroid/graphics/RectF;Lcom/android/quickstep/utils/CreateTransactionHelper;ZLcom/android/quickstep/util/animation/RectTransformHelper;Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;Landroid/graphics/RectF;[Lu2/s;Lcom/android/launcher3/M2$a;Landroid/graphics/RectF;Lcom/android/launcher3/views/FloatingIconView;Lcom/android/quickstep/views/FloatingWidgetView;FLandroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/anim/P$c;->r:Lcom/android/launcher3/anim/P;

    iput-boolean p2, p0, Lcom/android/launcher3/anim/P$c;->a:Z

    iput p3, p0, Lcom/android/launcher3/anim/P$c;->b:F

    iput-object p4, p0, Lcom/android/launcher3/anim/P$c;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-object p5, p0, Lcom/android/launcher3/anim/P$c;->d:Landroid/graphics/Matrix;

    iput-object p6, p0, Lcom/android/launcher3/anim/P$c;->e:Landroid/graphics/RectF;

    iput-object p7, p0, Lcom/android/launcher3/anim/P$c;->f:Lcom/android/quickstep/utils/CreateTransactionHelper;

    iput-boolean p8, p0, Lcom/android/launcher3/anim/P$c;->g:Z

    iput-object p9, p0, Lcom/android/launcher3/anim/P$c;->h:Lcom/android/quickstep/util/animation/RectTransformHelper;

    iput-object p10, p0, Lcom/android/launcher3/anim/P$c;->i:Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;

    iput-object p11, p0, Lcom/android/launcher3/anim/P$c;->j:Landroid/graphics/RectF;

    iput-object p12, p0, Lcom/android/launcher3/anim/P$c;->k:[Lu2/s;

    iput-object p13, p0, Lcom/android/launcher3/anim/P$c;->l:Lcom/android/launcher3/M2$a;

    iput-object p14, p0, Lcom/android/launcher3/anim/P$c;->m:Landroid/graphics/RectF;

    iput-object p15, p0, Lcom/android/launcher3/anim/P$c;->n:Lcom/android/launcher3/views/FloatingIconView;

    move-object/from16 p1, p16

    iput-object p1, p0, Lcom/android/launcher3/anim/P$c;->o:Lcom/android/quickstep/views/FloatingWidgetView;

    move/from16 p1, p17

    iput p1, p0, Lcom/android/launcher3/anim/P$c;->p:F

    move-object/from16 p1, p18

    iput-object p1, p0, Lcom/android/launcher3/anim/P$c;->q:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic a(Ljava/util/concurrent/atomic/AtomicBoolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/anim/P;->q(Ljava/util/concurrent/atomic/AtomicBoolean;)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method


# virtual methods
.method public onUpdate(Landroid/graphics/RectF;FFFF)V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    iget-boolean v1, v0, Lcom/android/launcher3/anim/P$c;->a:Z

    .line 6
    .line 7
    const/4 v11, 0x0

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    move v1, v11

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget v1, v0, Lcom/android/launcher3/anim/P$c;->b:F

    .line 13
    .line 14
    iget-object v3, v0, Lcom/android/launcher3/anim/P$c;->r:Lcom/android/launcher3/anim/P;

    .line 15
    .line 16
    invoke-static {v3}, Lcom/android/launcher3/anim/P;->k(Lcom/android/launcher3/anim/P;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getScrollX()I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    int-to-float v3, v3

    .line 29
    sub-float/2addr v1, v3

    .line 30
    iget-object v3, v0, Lcom/android/launcher3/anim/P$c;->r:Lcom/android/launcher3/anim/P;

    .line 31
    .line 32
    invoke-static {v3}, Lcom/android/launcher3/anim/P;->k(Lcom/android/launcher3/anim/P;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getTranslationX()F

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    add-float/2addr v1, v3

    .line 45
    :goto_0
    invoke-virtual {v2, v1, v11}, Landroid/graphics/RectF;->offset(FF)V

    .line 46
    .line 47
    .line 48
    const-string v1, "curRectF"

    .line 49
    .line 50
    invoke-static {v2, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    const v1, 0x3f19999a    # 0.6f

    .line 54
    .line 55
    .line 56
    cmpl-float v1, p2, v1

    .line 57
    .line 58
    const/4 v3, 0x1

    .line 59
    if-lez v1, :cond_1

    .line 60
    .line 61
    iget-object v4, v0, Lcom/android/launcher3/anim/P$c;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 62
    .line 63
    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    if-nez v4, :cond_1

    .line 68
    .line 69
    iget-object v4, v0, Lcom/android/launcher3/anim/P$c;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 70
    .line 71
    invoke-virtual {v4, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 72
    .line 73
    .line 74
    :cond_1
    iget-object v4, v0, Lcom/android/launcher3/anim/P$c;->d:Landroid/graphics/Matrix;

    .line 75
    .line 76
    iget-object v5, v0, Lcom/android/launcher3/anim/P$c;->e:Landroid/graphics/RectF;

    .line 77
    .line 78
    invoke-virtual {v4, v5, v2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    .line 79
    .line 80
    .line 81
    iget-object v4, v0, Lcom/android/launcher3/anim/P$c;->f:Lcom/android/quickstep/utils/CreateTransactionHelper;

    .line 82
    .line 83
    invoke-virtual {v4}, Lcom/android/quickstep/utils/CreateTransactionHelper;->createSurfaceTransaction()Lcom/android/quickstep/util/SurfaceTransaction;

    .line 84
    .line 85
    .line 86
    move-result-object v16

    .line 87
    iget-boolean v4, v0, Lcom/android/launcher3/anim/P$c;->g:Z

    .line 88
    .line 89
    const/4 v5, 0x0

    .line 90
    if-eqz v4, :cond_2

    .line 91
    .line 92
    move/from16 v4, p5

    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_2
    iget-object v4, v0, Lcom/android/launcher3/anim/P$c;->h:Lcom/android/quickstep/util/animation/RectTransformHelper;

    .line 96
    .line 97
    iget-object v6, v0, Lcom/android/launcher3/anim/P$c;->i:Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;

    .line 98
    .line 99
    iget-object v7, v0, Lcom/android/launcher3/anim/P$c;->e:Landroid/graphics/RectF;

    .line 100
    .line 101
    iget-object v8, v0, Lcom/android/launcher3/anim/P$c;->j:Landroid/graphics/RectF;

    .line 102
    .line 103
    invoke-virtual {v4, v6, v7, v8, v5}, Lcom/android/quickstep/util/animation/RectTransformHelper;->calculateWindowAlpha(Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;Landroid/graphics/RectF;Landroid/graphics/RectF;Z)F

    .line 104
    .line 105
    .line 106
    move-result v4

    .line 107
    :goto_1
    iget-object v6, v0, Lcom/android/launcher3/anim/P$c;->h:Lcom/android/quickstep/util/animation/RectTransformHelper;

    .line 108
    .line 109
    iget-object v7, v0, Lcom/android/launcher3/anim/P$c;->i:Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;

    .line 110
    .line 111
    iget-object v8, v0, Lcom/android/launcher3/anim/P$c;->e:Landroid/graphics/RectF;

    .line 112
    .line 113
    invoke-virtual {v6, v7, v8}, Lcom/android/quickstep/util/animation/RectTransformHelper;->calculateWindowScale(Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;Landroid/graphics/RectF;)F

    .line 114
    .line 115
    .line 116
    move-result v6

    .line 117
    cmpl-float v7, v6, v11

    .line 118
    .line 119
    if-lez v7, :cond_3

    .line 120
    .line 121
    div-float v7, p4, v6

    .line 122
    .line 123
    goto :goto_2

    .line 124
    :cond_3
    move/from16 v7, p4

    .line 125
    .line 126
    :goto_2
    iget-object v8, v0, Lcom/android/launcher3/anim/P$c;->i:Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;

    .line 127
    .line 128
    invoke-virtual {v8, v5}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->setWorkspaceScrollOffset(I)V

    .line 129
    .line 130
    .line 131
    iget-object v8, v0, Lcom/android/launcher3/anim/P$c;->i:Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;

    .line 132
    .line 133
    invoke-virtual {v8, v4}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->setAlpha(F)V

    .line 134
    .line 135
    .line 136
    iget-object v8, v0, Lcom/android/launcher3/anim/P$c;->i:Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;

    .line 137
    .line 138
    invoke-virtual {v8, v6}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->setScale(F)V

    .line 139
    .line 140
    .line 141
    iget-object v6, v0, Lcom/android/launcher3/anim/P$c;->i:Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;

    .line 142
    .line 143
    invoke-virtual {v6, v7}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->setRadius(F)V

    .line 144
    .line 145
    .line 146
    iget-object v6, v0, Lcom/android/launcher3/anim/P$c;->i:Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;

    .line 147
    .line 148
    iget-object v7, v0, Lcom/android/launcher3/anim/P$c;->e:Landroid/graphics/RectF;

    .line 149
    .line 150
    iget v7, v7, Landroid/graphics/RectF;->left:F

    .line 151
    .line 152
    int-to-float v8, v5

    .line 153
    add-float/2addr v7, v8

    .line 154
    invoke-virtual {v6, v7}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->setX(F)V

    .line 155
    .line 156
    .line 157
    iget-object v6, v0, Lcom/android/launcher3/anim/P$c;->i:Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;

    .line 158
    .line 159
    iget-object v7, v0, Lcom/android/launcher3/anim/P$c;->e:Landroid/graphics/RectF;

    .line 160
    .line 161
    iget v7, v7, Landroid/graphics/RectF;->top:F

    .line 162
    .line 163
    invoke-virtual {v6, v7}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->setY(F)V

    .line 164
    .line 165
    .line 166
    iget-object v6, v0, Lcom/android/launcher3/anim/P$c;->i:Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;

    .line 167
    .line 168
    move/from16 v7, p3

    .line 169
    .line 170
    invoke-virtual {v6, v7}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->setRadio(F)V

    .line 171
    .line 172
    .line 173
    iget-object v12, v0, Lcom/android/launcher3/anim/P$c;->h:Lcom/android/quickstep/util/animation/RectTransformHelper;

    .line 174
    .line 175
    iget-object v13, v0, Lcom/android/launcher3/anim/P$c;->i:Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;

    .line 176
    .line 177
    iget-object v14, v0, Lcom/android/launcher3/anim/P$c;->k:[Lu2/s;

    .line 178
    .line 179
    iget-object v6, v0, Lcom/android/launcher3/anim/P$c;->l:Lcom/android/launcher3/M2$a;

    .line 180
    .line 181
    if-eqz v6, :cond_4

    .line 182
    .line 183
    invoke-virtual {v6}, Lcom/android/launcher3/M2$a;->r2()Lu2/s$a;

    .line 184
    .line 185
    .line 186
    move-result-object v6

    .line 187
    :goto_3
    move-object/from16 v17, v6

    .line 188
    .line 189
    goto :goto_4

    .line 190
    :cond_4
    const/4 v6, 0x0

    .line 191
    goto :goto_3

    .line 192
    :goto_4
    iget-object v6, v0, Lcom/android/launcher3/anim/P$c;->e:Landroid/graphics/RectF;

    .line 193
    .line 194
    const/16 v19, 0x1

    .line 195
    .line 196
    const/4 v15, 0x1

    .line 197
    move-object/from16 v18, v6

    .line 198
    .line 199
    invoke-virtual/range {v12 .. v19}, Lcom/android/quickstep/util/animation/RectTransformHelper;->applySurfaceParams(Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;[Lu2/s;ILcom/android/quickstep/util/SurfaceTransaction;Lu2/s$a;Landroid/graphics/RectF;Z)V

    .line 200
    .line 201
    .line 202
    iget-object v6, v0, Lcom/android/launcher3/anim/P$c;->m:Landroid/graphics/RectF;

    .line 203
    .line 204
    invoke-virtual {v6, v2}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 205
    .line 206
    .line 207
    iget-object v6, v0, Lcom/android/launcher3/anim/P$c;->h:Lcom/android/quickstep/util/animation/RectTransformHelper;

    .line 208
    .line 209
    invoke-virtual {v6}, Lcom/android/quickstep/util/animation/RectTransformHelper;->getMClipRect()Landroid/graphics/Rect;

    .line 210
    .line 211
    .line 212
    iget-object v6, v0, Lcom/android/launcher3/anim/P$c;->m:Landroid/graphics/RectF;

    .line 213
    .line 214
    invoke-virtual {v6}, Landroid/graphics/RectF;->height()F

    .line 215
    .line 216
    .line 217
    if-lez v1, :cond_5

    .line 218
    .line 219
    iget-object v1, v0, Lcom/android/launcher3/anim/P$c;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 220
    .line 221
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 222
    .line 223
    .line 224
    move-result v1

    .line 225
    if-nez v1, :cond_5

    .line 226
    .line 227
    iget-object v1, v0, Lcom/android/launcher3/anim/P$c;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 228
    .line 229
    invoke-virtual {v1, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 230
    .line 231
    .line 232
    :cond_5
    const/high16 v12, 0x3f800000    # 1.0f

    .line 233
    .line 234
    sub-float v1, v12, v4

    .line 235
    .line 236
    cmpl-float v1, v1, v11

    .line 237
    .line 238
    if-lez v1, :cond_6

    .line 239
    .line 240
    move v3, v12

    .line 241
    goto :goto_5

    .line 242
    :cond_6
    move v3, v11

    .line 243
    :goto_5
    iget-object v1, v0, Lcom/android/launcher3/anim/P$c;->n:Lcom/android/launcher3/views/FloatingIconView;

    .line 244
    .line 245
    if-eqz v1, :cond_7

    .line 246
    .line 247
    iget-object v4, v0, Lcom/android/launcher3/anim/P$c;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 248
    .line 249
    new-instance v9, Lcom/android/launcher3/anim/Q;

    .line 250
    .line 251
    invoke-direct {v9, v4}, Lcom/android/launcher3/anim/Q;-><init>(Ljava/util/concurrent/atomic/AtomicBoolean;)V

    .line 252
    .line 253
    .line 254
    const/4 v10, 0x1

    .line 255
    move v4, v5

    .line 256
    const v5, 0x3ecccccd    # 0.4f

    .line 257
    .line 258
    .line 259
    const/4 v7, 0x0

    .line 260
    const/4 v8, 0x0

    .line 261
    move/from16 v6, p4

    .line 262
    .line 263
    move v13, v4

    .line 264
    move/from16 v4, p2

    .line 265
    .line 266
    invoke-virtual/range {v1 .. v10}, Lcom/android/launcher3/views/FloatingIconView;->P(Landroid/graphics/RectF;FFFFZLjava/util/function/Supplier;Ljava/util/function/Supplier;Z)V

    .line 267
    .line 268
    .line 269
    move v7, v6

    .line 270
    goto :goto_6

    .line 271
    :cond_7
    move/from16 v7, p4

    .line 272
    .line 273
    move v13, v5

    .line 274
    :goto_6
    iget-object v1, v0, Lcom/android/launcher3/anim/P$c;->o:Lcom/android/quickstep/views/FloatingWidgetView;

    .line 275
    .line 276
    if-eqz v1, :cond_a

    .line 277
    .line 278
    invoke-static {}, Lx1/O;->Y2()Z

    .line 279
    .line 280
    .line 281
    move-result v1

    .line 282
    if-nez v1, :cond_8

    .line 283
    .line 284
    move v2, v11

    .line 285
    goto :goto_7

    .line 286
    :cond_8
    const v1, 0x3f4ccccd    # 0.8f

    .line 287
    .line 288
    .line 289
    move v2, v1

    .line 290
    :goto_7
    sget-object v6, LJ0/h;->e:Landroid/view/animation/Interpolator;

    .line 291
    .line 292
    const/high16 v3, 0x3f800000    # 1.0f

    .line 293
    .line 294
    const/4 v4, 0x0

    .line 295
    const/high16 v5, 0x3f800000    # 1.0f

    .line 296
    .line 297
    move/from16 v1, p2

    .line 298
    .line 299
    invoke-static/range {v1 .. v6}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 300
    .line 301
    .line 302
    move-result v2

    .line 303
    sub-float/2addr v12, v2

    .line 304
    const/4 v2, 0x0

    .line 305
    const/high16 v3, 0x3f000000    # 0.5f

    .line 306
    .line 307
    invoke-static/range {v1 .. v6}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 308
    .line 309
    .line 310
    move-result v4

    .line 311
    iget-object v1, v0, Lcom/android/launcher3/anim/P$c;->o:Lcom/android/quickstep/views/FloatingWidgetView;

    .line 312
    .line 313
    invoke-virtual {v1, v7}, Lcom/android/quickstep/views/FloatingWidgetView;->setCornerRadius(F)V

    .line 314
    .line 315
    .line 316
    iget-object v1, v0, Lcom/android/launcher3/anim/P$c;->o:Lcom/android/quickstep/views/FloatingWidgetView;

    .line 317
    .line 318
    iget v3, v0, Lcom/android/launcher3/anim/P$c;->p:F

    .line 319
    .line 320
    sget v2, Lcom/android/launcher3/anim/C;->W:F

    .line 321
    .line 322
    cmpl-float v2, p2, v2

    .line 323
    .line 324
    if-lez v2, :cond_9

    .line 325
    .line 326
    move v5, v12

    .line 327
    :goto_8
    move-object/from16 v2, p1

    .line 328
    .line 329
    move v6, v7

    .line 330
    goto :goto_9

    .line 331
    :cond_9
    move v5, v11

    .line 332
    goto :goto_8

    .line 333
    :goto_9
    invoke-virtual/range {v1 .. v6}, Lcom/android/quickstep/views/FloatingWidgetView;->update(Landroid/graphics/RectF;FFFF)V

    .line 334
    .line 335
    .line 336
    iget-object v1, v0, Lcom/android/launcher3/anim/P$c;->q:Landroid/view/View;

    .line 337
    .line 338
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    .line 339
    .line 340
    .line 341
    move-result v1

    .line 342
    if-nez v1, :cond_a

    .line 343
    .line 344
    iget-object v0, v0, Lcom/android/launcher3/anim/P$c;->o:Lcom/android/quickstep/views/FloatingWidgetView;

    .line 345
    .line 346
    invoke-virtual {v0, v13}, Lcom/android/quickstep/views/FloatingWidgetView;->setForegroundOverlayViewVisibility(I)V

    .line 347
    .line 348
    .line 349
    :cond_a
    return-void
.end method
