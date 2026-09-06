.class public Lcom/zte/mifavor/widget/RealtimeEffectView;
.super Landroid/view/View;
.source "RealtimeEffectView.java"


# static fields
.field private static F:Z = false

.field private static G:I

.field private static H:Z


# instance fields
.field private A:J

.field private final B:Landroid/view/ViewTreeObserver$OnPreDrawListener;

.field private C:I

.field private D:I

.field private E:Landroid/view/View;

.field private g:F

.field private h:I

.field private i:I

.field private j:I

.field private k:F

.field private l:Landroid/graphics/Bitmap;

.field private m:Landroid/graphics/Bitmap;

.field private n:Landroid/graphics/Canvas;

.field private o:Z

.field private p:Landroid/graphics/Paint;

.field private final q:Landroid/graphics/Rect;

.field private final r:Landroid/graphics/Rect;

.field private s:Landroid/view/View;

.field private t:Z

.field private u:Landroid/graphics/Bitmap;

.field private v:Landroid/graphics/Canvas;

.field private w:Landroid/graphics/Paint;

.field private x:F

.field private y:Z

.field private z:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    sput-boolean v0, Lcom/zte/mifavor/widget/RealtimeEffectView;->H:Z

    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 8
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ResourceType"
        }
    .end annotation

    .line 1
    const-string v0, "RealtimeEffectView"

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 4
    .line 5
    .line 6
    const/4 v1, -0x1

    .line 7
    iput v1, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->h:I

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    iput-object v2, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->l:Landroid/graphics/Bitmap;

    .line 11
    .line 12
    iput-object v2, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->m:Landroid/graphics/Bitmap;

    .line 13
    .line 14
    iput-object v2, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->n:Landroid/graphics/Canvas;

    .line 15
    .line 16
    new-instance v3, Landroid/graphics/Rect;

    .line 17
    .line 18
    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v3, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->q:Landroid/graphics/Rect;

    .line 22
    .line 23
    new-instance v3, Landroid/graphics/Rect;

    .line 24
    .line 25
    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v3, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->r:Landroid/graphics/Rect;

    .line 29
    .line 30
    iput-object v2, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->u:Landroid/graphics/Bitmap;

    .line 31
    .line 32
    const/4 v3, 0x0

    .line 33
    iput v3, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->x:F

    .line 34
    .line 35
    const/4 v3, 0x1

    .line 36
    iput-boolean v3, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->y:Z

    .line 37
    .line 38
    const-wide/16 v3, 0x0

    .line 39
    .line 40
    iput-wide v3, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->z:J

    .line 41
    .line 42
    iput-wide v3, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->A:J

    .line 43
    .line 44
    new-instance v3, Lcom/zte/mifavor/widget/RealtimeEffectView$a;

    .line 45
    .line 46
    invoke-direct {v3, p0}, Lcom/zte/mifavor/widget/RealtimeEffectView$a;-><init>(Lcom/zte/mifavor/widget/RealtimeEffectView;)V

    .line 47
    .line 48
    .line 49
    iput-object v3, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->B:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    .line 50
    .line 51
    const/16 v3, 0xa

    .line 52
    .line 53
    iput v3, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->C:I

    .line 54
    .line 55
    const/4 v3, 0x7

    .line 56
    iput v3, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->D:I

    .line 57
    .line 58
    iput-object v2, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->E:Landroid/view/View;

    .line 59
    .line 60
    sget-boolean v2, Lcom/zte/mifavor/widget/u;->b:Z

    .line 61
    .line 62
    const/4 v3, 0x0

    .line 63
    if-eqz v2, :cond_0

    .line 64
    .line 65
    invoke-virtual {p0, v3}, Landroid/view/View;->setForceDarkAllowed(Z)V

    .line 66
    .line 67
    .line 68
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    sget v4, LR3/d;->v:I

    .line 73
    .line 74
    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    sget v5, LR3/f;->a:I

    .line 83
    .line 84
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    new-instance v6, Ljava/lang/StringBuilder;

    .line 89
    .line 90
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 91
    .line 92
    .line 93
    const-string v7, "Realtime Effect View in, use drawable bottombar_tab_bg, bottombarDrawable="

    .line 94
    .line 95
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v6

    .line 105
    invoke-static {v0, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    .line 107
    .line 108
    instance-of v6, v4, Landroid/graphics/drawable/BitmapDrawable;

    .line 109
    .line 110
    if-eqz v6, :cond_1

    .line 111
    .line 112
    invoke-virtual {p0, v5}, Lcom/zte/mifavor/widget/RealtimeEffectView;->o(I)I

    .line 113
    .line 114
    .line 115
    move-result v4

    .line 116
    iput v4, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->h:I

    .line 117
    .line 118
    new-instance v4, Ljava/lang/StringBuilder;

    .line 119
    .line 120
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 121
    .line 122
    .line 123
    const-string v5, "Realtime Effect View in, use BitmapDrawable bottombar_tab_bg. mDefaultOverlayColor="

    .line 124
    .line 125
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    iget v5, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->h:I

    .line 129
    .line 130
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v4

    .line 137
    invoke-static {v0, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    .line 139
    .line 140
    goto :goto_0

    .line 141
    :catch_0
    move-exception v1

    .line 142
    goto :goto_1

    .line 143
    :cond_1
    instance-of v5, v4, Landroid/graphics/drawable/ColorDrawable;

    .line 144
    .line 145
    if-eqz v5, :cond_2

    .line 146
    .line 147
    check-cast v4, Landroid/graphics/drawable/ColorDrawable;

    .line 148
    .line 149
    invoke-virtual {v4}, Landroid/graphics/drawable/ColorDrawable;->getColor()I

    .line 150
    .line 151
    .line 152
    move-result v4

    .line 153
    iput v4, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->h:I

    .line 154
    .line 155
    new-instance v4, Ljava/lang/StringBuilder;

    .line 156
    .line 157
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 158
    .line 159
    .line 160
    const-string v5, "Realtime Effect View in, use ColorDrawable bottombar_tab_bg. mDefaultOverlayColor="

    .line 161
    .line 162
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    iget v5, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->h:I

    .line 166
    .line 167
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v4

    .line 174
    invoke-static {v0, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 175
    .line 176
    .line 177
    :cond_2
    :goto_0
    iget v4, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->h:I

    .line 178
    .line 179
    if-eq v4, v2, :cond_3

    .line 180
    .line 181
    if-ne v4, v1, :cond_4

    .line 182
    .line 183
    :cond_3
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    sget v4, LR3/d;->b:I

    .line 188
    .line 189
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 190
    .line 191
    .line 192
    move-result v1

    .line 193
    iput v1, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->h:I

    .line 194
    .line 195
    new-instance v1, Ljava/lang/StringBuilder;

    .line 196
    .line 197
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 198
    .line 199
    .line 200
    const-string v4, "Realtime Effect View in, use color bottombar_tab_bg. mDefaultOverlayColor="

    .line 201
    .line 202
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    iget v4, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->h:I

    .line 206
    .line 207
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 208
    .line 209
    .line 210
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v1

    .line 214
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 215
    .line 216
    .line 217
    goto :goto_2

    .line 218
    :goto_1
    iput v2, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->h:I

    .line 219
    .line 220
    new-instance v2, Ljava/lang/StringBuilder;

    .line 221
    .line 222
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 223
    .line 224
    .line 225
    const-string v4, "Realtime Effect View in, use mDefaultOverlayColor="

    .line 226
    .line 227
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 228
    .line 229
    .line 230
    iget v4, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->h:I

    .line 231
    .line 232
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 233
    .line 234
    .line 235
    const-string v4, ", e = "

    .line 236
    .line 237
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object v1

    .line 244
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 245
    .line 246
    .line 247
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v1

    .line 251
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 252
    .line 253
    .line 254
    :cond_4
    :goto_2
    sget-object v1, LR3/m;->Z2:[I

    .line 255
    .line 256
    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 257
    .line 258
    .line 259
    move-result-object p2

    .line 260
    sget v1, LR3/m;->b3:I

    .line 261
    .line 262
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 263
    .line 264
    .line 265
    move-result-object v2

    .line 266
    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 267
    .line 268
    .line 269
    move-result-object v2

    .line 270
    const/high16 v4, 0x42140000    # 37.0f

    .line 271
    .line 272
    invoke-static {v3, v4, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 273
    .line 274
    .line 275
    move-result v2

    .line 276
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 277
    .line 278
    .line 279
    move-result v1

    .line 280
    iput v1, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->k:F

    .line 281
    .line 282
    sget v1, LR3/m;->c3:I

    .line 283
    .line 284
    const/high16 v2, 0x40a00000    # 5.0f

    .line 285
    .line 286
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 287
    .line 288
    .line 289
    move-result v1

    .line 290
    iput v1, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->g:F

    .line 291
    .line 292
    sget v1, LR3/m;->d3:I

    .line 293
    .line 294
    iget v2, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->h:I

    .line 295
    .line 296
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 297
    .line 298
    .line 299
    move-result v1

    .line 300
    iput v1, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->i:I

    .line 301
    .line 302
    sget v1, LR3/m;->a3:I

    .line 303
    .line 304
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 305
    .line 306
    .line 307
    move-result-object v2

    .line 308
    sget v4, LR3/d;->x:I

    .line 309
    .line 310
    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 311
    .line 312
    .line 313
    move-result v2

    .line 314
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 315
    .line 316
    .line 317
    move-result v1

    .line 318
    iput v1, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->j:I

    .line 319
    .line 320
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 321
    .line 322
    .line 323
    move-result-object p1

    .line 324
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 325
    .line 326
    .line 327
    move-result-object p1

    .line 328
    if-eqz p1, :cond_6

    .line 329
    .line 330
    iget v1, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 331
    .line 332
    const/16 v2, 0xa28

    .line 333
    .line 334
    if-gt v1, v2, :cond_5

    .line 335
    .line 336
    iget p1, p1, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 337
    .line 338
    if-le p1, v2, :cond_6

    .line 339
    .line 340
    :cond_5
    const/high16 p1, 0x41f00000    # 30.0f

    .line 341
    .line 342
    iput p1, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->k:F

    .line 343
    .line 344
    :cond_6
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 345
    .line 346
    .line 347
    new-instance p1, Landroid/graphics/Paint;

    .line 348
    .line 349
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 350
    .line 351
    .line 352
    iput-object p1, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->p:Landroid/graphics/Paint;

    .line 353
    .line 354
    new-instance p1, Landroid/graphics/Paint;

    .line 355
    .line 356
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 357
    .line 358
    .line 359
    iput-object p1, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->w:Landroid/graphics/Paint;

    .line 360
    .line 361
    sget-boolean p1, Lcom/zte/mifavor/widget/u;->b:Z

    .line 362
    .line 363
    if-eqz p1, :cond_7

    .line 364
    .line 365
    invoke-virtual {p0, v3}, Landroid/view/View;->setForceDarkAllowed(Z)V

    .line 366
    .line 367
    .line 368
    :cond_7
    new-instance p1, Ljava/lang/StringBuilder;

    .line 369
    .line 370
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 371
    .line 372
    .line 373
    const-string p2, "Realtime Effect View out. mBlurRadius="

    .line 374
    .line 375
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 376
    .line 377
    .line 378
    iget p2, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->k:F

    .line 379
    .line 380
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 381
    .line 382
    .line 383
    const-string p2, ", mOverlayColor="

    .line 384
    .line 385
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 386
    .line 387
    .line 388
    iget p2, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->i:I

    .line 389
    .line 390
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 391
    .line 392
    .line 393
    const-string p2, ", mBackgroundColor="

    .line 394
    .line 395
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 396
    .line 397
    .line 398
    iget p0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->j:I

    .line 399
    .line 400
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 401
    .line 402
    .line 403
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 404
    .line 405
    .line 406
    move-result-object p0

    .line 407
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 408
    .line 409
    .line 410
    return-void
.end method

.method static bridge synthetic a(Lcom/zte/mifavor/widget/RealtimeEffectView;)Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->l:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(Lcom/zte/mifavor/widget/RealtimeEffectView;)Landroid/graphics/Canvas;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->n:Landroid/graphics/Canvas;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/zte/mifavor/widget/RealtimeEffectView;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->s:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic d(Lcom/zte/mifavor/widget/RealtimeEffectView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->y:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic e(Lcom/zte/mifavor/widget/RealtimeEffectView;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->A:J

    .line 2
    .line 3
    return-wide v0
.end method

.method static bridge synthetic f(Lcom/zte/mifavor/widget/RealtimeEffectView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->i:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic g(Lcom/zte/mifavor/widget/RealtimeEffectView;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->z:J

    .line 2
    .line 3
    return-wide v0
.end method

.method static bridge synthetic h(Lcom/zte/mifavor/widget/RealtimeEffectView;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->o:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic i(Lcom/zte/mifavor/widget/RealtimeEffectView;J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->A:J

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic j()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/zte/mifavor/widget/RealtimeEffectView;->F:Z

    .line 2
    .line 3
    return v0
.end method

.method static bridge synthetic k()I
    .locals 1

    .line 1
    sget v0, Lcom/zte/mifavor/widget/RealtimeEffectView;->G:I

    .line 2
    .line 3
    return v0
.end method

.method static bridge synthetic l()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/zte/mifavor/widget/RealtimeEffectView;->H:Z

    .line 2
    .line 3
    return v0
.end method

.method static bridge synthetic m(I)V
    .locals 0

    .line 1
    sput p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->G:I

    .line 2
    .line 3
    return-void
.end method

.method private p(Landroid/content/Context;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "display_gaussian_blur"

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-static {p0, p1, v0}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    new-instance p1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    const-string v1, "is Display Gaussian Blur. isOpened = "

    .line 18
    .line 19
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const-string v1, "RealtimeEffectView"

    .line 30
    .line 31
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    if-nez p0, :cond_0

    .line 35
    .line 36
    const/4 p0, 0x1

    .line 37
    return p0

    .line 38
    :cond_0
    return v0
.end method

.method private q(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Z
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    const-string v3, "RealtimeEffectView"

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    if-nez v2, :cond_1

    .line 12
    .line 13
    :cond_0
    const/4 v6, 0x0

    .line 14
    goto/16 :goto_6

    .line 15
    .line 16
    :cond_1
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 17
    .line 18
    .line 19
    move-result v5

    .line 20
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 21
    .line 22
    .line 23
    move-result v6

    .line 24
    if-ne v5, v6, :cond_5

    .line 25
    .line 26
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 27
    .line 28
    .line 29
    move-result v5

    .line 30
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 31
    .line 32
    .line 33
    move-result v6

    .line 34
    if-ne v5, v6, :cond_5

    .line 35
    .line 36
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 37
    .line 38
    .line 39
    move-result v5

    .line 40
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 41
    .line 42
    .line 43
    move-result v6

    .line 44
    const/4 v7, 0x0

    .line 45
    const/4 v8, 0x0

    .line 46
    const/4 v9, 0x0

    .line 47
    :goto_0
    if-ge v7, v5, :cond_4

    .line 48
    .line 49
    const/4 v10, 0x0

    .line 50
    :goto_1
    if-ge v10, v6, :cond_3

    .line 51
    .line 52
    invoke-virtual {v1, v7, v10}, Landroid/graphics/Bitmap;->getPixel(II)I

    .line 53
    .line 54
    .line 55
    move-result v11

    .line 56
    invoke-virtual {v2, v7, v10}, Landroid/graphics/Bitmap;->getPixel(II)I

    .line 57
    .line 58
    .line 59
    move-result v12

    .line 60
    if-eq v11, v12, :cond_2

    .line 61
    .line 62
    add-int/lit8 v8, v8, 0x1

    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_2
    add-int/lit8 v9, v9, 0x1

    .line 66
    .line 67
    :goto_2
    iget v11, v0, Lcom/zte/mifavor/widget/RealtimeEffectView;->D:I

    .line 68
    .line 69
    add-int/2addr v10, v11

    .line 70
    goto :goto_1

    .line 71
    :cond_3
    iget v10, v0, Lcom/zte/mifavor/widget/RealtimeEffectView;->C:I

    .line 72
    .line 73
    add-int/2addr v7, v10

    .line 74
    goto :goto_0

    .line 75
    :cond_4
    if-nez v8, :cond_6

    .line 76
    .line 77
    if-eqz v9, :cond_5

    .line 78
    .line 79
    goto :goto_3

    .line 80
    :cond_5
    const/4 v6, 0x0

    .line 81
    goto/16 :goto_5

    .line 82
    .line 83
    :cond_6
    :goto_3
    int-to-float v1, v8

    .line 84
    add-int v2, v8, v9

    .line 85
    .line 86
    int-to-float v5, v2

    .line 87
    div-float/2addr v1, v5

    .line 88
    iget v5, v0, Lcom/zte/mifavor/widget/RealtimeEffectView;->x:F

    .line 89
    .line 90
    sub-float v5, v1, v5

    .line 91
    .line 92
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    .line 93
    .line 94
    .line 95
    move-result v5

    .line 96
    float-to-double v6, v5

    .line 97
    const-wide v10, 0x3e7ad7f29abcaf48L    # 1.0E-7

    .line 98
    .line 99
    .line 100
    .line 101
    .line 102
    cmpg-double v6, v6, v10

    .line 103
    .line 104
    const-string v7, ", Rate = "

    .line 105
    .line 106
    const-string v10, ", differentRate="

    .line 107
    .line 108
    const-string v11, ", mPreDiffRate="

    .line 109
    .line 110
    const-string v12, ", sameCount="

    .line 111
    .line 112
    if-ltz v6, :cond_9

    .line 113
    .line 114
    int-to-double v13, v8

    .line 115
    move/from16 p1, v5

    .line 116
    .line 117
    const/4 v6, 0x0

    .line 118
    int-to-double v4, v2

    .line 119
    const-wide v15, 0x3f847ae147ae147bL    # 0.01

    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    mul-double/2addr v4, v15

    .line 125
    cmpg-double v2, v13, v4

    .line 126
    .line 127
    if-gez v2, :cond_7

    .line 128
    .line 129
    move/from16 v4, p1

    .line 130
    .line 131
    goto :goto_4

    .line 132
    :cond_7
    sget-boolean v2, Lcom/zte/mifavor/widget/RealtimeEffectView;->F:Z

    .line 133
    .line 134
    if-eqz v2, :cond_8

    .line 135
    .line 136
    new-instance v2, Ljava/lang/StringBuilder;

    .line 137
    .line 138
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 139
    .line 140
    .line 141
    const-string v4, "is Equals, different bitmap. differentCount="

    .line 142
    .line 143
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    iget v4, v0, Lcom/zte/mifavor/widget/RealtimeEffectView;->x:F

    .line 159
    .line 160
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    move/from16 v4, p1

    .line 173
    .line 174
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v2

    .line 181
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 182
    .line 183
    .line 184
    :cond_8
    iput v1, v0, Lcom/zte/mifavor/widget/RealtimeEffectView;->x:F

    .line 185
    .line 186
    return v6

    .line 187
    :cond_9
    move v4, v5

    .line 188
    :goto_4
    sget-boolean v2, Lcom/zte/mifavor/widget/RealtimeEffectView;->F:Z

    .line 189
    .line 190
    if-eqz v2, :cond_a

    .line 191
    .line 192
    new-instance v2, Ljava/lang/StringBuilder;

    .line 193
    .line 194
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 195
    .line 196
    .line 197
    const-string v5, "is Equals, similar bitmap. differentCount="

    .line 198
    .line 199
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    iget v5, v0, Lcom/zte/mifavor/widget/RealtimeEffectView;->x:F

    .line 215
    .line 216
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 217
    .line 218
    .line 219
    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 223
    .line 224
    .line 225
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    .line 227
    .line 228
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object v2

    .line 235
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 236
    .line 237
    .line 238
    :cond_a
    iput v1, v0, Lcom/zte/mifavor/widget/RealtimeEffectView;->x:F

    .line 239
    .line 240
    const/4 v0, 0x1

    .line 241
    return v0

    .line 242
    :goto_5
    sget-boolean v0, Lcom/zte/mifavor/widget/RealtimeEffectView;->F:Z

    .line 243
    .line 244
    if-eqz v0, :cond_b

    .line 245
    .line 246
    const-string v0, "is Equals, width and height is different."

    .line 247
    .line 248
    invoke-static {v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 249
    .line 250
    .line 251
    :cond_b
    return v6

    .line 252
    :goto_6
    sget-boolean v0, Lcom/zte/mifavor/widget/RealtimeEffectView;->F:Z

    .line 253
    .line 254
    if-eqz v0, :cond_c

    .line 255
    .line 256
    const-string v0, "is Equals, b1 or b2 is null."

    .line 257
    .line 258
    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 259
    .line 260
    .line 261
    :cond_c
    return v6
.end method

.method private r()Z
    .locals 3

    .line 1
    invoke-static {}, Lcom/zte/mifavor/widget/u;->g()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    const-string v0, "PQ82A31"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const-string v0, "PQ82A61"

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    :cond_0
    const/4 v0, 0x0

    .line 24
    goto :goto_0

    .line 25
    :cond_1
    const/4 v0, 0x1

    .line 26
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    const-string v2, "is Support Gaussian Blur. product="

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string p0, ", isSupport="

    .line 40
    .line 41
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const-string v1, "RealtimeEffectView"

    .line 52
    .line 53
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    return v0
.end method

.method private t()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->l:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->l:Landroid/graphics/Bitmap;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->m:Landroid/graphics/Bitmap;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->m:Landroid/graphics/Bitmap;

    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->u:Landroid/graphics/Bitmap;

    .line 21
    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->u:Landroid/graphics/Bitmap;

    .line 28
    .line 29
    :cond_2
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    const-string v0, "RealtimeEffectView"

    .line 2
    .line 3
    :try_start_0
    iget-boolean v1, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->y:Z

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    sget-boolean p1, Lcom/zte/mifavor/widget/RealtimeEffectView;->F:Z

    .line 8
    .line 9
    if-eqz p1, :cond_3

    .line 10
    .line 11
    new-instance p1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v1, "draw mIsWorking = "

    .line 17
    .line 18
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->y:Z

    .line 22
    .line 23
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :catch_0
    move-exception p0

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    iget-boolean v1, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->o:Z

    .line 37
    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    sget-boolean p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->F:Z

    .line 41
    .line 42
    if-eqz p0, :cond_3

    .line 43
    .line 44
    const-string p0, "draw don\'t draw views above me."

    .line 45
    .line 46
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    sget v1, Lcom/zte/mifavor/widget/RealtimeEffectView;->G:I

    .line 51
    .line 52
    if-lez v1, :cond_2

    .line 53
    .line 54
    sget-boolean p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->F:Z

    .line 55
    .line 56
    if-eqz p0, :cond_3

    .line 57
    .line 58
    new-instance p0, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    .line 62
    .line 63
    const-string p1, "draw Doesn\'t support blurview overlap on another blurview., RENDERING_COUNT = "

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    sget p1, Lcom/zte/mifavor/widget/RealtimeEffectView;->G:I

    .line 69
    .line 70
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_2
    invoke-super {p0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :goto_0
    const-string p1, "draw super error, e = "

    .line 86
    .line 87
    invoke-static {v0, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 88
    .line 89
    .line 90
    :cond_3
    return-void
.end method

.method protected getActivityDecorView()Landroid/view/View;
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    const/4 v2, 0x4

    .line 7
    if-ge v1, v2, :cond_0

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    instance-of v2, v0, Landroid/app/Activity;

    .line 12
    .line 13
    if-nez v2, :cond_0

    .line 14
    .line 15
    instance-of v2, v0, Landroid/content/ContextWrapper;

    .line 16
    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    check-cast v0, Landroid/content/ContextWrapper;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    add-int/lit8 v1, v1, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    instance-of v1, v0, Landroid/app/Activity;

    .line 29
    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    check-cast v0, Landroid/app/Activity;

    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0

    .line 43
    :cond_1
    iget-object p0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->E:Landroid/view/View;

    .line 44
    .line 45
    if-eqz p0, :cond_2

    .line 46
    .line 47
    return-object p0

    .line 48
    :cond_2
    const/4 p0, 0x0

    .line 49
    return-object p0
.end method

.method public getDefaultOverlayColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public getIsWorking()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->y:Z

    .line 2
    .line 3
    return p0
.end method

.method public getPreDrawIntervalTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->z:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getPreDrawListener()Landroid/view/ViewTreeObserver$OnPreDrawListener;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "get Pre Draw Listener = "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->B:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "RealtimeEffectView"

    .line 21
    .line 22
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->B:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    .line 26
    .line 27
    return-object p0
.end method

.method public isClickable()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public isLongClickable()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method protected n(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;I)V
    .locals 3

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->q:Landroid/graphics/Rect;

    .line 4
    .line 5
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iput v1, v0, Landroid/graphics/Rect;->right:I

    .line 10
    .line 11
    iget-object v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->q:Landroid/graphics/Rect;

    .line 12
    .line 13
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 18
    .line 19
    iget-object v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->r:Landroid/graphics/Rect;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    iput v1, v0, Landroid/graphics/Rect;->right:I

    .line 26
    .line 27
    iget-object v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->r:Landroid/graphics/Rect;

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 34
    .line 35
    iget-object v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->q:Landroid/graphics/Rect;

    .line 36
    .line 37
    iget-object v1, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->r:Landroid/graphics/Rect;

    .line 38
    .line 39
    const/4 v2, 0x0

    .line 40
    invoke-virtual {p1, p2, v0, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    iget-object p2, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->p:Landroid/graphics/Paint;

    .line 44
    .line 45
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setColor(I)V

    .line 46
    .line 47
    .line 48
    iget-object p2, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->r:Landroid/graphics/Rect;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->p:Landroid/graphics/Paint;

    .line 51
    .line 52
    invoke-virtual {p1, p2, p0}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 53
    .line 54
    .line 55
    sget-boolean p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->F:Z

    .line 56
    .line 57
    if-eqz p0, :cond_1

    .line 58
    .line 59
    const-string p0, "RealtimeEffectView"

    .line 60
    .line 61
    const-string p1, "draw Blurred Bitmap out."

    .line 62
    .line 63
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    :cond_1
    return-void
.end method

.method public o(I)I
    .locals 8

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0, p1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const/4 p0, -0x1

    .line 12
    return p0

    .line 13
    :cond_0
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 18
    .line 19
    .line 20
    move-result v7

    .line 21
    mul-int p0, v3, v7

    .line 22
    .line 23
    new-array v1, p0, [I

    .line 24
    .line 25
    const/4 v4, 0x0

    .line 26
    const/4 v5, 0x0

    .line 27
    const/4 v2, 0x0

    .line 28
    move v6, v3

    .line 29
    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    .line 30
    .line 31
    .line 32
    new-instance p1, Ljava/util/HashMap;

    .line 33
    .line 34
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 35
    .line 36
    .line 37
    const/4 v0, 0x0

    .line 38
    move v2, v0

    .line 39
    :goto_0
    if-ge v2, p0, :cond_2

    .line 40
    .line 41
    aget v3, v1, v2

    .line 42
    .line 43
    const v4, 0xffffff

    .line 44
    .line 45
    .line 46
    and-int/2addr v3, v4

    .line 47
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    invoke-virtual {p1, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    const/4 v5, 0x1

    .line 56
    if-eqz v4, :cond_1

    .line 57
    .line 58
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    invoke-virtual {p1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    check-cast v4, Ljava/lang/Integer;

    .line 67
    .line 68
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 69
    .line 70
    .line 71
    move-result v4

    .line 72
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    add-int/2addr v4, v5

    .line 77
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    invoke-virtual {p1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_1
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 90
    .line 91
    .line 92
    move-result-object v4

    .line 93
    invoke-virtual {p1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_2
    invoke-virtual {p1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    move p1, v0

    .line 108
    :cond_3
    :goto_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    if-eqz v1, :cond_4

    .line 113
    .line 114
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    check-cast v1, Ljava/util/Map$Entry;

    .line 119
    .line 120
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    check-cast v2, Ljava/lang/Integer;

    .line 125
    .line 126
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 127
    .line 128
    .line 129
    move-result v2

    .line 130
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    check-cast v1, Ljava/lang/Integer;

    .line 135
    .line 136
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    if-le v1, p1, :cond_3

    .line 141
    .line 142
    move p1, v1

    .line 143
    move v0, v2

    .line 144
    goto :goto_2

    .line 145
    :cond_4
    const/high16 p0, -0x15000000

    .line 146
    .line 147
    or-int/2addr p0, v0

    .line 148
    return p0
.end method

.method protected onAttachedToWindow()V
    .locals 5

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/zte/mifavor/widget/RealtimeEffectView;->r()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const-string v1, "RealtimeEffectView"

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    new-instance v0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    const-string v2, "on Attached To Window, does not support Gaussian Blur, mBackgroundColor="

    .line 18
    .line 19
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    iget v2, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->j:I

    .line 23
    .line 24
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    iget v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->j:I

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-direct {p0, v0}, Lcom/zte/mifavor/widget/RealtimeEffectView;->p(Landroid/content/Context;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_1

    .line 49
    .line 50
    new-instance v0, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 53
    .line 54
    .line 55
    const-string v2, "on Attached To Window, display_gaussian_blur is 0..., mBackgroundColor="

    .line 56
    .line 57
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    iget v2, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->j:I

    .line 61
    .line 62
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    .line 71
    .line 72
    iget v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->j:I

    .line 73
    .line 74
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_1
    invoke-static {}, Lcom/zte/mifavor/widget/u;->m()Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-nez v0, :cond_2

    .line 83
    .line 84
    new-instance v0, Ljava/lang/StringBuilder;

    .line 85
    .line 86
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 87
    .line 88
    .line 89
    const-string v2, "on Attached To Window, myos_feature_complex_animation is false and do nothing, mBackgroundColor="

    .line 90
    .line 91
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    iget v2, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->j:I

    .line 95
    .line 96
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    .line 105
    .line 106
    iget v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->j:I

    .line 107
    .line 108
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_2
    invoke-static {}, Lcom/zte/mifavor/widget/u;->o()Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-eqz v0, :cond_3

    .line 117
    .line 118
    new-instance v0, Ljava/lang/StringBuilder;

    .line 119
    .line 120
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 121
    .line 122
    .line 123
    const-string v2, "on Attached To Window, myos_feature_low_end_phone is true and do nothing, mBackgroundColor="

    .line 124
    .line 125
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    iget v2, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->j:I

    .line 129
    .line 130
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    .line 139
    .line 140
    iget v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->j:I

    .line 141
    .line 142
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    :cond_3
    iget-object v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->s:Landroid/view/View;

    .line 147
    .line 148
    if-eqz v0, :cond_4

    .line 149
    .line 150
    goto :goto_0

    .line 151
    :cond_4
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/RealtimeEffectView;->getActivityDecorView()Landroid/view/View;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    :goto_0
    iput-object v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->s:Landroid/view/View;

    .line 156
    .line 157
    new-instance v0, Ljava/lang/StringBuilder;

    .line 158
    .line 159
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 160
    .line 161
    .line 162
    const-string v2, "on Attached To Window in. mDecorView = "

    .line 163
    .line 164
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    iget-object v2, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->s:Landroid/view/View;

    .line 168
    .line 169
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    const-string v2, ", mIsSDK31Above="

    .line 173
    .line 174
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    sget-boolean v2, Lcom/zte/mifavor/widget/RealtimeEffectView;->H:Z

    .line 178
    .line 179
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 187
    .line 188
    .line 189
    iget-object v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->s:Landroid/view/View;

    .line 190
    .line 191
    const/4 v2, 0x0

    .line 192
    if-eqz v0, :cond_7

    .line 193
    .line 194
    sget-boolean v0, Lcom/zte/mifavor/widget/RealtimeEffectView;->H:Z

    .line 195
    .line 196
    if-eqz v0, :cond_5

    .line 197
    .line 198
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 199
    .line 200
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 201
    .line 202
    .line 203
    const-string v3, "on Attached To Window. remove On Pre Draw Listener, mDecorView = "

    .line 204
    .line 205
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    iget-object v3, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->s:Landroid/view/View;

    .line 209
    .line 210
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 218
    .line 219
    .line 220
    iget-object v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->s:Landroid/view/View;

    .line 221
    .line 222
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    iget-object v3, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->B:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    .line 227
    .line 228
    invoke-virtual {v0, v3}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 229
    .line 230
    .line 231
    goto :goto_1

    .line 232
    :catch_0
    move-exception v0

    .line 233
    new-instance v3, Ljava/lang/StringBuilder;

    .line 234
    .line 235
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 236
    .line 237
    .line 238
    const-string v4, "on Attached To Window. remove On Pre Draw Listener error, e="

    .line 239
    .line 240
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 241
    .line 242
    .line 243
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 251
    .line 252
    .line 253
    :goto_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 254
    .line 255
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 256
    .line 257
    .line 258
    const-string v3, "on Attached To Window. add OnPre Draw Listener mDecorView = "

    .line 259
    .line 260
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 261
    .line 262
    .line 263
    iget-object v3, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->s:Landroid/view/View;

    .line 264
    .line 265
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 266
    .line 267
    .line 268
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object v0

    .line 272
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 273
    .line 274
    .line 275
    iget-object v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->s:Landroid/view/View;

    .line 276
    .line 277
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 278
    .line 279
    .line 280
    move-result-object v0

    .line 281
    iget-object v3, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->B:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    .line 282
    .line 283
    invoke-virtual {v0, v3}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 284
    .line 285
    .line 286
    goto :goto_2

    .line 287
    :cond_5
    const/4 v0, 0x0

    .line 288
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 289
    .line 290
    .line 291
    :goto_2
    iget-object v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->s:Landroid/view/View;

    .line 292
    .line 293
    invoke-virtual {v0}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 294
    .line 295
    .line 296
    move-result-object v0

    .line 297
    invoke-virtual {p0}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 298
    .line 299
    .line 300
    move-result-object v3

    .line 301
    if-eq v0, v3, :cond_6

    .line 302
    .line 303
    const/4 v2, 0x1

    .line 304
    :cond_6
    iput-boolean v2, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->t:Z

    .line 305
    .line 306
    if-eqz v2, :cond_8

    .line 307
    .line 308
    iget-object v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->s:Landroid/view/View;

    .line 309
    .line 310
    invoke-virtual {v0}, Landroid/view/View;->postInvalidate()V

    .line 311
    .line 312
    .line 313
    goto :goto_3

    .line 314
    :cond_7
    iput-boolean v2, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->t:Z

    .line 315
    .line 316
    :cond_8
    :goto_3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 317
    .line 318
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 319
    .line 320
    .line 321
    const-string v2, "on Attached To Window out. mDifferentRoot = "

    .line 322
    .line 323
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 324
    .line 325
    .line 326
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->t:Z

    .line 327
    .line 328
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 329
    .line 330
    .line 331
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 332
    .line 333
    .line 334
    move-result-object p0

    .line 335
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 336
    .line 337
    .line 338
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/zte/mifavor/widget/RealtimeEffectView;->r()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "RealtimeEffectView"

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string p0, "on Detached From Window, does not support Gaussian Blur."

    .line 10
    .line 11
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-direct {p0, v0}, Lcom/zte/mifavor/widget/RealtimeEffectView;->p(Landroid/content/Context;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    const-string p0, "on Detached From Window, display_gaussian_blur is 0."

    .line 26
    .line 27
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    invoke-static {}, Lcom/zte/mifavor/widget/u;->m()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_2

    .line 36
    .line 37
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 38
    .line 39
    .line 40
    const-string p0, "on Detached From Window, myos_feature_complex_animation is false and do nothing."

    .line 41
    .line 42
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_2
    invoke-static {}, Lcom/zte/mifavor/widget/u;->o()Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_3

    .line 51
    .line 52
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 53
    .line 54
    .line 55
    const-string p0, "on Detached From Window, myos_feature_low_end_phone is true and do nothing."

    .line 56
    .line 57
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 64
    .line 65
    .line 66
    const-string v2, "on Detached From Window in. mIsSDK31Above = "

    .line 67
    .line 68
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    sget-boolean v2, Lcom/zte/mifavor/widget/RealtimeEffectView;->H:Z

    .line 72
    .line 73
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->s:Landroid/view/View;

    .line 84
    .line 85
    if-eqz v0, :cond_4

    .line 86
    .line 87
    sget-boolean v0, Lcom/zte/mifavor/widget/RealtimeEffectView;->H:Z

    .line 88
    .line 89
    if-eqz v0, :cond_4

    .line 90
    .line 91
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 92
    .line 93
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 94
    .line 95
    .line 96
    const-string v2, "on Detached From Window. remove On Pre Draw Listener, mDecorView = "

    .line 97
    .line 98
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    iget-object v2, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->s:Landroid/view/View;

    .line 102
    .line 103
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->s:Landroid/view/View;

    .line 114
    .line 115
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    iget-object v2, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->B:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    .line 120
    .line 121
    invoke-virtual {v0, v2}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 122
    .line 123
    .line 124
    goto :goto_0

    .line 125
    :catch_0
    move-exception v0

    .line 126
    new-instance v2, Ljava/lang/StringBuilder;

    .line 127
    .line 128
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 129
    .line 130
    .line 131
    const-string v3, "remove On Pre Draw Listener error, e="

    .line 132
    .line 133
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 144
    .line 145
    .line 146
    :cond_4
    :goto_0
    invoke-direct {p0}, Lcom/zte/mifavor/widget/RealtimeEffectView;->t()V

    .line 147
    .line 148
    .line 149
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 150
    .line 151
    .line 152
    const-string p0, "on Detached From Window out."

    .line 153
    .line 154
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 155
    .line 156
    .line 157
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->y:Z

    .line 5
    .line 6
    const-string v1, "RealtimeEffectView"

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    sget-boolean p1, Lcom/zte/mifavor/widget/RealtimeEffectView;->F:Z

    .line 11
    .line 12
    if-eqz p1, :cond_3

    .line 13
    .line 14
    new-instance p1, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    const-string v0, "on Draw mIsWorking = "

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->y:Z

    .line 25
    .line 26
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    sget-boolean v0, Lcom/zte/mifavor/widget/RealtimeEffectView;->H:Z

    .line 38
    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    sget-boolean p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->F:Z

    .line 42
    .line 43
    if-eqz p0, :cond_3

    .line 44
    .line 45
    const-string p0, "on Draw isSDK31below."

    .line 46
    .line 47
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    iget-object v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->m:Landroid/graphics/Bitmap;

    .line 52
    .line 53
    if-eqz v0, :cond_3

    .line 54
    .line 55
    sget-boolean v0, Lcom/zte/mifavor/widget/RealtimeEffectView;->F:Z

    .line 56
    .line 57
    if-eqz v0, :cond_2

    .line 58
    .line 59
    const-string v0, "on Draw draw Blurred Bitmap."

    .line 60
    .line 61
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    :cond_2
    iget-object v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->m:Landroid/graphics/Bitmap;

    .line 65
    .line 66
    iget v1, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->i:I

    .line 67
    .line 68
    invoke-virtual {p0, p1, v0, v1}, Lcom/zte/mifavor/widget/RealtimeEffectView;->n(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;I)V

    .line 69
    .line 70
    .line 71
    :cond_3
    return-void
.end method

.method protected s()Z
    .locals 9

    .line 1
    sget-boolean v0, Lcom/zte/mifavor/widget/RealtimeEffectView;->H:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "RealtimeEffectView"

    .line 5
    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    sget-boolean p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->F:Z

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    const-string p0, " return false in prepare isSDK31below. "

    .line 13
    .line 14
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return v1

    .line 18
    :cond_1
    iget v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->k:F

    .line 19
    .line 20
    const/4 v3, 0x0

    .line 21
    cmpl-float v0, v0, v3

    .line 22
    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    invoke-direct {p0}, Lcom/zte/mifavor/widget/RealtimeEffectView;->t()V

    .line 26
    .line 27
    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 31
    .line 32
    .line 33
    const-string v3, "prepare out. mBlurRadius = "

    .line 34
    .line 35
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget p0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->k:F

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-static {v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    return v1

    .line 51
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    int-to-float v4, v0

    .line 60
    iget v5, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->g:F

    .line 61
    .line 62
    div-float/2addr v4, v5

    .line 63
    float-to-int v4, v4

    .line 64
    const/4 v5, 0x1

    .line 65
    invoke-static {v5, v4}, Ljava/lang/Math;->max(II)I

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    int-to-float v6, v3

    .line 70
    iget v7, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->g:F

    .line 71
    .line 72
    div-float/2addr v6, v7

    .line 73
    float-to-int v6, v6

    .line 74
    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    .line 75
    .line 76
    .line 77
    move-result v6

    .line 78
    sget-boolean v7, Lcom/zte/mifavor/widget/RealtimeEffectView;->F:Z

    .line 79
    .line 80
    if-eqz v7, :cond_3

    .line 81
    .line 82
    new-instance v7, Ljava/lang/StringBuilder;

    .line 83
    .line 84
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 85
    .line 86
    .line 87
    const-string v8, "prepare in. width="

    .line 88
    .line 89
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    const-string v0, ", height="

    .line 96
    .line 97
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v0, ", scaledWidth="

    .line 104
    .line 105
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    const-string v0, ", scaledHeight="

    .line 112
    .line 113
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 124
    .line 125
    .line 126
    :cond_3
    iget-object v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->n:Landroid/graphics/Canvas;

    .line 127
    .line 128
    if-eqz v0, :cond_4

    .line 129
    .line 130
    iget-object v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->m:Landroid/graphics/Bitmap;

    .line 131
    .line 132
    if-eqz v0, :cond_4

    .line 133
    .line 134
    iget-object v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->u:Landroid/graphics/Bitmap;

    .line 135
    .line 136
    if-nez v0, :cond_b

    .line 137
    .line 138
    :cond_4
    invoke-direct {p0}, Lcom/zte/mifavor/widget/RealtimeEffectView;->t()V

    .line 139
    .line 140
    .line 141
    :try_start_0
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 142
    .line 143
    invoke-static {v4, v6, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 144
    .line 145
    .line 146
    move-result-object v3

    .line 147
    iput-object v3, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->l:Landroid/graphics/Bitmap;

    .line 148
    .line 149
    if-nez v3, :cond_6

    .line 150
    .line 151
    sget-boolean v0, Lcom/zte/mifavor/widget/RealtimeEffectView;->F:Z

    .line 152
    .line 153
    if-eqz v0, :cond_5

    .line 154
    .line 155
    const-string v0, "prepare mBitmapToBlur is null."

    .line 156
    .line 157
    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 158
    .line 159
    .line 160
    goto :goto_0

    .line 161
    :catchall_0
    move-exception v0

    .line 162
    goto :goto_2

    .line 163
    :catch_0
    move-exception v0

    .line 164
    goto :goto_1

    .line 165
    :cond_5
    :goto_0
    invoke-direct {p0}, Lcom/zte/mifavor/widget/RealtimeEffectView;->t()V

    .line 166
    .line 167
    .line 168
    return v1

    .line 169
    :cond_6
    :try_start_1
    new-instance v3, Landroid/graphics/Canvas;

    .line 170
    .line 171
    iget-object v7, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->l:Landroid/graphics/Bitmap;

    .line 172
    .line 173
    invoke-direct {v3, v7}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 174
    .line 175
    .line 176
    iput-object v3, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->n:Landroid/graphics/Canvas;

    .line 177
    .line 178
    invoke-static {v4, v6, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    iput-object v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->m:Landroid/graphics/Bitmap;

    .line 183
    .line 184
    if-nez v0, :cond_8

    .line 185
    .line 186
    sget-boolean v0, Lcom/zte/mifavor/widget/RealtimeEffectView;->F:Z

    .line 187
    .line 188
    if-eqz v0, :cond_7

    .line 189
    .line 190
    const-string v0, "prepare mBlurredBitmap is null."

    .line 191
    .line 192
    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 193
    .line 194
    .line 195
    :cond_7
    invoke-direct {p0}, Lcom/zte/mifavor/widget/RealtimeEffectView;->t()V

    .line 196
    .line 197
    .line 198
    return v1

    .line 199
    :cond_8
    :try_start_2
    iget-object v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->l:Landroid/graphics/Bitmap;

    .line 200
    .line 201
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 202
    .line 203
    .line 204
    move-result v0

    .line 205
    iget-object v3, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->l:Landroid/graphics/Bitmap;

    .line 206
    .line 207
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    .line 208
    .line 209
    .line 210
    move-result v3

    .line 211
    iget-object v4, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->l:Landroid/graphics/Bitmap;

    .line 212
    .line 213
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    .line 214
    .line 215
    .line 216
    move-result-object v4

    .line 217
    invoke-static {v0, v3, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    iput-object v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->u:Landroid/graphics/Bitmap;

    .line 222
    .line 223
    if-nez v0, :cond_a

    .line 224
    .line 225
    sget-boolean v0, Lcom/zte/mifavor/widget/RealtimeEffectView;->F:Z

    .line 226
    .line 227
    if-eqz v0, :cond_9

    .line 228
    .line 229
    const-string v0, "prepare mPreBitmap is null."

    .line 230
    .line 231
    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/OutOfMemoryError; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 232
    .line 233
    .line 234
    :cond_9
    invoke-direct {p0}, Lcom/zte/mifavor/widget/RealtimeEffectView;->t()V

    .line 235
    .line 236
    .line 237
    return v1

    .line 238
    :cond_a
    :try_start_3
    new-instance v0, Landroid/graphics/Canvas;

    .line 239
    .line 240
    iget-object v3, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->u:Landroid/graphics/Bitmap;

    .line 241
    .line 242
    invoke-direct {v0, v3}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 243
    .line 244
    .line 245
    iput-object v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->v:Landroid/graphics/Canvas;
    :try_end_3
    .catch Ljava/lang/OutOfMemoryError; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 246
    .line 247
    :cond_b
    sget-boolean p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->F:Z

    .line 248
    .line 249
    if-eqz p0, :cond_c

    .line 250
    .line 251
    const-string p0, "prepare init out. return true."

    .line 252
    .line 253
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 254
    .line 255
    .line 256
    :cond_c
    return v5

    .line 257
    :goto_1
    :try_start_4
    const-string v3, "prepare error. e = "

    .line 258
    .line 259
    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 260
    .line 261
    .line 262
    invoke-direct {p0}, Lcom/zte/mifavor/widget/RealtimeEffectView;->t()V

    .line 263
    .line 264
    .line 265
    sget-boolean p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->F:Z

    .line 266
    .line 267
    if-eqz p0, :cond_d

    .line 268
    .line 269
    const-string p0, "prepare init out error. return false."

    .line 270
    .line 271
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 272
    .line 273
    .line 274
    :cond_d
    return v1

    .line 275
    :goto_2
    invoke-direct {p0}, Lcom/zte/mifavor/widget/RealtimeEffectView;->t()V

    .line 276
    .line 277
    .line 278
    throw v0
.end method

.method public setBlurRadius(F)V
    .locals 4

    .line 1
    const-string v0, "RealtimeEffectView"

    .line 2
    .line 3
    const-string v1, "setBlurRadius in."

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->k:F

    .line 9
    .line 10
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    sub-float/2addr v0, v1

    .line 19
    float-to-double v0, v0

    .line 20
    const-wide v2, -0x4046666666666666L    # -0.1

    .line 21
    .line 22
    .line 23
    .line 24
    .line 25
    cmpg-double v2, v0, v2

    .line 26
    .line 27
    if-ltz v2, :cond_1

    .line 28
    .line 29
    const-wide v2, 0x3fb999999999999aL    # 0.1

    .line 30
    .line 31
    .line 32
    .line 33
    .line 34
    cmpl-double v0, v0, v2

    .line 35
    .line 36
    if-lez v0, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    return-void

    .line 40
    :cond_1
    :goto_0
    iput p1, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->k:F

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public setDEBUG(Z)V
    .locals 0

    .line 1
    sput-boolean p1, Lcom/zte/mifavor/widget/RealtimeEffectView;->F:Z

    .line 2
    .line 3
    return-void
.end method

.method public setDecorView(Landroid/view/View;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "setDecorView in. view="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, ", mDecorView="

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->s:Landroid/view/View;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "RealtimeEffectView"

    .line 29
    .line 30
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 36
    .line 37
    .line 38
    const-string v2, "setDecorView. remove OnPre Draw Listener. mDecorView = "

    .line 39
    .line 40
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    iget-object v2, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->s:Landroid/view/View;

    .line 44
    .line 45
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->s:Landroid/view/View;

    .line 56
    .line 57
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iget-object v2, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->B:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    .line 62
    .line 63
    invoke-virtual {v0, v2}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :catch_0
    move-exception v0

    .line 68
    new-instance v2, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 71
    .line 72
    .line 73
    const-string v3, "setDecorView. remove On Pre Draw Listener error, e="

    .line 74
    .line 75
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    :goto_0
    iput-object p1, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->E:Landroid/view/View;

    .line 89
    .line 90
    iput-object p1, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->s:Landroid/view/View;

    .line 91
    .line 92
    new-instance p1, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 95
    .line 96
    .line 97
    const-string v0, "setDecorView. mDecorView="

    .line 98
    .line 99
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->s:Landroid/view/View;

    .line 103
    .line 104
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    const-string v0, ", mAppDecorView="

    .line 108
    .line 109
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->E:Landroid/view/View;

    .line 113
    .line 114
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    const-string v0, ", mIsSDK31Above="

    .line 118
    .line 119
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    sget-boolean v0, Lcom/zte/mifavor/widget/RealtimeEffectView;->H:Z

    .line 123
    .line 124
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    .line 133
    .line 134
    iget-object p1, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->s:Landroid/view/View;

    .line 135
    .line 136
    const/4 v0, 0x0

    .line 137
    if-eqz p1, :cond_2

    .line 138
    .line 139
    sget-boolean p1, Lcom/zte/mifavor/widget/RealtimeEffectView;->H:Z

    .line 140
    .line 141
    if-eqz p1, :cond_0

    .line 142
    .line 143
    new-instance p1, Ljava/lang/StringBuilder;

    .line 144
    .line 145
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 146
    .line 147
    .line 148
    const-string v2, "setDecorView. add OnPre Draw Listener mDecorView = "

    .line 149
    .line 150
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    iget-object v2, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->s:Landroid/view/View;

    .line 154
    .line 155
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 163
    .line 164
    .line 165
    iget-object p1, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->s:Landroid/view/View;

    .line 166
    .line 167
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    iget-object v2, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->B:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    .line 172
    .line 173
    invoke-virtual {p1, v2}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 174
    .line 175
    .line 176
    goto :goto_1

    .line 177
    :cond_0
    const/4 p1, 0x0

    .line 178
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 179
    .line 180
    .line 181
    :goto_1
    iget-object p1, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->s:Landroid/view/View;

    .line 182
    .line 183
    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 184
    .line 185
    .line 186
    move-result-object p1

    .line 187
    invoke-virtual {p0}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 188
    .line 189
    .line 190
    move-result-object v2

    .line 191
    if-eq p1, v2, :cond_1

    .line 192
    .line 193
    const/4 v0, 0x1

    .line 194
    :cond_1
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->t:Z

    .line 195
    .line 196
    if-eqz v0, :cond_3

    .line 197
    .line 198
    iget-object p1, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->s:Landroid/view/View;

    .line 199
    .line 200
    invoke-virtual {p1}, Landroid/view/View;->postInvalidate()V

    .line 201
    .line 202
    .line 203
    goto :goto_2

    .line 204
    :cond_2
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->t:Z

    .line 205
    .line 206
    :cond_3
    :goto_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 207
    .line 208
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 209
    .line 210
    .line 211
    const-string v0, "setDecorView out. mDifferentRoot="

    .line 212
    .line 213
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->t:Z

    .line 217
    .line 218
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object p0

    .line 225
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 226
    .line 227
    .line 228
    return-void
.end method

.method public setDownsampleFactor(F)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v0, p1, v0

    .line 3
    .line 4
    if-gtz v0, :cond_0

    .line 5
    .line 6
    const-string p0, "RealtimeEffectView"

    .line 7
    .line 8
    const-string p1, "Downsample factor must be greater than 0."

    .line 9
    .line 10
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget v1, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->g:F

    .line 19
    .line 20
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    sub-float/2addr v0, v1

    .line 25
    float-to-double v0, v0

    .line 26
    const-wide v2, -0x4046666666666666L    # -0.1

    .line 27
    .line 28
    .line 29
    .line 30
    .line 31
    cmpg-double v2, v0, v2

    .line 32
    .line 33
    if-ltz v2, :cond_2

    .line 34
    .line 35
    const-wide v2, 0x3fb999999999999aL    # 0.1

    .line 36
    .line 37
    .line 38
    .line 39
    .line 40
    cmpl-double v0, v0, v2

    .line 41
    .line 42
    if-lez v0, :cond_1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    return-void

    .line 46
    :cond_2
    :goto_0
    iput p1, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->g:F

    .line 47
    .line 48
    invoke-direct {p0}, Lcom/zte/mifavor/widget/RealtimeEffectView;->t()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public setIsWorking(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->y:Z

    .line 2
    .line 3
    return-void
.end method

.method public setOverlayColor(I)V
    .locals 2

    .line 1
    sget-boolean v0, Lcom/zte/mifavor/widget/RealtimeEffectView;->F:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v1, "setOverlayColor in. color="

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v1, ", mOverlayColor="

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    iget v1, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->i:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v1, "RealtimeEffectView"

    .line 33
    .line 34
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    :cond_0
    iget v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->i:I

    .line 38
    .line 39
    if-eq v0, p1, :cond_1

    .line 40
    .line 41
    iput p1, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->i:I

    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 44
    .line 45
    .line 46
    :cond_1
    return-void
.end method

.method public setPreDrawIntervalTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->z:J

    .line 2
    .line 3
    return-void
.end method

.method public u()V
    .locals 3

    .line 1
    const-string v0, "RealtimeEffectView"

    .line 2
    .line 3
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "remove On Pre Draw Listener, mDecorView = "

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    iget-object v2, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->s:Landroid/view/View;

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->s:Landroid/view/View;

    .line 26
    .line 27
    invoke-virtual {v1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget-object p0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->B:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    .line 32
    .line 33
    invoke-virtual {v1, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :catch_0
    move-exception p0

    .line 38
    new-instance v1, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 41
    .line 42
    .line 43
    const-string v2, "remove On Pre Draw Listener error, e="

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method protected v(Landroid/graphics/Bitmap;)V
    .locals 4

    .line 1
    sget-boolean v0, Lcom/zte/mifavor/widget/RealtimeEffectView;->H:Z

    .line 2
    .line 3
    const-string v1, "RealtimeEffectView"

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-boolean p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->F:Z

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    const-string p0, "render Effect isSDK31below."

    .line 12
    .line 13
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    if-nez p1, :cond_2

    .line 18
    .line 19
    sget-boolean p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->F:Z

    .line 20
    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    const-string p0, "render Effect, bitmapToBlur is null."

    .line 24
    .line 25
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void

    .line 29
    :cond_2
    iget-object v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->u:Landroid/graphics/Bitmap;

    .line 30
    .line 31
    invoke-direct {p0, v0, p1}, Lcom/zte/mifavor/widget/RealtimeEffectView;->q(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_4

    .line 36
    .line 37
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    .line 38
    .line 39
    invoke-direct {v0, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 40
    .line 41
    .line 42
    sget-boolean v2, Lcom/zte/mifavor/widget/RealtimeEffectView;->F:Z

    .line 43
    .line 44
    if-eqz v2, :cond_3

    .line 45
    .line 46
    new-instance v2, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 49
    .line 50
    .line 51
    const-string v3, "render Effect, setBackground mBlurRadius = "

    .line 52
    .line 53
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    iget v3, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->k:F

    .line 57
    .line 58
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    :cond_3
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 69
    .line 70
    .line 71
    iget v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->k:F

    .line 72
    .line 73
    sget-object v1, Landroid/graphics/Shader$TileMode;->MIRROR:Landroid/graphics/Shader$TileMode;

    .line 74
    .line 75
    invoke-static {v0, v0, v1}, Landroid/graphics/RenderEffect;->createBlurEffect(FFLandroid/graphics/Shader$TileMode;)Landroid/graphics/RenderEffect;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {p0, v0}, Landroid/view/View;->setRenderEffect(Landroid/graphics/RenderEffect;)V

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_4
    sget-boolean v0, Lcom/zte/mifavor/widget/RealtimeEffectView;->F:Z

    .line 84
    .line 85
    if-eqz v0, :cond_5

    .line 86
    .line 87
    const-string v0, "render Effect, similar bitmap and do nothing."

    .line 88
    .line 89
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    .line 91
    .line 92
    :cond_5
    :goto_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->v:Landroid/graphics/Canvas;

    .line 93
    .line 94
    new-instance v1, Landroid/graphics/Matrix;

    .line 95
    .line 96
    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    .line 97
    .line 98
    .line 99
    iget-object p0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView;->w:Landroid/graphics/Paint;

    .line 100
    .line 101
    invoke-virtual {v0, p1, v1, p0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    .line 102
    .line 103
    .line 104
    return-void
.end method
