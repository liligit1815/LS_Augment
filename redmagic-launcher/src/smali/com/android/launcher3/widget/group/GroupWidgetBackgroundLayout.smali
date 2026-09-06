.class public Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;
.super Landroid/widget/LinearLayout;
.source "GroupWidgetBackgroundLayout.java"

# interfaces
.implements Lcom/android/launcher3/blur/c;


# static fields
.field private static final p:Landroid/view/animation/PathInterpolator;


# instance fields
.field private g:Lcom/android/launcher3/blur/a;

.field private h:Landroid/widget/ImageView;

.field private i:I

.field private j:I

.field private k:Landroid/animation/Animator;

.field private l:Z

.field private m:J

.field private n:I

.field private o:Z


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    const v2, 0x3f2e147b    # 0.68f

    .line 6
    .line 7
    .line 8
    const v3, 0x3ea8f5c3    # 0.33f

    .line 9
    .line 10
    .line 11
    invoke-direct {v0, v3, v1, v2, v1}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->p:Landroid/view/animation/PathInterpolator;

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, 0x0

    .line 3
    iput p2, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->i:I

    .line 4
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const v0, 0x7f07040a

    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result p3

    iput p3, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->j:I

    .line 5
    iput-boolean p2, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->l:Z

    const-wide/16 v0, 0x0

    .line 6
    iput-wide v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->m:J

    .line 7
    iput p2, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->n:I

    .line 8
    invoke-static {}, Lcom/android/launcher3/blur/f;->g()Z

    move-result p2

    if-eqz p2, :cond_0

    .line 9
    new-instance p2, Lcom/android/launcher3/blur/a;

    invoke-direct {p2, p1, p0}, Lcom/android/launcher3/blur/a;-><init>(Landroid/content/Context;Landroid/view/View;)V

    iput-object p2, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->g:Lcom/android/launcher3/blur/a;

    .line 10
    invoke-virtual {p0, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-void

    .line 11
    :cond_0
    new-instance p2, Landroid/widget/ImageView;

    invoke-direct {p2, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->h:Landroid/widget/ImageView;

    .line 12
    new-instance p1, Landroid/view/ViewGroup$MarginLayoutParams;

    const/4 p3, -0x1

    invoke-direct {p1, p3, p3}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 13
    iget-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->h:Landroid/widget/ImageView;

    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->m:J

    .line 2
    .line 3
    return-wide v0
.end method

.method static bridge synthetic b(Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;)Landroid/widget/ImageView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->h:Landroid/widget/ImageView;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->k:Landroid/animation/Animator;

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method protected d(ZZJ)V
    .locals 16

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move/from16 v2, p1

    .line 4
    .line 5
    move/from16 v5, p2

    .line 6
    .line 7
    move-wide/from16 v6, p3

    .line 8
    .line 9
    const/4 v0, 0x2

    .line 10
    iget-boolean v3, v1, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->o:Z

    .line 11
    .line 12
    const-string v4, " delay="

    .line 13
    .line 14
    const-string v8, "GroupWidgetBackgroundLayout"

    .line 15
    .line 16
    if-eqz v3, :cond_0

    .line 17
    .line 18
    new-instance v0, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    const-string v1, "doBgScaleAnim mIgnoreBgScaleAnim toBig="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v1, " needAnim="

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {v8, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 54
    .line 55
    .line 56
    move-result-wide v9

    .line 57
    iput-wide v9, v1, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->m:J

    .line 58
    .line 59
    const-wide/16 v11, 0x0

    .line 60
    .line 61
    cmp-long v3, v6, v11

    .line 62
    .line 63
    const-string v13, " mAnimKeyTime="

    .line 64
    .line 65
    if-lez v3, :cond_1

    .line 66
    .line 67
    new-instance v0, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 70
    .line 71
    .line 72
    const-string v3, "doBgScaleAnim delay toBig="

    .line 73
    .line 74
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    iget-wide v3, v1, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->m:J

    .line 90
    .line 91
    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-static {v8, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    .line 100
    .line 101
    new-instance v0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$a;

    .line 102
    .line 103
    move-wide v3, v9

    .line 104
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$a;-><init>(Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;ZJZ)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v1, v0, v6, v7}, Landroid/widget/LinearLayout;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :cond_1
    move v10, v2

    .line 112
    iget-object v2, v1, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->k:Landroid/animation/Animator;

    .line 113
    .line 114
    if-eqz v2, :cond_2

    .line 115
    .line 116
    iget-boolean v2, v1, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->l:Z

    .line 117
    .line 118
    if-ne v2, v10, :cond_2

    .line 119
    .line 120
    new-instance v0, Ljava/lang/StringBuilder;

    .line 121
    .line 122
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 123
    .line 124
    .line 125
    const-string v1, "doBgScaleAnim already running return, toBig="

    .line 126
    .line 127
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-static {v8, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    .line 139
    .line 140
    return-void

    .line 141
    :cond_2
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    .line 142
    .line 143
    .line 144
    move-result v2

    .line 145
    if-lez v2, :cond_c

    .line 146
    .line 147
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    .line 148
    .line 149
    .line 150
    move-result v2

    .line 151
    if-gtz v2, :cond_3

    .line 152
    .line 153
    goto/16 :goto_5

    .line 154
    .line 155
    :cond_3
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getAlpha()F

    .line 156
    .line 157
    .line 158
    move-result v6

    .line 159
    const/4 v2, 0x0

    .line 160
    const/high16 v3, 0x3f800000    # 1.0f

    .line 161
    .line 162
    if-eqz v10, :cond_4

    .line 163
    .line 164
    move v7, v3

    .line 165
    goto :goto_0

    .line 166
    :cond_4
    move v7, v2

    .line 167
    :goto_0
    if-eqz v10, :cond_5

    .line 168
    .line 169
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    .line 170
    .line 171
    .line 172
    move-result v4

    .line 173
    iget v5, v1, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->j:I

    .line 174
    .line 175
    mul-int/2addr v5, v0

    .line 176
    add-int/2addr v4, v5

    .line 177
    int-to-float v4, v4

    .line 178
    mul-float/2addr v4, v3

    .line 179
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    .line 180
    .line 181
    .line 182
    move-result v5

    .line 183
    int-to-float v5, v5

    .line 184
    div-float/2addr v4, v5

    .line 185
    goto :goto_1

    .line 186
    :cond_5
    move v4, v3

    .line 187
    :goto_1
    if-eqz v10, :cond_6

    .line 188
    .line 189
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    .line 190
    .line 191
    .line 192
    move-result v5

    .line 193
    iget v9, v1, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->j:I

    .line 194
    .line 195
    mul-int/2addr v9, v0

    .line 196
    add-int/2addr v5, v9

    .line 197
    int-to-float v5, v5

    .line 198
    mul-float/2addr v5, v3

    .line 199
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    .line 200
    .line 201
    .line 202
    move-result v3

    .line 203
    int-to-float v3, v3

    .line 204
    div-float v3, v5, v3

    .line 205
    .line 206
    :cond_6
    move v5, v3

    .line 207
    move v3, v2

    .line 208
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getScaleX()F

    .line 209
    .line 210
    .line 211
    move-result v2

    .line 212
    move v9, v3

    .line 213
    move v3, v4

    .line 214
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getScaleY()F

    .line 215
    .line 216
    .line 217
    move-result v4

    .line 218
    iget v14, v1, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->n:I

    .line 219
    .line 220
    int-to-float v14, v14

    .line 221
    if-eqz v10, :cond_7

    .line 222
    .line 223
    iget v9, v1, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->j:I

    .line 224
    .line 225
    int-to-float v9, v9

    .line 226
    :cond_7
    new-instance v15, Ljava/lang/StringBuilder;

    .line 227
    .line 228
    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    .line 229
    .line 230
    .line 231
    const-string v11, "doBgScaleAnim toBig="

    .line 232
    .line 233
    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 234
    .line 235
    .line 236
    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 237
    .line 238
    .line 239
    const-string v11, " fromAlpha="

    .line 240
    .line 241
    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 242
    .line 243
    .line 244
    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 245
    .line 246
    .line 247
    const-string v11, " fromScaleX="

    .line 248
    .line 249
    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 250
    .line 251
    .line 252
    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 253
    .line 254
    .line 255
    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 256
    .line 257
    .line 258
    iget-wide v11, v1, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->m:J

    .line 259
    .line 260
    invoke-virtual {v15, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 261
    .line 262
    .line 263
    const-string v11, " pro="

    .line 264
    .line 265
    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 266
    .line 267
    .line 268
    iget-object v11, v1, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->k:Landroid/animation/Animator;

    .line 269
    .line 270
    instance-of v12, v11, Landroid/animation/ValueAnimator;

    .line 271
    .line 272
    if-eqz v12, :cond_8

    .line 273
    .line 274
    check-cast v11, Landroid/animation/ValueAnimator;

    .line 275
    .line 276
    invoke-virtual {v11}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 277
    .line 278
    .line 279
    move-result v11

    .line 280
    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 281
    .line 282
    .line 283
    move-result-object v11

    .line 284
    goto :goto_2

    .line 285
    :cond_8
    const-string v11, "null"

    .line 286
    .line 287
    :goto_2
    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 288
    .line 289
    .line 290
    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 291
    .line 292
    .line 293
    move-result-object v11

    .line 294
    invoke-static {v8, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 295
    .line 296
    .line 297
    iget-object v8, v1, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->k:Landroid/animation/Animator;

    .line 298
    .line 299
    if-eqz v8, :cond_9

    .line 300
    .line 301
    invoke-virtual {v8}, Landroid/animation/Animator;->cancel()V

    .line 302
    .line 303
    .line 304
    const/4 v8, 0x0

    .line 305
    iput-object v8, v1, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->k:Landroid/animation/Animator;

    .line 306
    .line 307
    :cond_9
    new-array v0, v0, [F

    .line 308
    .line 309
    fill-array-data v0, :array_0

    .line 310
    .line 311
    .line 312
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 313
    .line 314
    .line 315
    move-result-object v11

    .line 316
    if-eqz p2, :cond_b

    .line 317
    .line 318
    if-eqz v10, :cond_a

    .line 319
    .line 320
    const/16 v0, 0x12c

    .line 321
    .line 322
    goto :goto_3

    .line 323
    :cond_a
    const/16 v0, 0x1f4

    .line 324
    .line 325
    :goto_3
    int-to-long v12, v0

    .line 326
    goto :goto_4

    .line 327
    :cond_b
    const-wide/16 v12, 0x0

    .line 328
    .line 329
    :goto_4
    invoke-virtual {v11, v12, v13}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 330
    .line 331
    .line 332
    sget-object v0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->p:Landroid/view/animation/PathInterpolator;

    .line 333
    .line 334
    invoke-virtual {v11, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 335
    .line 336
    .line 337
    new-instance v0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$b;

    .line 338
    .line 339
    move v8, v14

    .line 340
    invoke-direct/range {v0 .. v9}, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$b;-><init>(Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;FFFFFFFF)V

    .line 341
    .line 342
    .line 343
    invoke-virtual {v11, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 344
    .line 345
    .line 346
    new-instance v0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$c;

    .line 347
    .line 348
    invoke-direct {v0, v1, v6, v7}, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$c;-><init>(Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;FF)V

    .line 349
    .line 350
    .line 351
    invoke-virtual {v11, v0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 352
    .line 353
    .line 354
    iput-boolean v10, v1, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->l:Z

    .line 355
    .line 356
    invoke-virtual {v11}, Landroid/animation/ValueAnimator;->start()V

    .line 357
    .line 358
    .line 359
    :cond_c
    :goto_5
    return-void

    .line 360
    nop

    .line 361
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public e(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->o:Z

    .line 2
    .line 3
    return-void
.end method

.method protected f()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getScaleX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x3f800000    # 1.0f

    .line 6
    .line 7
    cmpl-float v0, v0, v1

    .line 8
    .line 9
    if-gtz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getScaleY()F

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    cmpl-float p0, p0, v1

    .line 16
    .line 17
    if-lez p0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0

    .line 22
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 23
    return p0
.end method

.method public getBgBlurImageView()Lcom/android/launcher3/blur/a;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/blur/f;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->g:Lcom/android/launcher3/blur/a;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method protected onSetAlpha(I)Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/blur/f;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Lcom/android/launcher3/blur/f;->l(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onSetAlpha(I)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method protected setBgColor(I)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->i:I

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->h:Landroid/widget/ImageView;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setBackgroundColor(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->g:Lcom/android/launcher3/blur/a;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    .line 15
    .line 16
    invoke-direct {v0, p1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0}, Lcom/android/launcher3/blur/a;->setBlurBgTopColorDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method
