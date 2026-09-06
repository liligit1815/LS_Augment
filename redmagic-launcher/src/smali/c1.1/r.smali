.class public final Lc1/r;
.super Ljava/lang/Object;
.source "ReorderPreviewAnimation.kt"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lc1/r$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/view/View;",
        ":",
        "Lcom/android/launcher3/G5;",
        ">",
        "Ljava/lang/Object;",
        "Landroid/animation/ValueAnimator$AnimatorUpdateListener;"
    }
.end annotation


# static fields
.field public static final r:Lc1/r$a;


# instance fields
.field private final g:Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private final h:I

.field private final i:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Lcom/android/launcher3/G5;",
            "Lc1/r<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field private j:F

.field private k:F

.field private l:F

.field private m:F

.field private n:F

.field private o:F

.field private final p:I

.field private q:Landroid/animation/ValueAnimator;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lc1/r$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lc1/r$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lc1/r;->r:Lc1/r$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/view/View;IIIIIIIFLcom/android/launcher3/CellLayout;Landroid/util/ArrayMap;)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;IIIIIIIF",
            "Lcom/android/launcher3/CellLayout;",
            "Landroid/util/ArrayMap<",
            "Lcom/android/launcher3/G5;",
            "Lc1/r<",
            "TT;>;>;)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    move-object/from16 v3, p11

    .line 8
    .line 9
    const/4 v4, 0x2

    .line 10
    const-string v5, "child"

    .line 11
    .line 12
    invoke-static {v1, v5}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const-string v5, "cellLayout"

    .line 16
    .line 17
    move-object/from16 v6, p10

    .line 18
    .line 19
    invoke-static {v6, v5}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const-string v5, "shakeAnimators"

    .line 23
    .line 24
    invoke-static {v3, v5}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v1, v0, Lc1/r;->g:Landroid/view/View;

    .line 31
    .line 32
    iput v2, v0, Lc1/r;->h:I

    .line 33
    .line 34
    iput-object v3, v0, Lc1/r;->i:Landroid/util/ArrayMap;

    .line 35
    .line 36
    move-object v3, v1

    .line 37
    check-cast v3, Lcom/android/launcher3/G5;

    .line 38
    .line 39
    invoke-interface {v3}, Lcom/android/launcher3/G5;->getTranslateDelegate()Lcom/android/launcher3/util/z1;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    const/4 v5, 0x0

    .line 44
    invoke-virtual {v3, v5}, Lcom/android/launcher3/util/z1;->a(I)Lcom/android/launcher3/util/v1$c;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-virtual {v3}, Lcom/android/launcher3/util/v1$c;->c()F

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    iput v3, v0, Lc1/r;->l:F

    .line 53
    .line 54
    move-object v3, v1

    .line 55
    check-cast v3, Lcom/android/launcher3/G5;

    .line 56
    .line 57
    invoke-interface {v3}, Lcom/android/launcher3/G5;->getTranslateDelegate()Lcom/android/launcher3/util/z1;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-virtual {v3, v5}, Lcom/android/launcher3/util/z1;->b(I)Lcom/android/launcher3/util/v1$c;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    invoke-virtual {v3}, Lcom/android/launcher3/util/v1$c;->c()F

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    iput v3, v0, Lc1/r;->m:F

    .line 70
    .line 71
    move-object v3, v1

    .line 72
    check-cast v3, Lcom/android/launcher3/G5;

    .line 73
    .line 74
    invoke-interface {v3}, Lcom/android/launcher3/G5;->getReorderBounceScale()F

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    iput v3, v0, Lc1/r;->n:F

    .line 79
    .line 80
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    int-to-float v3, v3

    .line 85
    const/high16 v7, 0x40800000    # 4.0f

    .line 86
    .line 87
    div-float/2addr v7, v3

    .line 88
    iget v3, v0, Lc1/r;->n:F

    .line 89
    .line 90
    mul-float/2addr v7, v3

    .line 91
    const/high16 v3, 0x3f800000    # 1.0f

    .line 92
    .line 93
    sub-float v7, v3, v7

    .line 94
    .line 95
    iput v7, v0, Lc1/r;->o:F

    .line 96
    .line 97
    const/4 v7, -0x1

    .line 98
    const/4 v12, 0x1

    .line 99
    if-nez v2, :cond_0

    .line 100
    .line 101
    move v13, v7

    .line 102
    goto :goto_0

    .line 103
    :cond_0
    move v13, v12

    .line 104
    :goto_0
    iput v13, v0, Lc1/r;->p:I

    .line 105
    .line 106
    new-array v8, v4, [F

    .line 107
    .line 108
    fill-array-data v8, :array_0

    .line 109
    .line 110
    .line 111
    invoke-static {v8}, Landroid/animation/ObjectAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 112
    .line 113
    .line 114
    move-result-object v8

    .line 115
    invoke-virtual {v8, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 116
    .line 117
    .line 118
    if-nez v2, :cond_1

    .line 119
    .line 120
    const/16 v9, 0x28a

    .line 121
    .line 122
    goto :goto_1

    .line 123
    :cond_1
    const/16 v9, 0x12c

    .line 124
    .line 125
    :goto_1
    int-to-long v9, v9

    .line 126
    invoke-virtual {v8, v9, v10}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 127
    .line 128
    .line 129
    invoke-static {}, Ljava/lang/Math;->random()D

    .line 130
    .line 131
    .line 132
    move-result-wide v9

    .line 133
    const/16 v11, 0x3c

    .line 134
    .line 135
    int-to-double v14, v11

    .line 136
    mul-double/2addr v9, v14

    .line 137
    double-to-long v9, v9

    .line 138
    invoke-virtual {v8, v9, v10}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 139
    .line 140
    .line 141
    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    .line 142
    .line 143
    .line 144
    move-result v9

    .line 145
    if-eqz v9, :cond_2

    .line 146
    .line 147
    if-ne v2, v12, :cond_2

    .line 148
    .line 149
    invoke-virtual {v8, v7}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {v8, v4}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    .line 153
    .line 154
    .line 155
    :cond_2
    const-string v2, "also(...)"

    .line 156
    .line 157
    invoke-static {v8, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    iput-object v8, v0, Lc1/r;->q:Landroid/animation/ValueAnimator;

    .line 161
    .line 162
    filled-new-array {v5, v5}, [I

    .line 163
    .line 164
    .line 165
    move-result-object v11

    .line 166
    move/from16 v7, p3

    .line 167
    .line 168
    move/from16 v8, p4

    .line 169
    .line 170
    move/from16 v9, p7

    .line 171
    .line 172
    move/from16 v10, p8

    .line 173
    .line 174
    invoke-virtual/range {v6 .. v11}, Lcom/android/launcher3/CellLayout;->p0(IIII[I)V

    .line 175
    .line 176
    .line 177
    aget v2, v11, v5

    .line 178
    .line 179
    aget v4, v11, v12

    .line 180
    .line 181
    move/from16 v7, p5

    .line 182
    .line 183
    move/from16 v8, p6

    .line 184
    .line 185
    move-object/from16 v6, p10

    .line 186
    .line 187
    invoke-virtual/range {v6 .. v11}, Lcom/android/launcher3/CellLayout;->p0(IIII[I)V

    .line 188
    .line 189
    .line 190
    aget v5, v11, v5

    .line 191
    .line 192
    aget v6, v11, v12

    .line 193
    .line 194
    sub-int/2addr v5, v2

    .line 195
    sub-int/2addr v6, v4

    .line 196
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 197
    .line 198
    .line 199
    move-result v2

    .line 200
    if-nez v2, :cond_3

    .line 201
    .line 202
    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    move-result-object v1

    .line 206
    new-instance v2, Ljava/lang/StringBuilder;

    .line 207
    .line 208
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 209
    .line 210
    .line 211
    const-string v4, "ReorderPreviewAnimation: width error: "

    .line 212
    .line 213
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 217
    .line 218
    .line 219
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object v1

    .line 223
    const-string v2, "ReorderPreviewAnimation"

    .line 224
    .line 225
    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 226
    .line 227
    .line 228
    iput v3, v0, Lc1/r;->o:F

    .line 229
    .line 230
    :cond_3
    if-nez v5, :cond_5

    .line 231
    .line 232
    if-eqz v6, :cond_4

    .line 233
    .line 234
    goto :goto_2

    .line 235
    :cond_4
    return-void

    .line 236
    :cond_5
    :goto_2
    if-nez v6, :cond_6

    .line 237
    .line 238
    neg-int v1, v13

    .line 239
    int-to-float v1, v1

    .line 240
    int-to-float v2, v5

    .line 241
    invoke-static {v2}, Ljava/lang/Math;->signum(F)F

    .line 242
    .line 243
    .line 244
    move-result v2

    .line 245
    mul-float/2addr v1, v2

    .line 246
    mul-float v1, v1, p9

    .line 247
    .line 248
    iput v1, v0, Lc1/r;->j:F

    .line 249
    .line 250
    return-void

    .line 251
    :cond_6
    if-nez v5, :cond_7

    .line 252
    .line 253
    neg-int v1, v13

    .line 254
    int-to-float v1, v1

    .line 255
    int-to-float v2, v6

    .line 256
    invoke-static {v2}, Ljava/lang/Math;->signum(F)F

    .line 257
    .line 258
    .line 259
    move-result v2

    .line 260
    mul-float/2addr v1, v2

    .line 261
    mul-float v1, v1, p9

    .line 262
    .line 263
    iput v1, v0, Lc1/r;->k:F

    .line 264
    .line 265
    return-void

    .line 266
    :cond_7
    int-to-float v1, v6

    .line 267
    int-to-float v2, v5

    .line 268
    div-float v3, v1, v2

    .line 269
    .line 270
    float-to-double v3, v3

    .line 271
    invoke-static {v3, v4}, Ljava/lang/Math;->atan(D)D

    .line 272
    .line 273
    .line 274
    move-result-wide v3

    .line 275
    double-to-float v3, v3

    .line 276
    neg-int v4, v13

    .line 277
    int-to-float v4, v4

    .line 278
    invoke-static {v2}, Ljava/lang/Math;->signum(F)F

    .line 279
    .line 280
    .line 281
    move-result v2

    .line 282
    mul-float/2addr v4, v2

    .line 283
    float-to-double v2, v3

    .line 284
    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    .line 285
    .line 286
    .line 287
    move-result-wide v5

    .line 288
    double-to-float v5, v5

    .line 289
    mul-float v5, v5, p9

    .line 290
    .line 291
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    .line 292
    .line 293
    .line 294
    move-result v5

    .line 295
    mul-float/2addr v4, v5

    .line 296
    iput v4, v0, Lc1/r;->j:F

    .line 297
    .line 298
    neg-int v4, v13

    .line 299
    int-to-float v4, v4

    .line 300
    invoke-static {v1}, Ljava/lang/Math;->signum(F)F

    .line 301
    .line 302
    .line 303
    move-result v1

    .line 304
    mul-float/2addr v4, v1

    .line 305
    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    .line 306
    .line 307
    .line 308
    move-result-wide v1

    .line 309
    double-to-float v1, v1

    .line 310
    mul-float v1, v1, p9

    .line 311
    .line 312
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 313
    .line 314
    .line 315
    move-result v1

    .line 316
    mul-float/2addr v4, v1

    .line 317
    iput v4, v0, Lc1/r;->k:F

    .line 318
    .line 319
    return-void

    .line 320
    nop

    .line 321
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private final b()V
    .locals 0

    .line 1
    iget-object p0, p0, Lc1/r;->q:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private final e()V
    .locals 1

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    iput v0, p0, Lc1/r;->n:F

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput v0, p0, Lc1/r;->l:F

    .line 7
    .line 8
    iput v0, p0, Lc1/r;->m:F

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 3

    .line 1
    iget v0, p0, Lc1/r;->j:F

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    cmpg-float v0, v0, v1

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iget v0, p0, Lc1/r;->k:F

    .line 9
    .line 10
    cmpg-float v0, v0, v1

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    :goto_0
    iget-object v1, p0, Lc1/r;->i:Landroid/util/ArrayMap;

    .line 18
    .line 19
    iget-object v2, p0, Lc1/r;->g:Landroid/view/View;

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroid/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_2

    .line 26
    .line 27
    iget-object v1, p0, Lc1/r;->i:Landroid/util/ArrayMap;

    .line 28
    .line 29
    iget-object v2, p0, Lc1/r;->g:Landroid/view/View;

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Lc1/r;

    .line 36
    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1}, Lc1/r;->c()V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    invoke-direct {v1}, Lc1/r;->b()V

    .line 50
    .line 51
    .line 52
    :cond_2
    if-eqz v0, :cond_3

    .line 53
    .line 54
    return-void

    .line 55
    :cond_3
    iget-object v0, p0, Lc1/r;->i:Landroid/util/ArrayMap;

    .line 56
    .line 57
    iget-object v1, p0, Lc1/r;->g:Landroid/view/View;

    .line 58
    .line 59
    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Lc1/r;->q:Landroid/animation/ValueAnimator;

    .line 63
    .line 64
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public final c()V
    .locals 3

    .line 1
    iget-object v0, p0, Lc1/r;->q:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lc1/r;->e()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lc1/r;->d()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lc1/r;->q:Landroid/animation/ValueAnimator;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "null cannot be cast to non-null type kotlin.Float"

    .line 19
    .line 20
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    check-cast v0, Ljava/lang/Float;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const/4 v1, 0x2

    .line 30
    new-array v1, v1, [F

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    aput v0, v1, v2

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    const/4 v2, 0x1

    .line 37
    aput v0, v1, v2

    .line 38
    .line 39
    invoke-static {v1}, Landroid/animation/ObjectAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iput-object v0, p0, Lc1/r;->q:Landroid/animation/ValueAnimator;

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lc1/r;->q:Landroid/animation/ValueAnimator;

    .line 49
    .line 50
    sget-object v1, LJ0/h;->J:Landroid/view/animation/Interpolator;

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lc1/r;->q:Landroid/animation/ValueAnimator;

    .line 56
    .line 57
    const-wide/16 v1, 0x96

    .line 58
    .line 59
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Lc1/r;->q:Landroid/animation/ValueAnimator;

    .line 63
    .line 64
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public final d()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lc1/r;->j:F

    .line 3
    .line 4
    iput v0, p0, Lc1/r;->k:F

    .line 5
    .line 6
    return-void
.end method

.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 5

    .line 1
    const-string v0, "updatedAnimation"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const-string v0, "null cannot be cast to non-null type kotlin.Float"

    .line 11
    .line 12
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    check-cast p1, Ljava/lang/Float;

    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iget-object v0, p0, Lc1/r;->g:Landroid/view/View;

    .line 22
    .line 23
    check-cast v0, Lcom/android/launcher3/G5;

    .line 24
    .line 25
    invoke-interface {v0}, Lcom/android/launcher3/G5;->getTranslateDelegate()Lcom/android/launcher3/util/z1;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget v1, p0, Lc1/r;->j:F

    .line 30
    .line 31
    mul-float/2addr v1, p1

    .line 32
    const/4 v2, 0x1

    .line 33
    int-to-float v2, v2

    .line 34
    sub-float/2addr v2, p1

    .line 35
    iget v3, p0, Lc1/r;->l:F

    .line 36
    .line 37
    mul-float/2addr v3, v2

    .line 38
    add-float/2addr v1, v3

    .line 39
    iget v3, p0, Lc1/r;->k:F

    .line 40
    .line 41
    mul-float/2addr v3, p1

    .line 42
    iget v4, p0, Lc1/r;->m:F

    .line 43
    .line 44
    mul-float/2addr v4, v2

    .line 45
    add-float/2addr v3, v4

    .line 46
    const/4 v4, 0x0

    .line 47
    invoke-virtual {v0, v4, v1, v3}, Lcom/android/launcher3/util/z1;->c(IFF)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lc1/r;->g:Landroid/view/View;

    .line 51
    .line 52
    check-cast v0, Lcom/android/launcher3/G5;

    .line 53
    .line 54
    iget v1, p0, Lc1/r;->o:F

    .line 55
    .line 56
    mul-float/2addr p1, v1

    .line 57
    iget p0, p0, Lc1/r;->n:F

    .line 58
    .line 59
    mul-float/2addr v2, p0

    .line 60
    add-float/2addr p1, v2

    .line 61
    invoke-interface {v0, p1}, Lcom/android/launcher3/G5;->setReorderBounceScale(F)V

    .line 62
    .line 63
    .line 64
    return-void
.end method
