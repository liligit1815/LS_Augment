.class Lcom/android/launcher3/MFVDockExpandSupport$b;
.super Landroid/content/BroadcastReceiver;
.source "MFVDockExpandSupport.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/MFVDockExpandSupport;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/MFVDockExpandSupport;


# direct methods
.method constructor <init>(Lcom/android/launcher3/MFVDockExpandSupport;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/MFVDockExpandSupport$b;->a:Lcom/android/launcher3/MFVDockExpandSupport;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 11

    .line 1
    const/4 v0, 0x4

    .line 2
    const/4 v1, 0x3

    .line 3
    const/4 v2, 0x2

    .line 4
    const/4 v3, -0x1

    .line 5
    const/4 v4, 0x1

    .line 6
    const/4 v5, 0x0

    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    goto/16 :goto_5

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v6

    .line 15
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    const-string v7, "mirror"

    .line 19
    .line 20
    const-string v8, "cast_type"

    .line 21
    .line 22
    const-string v9, "MFVDockExpandSupport"

    .line 23
    .line 24
    invoke-virtual {v6}, Ljava/lang/String;->hashCode()I

    .line 25
    .line 26
    .line 27
    move-result v10

    .line 28
    sparse-switch v10, :sswitch_data_0

    .line 29
    .line 30
    .line 31
    :goto_0
    move v6, v3

    .line 32
    goto :goto_1

    .line 33
    :sswitch_0
    const-string v10, "relay_service_action_send_bytes"

    .line 34
    .line 35
    invoke-virtual {v6, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v6

    .line 39
    if-nez v6, :cond_1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    move v6, v0

    .line 43
    goto :goto_1

    .line 44
    :sswitch_1
    const-string v10, "comm_share_action_phone_info_from_relay_service"

    .line 45
    .line 46
    invoke-virtual {v6, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v6

    .line 50
    if-nez v6, :cond_2

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    move v6, v1

    .line 54
    goto :goto_1

    .line 55
    :sswitch_2
    const-string v10, "com.zte.multscr.ACTION_CAST_CONNECTION_CHANGE"

    .line 56
    .line 57
    invoke-virtual {v6, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v6

    .line 61
    if-nez v6, :cond_3

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_3
    move v6, v2

    .line 65
    goto :goto_1

    .line 66
    :sswitch_3
    const-string v10, "android.bluetooth.adapter.action.STATE_CHANGED"

    .line 67
    .line 68
    invoke-virtual {v6, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v6

    .line 72
    if-nez v6, :cond_4

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_4
    move v6, v4

    .line 76
    goto :goto_1

    .line 77
    :sswitch_4
    const-string v10, "com.zte.multscr.ACTION_BACKGROUND_CAST"

    .line 78
    .line 79
    invoke-virtual {v6, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v6

    .line 83
    if-nez v6, :cond_5

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_5
    move v6, v5

    .line 87
    :goto_1
    packed-switch v6, :pswitch_data_0

    .line 88
    .line 89
    .line 90
    goto/16 :goto_5

    .line 91
    .line 92
    :pswitch_0
    const-string p1, "data_type_byte"

    .line 93
    .line 94
    invoke-virtual {p2, p1}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    new-instance p2, Ljava/lang/StringBuilder;

    .line 99
    .line 100
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 101
    .line 102
    .line 103
    const-string v1, "Multi-screen: mMultiScrReceiver RELAY_SERVICE_SEND_BYTES iconData length is "

    .line 104
    .line 105
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    if-nez p1, :cond_6

    .line 109
    .line 110
    const-string v1, "null"

    .line 111
    .line 112
    goto :goto_2

    .line 113
    :cond_6
    array-length v1, p1

    .line 114
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    :goto_2
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p2

    .line 125
    invoke-static {v9, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    .line 127
    .line 128
    if-eqz p1, :cond_9

    .line 129
    .line 130
    array-length p2, p1

    .line 131
    if-eqz p2, :cond_9

    .line 132
    .line 133
    array-length p2, p1

    .line 134
    if-le p2, v0, :cond_9

    .line 135
    .line 136
    iget-object p2, p0, Lcom/android/launcher3/MFVDockExpandSupport$b;->a:Lcom/android/launcher3/MFVDockExpandSupport;

    .line 137
    .line 138
    invoke-static {p2, p1}, Lcom/android/launcher3/MFVDockExpandSupport;->g(Lcom/android/launcher3/MFVDockExpandSupport;[B)Ljava/lang/Boolean;

    .line 139
    .line 140
    .line 141
    move-result-object p2

    .line 142
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 143
    .line 144
    .line 145
    move-result p2

    .line 146
    if-eqz p2, :cond_7

    .line 147
    .line 148
    const-string p2, "Multi-screen: mMultiScrReceiver RELAY_SERVICE_SEND_BYTES iconData just contains bitmap!"

    .line 149
    .line 150
    invoke-static {v9, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    .line 152
    .line 153
    array-length p2, p1

    .line 154
    invoke-static {p1, v5, p2}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    iget-object p0, p0, Lcom/android/launcher3/MFVDockExpandSupport$b;->a:Lcom/android/launcher3/MFVDockExpandSupport;

    .line 159
    .line 160
    const-string p2, ""

    .line 161
    .line 162
    invoke-virtual {p0, v4, p2, p1}, Lcom/android/launcher3/MFVDockExpandSupport;->o(ZLjava/lang/String;Landroid/graphics/Bitmap;)V

    .line 163
    .line 164
    .line 165
    return-void

    .line 166
    :cond_7
    aget-byte p2, p1, v4

    .line 167
    .line 168
    shl-int/lit8 p2, p2, 0x8

    .line 169
    .line 170
    aget-byte v0, p1, v5

    .line 171
    .line 172
    or-int/2addr p2, v0

    .line 173
    new-array v0, p2, [B

    .line 174
    .line 175
    invoke-static {p1, v2, v0, v5, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 176
    .line 177
    .line 178
    new-instance v1, Ljava/lang/String;

    .line 179
    .line 180
    invoke-direct {v1, v0}, Ljava/lang/String;-><init>([B)V

    .line 181
    .line 182
    .line 183
    new-instance v0, Ljava/lang/StringBuilder;

    .line 184
    .line 185
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 186
    .line 187
    .line 188
    const-string v3, "Multi-screen: mMultiScrReceiver RELAY_SERVICE_SEND_BYTES iconData contains pkgName and the pkg is "

    .line 189
    .line 190
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    invoke-static {v9, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 201
    .line 202
    .line 203
    const-string v0, "com.zte.multscr"

    .line 204
    .line 205
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 206
    .line 207
    .line 208
    move-result v0

    .line 209
    if-eqz v0, :cond_8

    .line 210
    .line 211
    iget-object p1, p0, Lcom/android/launcher3/MFVDockExpandSupport$b;->a:Lcom/android/launcher3/MFVDockExpandSupport;

    .line 212
    .line 213
    invoke-virtual {p1, v5}, Lcom/android/launcher3/MFVDockExpandSupport;->q(Z)V

    .line 214
    .line 215
    .line 216
    iget-object p0, p0, Lcom/android/launcher3/MFVDockExpandSupport$b;->a:Lcom/android/launcher3/MFVDockExpandSupport;

    .line 217
    .line 218
    invoke-virtual {p0}, Lcom/android/launcher3/MFVDockExpandSupport;->k()V

    .line 219
    .line 220
    .line 221
    return-void

    .line 222
    :cond_8
    add-int/2addr p2, v2

    .line 223
    array-length v0, p1

    .line 224
    sub-int/2addr v0, p2

    .line 225
    invoke-static {p1, p2, v0}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    .line 226
    .line 227
    .line 228
    move-result-object p1

    .line 229
    iget-object p0, p0, Lcom/android/launcher3/MFVDockExpandSupport$b;->a:Lcom/android/launcher3/MFVDockExpandSupport;

    .line 230
    .line 231
    invoke-virtual {p0, v4, v1, p1}, Lcom/android/launcher3/MFVDockExpandSupport;->o(ZLjava/lang/String;Landroid/graphics/Bitmap;)V

    .line 232
    .line 233
    .line 234
    return-void

    .line 235
    :cond_9
    const-string p1, "Multi-screen: mMultiScrReceiver RELAY_SERVICE_SEND_BYTES icon data is null."

    .line 236
    .line 237
    invoke-static {v9, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 238
    .line 239
    .line 240
    iget-object p0, p0, Lcom/android/launcher3/MFVDockExpandSupport$b;->a:Lcom/android/launcher3/MFVDockExpandSupport;

    .line 241
    .line 242
    invoke-virtual {p0}, Lcom/android/launcher3/MFVDockExpandSupport;->k()V

    .line 243
    .line 244
    .line 245
    return-void

    .line 246
    :pswitch_1
    const-string p1, "comm_share_info"

    .line 247
    .line 248
    invoke-virtual {p2, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object p1

    .line 252
    new-instance p2, Lcom/google/gson/f;

    .line 253
    .line 254
    invoke-direct {p2}, Lcom/google/gson/f;-><init>()V

    .line 255
    .line 256
    .line 257
    const-class v0, Lcom/android/launcher3/MFVDockExpandSupport$CallShardStateData;

    .line 258
    .line 259
    invoke-virtual {p2, p1, v0}, Lcom/google/gson/f;->j(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 260
    .line 261
    .line 262
    move-result-object p2

    .line 263
    check-cast p2, Lcom/android/launcher3/MFVDockExpandSupport$CallShardStateData;

    .line 264
    .line 265
    if-nez p2, :cond_a

    .line 266
    .line 267
    const-string p0, "Multi-screen: mMultiScrReceiver ACTION_CALL_SHARE_ACTION info is null, return! "

    .line 268
    .line 269
    invoke-static {v9, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 270
    .line 271
    .line 272
    return-void

    .line 273
    :cond_a
    new-instance v0, Ljava/lang/StringBuilder;

    .line 274
    .line 275
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 276
    .line 277
    .line 278
    const-string v2, "Multi-screen: mMultiScrReceiver ACTION_CALL_SHARE_ACTION info: "

    .line 279
    .line 280
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 281
    .line 282
    .line 283
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 284
    .line 285
    .line 286
    const-string p1, ", getPhoneState()="

    .line 287
    .line 288
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 289
    .line 290
    .line 291
    invoke-virtual {p2}, Lcom/android/launcher3/MFVDockExpandSupport$CallShardStateData;->getPhoneState()I

    .line 292
    .line 293
    .line 294
    move-result p1

    .line 295
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 296
    .line 297
    .line 298
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 299
    .line 300
    .line 301
    move-result-object p1

    .line 302
    invoke-static {v9, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 303
    .line 304
    .line 305
    invoke-virtual {p2}, Lcom/android/launcher3/MFVDockExpandSupport$CallShardStateData;->getPhoneState()I

    .line 306
    .line 307
    .line 308
    move-result p1

    .line 309
    if-ne p1, v1, :cond_c

    .line 310
    .line 311
    invoke-static {}, Lcom/android/launcher3/MFVDockExpandSupport;->h()Ljava/util/ArrayList;

    .line 312
    .line 313
    .line 314
    move-result-object p1

    .line 315
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 316
    .line 317
    .line 318
    move-result p1

    .line 319
    if-eqz p1, :cond_b

    .line 320
    .line 321
    iget-object p1, p0, Lcom/android/launcher3/MFVDockExpandSupport$b;->a:Lcom/android/launcher3/MFVDockExpandSupport;

    .line 322
    .line 323
    invoke-static {p1}, Lcom/android/launcher3/MFVDockExpandSupport;->f(Lcom/android/launcher3/MFVDockExpandSupport;)Lcom/android/launcher3/model/data/I;

    .line 324
    .line 325
    .line 326
    move-result-object p1

    .line 327
    goto :goto_3

    .line 328
    :cond_b
    invoke-static {}, Lcom/android/launcher3/MFVDockExpandSupport;->h()Ljava/util/ArrayList;

    .line 329
    .line 330
    .line 331
    move-result-object p1

    .line 332
    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 333
    .line 334
    .line 335
    move-result-object p1

    .line 336
    check-cast p1, Lcom/android/launcher3/model/data/I;

    .line 337
    .line 338
    :goto_3
    iget-object p2, p1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 339
    .line 340
    iget-object p2, p2, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 341
    .line 342
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 343
    .line 344
    invoke-virtual {p2, v0, v4}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    .line 345
    .line 346
    .line 347
    move-result-object p2

    .line 348
    iget-object v0, p0, Lcom/android/launcher3/MFVDockExpandSupport$b;->a:Lcom/android/launcher3/MFVDockExpandSupport;

    .line 349
    .line 350
    iget-object v0, v0, Lcom/android/launcher3/MFVDockExpandSupport;->a:Landroid/content/Context;

    .line 351
    .line 352
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 353
    .line 354
    .line 355
    move-result-object v0

    .line 356
    const v1, 0x7f080dab

    .line 357
    .line 358
    .line 359
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 360
    .line 361
    .line 362
    move-result-object v0

    .line 363
    invoke-static {p2, v4, v0}, Lcom/android/launcher3/MFVDockExpandSupport;->l(Landroid/graphics/Bitmap;ZLandroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    .line 364
    .line 365
    .line 366
    move-result-object p2

    .line 367
    iget-object v0, p1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 368
    .line 369
    iget-object v0, v0, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 370
    .line 371
    new-instance v1, Ls1/d;

    .line 372
    .line 373
    iget-object v2, p1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 374
    .line 375
    iget v2, v2, Ls1/d;->b:I

    .line 376
    .line 377
    invoke-direct {v1, p2, v2}, Ls1/d;-><init>(Landroid/graphics/Bitmap;I)V

    .line 378
    .line 379
    .line 380
    iput-object v1, p1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 381
    .line 382
    invoke-static {v0}, Lx1/O;->w4(Landroid/graphics/Bitmap;)V

    .line 383
    .line 384
    .line 385
    goto :goto_4

    .line 386
    :cond_c
    iget-object p1, p0, Lcom/android/launcher3/MFVDockExpandSupport$b;->a:Lcom/android/launcher3/MFVDockExpandSupport;

    .line 387
    .line 388
    invoke-static {p1}, Lcom/android/launcher3/MFVDockExpandSupport;->f(Lcom/android/launcher3/MFVDockExpandSupport;)Lcom/android/launcher3/model/data/I;

    .line 389
    .line 390
    .line 391
    move-result-object p1

    .line 392
    :goto_4
    invoke-static {}, Lcom/android/launcher3/MFVDockExpandSupport;->h()Ljava/util/ArrayList;

    .line 393
    .line 394
    .line 395
    move-result-object p2

    .line 396
    invoke-virtual {p2}, Ljava/util/ArrayList;->clear()V

    .line 397
    .line 398
    .line 399
    invoke-static {}, Lcom/android/launcher3/MFVDockExpandSupport;->h()Ljava/util/ArrayList;

    .line 400
    .line 401
    .line 402
    move-result-object p2

    .line 403
    invoke-virtual {p2, v5, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 404
    .line 405
    .line 406
    iget-object p0, p0, Lcom/android/launcher3/MFVDockExpandSupport$b;->a:Lcom/android/launcher3/MFVDockExpandSupport;

    .line 407
    .line 408
    invoke-virtual {p0, v4}, Lcom/android/launcher3/MFVDockExpandSupport;->y(Z)V

    .line 409
    .line 410
    .line 411
    return-void

    .line 412
    :pswitch_2
    invoke-virtual {p2, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 413
    .line 414
    .line 415
    move-result-object p1

    .line 416
    new-instance v0, Ljava/lang/StringBuilder;

    .line 417
    .line 418
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 419
    .line 420
    .line 421
    const-string v1, "Multi-screen: mMultiScrReceiver CONNECTION_CHANGE connectionChangeExtra="

    .line 422
    .line 423
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 424
    .line 425
    .line 426
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 427
    .line 428
    .line 429
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 430
    .line 431
    .line 432
    move-result-object v0

    .line 433
    invoke-static {v9, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 434
    .line 435
    .line 436
    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 437
    .line 438
    .line 439
    move-result v0

    .line 440
    const-string v1, "connection_status"

    .line 441
    .line 442
    if-eqz v0, :cond_e

    .line 443
    .line 444
    invoke-virtual {p2, v1, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 445
    .line 446
    .line 447
    move-result p1

    .line 448
    new-instance p2, Ljava/lang/StringBuilder;

    .line 449
    .line 450
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 451
    .line 452
    .line 453
    const-string v0, "Multi-screen: VALUE_ZTE_CAST_TYPE_MIRROR is "

    .line 454
    .line 455
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 456
    .line 457
    .line 458
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 459
    .line 460
    .line 461
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 462
    .line 463
    .line 464
    move-result-object p2

    .line 465
    invoke-static {v9, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 466
    .line 467
    .line 468
    if-nez p1, :cond_d

    .line 469
    .line 470
    iget-object p0, p0, Lcom/android/launcher3/MFVDockExpandSupport$b;->a:Lcom/android/launcher3/MFVDockExpandSupport;

    .line 471
    .line 472
    invoke-virtual {p0, v4}, Lcom/android/launcher3/MFVDockExpandSupport;->q(Z)V

    .line 473
    .line 474
    .line 475
    return-void

    .line 476
    :cond_d
    if-ne p1, v4, :cond_f

    .line 477
    .line 478
    iget-object p0, p0, Lcom/android/launcher3/MFVDockExpandSupport$b;->a:Lcom/android/launcher3/MFVDockExpandSupport;

    .line 479
    .line 480
    invoke-virtual {p0, v5}, Lcom/android/launcher3/MFVDockExpandSupport;->q(Z)V

    .line 481
    .line 482
    .line 483
    return-void

    .line 484
    :cond_e
    const-string v0, "virtualDisplay"

    .line 485
    .line 486
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 487
    .line 488
    .line 489
    move-result p1

    .line 490
    if-eqz p1, :cond_f

    .line 491
    .line 492
    invoke-virtual {p2, v1, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 493
    .line 494
    .line 495
    move-result p1

    .line 496
    new-instance p2, Ljava/lang/StringBuilder;

    .line 497
    .line 498
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 499
    .line 500
    .line 501
    const-string v0, "Multi-screen: VALUE_ZTE_CAST_TYPE_VIRTUAL_DISPLAY is "

    .line 502
    .line 503
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 504
    .line 505
    .line 506
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 507
    .line 508
    .line 509
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 510
    .line 511
    .line 512
    move-result-object p2

    .line 513
    invoke-static {v9, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 514
    .line 515
    .line 516
    if-ne p1, v4, :cond_f

    .line 517
    .line 518
    iget-object p0, p0, Lcom/android/launcher3/MFVDockExpandSupport$b;->a:Lcom/android/launcher3/MFVDockExpandSupport;

    .line 519
    .line 520
    invoke-virtual {p0}, Lcom/android/launcher3/MFVDockExpandSupport;->k()V

    .line 521
    .line 522
    .line 523
    return-void

    .line 524
    :pswitch_3
    const-string p2, "Multi-screen: mMultiScrReceiver BLUETOOTH_STATE_CHANGE"

    .line 525
    .line 526
    invoke-static {v9, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 527
    .line 528
    .line 529
    const-string p2, "bluetooth"

    .line 530
    .line 531
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 532
    .line 533
    .line 534
    move-result-object p1

    .line 535
    check-cast p1, Landroid/bluetooth/BluetoothManager;

    .line 536
    .line 537
    if-eqz p1, :cond_f

    .line 538
    .line 539
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothManager;->getAdapter()Landroid/bluetooth/BluetoothAdapter;

    .line 540
    .line 541
    .line 542
    move-result-object p1

    .line 543
    if-eqz p1, :cond_f

    .line 544
    .line 545
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    .line 546
    .line 547
    .line 548
    move-result p1

    .line 549
    new-instance p2, Ljava/lang/StringBuilder;

    .line 550
    .line 551
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 552
    .line 553
    .line 554
    const-string v0, "Multi-screen: mMultiScrReceiver BLUETOOTH_STATE_CHANGE is "

    .line 555
    .line 556
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 557
    .line 558
    .line 559
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 560
    .line 561
    .line 562
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 563
    .line 564
    .line 565
    move-result-object p2

    .line 566
    invoke-static {v9, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 567
    .line 568
    .line 569
    if-nez p1, :cond_f

    .line 570
    .line 571
    iget-object p1, p0, Lcom/android/launcher3/MFVDockExpandSupport$b;->a:Lcom/android/launcher3/MFVDockExpandSupport;

    .line 572
    .line 573
    invoke-virtual {p1, v5}, Lcom/android/launcher3/MFVDockExpandSupport;->q(Z)V

    .line 574
    .line 575
    .line 576
    iget-object p0, p0, Lcom/android/launcher3/MFVDockExpandSupport$b;->a:Lcom/android/launcher3/MFVDockExpandSupport;

    .line 577
    .line 578
    invoke-virtual {p0}, Lcom/android/launcher3/MFVDockExpandSupport;->k()V

    .line 579
    .line 580
    .line 581
    return-void

    .line 582
    :pswitch_4
    invoke-virtual {p2, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 583
    .line 584
    .line 585
    move-result-object p1

    .line 586
    new-instance p2, Ljava/lang/StringBuilder;

    .line 587
    .line 588
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 589
    .line 590
    .line 591
    const-string v0, "Multi-screen: mMultiScrReceiver BACKGROUND_CAST backgroundCastExtra="

    .line 592
    .line 593
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 594
    .line 595
    .line 596
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 597
    .line 598
    .line 599
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 600
    .line 601
    .line 602
    move-result-object p2

    .line 603
    invoke-static {v9, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 604
    .line 605
    .line 606
    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 607
    .line 608
    .line 609
    move-result p1

    .line 610
    if-eqz p1, :cond_f

    .line 611
    .line 612
    invoke-static {}, Lcom/android/launcher3/MFVDockExpandSupport;->i()Ljava/util/ArrayList;

    .line 613
    .line 614
    .line 615
    move-result-object p1

    .line 616
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 617
    .line 618
    .line 619
    move-result p1

    .line 620
    if-nez p1, :cond_f

    .line 621
    .line 622
    iget-object p0, p0, Lcom/android/launcher3/MFVDockExpandSupport$b;->a:Lcom/android/launcher3/MFVDockExpandSupport;

    .line 623
    .line 624
    invoke-virtual {p0, v4}, Lcom/android/launcher3/MFVDockExpandSupport;->q(Z)V

    .line 625
    .line 626
    .line 627
    :cond_f
    :goto_5
    return-void

    .line 628
    nop

    .line 629
    :sswitch_data_0
    .sparse-switch
        -0x5da0de6d -> :sswitch_4
        -0x5b36f014 -> :sswitch_3
        -0x1fbe1012 -> :sswitch_2
        -0x18d62644 -> :sswitch_1
        0x7f54b65 -> :sswitch_0
    .end sparse-switch

    .line 630
    .line 631
    .line 632
    .line 633
    .line 634
    .line 635
    .line 636
    .line 637
    .line 638
    .line 639
    .line 640
    .line 641
    .line 642
    .line 643
    .line 644
    .line 645
    .line 646
    .line 647
    .line 648
    .line 649
    .line 650
    .line 651
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
