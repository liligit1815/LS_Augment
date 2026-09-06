.class Landroidx/core/app/j;
.super Ljava/lang/Object;
.source "NotificationCompatBuilder.java"

# interfaces
.implements Landroidx/core/app/h;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/core/app/j$e;,
        Landroidx/core/app/j$c;,
        Landroidx/core/app/j$a;,
        Landroidx/core/app/j$b;,
        Landroidx/core/app/j$d;,
        Landroidx/core/app/j$f;,
        Landroidx/core/app/j$g;,
        Landroidx/core/app/j$h;
    }
.end annotation


# instance fields
.field private final a:Landroid/content/Context;

.field private final b:Landroid/app/Notification$Builder;

.field private final c:Landroidx/core/app/i$d;

.field private d:Landroid/widget/RemoteViews;

.field private e:Landroid/widget/RemoteViews;

.field private final f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/os/Bundle;",
            ">;"
        }
    .end annotation
.end field

.field private final g:Landroid/os/Bundle;

.field private h:I

.field private i:Landroid/widget/RemoteViews;


# direct methods
.method constructor <init>(Landroidx/core/app/i$d;)V
    .locals 12

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Landroidx/core/app/j;->f:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Landroid/os/Bundle;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Landroidx/core/app/j;->g:Landroid/os/Bundle;

    .line 17
    .line 18
    iput-object p1, p0, Landroidx/core/app/j;->c:Landroidx/core/app/i$d;

    .line 19
    .line 20
    iget-object v0, p1, Landroidx/core/app/i$d;->a:Landroid/content/Context;

    .line 21
    .line 22
    iput-object v0, p0, Landroidx/core/app/j;->a:Landroid/content/Context;

    .line 23
    .line 24
    iget-object v1, p1, Landroidx/core/app/i$d;->K:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v0, v1}, Landroidx/core/app/j$e;->a(Landroid/content/Context;Ljava/lang/String;)Landroid/app/Notification$Builder;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iput-object v1, p0, Landroidx/core/app/j;->b:Landroid/app/Notification$Builder;

    .line 31
    .line 32
    iget-object v2, p1, Landroidx/core/app/i$d;->R:Landroid/app/Notification;

    .line 33
    .line 34
    iget-wide v3, v2, Landroid/app/Notification;->when:J

    .line 35
    .line 36
    invoke-virtual {v1, v3, v4}, Landroid/app/Notification$Builder;->setWhen(J)Landroid/app/Notification$Builder;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    iget v4, v2, Landroid/app/Notification;->icon:I

    .line 41
    .line 42
    iget v5, v2, Landroid/app/Notification;->iconLevel:I

    .line 43
    .line 44
    invoke-virtual {v3, v4, v5}, Landroid/app/Notification$Builder;->setSmallIcon(II)Landroid/app/Notification$Builder;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    iget-object v4, v2, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    .line 49
    .line 50
    invoke-virtual {v3, v4}, Landroid/app/Notification$Builder;->setContent(Landroid/widget/RemoteViews;)Landroid/app/Notification$Builder;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    iget-object v4, v2, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    .line 55
    .line 56
    iget-object v5, p1, Landroidx/core/app/i$d;->i:Landroid/widget/RemoteViews;

    .line 57
    .line 58
    invoke-virtual {v3, v4, v5}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;Landroid/widget/RemoteViews;)Landroid/app/Notification$Builder;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    iget-object v4, v2, Landroid/app/Notification;->vibrate:[J

    .line 63
    .line 64
    invoke-virtual {v3, v4}, Landroid/app/Notification$Builder;->setVibrate([J)Landroid/app/Notification$Builder;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    iget v4, v2, Landroid/app/Notification;->ledARGB:I

    .line 69
    .line 70
    iget v5, v2, Landroid/app/Notification;->ledOnMS:I

    .line 71
    .line 72
    iget v6, v2, Landroid/app/Notification;->ledOffMS:I

    .line 73
    .line 74
    invoke-virtual {v3, v4, v5, v6}, Landroid/app/Notification$Builder;->setLights(III)Landroid/app/Notification$Builder;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    iget v4, v2, Landroid/app/Notification;->flags:I

    .line 79
    .line 80
    const/4 v5, 0x2

    .line 81
    and-int/2addr v4, v5

    .line 82
    const/4 v6, 0x1

    .line 83
    const/4 v7, 0x0

    .line 84
    if-eqz v4, :cond_0

    .line 85
    .line 86
    move v4, v6

    .line 87
    goto :goto_0

    .line 88
    :cond_0
    move v4, v7

    .line 89
    :goto_0
    invoke-virtual {v3, v4}, Landroid/app/Notification$Builder;->setOngoing(Z)Landroid/app/Notification$Builder;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    iget v4, v2, Landroid/app/Notification;->flags:I

    .line 94
    .line 95
    and-int/lit8 v4, v4, 0x8

    .line 96
    .line 97
    if-eqz v4, :cond_1

    .line 98
    .line 99
    move v4, v6

    .line 100
    goto :goto_1

    .line 101
    :cond_1
    move v4, v7

    .line 102
    :goto_1
    invoke-virtual {v3, v4}, Landroid/app/Notification$Builder;->setOnlyAlertOnce(Z)Landroid/app/Notification$Builder;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    iget v4, v2, Landroid/app/Notification;->flags:I

    .line 107
    .line 108
    and-int/lit8 v4, v4, 0x10

    .line 109
    .line 110
    if-eqz v4, :cond_2

    .line 111
    .line 112
    move v4, v6

    .line 113
    goto :goto_2

    .line 114
    :cond_2
    move v4, v7

    .line 115
    :goto_2
    invoke-virtual {v3, v4}, Landroid/app/Notification$Builder;->setAutoCancel(Z)Landroid/app/Notification$Builder;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    iget v4, v2, Landroid/app/Notification;->defaults:I

    .line 120
    .line 121
    invoke-virtual {v3, v4}, Landroid/app/Notification$Builder;->setDefaults(I)Landroid/app/Notification$Builder;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    iget-object v4, p1, Landroidx/core/app/i$d;->e:Ljava/lang/CharSequence;

    .line 126
    .line 127
    invoke-virtual {v3, v4}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    iget-object v4, p1, Landroidx/core/app/i$d;->f:Ljava/lang/CharSequence;

    .line 132
    .line 133
    invoke-virtual {v3, v4}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 134
    .line 135
    .line 136
    move-result-object v3

    .line 137
    iget-object v4, p1, Landroidx/core/app/i$d;->k:Ljava/lang/CharSequence;

    .line 138
    .line 139
    invoke-virtual {v3, v4}, Landroid/app/Notification$Builder;->setContentInfo(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    iget-object v4, p1, Landroidx/core/app/i$d;->g:Landroid/app/PendingIntent;

    .line 144
    .line 145
    invoke-virtual {v3, v4}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    .line 146
    .line 147
    .line 148
    move-result-object v3

    .line 149
    iget-object v4, v2, Landroid/app/Notification;->deleteIntent:Landroid/app/PendingIntent;

    .line 150
    .line 151
    invoke-virtual {v3, v4}, Landroid/app/Notification$Builder;->setDeleteIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    iget-object v4, p1, Landroidx/core/app/i$d;->h:Landroid/app/PendingIntent;

    .line 156
    .line 157
    iget v8, v2, Landroid/app/Notification;->flags:I

    .line 158
    .line 159
    and-int/lit16 v8, v8, 0x80

    .line 160
    .line 161
    if-eqz v8, :cond_3

    .line 162
    .line 163
    move v8, v6

    .line 164
    goto :goto_3

    .line 165
    :cond_3
    move v8, v7

    .line 166
    :goto_3
    invoke-virtual {v3, v4, v8}, Landroid/app/Notification$Builder;->setFullScreenIntent(Landroid/app/PendingIntent;Z)Landroid/app/Notification$Builder;

    .line 167
    .line 168
    .line 169
    move-result-object v3

    .line 170
    iget v4, p1, Landroidx/core/app/i$d;->l:I

    .line 171
    .line 172
    invoke-virtual {v3, v4}, Landroid/app/Notification$Builder;->setNumber(I)Landroid/app/Notification$Builder;

    .line 173
    .line 174
    .line 175
    move-result-object v3

    .line 176
    iget v4, p1, Landroidx/core/app/i$d;->t:I

    .line 177
    .line 178
    iget v8, p1, Landroidx/core/app/i$d;->u:I

    .line 179
    .line 180
    iget-boolean v9, p1, Landroidx/core/app/i$d;->v:Z

    .line 181
    .line 182
    invoke-virtual {v3, v4, v8, v9}, Landroid/app/Notification$Builder;->setProgress(IIZ)Landroid/app/Notification$Builder;

    .line 183
    .line 184
    .line 185
    iget-object v3, p1, Landroidx/core/app/i$d;->j:Landroidx/core/graphics/drawable/IconCompat;

    .line 186
    .line 187
    const/4 v4, 0x0

    .line 188
    if-nez v3, :cond_4

    .line 189
    .line 190
    move-object v0, v4

    .line 191
    goto :goto_4

    .line 192
    :cond_4
    invoke-virtual {v3, v0}, Landroidx/core/graphics/drawable/IconCompat;->n(Landroid/content/Context;)Landroid/graphics/drawable/Icon;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    :goto_4
    invoke-static {v1, v0}, Landroidx/core/app/j$c;->b(Landroid/app/Notification$Builder;Landroid/graphics/drawable/Icon;)Landroid/app/Notification$Builder;

    .line 197
    .line 198
    .line 199
    iget-object v0, p1, Landroidx/core/app/i$d;->q:Ljava/lang/CharSequence;

    .line 200
    .line 201
    invoke-virtual {v1, v0}, Landroid/app/Notification$Builder;->setSubText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    iget-boolean v1, p1, Landroidx/core/app/i$d;->o:Z

    .line 206
    .line 207
    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setUsesChronometer(Z)Landroid/app/Notification$Builder;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    iget v1, p1, Landroidx/core/app/i$d;->m:I

    .line 212
    .line 213
    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setPriority(I)Landroid/app/Notification$Builder;

    .line 214
    .line 215
    .line 216
    iget-object v0, p1, Landroidx/core/app/i$d;->p:Landroidx/core/app/i$f;

    .line 217
    .line 218
    instance-of v1, v0, Landroidx/core/app/i$e;

    .line 219
    .line 220
    if-eqz v1, :cond_5

    .line 221
    .line 222
    check-cast v0, Landroidx/core/app/i$e;

    .line 223
    .line 224
    invoke-virtual {v0}, Landroidx/core/app/i$e;->h()Ljava/util/ArrayList;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    :goto_5
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 233
    .line 234
    .line 235
    move-result v1

    .line 236
    if-eqz v1, :cond_6

    .line 237
    .line 238
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 239
    .line 240
    .line 241
    move-result-object v1

    .line 242
    check-cast v1, Landroidx/core/app/i$a;

    .line 243
    .line 244
    invoke-direct {p0, v1}, Landroidx/core/app/j;->b(Landroidx/core/app/i$a;)V

    .line 245
    .line 246
    .line 247
    goto :goto_5

    .line 248
    :cond_5
    iget-object v0, p1, Landroidx/core/app/i$d;->b:Ljava/util/ArrayList;

    .line 249
    .line 250
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 251
    .line 252
    .line 253
    move-result-object v0

    .line 254
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 255
    .line 256
    .line 257
    move-result v1

    .line 258
    if-eqz v1, :cond_6

    .line 259
    .line 260
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 261
    .line 262
    .line 263
    move-result-object v1

    .line 264
    check-cast v1, Landroidx/core/app/i$a;

    .line 265
    .line 266
    invoke-direct {p0, v1}, Landroidx/core/app/j;->b(Landroidx/core/app/i$a;)V

    .line 267
    .line 268
    .line 269
    goto :goto_6

    .line 270
    :cond_6
    iget-object v0, p1, Landroidx/core/app/i$d;->D:Landroid/os/Bundle;

    .line 271
    .line 272
    if-eqz v0, :cond_7

    .line 273
    .line 274
    iget-object v1, p0, Landroidx/core/app/j;->g:Landroid/os/Bundle;

    .line 275
    .line 276
    invoke-virtual {v1, v0}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    .line 277
    .line 278
    .line 279
    :cond_7
    iget-object v0, p1, Landroidx/core/app/i$d;->H:Landroid/widget/RemoteViews;

    .line 280
    .line 281
    iput-object v0, p0, Landroidx/core/app/j;->d:Landroid/widget/RemoteViews;

    .line 282
    .line 283
    iget-object v0, p1, Landroidx/core/app/i$d;->I:Landroid/widget/RemoteViews;

    .line 284
    .line 285
    iput-object v0, p0, Landroidx/core/app/j;->e:Landroid/widget/RemoteViews;

    .line 286
    .line 287
    iget-object v0, p0, Landroidx/core/app/j;->b:Landroid/app/Notification$Builder;

    .line 288
    .line 289
    iget-boolean v1, p1, Landroidx/core/app/i$d;->n:Z

    .line 290
    .line 291
    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setShowWhen(Z)Landroid/app/Notification$Builder;

    .line 292
    .line 293
    .line 294
    iget-object v0, p0, Landroidx/core/app/j;->b:Landroid/app/Notification$Builder;

    .line 295
    .line 296
    iget-boolean v1, p1, Landroidx/core/app/i$d;->z:Z

    .line 297
    .line 298
    invoke-static {v0, v1}, Landroidx/core/app/j$a;->g(Landroid/app/Notification$Builder;Z)Landroid/app/Notification$Builder;

    .line 299
    .line 300
    .line 301
    iget-object v0, p0, Landroidx/core/app/j;->b:Landroid/app/Notification$Builder;

    .line 302
    .line 303
    iget-object v1, p1, Landroidx/core/app/i$d;->w:Ljava/lang/String;

    .line 304
    .line 305
    invoke-static {v0, v1}, Landroidx/core/app/j$a;->e(Landroid/app/Notification$Builder;Ljava/lang/String;)Landroid/app/Notification$Builder;

    .line 306
    .line 307
    .line 308
    iget-object v0, p0, Landroidx/core/app/j;->b:Landroid/app/Notification$Builder;

    .line 309
    .line 310
    iget-object v1, p1, Landroidx/core/app/i$d;->y:Ljava/lang/String;

    .line 311
    .line 312
    invoke-static {v0, v1}, Landroidx/core/app/j$a;->h(Landroid/app/Notification$Builder;Ljava/lang/String;)Landroid/app/Notification$Builder;

    .line 313
    .line 314
    .line 315
    iget-object v0, p0, Landroidx/core/app/j;->b:Landroid/app/Notification$Builder;

    .line 316
    .line 317
    iget-boolean v1, p1, Landroidx/core/app/i$d;->x:Z

    .line 318
    .line 319
    invoke-static {v0, v1}, Landroidx/core/app/j$a;->f(Landroid/app/Notification$Builder;Z)Landroid/app/Notification$Builder;

    .line 320
    .line 321
    .line 322
    iget v0, p1, Landroidx/core/app/i$d;->O:I

    .line 323
    .line 324
    iput v0, p0, Landroidx/core/app/j;->h:I

    .line 325
    .line 326
    iget-object v0, p0, Landroidx/core/app/j;->b:Landroid/app/Notification$Builder;

    .line 327
    .line 328
    iget-object v1, p1, Landroidx/core/app/i$d;->C:Ljava/lang/String;

    .line 329
    .line 330
    invoke-static {v0, v1}, Landroidx/core/app/j$b;->b(Landroid/app/Notification$Builder;Ljava/lang/String;)Landroid/app/Notification$Builder;

    .line 331
    .line 332
    .line 333
    iget-object v0, p0, Landroidx/core/app/j;->b:Landroid/app/Notification$Builder;

    .line 334
    .line 335
    iget v1, p1, Landroidx/core/app/i$d;->E:I

    .line 336
    .line 337
    invoke-static {v0, v1}, Landroidx/core/app/j$b;->c(Landroid/app/Notification$Builder;I)Landroid/app/Notification$Builder;

    .line 338
    .line 339
    .line 340
    iget-object v0, p0, Landroidx/core/app/j;->b:Landroid/app/Notification$Builder;

    .line 341
    .line 342
    iget v1, p1, Landroidx/core/app/i$d;->F:I

    .line 343
    .line 344
    invoke-static {v0, v1}, Landroidx/core/app/j$b;->f(Landroid/app/Notification$Builder;I)Landroid/app/Notification$Builder;

    .line 345
    .line 346
    .line 347
    iget-object v0, p0, Landroidx/core/app/j;->b:Landroid/app/Notification$Builder;

    .line 348
    .line 349
    iget-object v1, p1, Landroidx/core/app/i$d;->G:Landroid/app/Notification;

    .line 350
    .line 351
    invoke-static {v0, v1}, Landroidx/core/app/j$b;->d(Landroid/app/Notification$Builder;Landroid/app/Notification;)Landroid/app/Notification$Builder;

    .line 352
    .line 353
    .line 354
    iget-object v0, p0, Landroidx/core/app/j;->b:Landroid/app/Notification$Builder;

    .line 355
    .line 356
    iget-object v1, v2, Landroid/app/Notification;->sound:Landroid/net/Uri;

    .line 357
    .line 358
    iget-object v3, v2, Landroid/app/Notification;->audioAttributes:Landroid/media/AudioAttributes;

    .line 359
    .line 360
    invoke-static {v0, v1, v3}, Landroidx/core/app/j$b;->e(Landroid/app/Notification$Builder;Landroid/net/Uri;Ljava/lang/Object;)Landroid/app/Notification$Builder;

    .line 361
    .line 362
    .line 363
    iget-object v0, p1, Landroidx/core/app/i$d;->U:Ljava/util/ArrayList;

    .line 364
    .line 365
    if-eqz v0, :cond_8

    .line 366
    .line 367
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 368
    .line 369
    .line 370
    move-result v1

    .line 371
    if-nez v1, :cond_8

    .line 372
    .line 373
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 374
    .line 375
    .line 376
    move-result-object v0

    .line 377
    :goto_7
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 378
    .line 379
    .line 380
    move-result v1

    .line 381
    if-eqz v1, :cond_8

    .line 382
    .line 383
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 384
    .line 385
    .line 386
    move-result-object v1

    .line 387
    check-cast v1, Ljava/lang/String;

    .line 388
    .line 389
    iget-object v3, p0, Landroidx/core/app/j;->b:Landroid/app/Notification$Builder;

    .line 390
    .line 391
    invoke-static {v3, v1}, Landroidx/core/app/j$b;->a(Landroid/app/Notification$Builder;Ljava/lang/String;)Landroid/app/Notification$Builder;

    .line 392
    .line 393
    .line 394
    goto :goto_7

    .line 395
    :cond_8
    iget-object v0, p1, Landroidx/core/app/i$d;->J:Landroid/widget/RemoteViews;

    .line 396
    .line 397
    iput-object v0, p0, Landroidx/core/app/j;->i:Landroid/widget/RemoteViews;

    .line 398
    .line 399
    iget-object v0, p1, Landroidx/core/app/i$d;->d:Ljava/util/ArrayList;

    .line 400
    .line 401
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 402
    .line 403
    .line 404
    move-result v0

    .line 405
    if-lez v0, :cond_b

    .line 406
    .line 407
    invoke-virtual {p1}, Landroidx/core/app/i$d;->c()Landroid/os/Bundle;

    .line 408
    .line 409
    .line 410
    move-result-object v0

    .line 411
    const-string v1, "android.car.EXTENSIONS"

    .line 412
    .line 413
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 414
    .line 415
    .line 416
    move-result-object v0

    .line 417
    if-nez v0, :cond_9

    .line 418
    .line 419
    new-instance v0, Landroid/os/Bundle;

    .line 420
    .line 421
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 422
    .line 423
    .line 424
    :cond_9
    new-instance v3, Landroid/os/Bundle;

    .line 425
    .line 426
    invoke-direct {v3, v0}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    .line 427
    .line 428
    .line 429
    new-instance v8, Landroid/os/Bundle;

    .line 430
    .line 431
    invoke-direct {v8}, Landroid/os/Bundle;-><init>()V

    .line 432
    .line 433
    .line 434
    move v9, v7

    .line 435
    :goto_8
    iget-object v10, p1, Landroidx/core/app/i$d;->d:Ljava/util/ArrayList;

    .line 436
    .line 437
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    .line 438
    .line 439
    .line 440
    move-result v10

    .line 441
    if-ge v9, v10, :cond_a

    .line 442
    .line 443
    invoke-static {v9}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 444
    .line 445
    .line 446
    move-result-object v10

    .line 447
    iget-object v11, p1, Landroidx/core/app/i$d;->d:Ljava/util/ArrayList;

    .line 448
    .line 449
    invoke-virtual {v11, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 450
    .line 451
    .line 452
    move-result-object v11

    .line 453
    check-cast v11, Landroidx/core/app/i$a;

    .line 454
    .line 455
    invoke-static {v11}, Landroidx/core/app/k;->a(Landroidx/core/app/i$a;)Landroid/os/Bundle;

    .line 456
    .line 457
    .line 458
    move-result-object v11

    .line 459
    invoke-virtual {v8, v10, v11}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 460
    .line 461
    .line 462
    add-int/lit8 v9, v9, 0x1

    .line 463
    .line 464
    goto :goto_8

    .line 465
    :cond_a
    const-string v9, "invisible_actions"

    .line 466
    .line 467
    invoke-virtual {v0, v9, v8}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 468
    .line 469
    .line 470
    invoke-virtual {v3, v9, v8}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 471
    .line 472
    .line 473
    invoke-virtual {p1}, Landroidx/core/app/i$d;->c()Landroid/os/Bundle;

    .line 474
    .line 475
    .line 476
    move-result-object v8

    .line 477
    invoke-virtual {v8, v1, v0}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 478
    .line 479
    .line 480
    iget-object v0, p0, Landroidx/core/app/j;->g:Landroid/os/Bundle;

    .line 481
    .line 482
    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 483
    .line 484
    .line 485
    :cond_b
    iget-object v0, p1, Landroidx/core/app/i$d;->T:Ljava/lang/Object;

    .line 486
    .line 487
    if-eqz v0, :cond_c

    .line 488
    .line 489
    iget-object v1, p0, Landroidx/core/app/j;->b:Landroid/app/Notification$Builder;

    .line 490
    .line 491
    invoke-static {v1, v0}, Landroidx/core/app/j$c;->c(Landroid/app/Notification$Builder;Ljava/lang/Object;)Landroid/app/Notification$Builder;

    .line 492
    .line 493
    .line 494
    :cond_c
    iget-object v0, p0, Landroidx/core/app/j;->b:Landroid/app/Notification$Builder;

    .line 495
    .line 496
    iget-object v1, p1, Landroidx/core/app/i$d;->D:Landroid/os/Bundle;

    .line 497
    .line 498
    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setExtras(Landroid/os/Bundle;)Landroid/app/Notification$Builder;

    .line 499
    .line 500
    .line 501
    iget-object v0, p0, Landroidx/core/app/j;->b:Landroid/app/Notification$Builder;

    .line 502
    .line 503
    iget-object v1, p1, Landroidx/core/app/i$d;->s:[Ljava/lang/CharSequence;

    .line 504
    .line 505
    invoke-static {v0, v1}, Landroidx/core/app/j$d;->e(Landroid/app/Notification$Builder;[Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 506
    .line 507
    .line 508
    iget-object v0, p1, Landroidx/core/app/i$d;->H:Landroid/widget/RemoteViews;

    .line 509
    .line 510
    if-eqz v0, :cond_d

    .line 511
    .line 512
    iget-object v1, p0, Landroidx/core/app/j;->b:Landroid/app/Notification$Builder;

    .line 513
    .line 514
    invoke-static {v1, v0}, Landroidx/core/app/j$d;->c(Landroid/app/Notification$Builder;Landroid/widget/RemoteViews;)Landroid/app/Notification$Builder;

    .line 515
    .line 516
    .line 517
    :cond_d
    iget-object v0, p1, Landroidx/core/app/i$d;->I:Landroid/widget/RemoteViews;

    .line 518
    .line 519
    if-eqz v0, :cond_e

    .line 520
    .line 521
    iget-object v1, p0, Landroidx/core/app/j;->b:Landroid/app/Notification$Builder;

    .line 522
    .line 523
    invoke-static {v1, v0}, Landroidx/core/app/j$d;->b(Landroid/app/Notification$Builder;Landroid/widget/RemoteViews;)Landroid/app/Notification$Builder;

    .line 524
    .line 525
    .line 526
    :cond_e
    iget-object v0, p1, Landroidx/core/app/i$d;->J:Landroid/widget/RemoteViews;

    .line 527
    .line 528
    if-eqz v0, :cond_f

    .line 529
    .line 530
    iget-object v1, p0, Landroidx/core/app/j;->b:Landroid/app/Notification$Builder;

    .line 531
    .line 532
    invoke-static {v1, v0}, Landroidx/core/app/j$d;->d(Landroid/app/Notification$Builder;Landroid/widget/RemoteViews;)Landroid/app/Notification$Builder;

    .line 533
    .line 534
    .line 535
    :cond_f
    iget-object v0, p0, Landroidx/core/app/j;->b:Landroid/app/Notification$Builder;

    .line 536
    .line 537
    iget v1, p1, Landroidx/core/app/i$d;->L:I

    .line 538
    .line 539
    invoke-static {v0, v1}, Landroidx/core/app/j$e;->b(Landroid/app/Notification$Builder;I)Landroid/app/Notification$Builder;

    .line 540
    .line 541
    .line 542
    iget-object v0, p0, Landroidx/core/app/j;->b:Landroid/app/Notification$Builder;

    .line 543
    .line 544
    iget-object v1, p1, Landroidx/core/app/i$d;->r:Ljava/lang/CharSequence;

    .line 545
    .line 546
    invoke-static {v0, v1}, Landroidx/core/app/j$e;->e(Landroid/app/Notification$Builder;Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 547
    .line 548
    .line 549
    iget-object v0, p0, Landroidx/core/app/j;->b:Landroid/app/Notification$Builder;

    .line 550
    .line 551
    iget-object v1, p1, Landroidx/core/app/i$d;->M:Ljava/lang/String;

    .line 552
    .line 553
    invoke-static {v0, v1}, Landroidx/core/app/j$e;->f(Landroid/app/Notification$Builder;Ljava/lang/String;)Landroid/app/Notification$Builder;

    .line 554
    .line 555
    .line 556
    iget-object v0, p0, Landroidx/core/app/j;->b:Landroid/app/Notification$Builder;

    .line 557
    .line 558
    iget-wide v8, p1, Landroidx/core/app/i$d;->N:J

    .line 559
    .line 560
    invoke-static {v0, v8, v9}, Landroidx/core/app/j$e;->g(Landroid/app/Notification$Builder;J)Landroid/app/Notification$Builder;

    .line 561
    .line 562
    .line 563
    iget-object v0, p0, Landroidx/core/app/j;->b:Landroid/app/Notification$Builder;

    .line 564
    .line 565
    iget v1, p1, Landroidx/core/app/i$d;->O:I

    .line 566
    .line 567
    invoke-static {v0, v1}, Landroidx/core/app/j$e;->d(Landroid/app/Notification$Builder;I)Landroid/app/Notification$Builder;

    .line 568
    .line 569
    .line 570
    iget-boolean v0, p1, Landroidx/core/app/i$d;->B:Z

    .line 571
    .line 572
    if-eqz v0, :cond_10

    .line 573
    .line 574
    iget-object v0, p0, Landroidx/core/app/j;->b:Landroid/app/Notification$Builder;

    .line 575
    .line 576
    iget-boolean v1, p1, Landroidx/core/app/i$d;->A:Z

    .line 577
    .line 578
    invoke-static {v0, v1}, Landroidx/core/app/j$e;->c(Landroid/app/Notification$Builder;Z)Landroid/app/Notification$Builder;

    .line 579
    .line 580
    .line 581
    :cond_10
    iget-object v0, p1, Landroidx/core/app/i$d;->K:Ljava/lang/String;

    .line 582
    .line 583
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 584
    .line 585
    .line 586
    move-result v0

    .line 587
    if-nez v0, :cond_11

    .line 588
    .line 589
    iget-object v0, p0, Landroidx/core/app/j;->b:Landroid/app/Notification$Builder;

    .line 590
    .line 591
    invoke-virtual {v0, v4}, Landroid/app/Notification$Builder;->setSound(Landroid/net/Uri;)Landroid/app/Notification$Builder;

    .line 592
    .line 593
    .line 594
    move-result-object v0

    .line 595
    invoke-virtual {v0, v7}, Landroid/app/Notification$Builder;->setDefaults(I)Landroid/app/Notification$Builder;

    .line 596
    .line 597
    .line 598
    move-result-object v0

    .line 599
    invoke-virtual {v0, v7, v7, v7}, Landroid/app/Notification$Builder;->setLights(III)Landroid/app/Notification$Builder;

    .line 600
    .line 601
    .line 602
    move-result-object v0

    .line 603
    invoke-virtual {v0, v4}, Landroid/app/Notification$Builder;->setVibrate([J)Landroid/app/Notification$Builder;

    .line 604
    .line 605
    .line 606
    :cond_11
    iget-object v0, p1, Landroidx/core/app/i$d;->c:Ljava/util/ArrayList;

    .line 607
    .line 608
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 609
    .line 610
    .line 611
    move-result-object v0

    .line 612
    :goto_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 613
    .line 614
    .line 615
    move-result v1

    .line 616
    if-eqz v1, :cond_12

    .line 617
    .line 618
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 619
    .line 620
    .line 621
    move-result-object v1

    .line 622
    check-cast v1, Landroidx/core/app/o;

    .line 623
    .line 624
    iget-object v3, p0, Landroidx/core/app/j;->b:Landroid/app/Notification$Builder;

    .line 625
    .line 626
    invoke-virtual {v1}, Landroidx/core/app/o;->g()Landroid/app/Person;

    .line 627
    .line 628
    .line 629
    move-result-object v1

    .line 630
    invoke-static {v3, v1}, Landroidx/core/app/j$f;->a(Landroid/app/Notification$Builder;Landroid/app/Person;)Landroid/app/Notification$Builder;

    .line 631
    .line 632
    .line 633
    goto :goto_9

    .line 634
    :cond_12
    iget-object v0, p0, Landroidx/core/app/j;->b:Landroid/app/Notification$Builder;

    .line 635
    .line 636
    iget-boolean v1, p1, Landroidx/core/app/i$d;->Q:Z

    .line 637
    .line 638
    invoke-static {v0, v1}, Landroidx/core/app/j$g;->a(Landroid/app/Notification$Builder;Z)Landroid/app/Notification$Builder;

    .line 639
    .line 640
    .line 641
    iget-object v0, p0, Landroidx/core/app/j;->b:Landroid/app/Notification$Builder;

    .line 642
    .line 643
    invoke-static {v4}, Landroidx/core/app/i$c;->a(Landroidx/core/app/i$c;)Landroid/app/Notification$BubbleMetadata;

    .line 644
    .line 645
    .line 646
    move-result-object v1

    .line 647
    invoke-static {v0, v1}, Landroidx/core/app/j$g;->b(Landroid/app/Notification$Builder;Landroid/app/Notification$BubbleMetadata;)Landroid/app/Notification$Builder;

    .line 648
    .line 649
    .line 650
    iget v0, p1, Landroidx/core/app/i$d;->P:I

    .line 651
    .line 652
    if-eqz v0, :cond_13

    .line 653
    .line 654
    iget-object v1, p0, Landroidx/core/app/j;->b:Landroid/app/Notification$Builder;

    .line 655
    .line 656
    invoke-static {v1, v0}, Landroidx/core/app/j$h;->b(Landroid/app/Notification$Builder;I)Landroid/app/Notification$Builder;

    .line 657
    .line 658
    .line 659
    :cond_13
    iget-boolean p1, p1, Landroidx/core/app/i$d;->S:Z

    .line 660
    .line 661
    if-eqz p1, :cond_16

    .line 662
    .line 663
    iget-object p1, p0, Landroidx/core/app/j;->c:Landroidx/core/app/i$d;

    .line 664
    .line 665
    iget-boolean p1, p1, Landroidx/core/app/i$d;->x:Z

    .line 666
    .line 667
    if-eqz p1, :cond_14

    .line 668
    .line 669
    iput v5, p0, Landroidx/core/app/j;->h:I

    .line 670
    .line 671
    goto :goto_a

    .line 672
    :cond_14
    iput v6, p0, Landroidx/core/app/j;->h:I

    .line 673
    .line 674
    :goto_a
    iget-object p1, p0, Landroidx/core/app/j;->b:Landroid/app/Notification$Builder;

    .line 675
    .line 676
    invoke-virtual {p1, v4}, Landroid/app/Notification$Builder;->setVibrate([J)Landroid/app/Notification$Builder;

    .line 677
    .line 678
    .line 679
    iget-object p1, p0, Landroidx/core/app/j;->b:Landroid/app/Notification$Builder;

    .line 680
    .line 681
    invoke-virtual {p1, v4}, Landroid/app/Notification$Builder;->setSound(Landroid/net/Uri;)Landroid/app/Notification$Builder;

    .line 682
    .line 683
    .line 684
    iget p1, v2, Landroid/app/Notification;->defaults:I

    .line 685
    .line 686
    and-int/lit8 p1, p1, -0x4

    .line 687
    .line 688
    iput p1, v2, Landroid/app/Notification;->defaults:I

    .line 689
    .line 690
    iget-object v0, p0, Landroidx/core/app/j;->b:Landroid/app/Notification$Builder;

    .line 691
    .line 692
    invoke-virtual {v0, p1}, Landroid/app/Notification$Builder;->setDefaults(I)Landroid/app/Notification$Builder;

    .line 693
    .line 694
    .line 695
    iget-object p1, p0, Landroidx/core/app/j;->c:Landroidx/core/app/i$d;

    .line 696
    .line 697
    iget-object p1, p1, Landroidx/core/app/i$d;->w:Ljava/lang/String;

    .line 698
    .line 699
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 700
    .line 701
    .line 702
    move-result p1

    .line 703
    if-eqz p1, :cond_15

    .line 704
    .line 705
    iget-object p1, p0, Landroidx/core/app/j;->b:Landroid/app/Notification$Builder;

    .line 706
    .line 707
    const-string v0, "silent"

    .line 708
    .line 709
    invoke-static {p1, v0}, Landroidx/core/app/j$a;->e(Landroid/app/Notification$Builder;Ljava/lang/String;)Landroid/app/Notification$Builder;

    .line 710
    .line 711
    .line 712
    :cond_15
    iget-object p1, p0, Landroidx/core/app/j;->b:Landroid/app/Notification$Builder;

    .line 713
    .line 714
    iget p0, p0, Landroidx/core/app/j;->h:I

    .line 715
    .line 716
    invoke-static {p1, p0}, Landroidx/core/app/j$e;->d(Landroid/app/Notification$Builder;I)Landroid/app/Notification$Builder;

    .line 717
    .line 718
    .line 719
    :cond_16
    return-void
.end method

.method private b(Landroidx/core/app/i$a;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroidx/core/app/i$a;->d()Landroidx/core/graphics/drawable/IconCompat;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Landroidx/core/graphics/drawable/IconCompat;->m()Landroid/graphics/drawable/Icon;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    :goto_0
    invoke-virtual {p1}, Landroidx/core/app/i$a;->h()Ljava/lang/CharSequence;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p1}, Landroidx/core/app/i$a;->a()Landroid/app/PendingIntent;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-static {v0, v1, v2}, Landroidx/core/app/j$c;->a(Landroid/graphics/drawable/Icon;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)Landroid/app/Notification$Action$Builder;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p1}, Landroidx/core/app/i$a;->e()[Landroidx/core/app/q;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    invoke-virtual {p1}, Landroidx/core/app/i$a;->e()[Landroidx/core/app/q;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-static {v1}, Landroidx/core/app/q;->b([Landroidx/core/app/q;)[Landroid/app/RemoteInput;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    array-length v2, v1

    .line 40
    const/4 v3, 0x0

    .line 41
    :goto_1
    if-ge v3, v2, :cond_1

    .line 42
    .line 43
    aget-object v4, v1, v3

    .line 44
    .line 45
    invoke-static {v0, v4}, Landroidx/core/app/j$a;->c(Landroid/app/Notification$Action$Builder;Landroid/app/RemoteInput;)Landroid/app/Notification$Action$Builder;

    .line 46
    .line 47
    .line 48
    add-int/lit8 v3, v3, 0x1

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_1
    invoke-virtual {p1}, Landroidx/core/app/i$a;->c()Landroid/os/Bundle;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    if-eqz v1, :cond_2

    .line 56
    .line 57
    new-instance v1, Landroid/os/Bundle;

    .line 58
    .line 59
    invoke-virtual {p1}, Landroidx/core/app/i$a;->c()Landroid/os/Bundle;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-direct {v1, v2}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    .line 64
    .line 65
    .line 66
    goto :goto_2

    .line 67
    :cond_2
    new-instance v1, Landroid/os/Bundle;

    .line 68
    .line 69
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 70
    .line 71
    .line 72
    :goto_2
    const-string v2, "android.support.allowGeneratedReplies"

    .line 73
    .line 74
    invoke-virtual {p1}, Landroidx/core/app/i$a;->b()Z

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p1}, Landroidx/core/app/i$a;->b()Z

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    invoke-static {v0, v2}, Landroidx/core/app/j$d;->a(Landroid/app/Notification$Action$Builder;Z)Landroid/app/Notification$Action$Builder;

    .line 86
    .line 87
    .line 88
    const-string v2, "android.support.action.semanticAction"

    .line 89
    .line 90
    invoke-virtual {p1}, Landroidx/core/app/i$a;->f()I

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p1}, Landroidx/core/app/i$a;->f()I

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    invoke-static {v0, v2}, Landroidx/core/app/j$f;->b(Landroid/app/Notification$Action$Builder;I)Landroid/app/Notification$Action$Builder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {p1}, Landroidx/core/app/i$a;->j()Z

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    invoke-static {v0, v2}, Landroidx/core/app/j$g;->c(Landroid/app/Notification$Action$Builder;Z)Landroid/app/Notification$Action$Builder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {p1}, Landroidx/core/app/i$a;->i()Z

    .line 112
    .line 113
    .line 114
    move-result v2

    .line 115
    invoke-static {v0, v2}, Landroidx/core/app/j$h;->a(Landroid/app/Notification$Action$Builder;Z)Landroid/app/Notification$Action$Builder;

    .line 116
    .line 117
    .line 118
    const-string v2, "android.support.action.showsUserInterface"

    .line 119
    .line 120
    invoke-virtual {p1}, Landroidx/core/app/i$a;->g()Z

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 125
    .line 126
    .line 127
    invoke-static {v0, v1}, Landroidx/core/app/j$a;->b(Landroid/app/Notification$Action$Builder;Landroid/os/Bundle;)Landroid/app/Notification$Action$Builder;

    .line 128
    .line 129
    .line 130
    iget-object p0, p0, Landroidx/core/app/j;->b:Landroid/app/Notification$Builder;

    .line 131
    .line 132
    invoke-static {v0}, Landroidx/core/app/j$a;->d(Landroid/app/Notification$Action$Builder;)Landroid/app/Notification$Action;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    invoke-static {p0, p1}, Landroidx/core/app/j$a;->a(Landroid/app/Notification$Builder;Landroid/app/Notification$Action;)Landroid/app/Notification$Builder;

    .line 137
    .line 138
    .line 139
    return-void
.end method


# virtual methods
.method public a()Landroid/app/Notification$Builder;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/core/app/j;->b:Landroid/app/Notification$Builder;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Landroid/app/Notification;
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/core/app/j;->c:Landroidx/core/app/i$d;

    .line 2
    .line 3
    iget-object v0, v0, Landroidx/core/app/i$d;->p:Landroidx/core/app/i$f;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Landroidx/core/app/i$f;->b(Landroidx/core/app/h;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Landroidx/core/app/i$f;->e(Landroidx/core/app/h;)Landroid/widget/RemoteViews;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    goto :goto_0

    .line 17
    :cond_1
    const/4 v1, 0x0

    .line 18
    :goto_0
    invoke-virtual {p0}, Landroidx/core/app/j;->d()Landroid/app/Notification;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    if-eqz v1, :cond_2

    .line 23
    .line 24
    iput-object v1, v2, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_2
    iget-object v1, p0, Landroidx/core/app/j;->c:Landroidx/core/app/i$d;

    .line 28
    .line 29
    iget-object v1, v1, Landroidx/core/app/i$d;->H:Landroid/widget/RemoteViews;

    .line 30
    .line 31
    if-eqz v1, :cond_3

    .line 32
    .line 33
    iput-object v1, v2, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    .line 34
    .line 35
    :cond_3
    :goto_1
    if-eqz v0, :cond_4

    .line 36
    .line 37
    invoke-virtual {v0, p0}, Landroidx/core/app/i$f;->d(Landroidx/core/app/h;)Landroid/widget/RemoteViews;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    if-eqz v1, :cond_4

    .line 42
    .line 43
    iput-object v1, v2, Landroid/app/Notification;->bigContentView:Landroid/widget/RemoteViews;

    .line 44
    .line 45
    :cond_4
    if-eqz v0, :cond_5

    .line 46
    .line 47
    iget-object v1, p0, Landroidx/core/app/j;->c:Landroidx/core/app/i$d;

    .line 48
    .line 49
    iget-object v1, v1, Landroidx/core/app/i$d;->p:Landroidx/core/app/i$f;

    .line 50
    .line 51
    invoke-virtual {v1, p0}, Landroidx/core/app/i$f;->f(Landroidx/core/app/h;)Landroid/widget/RemoteViews;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    if-eqz p0, :cond_5

    .line 56
    .line 57
    iput-object p0, v2, Landroid/app/Notification;->headsUpContentView:Landroid/widget/RemoteViews;

    .line 58
    .line 59
    :cond_5
    if-eqz v0, :cond_6

    .line 60
    .line 61
    invoke-static {v2}, Landroidx/core/app/i;->a(Landroid/app/Notification;)Landroid/os/Bundle;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    if-eqz p0, :cond_6

    .line 66
    .line 67
    invoke-virtual {v0, p0}, Landroidx/core/app/i$f;->a(Landroid/os/Bundle;)V

    .line 68
    .line 69
    .line 70
    :cond_6
    return-object v2
.end method

.method protected d()Landroid/app/Notification;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/core/app/j;->b:Landroid/app/Notification$Builder;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
