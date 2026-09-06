.class Lx1/r$a;
.super Landroid/content/BroadcastReceiver;
.source "AppTransferProxy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lx1/r;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lx1/r;


# direct methods
.method constructor <init>(Lx1/r;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lx1/r$a;->a:Lx1/r;

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
    .locals 7

    .line 1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Lx1/r;->l0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    new-instance v2, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v3, "mAppCastResultReceiver: onReceive action = "

    .line 15
    .line 16
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    const-string v1, "com.zte.multscr.ACTION_CAST_CONNECTION_CHANGE"

    .line 30
    .line 31
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    const/4 v2, 0x0

    .line 36
    const/4 v3, 0x0

    .line 37
    const/4 v4, 0x1

    .line 38
    if-eqz v1, :cond_4

    .line 39
    .line 40
    const-string p1, "connection_status"

    .line 41
    .line 42
    invoke-virtual {p2, p1, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    iget-object v0, p0, Lx1/r$a;->a:Lx1/r;

    .line 47
    .line 48
    const-string v1, "connected_device_name"

    .line 49
    .line 50
    invoke-virtual {p2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-static {v0, v1}, Lx1/r;->U(Lx1/r;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    const-string v0, "connected_device_type"

    .line 58
    .line 59
    const/4 v1, -0x1

    .line 60
    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    const-string v1, "cast_type"

    .line 65
    .line 66
    invoke-virtual {p2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    invoke-static {}, Lx1/r;->l0()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    new-instance v5, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 77
    .line 78
    .line 79
    const-string v6, "connectionStatus "

    .line 80
    .line 81
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    const-string v6, " cast_type "

    .line 88
    .line 89
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    const-string v6, " connected_device_name "

    .line 96
    .line 97
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    iget-object v6, p0, Lx1/r$a;->a:Lx1/r;

    .line 101
    .line 102
    invoke-static {v6}, Lx1/r;->C(Lx1/r;)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v6

    .line 106
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    const-string v6, " connected_device_type "

    .line 110
    .line 111
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    .line 123
    .line 124
    const-string v0, "virtualDisplay"

    .line 125
    .line 126
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    if-eqz v1, :cond_3

    .line 131
    .line 132
    iget-object v1, p0, Lx1/r$a;->a:Lx1/r;

    .line 133
    .line 134
    if-nez p1, :cond_0

    .line 135
    .line 136
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    move-result p1

    .line 140
    if-eqz p1, :cond_0

    .line 141
    .line 142
    move v3, v4

    .line 143
    :cond_0
    invoke-static {v1, v3}, Lx1/r;->a0(Lx1/r;Z)V

    .line 144
    .line 145
    .line 146
    iget-object p1, p0, Lx1/r$a;->a:Lx1/r;

    .line 147
    .line 148
    invoke-static {p1}, Lx1/r;->v(Lx1/r;)Ljava/util/function/Consumer;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    if-eqz p1, :cond_1

    .line 153
    .line 154
    iget-object p1, p0, Lx1/r$a;->a:Lx1/r;

    .line 155
    .line 156
    invoke-static {p1}, Lx1/r;->v(Lx1/r;)Ljava/util/function/Consumer;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    iget-object p2, p0, Lx1/r$a;->a:Lx1/r;

    .line 161
    .line 162
    invoke-static {p2}, Lx1/r;->D(Lx1/r;)Z

    .line 163
    .line 164
    .line 165
    move-result p2

    .line 166
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 167
    .line 168
    .line 169
    move-result-object p2

    .line 170
    invoke-interface {p1, p2}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 171
    .line 172
    .line 173
    iget-object p1, p0, Lx1/r$a;->a:Lx1/r;

    .line 174
    .line 175
    invoke-static {p1, v2}, Lx1/r;->P(Lx1/r;Ljava/util/function/Consumer;)V

    .line 176
    .line 177
    .line 178
    :cond_1
    iget-object p1, p0, Lx1/r$a;->a:Lx1/r;

    .line 179
    .line 180
    invoke-static {p1}, Lx1/r;->D(Lx1/r;)Z

    .line 181
    .line 182
    .line 183
    move-result p1

    .line 184
    if-nez p1, :cond_a

    .line 185
    .line 186
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    iget-object p0, p0, Lx1/r$a;->a:Lx1/r;

    .line 191
    .line 192
    if-eqz p1, :cond_2

    .line 193
    .line 194
    invoke-virtual {p1}, Lcom/android/launcher3/v;->hasBeenResumed()Z

    .line 195
    .line 196
    .line 197
    move-result p2

    .line 198
    if-nez p2, :cond_2

    .line 199
    .line 200
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->z2()Landroid/app/TaskInfo;

    .line 201
    .line 202
    .line 203
    move-result-object v2

    .line 204
    :cond_2
    invoke-virtual {p0, v2, v4}, Lx1/r;->G0(Landroid/app/TaskInfo;Z)V

    .line 205
    .line 206
    .line 207
    return-void

    .line 208
    :cond_3
    const-string v0, "mirror"

    .line 209
    .line 210
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 211
    .line 212
    .line 213
    move-result p2

    .line 214
    if-eqz p2, :cond_a

    .line 215
    .line 216
    if-ne p1, v4, :cond_a

    .line 217
    .line 218
    iget-object p0, p0, Lx1/r$a;->a:Lx1/r;

    .line 219
    .line 220
    const-string p1, "com.zte.multscr"

    .line 221
    .line 222
    invoke-virtual {p0, v2, p1}, Lx1/r;->F0(Landroid/graphics/drawable/Drawable;Ljava/lang/String;)V

    .line 223
    .line 224
    .line 225
    return-void

    .line 226
    :cond_4
    const-string v1, "com.zte.multscr.ACTION_CAST_FAIL"

    .line 227
    .line 228
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 229
    .line 230
    .line 231
    move-result v1

    .line 232
    if-eqz v1, :cond_6

    .line 233
    .line 234
    iget-object p1, p0, Lx1/r$a;->a:Lx1/r;

    .line 235
    .line 236
    invoke-static {p1, v3}, Lx1/r;->a0(Lx1/r;Z)V

    .line 237
    .line 238
    .line 239
    iget-object p1, p0, Lx1/r$a;->a:Lx1/r;

    .line 240
    .line 241
    const-string v0, "cast_fail_reason"

    .line 242
    .line 243
    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object p2

    .line 247
    invoke-static {p1, p2}, Lx1/r;->b0(Lx1/r;Ljava/lang/String;)V

    .line 248
    .line 249
    .line 250
    iget-object p1, p0, Lx1/r$a;->a:Lx1/r;

    .line 251
    .line 252
    invoke-static {p1}, Lx1/r;->v(Lx1/r;)Ljava/util/function/Consumer;

    .line 253
    .line 254
    .line 255
    move-result-object p1

    .line 256
    if-eqz p1, :cond_5

    .line 257
    .line 258
    iget-object p1, p0, Lx1/r$a;->a:Lx1/r;

    .line 259
    .line 260
    invoke-static {p1}, Lx1/r;->v(Lx1/r;)Ljava/util/function/Consumer;

    .line 261
    .line 262
    .line 263
    move-result-object p1

    .line 264
    iget-object p2, p0, Lx1/r$a;->a:Lx1/r;

    .line 265
    .line 266
    invoke-static {p2}, Lx1/r;->D(Lx1/r;)Z

    .line 267
    .line 268
    .line 269
    move-result p2

    .line 270
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 271
    .line 272
    .line 273
    move-result-object p2

    .line 274
    invoke-interface {p1, p2}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 275
    .line 276
    .line 277
    iget-object p1, p0, Lx1/r$a;->a:Lx1/r;

    .line 278
    .line 279
    invoke-static {p1, v2}, Lx1/r;->P(Lx1/r;Ljava/util/function/Consumer;)V

    .line 280
    .line 281
    .line 282
    :cond_5
    invoke-static {}, Lx1/r;->l0()Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object p1

    .line 286
    new-instance p2, Ljava/lang/StringBuilder;

    .line 287
    .line 288
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 289
    .line 290
    .line 291
    const-string v0, " "

    .line 292
    .line 293
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 294
    .line 295
    .line 296
    iget-object p0, p0, Lx1/r$a;->a:Lx1/r;

    .line 297
    .line 298
    invoke-static {p0}, Lx1/r;->E(Lx1/r;)Ljava/lang/String;

    .line 299
    .line 300
    .line 301
    move-result-object p0

    .line 302
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 303
    .line 304
    .line 305
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 306
    .line 307
    .line 308
    move-result-object p0

    .line 309
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 310
    .line 311
    .line 312
    return-void

    .line 313
    :cond_6
    const-string p2, "android.bluetooth.adapter.action.STATE_CHANGED"

    .line 314
    .line 315
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 316
    .line 317
    .line 318
    move-result p2

    .line 319
    if-eqz p2, :cond_a

    .line 320
    .line 321
    const-string p2, "bluetooth"

    .line 322
    .line 323
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 324
    .line 325
    .line 326
    move-result-object p1

    .line 327
    check-cast p1, Landroid/bluetooth/BluetoothManager;

    .line 328
    .line 329
    if-eqz p1, :cond_a

    .line 330
    .line 331
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothManager;->getAdapter()Landroid/bluetooth/BluetoothAdapter;

    .line 332
    .line 333
    .line 334
    move-result-object p1

    .line 335
    if-eqz p1, :cond_a

    .line 336
    .line 337
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    .line 338
    .line 339
    .line 340
    move-result p1

    .line 341
    iget-object p2, p0, Lx1/r$a;->a:Lx1/r;

    .line 342
    .line 343
    invoke-static {p2}, Lx1/r;->M(Lx1/r;)Z

    .line 344
    .line 345
    .line 346
    move-result p2

    .line 347
    if-eqz p2, :cond_7

    .line 348
    .line 349
    iget-object p2, p0, Lx1/r$a;->a:Lx1/r;

    .line 350
    .line 351
    invoke-static {p2}, Lx1/r;->w(Lx1/r;)Z

    .line 352
    .line 353
    .line 354
    move-result p2

    .line 355
    if-eqz p2, :cond_7

    .line 356
    .line 357
    iget-object p2, p0, Lx1/r$a;->a:Lx1/r;

    .line 358
    .line 359
    invoke-static {p2}, Lx1/r;->A(Lx1/r;)Z

    .line 360
    .line 361
    .line 362
    move-result p2

    .line 363
    if-eqz p2, :cond_7

    .line 364
    .line 365
    move p2, v4

    .line 366
    goto :goto_0

    .line 367
    :cond_7
    move p2, v3

    .line 368
    :goto_0
    iget-object v0, p0, Lx1/r$a;->a:Lx1/r;

    .line 369
    .line 370
    invoke-static {v0}, Lx1/r;->M(Lx1/r;)Z

    .line 371
    .line 372
    .line 373
    move-result v0

    .line 374
    if-eqz v0, :cond_8

    .line 375
    .line 376
    iget-object v0, p0, Lx1/r$a;->a:Lx1/r;

    .line 377
    .line 378
    invoke-static {v0}, Lx1/r;->w(Lx1/r;)Z

    .line 379
    .line 380
    .line 381
    move-result v0

    .line 382
    if-eqz v0, :cond_8

    .line 383
    .line 384
    if-eqz p1, :cond_8

    .line 385
    .line 386
    move v3, v4

    .line 387
    :cond_8
    if-eq p2, v3, :cond_9

    .line 388
    .line 389
    iget-object p2, p0, Lx1/r$a;->a:Lx1/r;

    .line 390
    .line 391
    invoke-static {p2, p1}, Lx1/r;->g0(Lx1/r;Z)V

    .line 392
    .line 393
    .line 394
    :cond_9
    iget-object p0, p0, Lx1/r$a;->a:Lx1/r;

    .line 395
    .line 396
    invoke-static {p0, p1}, Lx1/r;->T(Lx1/r;Z)V

    .line 397
    .line 398
    .line 399
    :cond_a
    return-void
.end method
