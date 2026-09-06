.class Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$b;
.super Ljava/lang/Object;
.source "AICustomWidgetBottomEventLayout.java"

# interfaces
.implements Lcom/android/launcher3/widget/custom/ai/r$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/launcher3/widget/custom/ai/r$a<",
        "Lcom/android/launcher3/widget/custom/ai/data/AIWidgetBottomEventData;",
        "Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$b;->a:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic e(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$b;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$b;->g(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic g(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$b;->a:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->n(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;I)V
    .locals 12

    .line 1
    const v0, 0x7f0b0090

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Landroid/widget/TextView;

    .line 9
    .line 10
    const v1, 0x7f0b008f

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Landroid/widget/TextView;

    .line 18
    .line 19
    const v2, 0x7f0b008e

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Landroid/widget/ImageView;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$b;->b()Ljava/util/ArrayList;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-virtual {v3, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    check-cast v3, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetBottomEventData;

    .line 37
    .line 38
    invoke-virtual {p1, v3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    instance-of p1, v3, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;

    .line 42
    .line 43
    const-string v4, ""

    .line 44
    .line 45
    if-eqz p1, :cond_8

    .line 46
    .line 47
    check-cast v3, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;

    .line 48
    .line 49
    const p1, 0x7f08074b

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v3}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->getTitle()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v3}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->isAllDay()Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-eqz p1, :cond_0

    .line 67
    .line 68
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$b;->a:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;

    .line 69
    .line 70
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    const p1, 0x7f140059

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    goto/16 :goto_3

    .line 86
    .line 87
    :cond_0
    invoke-virtual {v3}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->getStartTimeLong()J

    .line 88
    .line 89
    .line 90
    move-result-wide v5

    .line 91
    invoke-virtual {v3}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->getEndTimeLong()J

    .line 92
    .line 93
    .line 94
    move-result-wide v7

    .line 95
    invoke-static {v5, v6, v7, v8}, Lcom/android/launcher3/widget/custom/ai/n;->L(JJ)Z

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    if-nez p1, :cond_4

    .line 100
    .line 101
    invoke-virtual {p0, p2}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$b;->f(I)Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    sget-object p2, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;->j:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;

    .line 106
    .line 107
    if-eq p1, p2, :cond_4

    .line 108
    .line 109
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 110
    .line 111
    .line 112
    move-result-wide p1

    .line 113
    invoke-virtual {v3}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->getStartTimeLong()J

    .line 114
    .line 115
    .line 116
    move-result-wide v5

    .line 117
    cmp-long p1, p1, v5

    .line 118
    .line 119
    const p2, 0x7f14005b

    .line 120
    .line 121
    .line 122
    const v0, 0x7f14005c

    .line 123
    .line 124
    .line 125
    if-gez p1, :cond_2

    .line 126
    .line 127
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$b;->a:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;

    .line 128
    .line 129
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    invoke-virtual {v3}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->getStartTimeLong()J

    .line 134
    .line 135
    .line 136
    move-result-wide v4

    .line 137
    invoke-static {v4, v5}, Lcom/android/launcher3/widget/custom/ai/n;->T(J)Z

    .line 138
    .line 139
    .line 140
    move-result v4

    .line 141
    if-eqz v4, :cond_1

    .line 142
    .line 143
    move p2, v0

    .line 144
    :cond_1
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    new-instance p2, Ljava/lang/StringBuilder;

    .line 149
    .line 150
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 151
    .line 152
    .line 153
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$b;->a:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;

    .line 154
    .line 155
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    const v4, 0x7f14005d

    .line 160
    .line 161
    .line 162
    invoke-virtual {v0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 170
    .line 171
    invoke-direct {v0, p1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {v3}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->getStartTimeLong()J

    .line 175
    .line 176
    .line 177
    move-result-wide v4

    .line 178
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 179
    .line 180
    .line 181
    move-result-object p1

    .line 182
    invoke-virtual {v0, p1}, Ljava/text/SimpleDateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object v4

    .line 193
    goto :goto_0

    .line 194
    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 195
    .line 196
    .line 197
    move-result-wide v5

    .line 198
    invoke-virtual {v3}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->getEndTimeLong()J

    .line 199
    .line 200
    .line 201
    move-result-wide v7

    .line 202
    cmp-long p1, v5, v7

    .line 203
    .line 204
    if-gez p1, :cond_4

    .line 205
    .line 206
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$b;->a:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;

    .line 207
    .line 208
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 209
    .line 210
    .line 211
    move-result-object p1

    .line 212
    invoke-virtual {v3}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->getEndTimeLong()J

    .line 213
    .line 214
    .line 215
    move-result-wide v4

    .line 216
    invoke-static {v4, v5}, Lcom/android/launcher3/widget/custom/ai/n;->T(J)Z

    .line 217
    .line 218
    .line 219
    move-result v4

    .line 220
    if-eqz v4, :cond_3

    .line 221
    .line 222
    move p2, v0

    .line 223
    :cond_3
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object p1

    .line 227
    new-instance p2, Ljava/lang/StringBuilder;

    .line 228
    .line 229
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 230
    .line 231
    .line 232
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$b;->a:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;

    .line 233
    .line 234
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    const v4, 0x7f14005f

    .line 239
    .line 240
    .line 241
    invoke-virtual {v0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object v0

    .line 245
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 249
    .line 250
    invoke-direct {v0, p1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 251
    .line 252
    .line 253
    invoke-virtual {v3}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->getEndTimeLong()J

    .line 254
    .line 255
    .line 256
    move-result-wide v4

    .line 257
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 258
    .line 259
    .line 260
    move-result-object p1

    .line 261
    invoke-virtual {v0, p1}, Ljava/text/SimpleDateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object p1

    .line 265
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 266
    .line 267
    .line 268
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object v4

    .line 272
    :cond_4
    :goto_0
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 273
    .line 274
    .line 275
    move-result p1

    .line 276
    if-eqz p1, :cond_6

    .line 277
    .line 278
    invoke-virtual {v3}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->isAllDay()Z

    .line 279
    .line 280
    .line 281
    move-result p1

    .line 282
    if-eqz p1, :cond_5

    .line 283
    .line 284
    const/16 p1, 0x10

    .line 285
    .line 286
    :goto_1
    move v10, p1

    .line 287
    goto :goto_2

    .line 288
    :cond_5
    const/4 p1, 0x1

    .line 289
    goto :goto_1

    .line 290
    :goto_2
    new-instance v5, Ljava/util/Formatter;

    .line 291
    .line 292
    new-instance p1, Ljava/lang/StringBuilder;

    .line 293
    .line 294
    const/16 p2, 0x32

    .line 295
    .line 296
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 297
    .line 298
    .line 299
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 300
    .line 301
    .line 302
    move-result-object p2

    .line 303
    invoke-direct {v5, p1, p2}, Ljava/util/Formatter;-><init>(Ljava/lang/Appendable;Ljava/util/Locale;)V

    .line 304
    .line 305
    .line 306
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$b;->a:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;

    .line 307
    .line 308
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 309
    .line 310
    .line 311
    move-result-object v4

    .line 312
    invoke-virtual {v3}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->getStartTimeLong()J

    .line 313
    .line 314
    .line 315
    move-result-wide v6

    .line 316
    invoke-virtual {v3}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->getEndTimeLong()J

    .line 317
    .line 318
    .line 319
    move-result-wide v8

    .line 320
    invoke-static {}, Landroid/text/format/Time;->getCurrentTimezone()Ljava/lang/String;

    .line 321
    .line 322
    .line 323
    move-result-object v11

    .line 324
    invoke-static/range {v4 .. v11}, Landroid/text/format/DateUtils;->formatDateRange(Landroid/content/Context;Ljava/util/Formatter;JJILjava/lang/String;)Ljava/util/Formatter;

    .line 325
    .line 326
    .line 327
    move-result-object p0

    .line 328
    invoke-virtual {p0}, Ljava/util/Formatter;->toString()Ljava/lang/String;

    .line 329
    .line 330
    .line 331
    move-result-object p0

    .line 332
    goto :goto_3

    .line 333
    :cond_6
    move-object p0, v4

    .line 334
    :goto_3
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 335
    .line 336
    .line 337
    invoke-static {v3}, Lcom/android/launcher3/widget/custom/ai/n;->M(Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;)Z

    .line 338
    .line 339
    .line 340
    move-result p0

    .line 341
    if-eqz p0, :cond_7

    .line 342
    .line 343
    const p0, 0x7f08074d

    .line 344
    .line 345
    .line 346
    invoke-virtual {v2, p0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 347
    .line 348
    .line 349
    const p0, 0x7f14005a

    .line 350
    .line 351
    .line 352
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(I)V

    .line 353
    .line 354
    .line 355
    return-void

    .line 356
    :cond_7
    invoke-static {v3}, Lcom/android/launcher3/widget/custom/ai/n;->P(Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;)Z

    .line 357
    .line 358
    .line 359
    move-result p0

    .line 360
    if-eqz p0, :cond_f

    .line 361
    .line 362
    const p0, 0x7f08074c

    .line 363
    .line 364
    .line 365
    invoke-virtual {v2, p0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 366
    .line 367
    .line 368
    const p0, 0x7f14005e

    .line 369
    .line 370
    .line 371
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(I)V

    .line 372
    .line 373
    .line 374
    return-void

    .line 375
    :cond_8
    instance-of p1, v3, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;

    .line 376
    .line 377
    if-eqz p1, :cond_e

    .line 378
    .line 379
    check-cast v3, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;

    .line 380
    .line 381
    const p0, 0x7f08074e

    .line 382
    .line 383
    .line 384
    invoke-virtual {v2, p0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 385
    .line 386
    .line 387
    iget-object p0, v3, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;->toStation:Ljava/lang/String;

    .line 388
    .line 389
    iget-object p1, v3, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;->fromTime:Ljava/lang/String;

    .line 390
    .line 391
    const/4 p2, 0x0

    .line 392
    invoke-static {p1, p2}, Lcom/android/launcher3/widget/custom/ai/n;->I(Ljava/lang/String;Z)J

    .line 393
    .line 394
    .line 395
    move-result-wide p1

    .line 396
    const-wide/16 v5, 0x0

    .line 397
    .line 398
    cmp-long v5, p1, v5

    .line 399
    .line 400
    if-lez v5, :cond_a

    .line 401
    .line 402
    invoke-static {p1, p2}, Lcom/android/launcher3/widget/custom/ai/n;->T(J)Z

    .line 403
    .line 404
    .line 405
    move-result v4

    .line 406
    if-eqz v4, :cond_9

    .line 407
    .line 408
    sget-object v4, Lcom/android/launcher3/widget/custom/ai/n;->C:Ljava/text/SimpleDateFormat;

    .line 409
    .line 410
    :goto_4
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 411
    .line 412
    .line 413
    move-result-object v6

    .line 414
    invoke-virtual {v4, v6}, Ljava/text/SimpleDateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 415
    .line 416
    .line 417
    move-result-object v4

    .line 418
    goto :goto_5

    .line 419
    :cond_9
    sget-object v4, Lcom/android/launcher3/widget/custom/ai/n;->F:Ljava/text/SimpleDateFormat;

    .line 420
    .line 421
    goto :goto_4

    .line 422
    :cond_a
    :goto_5
    const-string v6, "train"

    .line 423
    .line 424
    iget-object v7, v3, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;->dataKeyString:Ljava/lang/String;

    .line 425
    .line 426
    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 427
    .line 428
    .line 429
    move-result v6

    .line 430
    if-eqz v6, :cond_b

    .line 431
    .line 432
    const p1, 0x7f080750

    .line 433
    .line 434
    .line 435
    invoke-virtual {v2, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 436
    .line 437
    .line 438
    const-string p1, "\u51fa\u53d1"

    .line 439
    .line 440
    goto :goto_6

    .line 441
    :cond_b
    const-string v6, "hotel"

    .line 442
    .line 443
    iget-object v7, v3, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;->dataKeyString:Ljava/lang/String;

    .line 444
    .line 445
    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 446
    .line 447
    .line 448
    move-result v6

    .line 449
    if-eqz v6, :cond_d

    .line 450
    .line 451
    const p0, 0x7f08074f

    .line 452
    .line 453
    .line 454
    invoke-virtual {v2, p0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 455
    .line 456
    .line 457
    iget-object p0, v3, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;->travelNumber:Ljava/lang/String;

    .line 458
    .line 459
    const-string v2, "\u5165\u4f4f"

    .line 460
    .line 461
    if-lez v5, :cond_c

    .line 462
    .line 463
    sget-object v3, Lcom/android/launcher3/widget/custom/ai/n;->B:Ljava/text/SimpleDateFormat;

    .line 464
    .line 465
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 466
    .line 467
    .line 468
    move-result-object p1

    .line 469
    invoke-virtual {v3, p1}, Ljava/text/SimpleDateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 470
    .line 471
    .line 472
    move-result-object v4

    .line 473
    :cond_c
    move-object p1, v2

    .line 474
    goto :goto_6

    .line 475
    :cond_d
    const-string p1, "\u8d77\u98de"

    .line 476
    .line 477
    :goto_6
    new-instance p2, Ljava/lang/StringBuilder;

    .line 478
    .line 479
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 480
    .line 481
    .line 482
    const-string v2, "\u5230 "

    .line 483
    .line 484
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 485
    .line 486
    .line 487
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 488
    .line 489
    .line 490
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 491
    .line 492
    .line 493
    move-result-object p0

    .line 494
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 495
    .line 496
    .line 497
    new-instance p0, Ljava/lang/StringBuilder;

    .line 498
    .line 499
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 500
    .line 501
    .line 502
    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 503
    .line 504
    .line 505
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 506
    .line 507
    .line 508
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 509
    .line 510
    .line 511
    move-result-object p0

    .line 512
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 513
    .line 514
    .line 515
    return-void

    .line 516
    :cond_e
    instance-of p1, v3, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;

    .line 517
    .line 518
    if-eqz p1, :cond_f

    .line 519
    .line 520
    check-cast v3, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;

    .line 521
    .line 522
    const p1, 0x7f08074a

    .line 523
    .line 524
    .line 525
    invoke-virtual {v2, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 526
    .line 527
    .line 528
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$b;->a:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;

    .line 529
    .line 530
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 531
    .line 532
    .line 533
    move-result-object p0

    .line 534
    const p1, 0x7f140057

    .line 535
    .line 536
    .line 537
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 538
    .line 539
    .line 540
    move-result-object p0

    .line 541
    invoke-static {v3}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;->a(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;)I

    .line 542
    .line 543
    .line 544
    move-result p1

    .line 545
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 546
    .line 547
    .line 548
    move-result-object p1

    .line 549
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 550
    .line 551
    .line 552
    move-result-object p1

    .line 553
    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 554
    .line 555
    .line 556
    move-result-object p0

    .line 557
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 558
    .line 559
    .line 560
    invoke-static {v3}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;->b(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;)Ljava/lang/String;

    .line 561
    .line 562
    .line 563
    move-result-object p0

    .line 564
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 565
    .line 566
    .line 567
    :cond_f
    return-void
.end method

.method public b()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/widget/custom/ai/data/AIWidgetBottomEventData;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$b;->a:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->m(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;)Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c()Landroid/view/ViewGroup;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$b;->a:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic d(Landroid/view/ViewGroup;Ljava/lang/Object;)Landroid/view/View;
    .locals 0

    .line 1
    check-cast p2, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$b;->h(Landroid/view/ViewGroup;Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public f(I)Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$b;->b()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    sget-object p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;->j:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$b;->b()Ljava/util/ArrayList;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->o(Ljava/lang/Object;)Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public bridge synthetic getItemViewType(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$b;->f(I)Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public h(Landroid/view/ViewGroup;Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;)Landroid/view/View;
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;->j:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-ne p2, v0, :cond_0

    .line 5
    .line 6
    iget-object p2, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$b;->a:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;

    .line 7
    .line 8
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    const v0, 0x7f0e0042

    .line 17
    .line 18
    .line 19
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object p2, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$b;->a:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;

    .line 25
    .line 26
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    const v0, 0x7f0e0041

    .line 35
    .line 36
    .line 37
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    :goto_0
    new-instance p2, Lcom/android/launcher3/widget/custom/ai/j;

    .line 42
    .line 43
    invoke-direct {p2, p0}, Lcom/android/launcher3/widget/custom/ai/j;-><init>(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$b;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 47
    .line 48
    .line 49
    return-object p1
.end method
