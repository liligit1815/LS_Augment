.class Lcom/android/launcher3/resource/G1;
.super Ljava/lang/Object;
.source "WallpaperManagerMFV.java"


# instance fields
.field private a:Z

.field private b:Landroid/net/Uri;

.field private c:Landroid/content/Context;

.field private d:Ljava/lang/String;

.field private e:[B

.field private f:I

.field private g:Landroid/graphics/Bitmap;

.field private final h:Ljava/lang/Object;

.field private i:Z

.field j:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/resource/G1;->a:Z

    .line 6
    .line 7
    new-instance v0, Ljava/lang/Object;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/android/launcher3/resource/G1;->h:Ljava/lang/Object;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Lcom/android/launcher3/resource/G1;->i:Z

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput-object v0, p0, Lcom/android/launcher3/resource/G1;->j:Ljava/lang/String;

    .line 19
    .line 20
    iput-object p1, p0, Lcom/android/launcher3/resource/G1;->c:Landroid/content/Context;

    .line 21
    .line 22
    invoke-static {}, Lx1/O;->N1()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-nez p1, :cond_0

    .line 27
    .line 28
    invoke-static {}, Lx1/O;->C2()Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-nez p1, :cond_0

    .line 33
    .line 34
    invoke-static {}, Lx1/O;->m1()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_0

    .line 39
    .line 40
    invoke-static {}, Lx1/O;->l2()Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-nez p1, :cond_0

    .line 45
    .line 46
    const/high16 p1, -0x1000000

    .line 47
    .line 48
    const/16 v0, 0x8c

    .line 49
    .line 50
    invoke-static {p1, v0}, Ls1/q;->h(II)I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    invoke-static {p1}, Lcom/android/launcher3/resource/t;->h(I)Landroid/graphics/Bitmap;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iput-object p1, p0, Lcom/android/launcher3/resource/G1;->g:Landroid/graphics/Bitmap;

    .line 59
    .line 60
    :cond_0
    return-void
.end method

.method private F(Landroid/app/Activity;Landroid/content/Intent;I)V
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    const v0, 0x7f140047

    .line 3
    .line 4
    .line 5
    :try_start_0
    invoke-virtual {p1, p2, p3}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p3

    .line 10
    invoke-static {p1, v0, p0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 15
    .line 16
    .line 17
    new-instance p0, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .line 21
    .line 22
    const-string p1, "Launcher does not have the permission to launch "

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string p1, ". Make sure to create a MAIN intent-filter for the corresponding activity or use the exported attribute for this activity."

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string p1, "R-Loader-WALLPAPER"

    .line 40
    .line 41
    invoke-static {p1, p0, p3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :catch_1
    invoke-static {p1, v0, p0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 50
    .line 51
    .line 52
    :goto_0
    return-void
.end method

.method private G(Landroid/graphics/Bitmap;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/resource/E1;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/resource/E1;-><init>(Lcom/android/launcher3/resource/G1;Landroid/graphics/Bitmap;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private H(Lcom/android/launcher3/resource/K$a;)Z
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/G1;->c:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/app/WallpaperManager;->getWallpaperInfo()Landroid/app/WallpaperInfo;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    return v1

    .line 15
    :cond_0
    invoke-virtual {v0}, Landroid/app/WallpaperInfo;->getComponent()Landroid/content/ComponentName;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-eqz v3, :cond_1

    .line 28
    .line 29
    return v1

    .line 30
    :cond_1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-virtual {v3}, Lcom/android/launcher3/resource/o0;->t()Lcom/android/launcher3/resource/K$c;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    const-string v4, "wallpaper"

    .line 39
    .line 40
    invoke-virtual {p1, v4}, Lcom/android/launcher3/resource/K$a;->e(Ljava/lang/String;)Lcom/android/launcher3/resource/K$d;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {v3}, Lcom/android/launcher3/resource/K$c;->h()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    new-instance v5, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 51
    .line 52
    .line 53
    const-string v6, "syncDynamicWallpaperInfo selectedItemId :"

    .line 54
    .line 55
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string v6, ",wallpaperTab="

    .line 62
    .line 63
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v5

    .line 73
    const-string v6, "R-Loader-WALLPAPER"

    .line 74
    .line 75
    invoke-static {v6, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    .line 77
    .line 78
    const/4 v5, 0x1

    .line 79
    if-eqz p1, :cond_2

    .line 80
    .line 81
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 82
    .line 83
    .line 84
    move-result v7

    .line 85
    if-nez v7, :cond_2

    .line 86
    .line 87
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v7

    .line 91
    if-eqz v7, :cond_2

    .line 92
    .line 93
    new-instance p0, Ljava/lang/StringBuilder;

    .line 94
    .line 95
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 96
    .line 97
    .line 98
    const-string p1, "syncDynamicWallpaperInfo-- not need to update "

    .line 99
    .line 100
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-static {v6, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    .line 112
    .line 113
    return v5

    .line 114
    :cond_2
    if-eqz p1, :cond_3

    .line 115
    .line 116
    invoke-virtual {p1, v2}, Lcom/android/launcher3/resource/K$d;->e(Ljava/lang/String;)Lcom/android/launcher3/resource/K$e;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    check-cast p1, Lcom/android/launcher3/resource/K$f;

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_3
    const/4 p1, 0x0

    .line 124
    :goto_0
    const/high16 v4, -0x1000000

    .line 125
    .line 126
    if-eqz p1, :cond_4

    .line 127
    .line 128
    invoke-virtual {p1}, Lcom/android/launcher3/resource/K$f;->Y()I

    .line 129
    .line 130
    .line 131
    move-result v7

    .line 132
    if-eq v7, v4, :cond_4

    .line 133
    .line 134
    invoke-virtual {p1}, Lcom/android/launcher3/resource/K$f;->Y()I

    .line 135
    .line 136
    .line 137
    move-result v7

    .line 138
    if-eqz v7, :cond_4

    .line 139
    .line 140
    invoke-direct {p0, v0, p1}, Lcom/android/launcher3/resource/G1;->f(Landroid/app/WallpaperInfo;Lcom/android/launcher3/resource/K$f;)Z

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    if-eqz v0, :cond_4

    .line 145
    .line 146
    invoke-virtual {p1}, Lcom/android/launcher3/resource/K$f;->X()I

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    invoke-virtual {v3, v0, v5}, Lcom/android/launcher3/resource/K$c;->k(IZ)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {p1}, Lcom/android/launcher3/resource/K$f;->Y()I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    invoke-virtual {v3, v0, v5}, Lcom/android/launcher3/resource/K$c;->n(IZ)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {p1}, Lcom/android/launcher3/resource/K$f;->Z()I

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    invoke-virtual {v3, v0, v5}, Lcom/android/launcher3/resource/K$c;->q(IZ)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {v3, v2, v5}, Lcom/android/launcher3/resource/K$c;->p(Ljava/lang/String;Z)V

    .line 168
    .line 169
    .line 170
    const-string v0, "syncDynamicWallpaperInfo: notifyChangeForAliveWallpaper"

    .line 171
    .line 172
    invoke-static {v6, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 173
    .line 174
    .line 175
    move v0, v1

    .line 176
    goto :goto_1

    .line 177
    :cond_4
    invoke-virtual {v3, v5}, Lcom/android/launcher3/resource/K$c;->m(Z)V

    .line 178
    .line 179
    .line 180
    move v0, v5

    .line 181
    :goto_1
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 182
    .line 183
    .line 184
    move-result-object v7

    .line 185
    invoke-virtual {v7}, Lcom/android/launcher3/resource/B;->p()Z

    .line 186
    .line 187
    .line 188
    move-result v7

    .line 189
    if-eqz v7, :cond_5

    .line 190
    .line 191
    invoke-virtual {v3, v1, v5}, Lcom/android/launcher3/resource/K$c;->l(ZZ)V

    .line 192
    .line 193
    .line 194
    :cond_5
    const-wide/16 v7, 0x4b0

    .line 195
    .line 196
    invoke-static {v7, v8}, Landroid/os/SystemClock;->sleep(J)V

    .line 197
    .line 198
    .line 199
    invoke-static {}, Lx1/O;->N1()Z

    .line 200
    .line 201
    .line 202
    move-result v7

    .line 203
    if-nez v7, :cond_7

    .line 204
    .line 205
    invoke-static {}, Lx1/O;->C2()Z

    .line 206
    .line 207
    .line 208
    move-result v7

    .line 209
    if-nez v7, :cond_7

    .line 210
    .line 211
    invoke-static {}, Lx1/O;->m1()Z

    .line 212
    .line 213
    .line 214
    move-result v7

    .line 215
    if-eqz v7, :cond_7

    .line 216
    .line 217
    invoke-static {}, Lx1/O;->l2()Z

    .line 218
    .line 219
    .line 220
    move-result v7

    .line 221
    if-nez v7, :cond_7

    .line 222
    .line 223
    invoke-direct {p0}, Lcom/android/launcher3/resource/G1;->r()Landroid/graphics/Bitmap;

    .line 224
    .line 225
    .line 226
    move-result-object v7

    .line 227
    if-eqz v7, :cond_7

    .line 228
    .line 229
    invoke-virtual {v7}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 230
    .line 231
    .line 232
    move-result v8

    .line 233
    if-nez v8, :cond_7

    .line 234
    .line 235
    invoke-static {v7}, Lx1/O;->m(Landroid/graphics/Bitmap;)[B

    .line 236
    .line 237
    .line 238
    move-result-object v8

    .line 239
    array-length v8, v8

    .line 240
    const/16 v9, 0xc00

    .line 241
    .line 242
    if-ge v8, v9, :cond_6

    .line 243
    .line 244
    new-instance v9, Ljava/lang/StringBuilder;

    .line 245
    .line 246
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 247
    .line 248
    .line 249
    const-string v10, "syncDynamicWallpaperInfo: checkLength "

    .line 250
    .line 251
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 252
    .line 253
    .line 254
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 255
    .line 256
    .line 257
    const-string v8, " need to reGet"

    .line 258
    .line 259
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 260
    .line 261
    .line 262
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object v8

    .line 266
    invoke-static {v6, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 267
    .line 268
    .line 269
    invoke-static {v7}, Lx1/O;->w4(Landroid/graphics/Bitmap;)V

    .line 270
    .line 271
    .line 272
    const-wide/16 v7, 0xc8

    .line 273
    .line 274
    invoke-static {v7, v8}, Landroid/os/SystemClock;->sleep(J)V

    .line 275
    .line 276
    .line 277
    invoke-direct {p0}, Lcom/android/launcher3/resource/G1;->r()Landroid/graphics/Bitmap;

    .line 278
    .line 279
    .line 280
    move-result-object v7

    .line 281
    :cond_6
    invoke-direct {p0, v7}, Lcom/android/launcher3/resource/G1;->G(Landroid/graphics/Bitmap;)V

    .line 282
    .line 283
    .line 284
    :cond_7
    if-nez v0, :cond_8

    .line 285
    .line 286
    return v5

    .line 287
    :cond_8
    new-instance v0, Lcom/android/launcher3/resource/K$f;

    .line 288
    .line 289
    invoke-direct {v0}, Lcom/android/launcher3/resource/K$f;-><init>()V

    .line 290
    .line 291
    .line 292
    iget-object v7, p0, Lcom/android/launcher3/resource/G1;->c:Landroid/content/Context;

    .line 293
    .line 294
    invoke-static {v7}, Lcom/android/launcher3/resource/o0;->v(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 295
    .line 296
    .line 297
    move-result-object v7

    .line 298
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 299
    .line 300
    .line 301
    move-result-object v8

    .line 302
    iget-object v9, p0, Lcom/android/launcher3/resource/G1;->c:Landroid/content/Context;

    .line 303
    .line 304
    invoke-virtual {v8, v9}, Lcom/zte/mifavor/launcher/adapter/compat/c;->g(Landroid/content/Context;)Z

    .line 305
    .line 306
    .line 307
    move-result v8

    .line 308
    if-eqz v8, :cond_a

    .line 309
    .line 310
    if-eqz v7, :cond_a

    .line 311
    .line 312
    const-string v8, "MiFavor_current_forecolor"

    .line 313
    .line 314
    invoke-interface {v7, v8, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 315
    .line 316
    .line 317
    move-result v8

    .line 318
    const-string v9, "MiFavor_current_maincolor"

    .line 319
    .line 320
    invoke-interface {v7, v9, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 321
    .line 322
    .line 323
    move-result v9

    .line 324
    const-string v10, "MiFavor_current_statusforecolor"

    .line 325
    .line 326
    invoke-interface {v7, v10, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 327
    .line 328
    .line 329
    move-result v7

    .line 330
    if-eqz v8, :cond_9

    .line 331
    .line 332
    if-eqz v9, :cond_9

    .line 333
    .line 334
    if-eqz v7, :cond_9

    .line 335
    .line 336
    invoke-virtual {v0, v8}, Lcom/android/launcher3/resource/K$f;->E(I)V

    .line 337
    .line 338
    .line 339
    invoke-virtual {v0, v9}, Lcom/android/launcher3/resource/K$f;->H(I)V

    .line 340
    .line 341
    .line 342
    invoke-virtual {v0, v7}, Lcom/android/launcher3/resource/K$f;->J(I)V

    .line 343
    .line 344
    .line 345
    new-instance p0, Ljava/lang/StringBuilder;

    .line 346
    .line 347
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 348
    .line 349
    .line 350
    const-string v10, "syncDynamicWallpaperInfo: keyguard is locked , use forColor = "

    .line 351
    .line 352
    invoke-virtual {p0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 353
    .line 354
    .line 355
    invoke-virtual {p0, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 356
    .line 357
    .line 358
    const-string v8, " , mainColor = "

    .line 359
    .line 360
    invoke-virtual {p0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 361
    .line 362
    .line 363
    invoke-virtual {p0, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 364
    .line 365
    .line 366
    const-string v8, ", statusColor = "

    .line 367
    .line 368
    invoke-virtual {p0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 369
    .line 370
    .line 371
    invoke-virtual {p0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 372
    .line 373
    .line 374
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 375
    .line 376
    .line 377
    move-result-object p0

    .line 378
    invoke-static {v6, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 379
    .line 380
    .line 381
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 382
    .line 383
    .line 384
    move-result-object p0

    .line 385
    if-eqz p0, :cond_b

    .line 386
    .line 387
    invoke-virtual {p0, v1}, Lcom/android/launcher3/resource/g0;->K2(Z)V

    .line 388
    .line 389
    .line 390
    const-string p0, "syncDynamicWallpaperInfo: set sync dynamic wallpaper result false."

    .line 391
    .line 392
    invoke-static {v6, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 393
    .line 394
    .line 395
    goto :goto_2

    .line 396
    :cond_9
    invoke-direct {p0, v0, v2}, Lcom/android/launcher3/resource/G1;->i(Lcom/android/launcher3/resource/K$f;Ljava/lang/String;)V

    .line 397
    .line 398
    .line 399
    goto :goto_2

    .line 400
    :cond_a
    invoke-direct {p0, v0, v2}, Lcom/android/launcher3/resource/G1;->i(Lcom/android/launcher3/resource/K$f;Ljava/lang/String;)V

    .line 401
    .line 402
    .line 403
    :cond_b
    :goto_2
    if-eqz p1, :cond_10

    .line 404
    .line 405
    invoke-virtual {p1}, Lcom/android/launcher3/resource/K$f;->X()I

    .line 406
    .line 407
    .line 408
    move-result p0

    .line 409
    invoke-virtual {p1}, Lcom/android/launcher3/resource/K$f;->X()I

    .line 410
    .line 411
    .line 412
    move-result v7

    .line 413
    if-nez v7, :cond_c

    .line 414
    .line 415
    invoke-virtual {v0}, Lcom/android/launcher3/resource/K$f;->X()I

    .line 416
    .line 417
    .line 418
    move-result p0

    .line 419
    invoke-virtual {p1, p0}, Lcom/android/launcher3/resource/K$f;->E(I)V

    .line 420
    .line 421
    .line 422
    :cond_c
    invoke-virtual {v3, p0, v5}, Lcom/android/launcher3/resource/K$c;->k(IZ)V

    .line 423
    .line 424
    .line 425
    invoke-virtual {p1}, Lcom/android/launcher3/resource/K$f;->Y()I

    .line 426
    .line 427
    .line 428
    move-result v7

    .line 429
    invoke-virtual {p1}, Lcom/android/launcher3/resource/K$f;->Y()I

    .line 430
    .line 431
    .line 432
    move-result v8

    .line 433
    if-eqz v8, :cond_d

    .line 434
    .line 435
    invoke-virtual {p1}, Lcom/android/launcher3/resource/K$f;->Y()I

    .line 436
    .line 437
    .line 438
    move-result v8

    .line 439
    if-ne v8, v4, :cond_e

    .line 440
    .line 441
    :cond_d
    invoke-virtual {v0}, Lcom/android/launcher3/resource/K$f;->Y()I

    .line 442
    .line 443
    .line 444
    move-result v7

    .line 445
    invoke-virtual {p1, v7}, Lcom/android/launcher3/resource/K$f;->H(I)V

    .line 446
    .line 447
    .line 448
    :cond_e
    invoke-virtual {v3, v7, v5}, Lcom/android/launcher3/resource/K$c;->n(IZ)V

    .line 449
    .line 450
    .line 451
    invoke-virtual {p1}, Lcom/android/launcher3/resource/K$f;->Z()I

    .line 452
    .line 453
    .line 454
    move-result v4

    .line 455
    invoke-virtual {p1}, Lcom/android/launcher3/resource/K$f;->Z()I

    .line 456
    .line 457
    .line 458
    move-result v8

    .line 459
    if-nez v8, :cond_f

    .line 460
    .line 461
    invoke-virtual {v0}, Lcom/android/launcher3/resource/K$f;->Z()I

    .line 462
    .line 463
    .line 464
    move-result v4

    .line 465
    invoke-virtual {p1, v4}, Lcom/android/launcher3/resource/K$f;->J(I)V

    .line 466
    .line 467
    .line 468
    :cond_f
    invoke-virtual {v3, v4, v5}, Lcom/android/launcher3/resource/K$c;->q(IZ)V

    .line 469
    .line 470
    .line 471
    new-instance p1, Ljava/lang/StringBuilder;

    .line 472
    .line 473
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 474
    .line 475
    .line 476
    const-string v8, "syncDynamicWallpaperInfo-- color"

    .line 477
    .line 478
    invoke-virtual {p1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 479
    .line 480
    .line 481
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 482
    .line 483
    .line 484
    move-result-object p0

    .line 485
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 486
    .line 487
    .line 488
    const-string p0, " / statusColor "

    .line 489
    .line 490
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 491
    .line 492
    .line 493
    invoke-static {v4}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 494
    .line 495
    .line 496
    move-result-object p0

    .line 497
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 498
    .line 499
    .line 500
    const-string p0, "/ mainColor"

    .line 501
    .line 502
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 503
    .line 504
    .line 505
    invoke-static {v7}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 506
    .line 507
    .line 508
    move-result-object p0

    .line 509
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 510
    .line 511
    .line 512
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 513
    .line 514
    .line 515
    move-result-object p0

    .line 516
    invoke-static {v6, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 517
    .line 518
    .line 519
    invoke-virtual {v0}, Lcom/android/launcher3/resource/K$f;->a0()[I

    .line 520
    .line 521
    .line 522
    goto :goto_3

    .line 523
    :cond_10
    invoke-virtual {v0}, Lcom/android/launcher3/resource/K$f;->Y()I

    .line 524
    .line 525
    .line 526
    move-result p0

    .line 527
    invoke-virtual {v0}, Lcom/android/launcher3/resource/K$f;->X()I

    .line 528
    .line 529
    .line 530
    move-result p1

    .line 531
    invoke-virtual {v3, p1, v5}, Lcom/android/launcher3/resource/K$c;->k(IZ)V

    .line 532
    .line 533
    .line 534
    invoke-virtual {v3, p0, v5}, Lcom/android/launcher3/resource/K$c;->n(IZ)V

    .line 535
    .line 536
    .line 537
    invoke-virtual {v0}, Lcom/android/launcher3/resource/K$f;->Z()I

    .line 538
    .line 539
    .line 540
    move-result p0

    .line 541
    invoke-virtual {v3, p0, v5}, Lcom/android/launcher3/resource/K$c;->q(IZ)V

    .line 542
    .line 543
    .line 544
    :goto_3
    invoke-virtual {v3, v2, v5}, Lcom/android/launcher3/resource/K$c;->p(Ljava/lang/String;Z)V

    .line 545
    .line 546
    .line 547
    invoke-virtual {v3, v1}, Lcom/android/launcher3/resource/K$c;->m(Z)V

    .line 548
    .line 549
    .line 550
    return v5
.end method

.method private J(Landroid/content/Context;)Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/android/launcher3/resource/g0;->y2()Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    return v0

    .line 19
    :cond_0
    invoke-static {p1}, Lx1/O;->S0(Landroid/content/Context;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    return v0

    .line 26
    :cond_1
    const/4 p0, 0x1

    .line 27
    return p0
.end method

.method public static synthetic a(Lcom/android/launcher3/resource/G1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/resource/G1;->x()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/resource/G1;Lcom/android/launcher3/resource/K$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/resource/G1;->w(Lcom/android/launcher3/resource/K$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/resource/G1;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/resource/G1;->v(Landroid/graphics/Bitmap;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/resource/G1;Landroid/content/ComponentName;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/resource/G1;->t(Landroid/content/ComponentName;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/android/launcher3/resource/G1;Ljava/io/InputStream;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/resource/G1;->u(Ljava/io/InputStream;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private f(Landroid/app/WallpaperInfo;Lcom/android/launcher3/resource/K$f;)Z
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/G1;->c:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1, p0}, Landroid/app/WallpaperInfo;->loadThumbnail(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Lx1/O;->G(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/4 p1, 0x1

    .line 16
    invoke-virtual {p2, p0, p1}, Lcom/android/launcher3/resource/K$e;->j(Landroid/graphics/Bitmap;Z)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    new-instance v0, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 23
    .line 24
    .line 25
    const-string v1, "checkDynamicTheme: "

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p2}, Lcom/android/launcher3/resource/K$f;->X()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v1, "-"

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const-string v1, "R-Loader-WALLPAPER"

    .line 50
    .line 51
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    invoke-virtual {p2}, Lcom/android/launcher3/resource/K$f;->X()I

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    if-ne p0, p2, :cond_0

    .line 59
    .line 60
    return p1

    .line 61
    :cond_0
    const/4 p0, 0x0

    .line 62
    return p0
.end method

.method private h(II)D
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p2}, Landroid/graphics/Color;->red(I)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    sub-int/2addr p0, v0

    .line 10
    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-static {p2}, Landroid/graphics/Color;->green(I)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    sub-int/2addr v0, v1

    .line 19
    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    invoke-static {p2}, Landroid/graphics/Color;->blue(I)I

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    sub-int/2addr p1, p2

    .line 28
    mul-int/2addr p0, p0

    .line 29
    mul-int/2addr v0, v0

    .line 30
    add-int/2addr p0, v0

    .line 31
    mul-int/2addr p1, p1

    .line 32
    add-int/2addr p0, p1

    .line 33
    int-to-double p0, p0

    .line 34
    invoke-static {p0, p1}, Ljava/lang/Math;->sqrt(D)D

    .line 35
    .line 36
    .line 37
    move-result-wide p0

    .line 38
    return-wide p0
.end method

.method private i(Lcom/android/launcher3/resource/K$f;Ljava/lang/String;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, "LiveWallpaper_m14zf1"

    .line 11
    .line 12
    invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    if-eqz p2, :cond_1

    .line 17
    .line 18
    const/high16 p0, -0x1000000

    .line 19
    .line 20
    invoke-virtual {p1, p0}, Lcom/android/launcher3/resource/K$f;->E(I)V

    .line 21
    .line 22
    .line 23
    const/4 p0, -0x1

    .line 24
    invoke-virtual {p1, p0}, Lcom/android/launcher3/resource/K$f;->J(I)V

    .line 25
    .line 26
    .line 27
    const-string p0, "R-Loader-WALLPAPER"

    .line 28
    .line 29
    const-string p1, "syncDynamicWallpaperInfo: isSpecialLightDynamicWallpaper !!"

    .line 30
    .line 31
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    const-string p2, "default_wallpaper_gallery"

    .line 36
    .line 37
    invoke-virtual {p1, p2}, Lcom/android/launcher3/resource/K$e;->F(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-direct {p0}, Lcom/android/launcher3/resource/G1;->r()Landroid/graphics/Bitmap;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    const/4 p2, 0x1

    .line 45
    invoke-virtual {p1, p0, p2, p2}, Lcom/android/launcher3/resource/K$e;->f(Landroid/graphics/Bitmap;ZZ)V

    .line 46
    .line 47
    .line 48
    :cond_2
    :goto_0
    return-void
.end method

.method private j(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;
    .locals 11

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->d:Lcom/android/launcher3/resource/r0;

    .line 6
    .line 7
    const/16 v0, 0x5a

    .line 8
    .line 9
    const-string v1, "R-Loader-WALLPAPER"

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    iget-object p0, p0, Lcom/android/launcher3/resource/g0;->d:Lcom/android/launcher3/resource/r0;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lcom/android/launcher3/resource/r0;->m(I)Landroid/graphics/Bitmap;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance v3, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    const-string v4, "generateDynamicThumb: SysAdapter bitmap="

    .line 30
    .line 31
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    move-object p0, v2

    .line 46
    :goto_0
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    const/4 v4, 0x1

    .line 51
    const/4 v5, 0x0

    .line 52
    if-eqz v3, :cond_3

    .line 53
    .line 54
    invoke-static {}, Lx1/S;->r()Z

    .line 55
    .line 56
    .line 57
    move-result v6

    .line 58
    if-eqz v6, :cond_3

    .line 59
    .line 60
    invoke-virtual {v3}, Lcom/android/launcher3/resource/g0;->j2()Z

    .line 61
    .line 62
    .line 63
    move-result v6

    .line 64
    if-eqz v6, :cond_3

    .line 65
    .line 66
    if-eqz p0, :cond_1

    .line 67
    .line 68
    move v6, v4

    .line 69
    goto :goto_1

    .line 70
    :cond_1
    move v6, v5

    .line 71
    :goto_1
    invoke-virtual {v3, v6}, Lcom/android/launcher3/resource/g0;->K2(Z)V

    .line 72
    .line 73
    .line 74
    new-instance v3, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 77
    .line 78
    .line 79
    const-string v6, "generateDynamicThumb: inspired wallpaper get bitmap : "

    .line 80
    .line 81
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    if-eqz p0, :cond_2

    .line 85
    .line 86
    move v6, v4

    .line 87
    goto :goto_2

    .line 88
    :cond_2
    move v6, v5

    .line 89
    :goto_2
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    .line 98
    .line 99
    :cond_3
    if-eqz p0, :cond_4

    .line 100
    .line 101
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 102
    .line 103
    .line 104
    move-result v3

    .line 105
    if-nez v3, :cond_4

    .line 106
    .line 107
    const-string p1, "generateDynamicThumb: getCurDynamicWallpaperShot "

    .line 108
    .line 109
    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    .line 111
    .line 112
    return-object p0

    .line 113
    :cond_4
    :try_start_0
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 114
    .line 115
    .line 116
    move-result v3

    .line 117
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 118
    .line 119
    .line 120
    move-result v6

    .line 121
    int-to-float v7, v3

    .line 122
    const/high16 v8, 0x3f800000    # 1.0f

    .line 123
    .line 124
    mul-float/2addr v8, v7

    .line 125
    int-to-float v9, v6

    .line 126
    div-float/2addr v8, v9

    .line 127
    invoke-static {p1}, Lx1/O;->I(Landroid/graphics/drawable/Drawable;)[B

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    array-length v10, p1

    .line 132
    invoke-static {p1, v5, v10, v4}, Landroid/graphics/BitmapRegionDecoder;->newInstance([BIIZ)Landroid/graphics/BitmapRegionDecoder;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    if-eqz p1, :cond_6

    .line 137
    .line 138
    new-instance p0, Landroid/graphics/BitmapFactory$Options;

    .line 139
    .line 140
    invoke-direct {p0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 141
    .line 142
    .line 143
    iput v4, p0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 144
    .line 145
    const/high16 v10, 0x3f100000    # 0.5625f

    .line 146
    .line 147
    cmpl-float v8, v8, v10

    .line 148
    .line 149
    if-lez v8, :cond_5

    .line 150
    .line 151
    mul-float/2addr v9, v10

    .line 152
    float-to-int v7, v9

    .line 153
    sub-int v8, v3, v7

    .line 154
    .line 155
    div-int/lit8 v8, v8, 0x2

    .line 156
    .line 157
    new-instance v9, Landroid/graphics/Rect;

    .line 158
    .line 159
    invoke-direct {v9, v5, v5, v7, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {v9, v8, v5}, Landroid/graphics/Rect;->offset(II)V

    .line 163
    .line 164
    .line 165
    goto :goto_3

    .line 166
    :catch_0
    move-exception p0

    .line 167
    goto :goto_4

    .line 168
    :cond_5
    div-float/2addr v7, v10

    .line 169
    float-to-int v7, v7

    .line 170
    sub-int v8, v6, v7

    .line 171
    .line 172
    div-int/lit8 v8, v8, 0x2

    .line 173
    .line 174
    new-instance v9, Landroid/graphics/Rect;

    .line 175
    .line 176
    invoke-direct {v9, v5, v5, v3, v7}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {v9, v5, v8}, Landroid/graphics/Rect;->offset(II)V

    .line 180
    .line 181
    .line 182
    :goto_3
    new-instance v5, Ljava/lang/StringBuilder;

    .line 183
    .line 184
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 185
    .line 186
    .line 187
    const-string v7, "generateDynamicThumb rect ="

    .line 188
    .line 189
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    invoke-virtual {v9}, Landroid/graphics/Rect;->toShortString()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v7

    .line 196
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    const-string v7, "-"

    .line 200
    .line 201
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    const-string v3, "/"

    .line 208
    .line 209
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v3

    .line 219
    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 220
    .line 221
    .line 222
    invoke-virtual {p1, v9, p0}, Landroid/graphics/BitmapRegionDecoder;->decodeRegion(Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 223
    .line 224
    .line 225
    move-result-object p0

    .line 226
    invoke-static {p1}, Lx1/O;->y4(Landroid/graphics/BitmapRegionDecoder;)V

    .line 227
    .line 228
    .line 229
    :cond_6
    const/16 p1, 0xa0

    .line 230
    .line 231
    invoke-static {p0, v0, p1, v4}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    .line 232
    .line 233
    .line 234
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 235
    return-object p0

    .line 236
    :goto_4
    new-instance p1, Ljava/lang/StringBuilder;

    .line 237
    .line 238
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 239
    .line 240
    .line 241
    const-string v0, "generateDynamicThumb IOException="

    .line 242
    .line 243
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object p0

    .line 253
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 254
    .line 255
    .line 256
    return-object v2
.end method

.method private m(Ljava/util/Set;)Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;>;)",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/HashSet;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Landroid/util/Pair;

    .line 21
    .line 22
    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v0, Ljava/lang/Integer;

    .line 25
    .line 26
    invoke-interface {p0, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    return-object p0
.end method

.method private n(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .locals 15

    .line 1
    const-string v1, "R-Loader-WALLPAPER"

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/resource/G1;->r()Landroid/graphics/Bitmap;

    .line 4
    .line 5
    .line 6
    move-result-object v2

    .line 7
    const v3, 0x7f080a97

    .line 8
    .line 9
    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    :cond_0
    move-object/from16 v4, p1

    .line 19
    .line 20
    goto/16 :goto_5

    .line 21
    .line 22
    :cond_1
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    :try_start_0
    invoke-static {v2}, Lx1/O;->m(Landroid/graphics/Bitmap;)[B

    .line 31
    .line 32
    .line 33
    move-result-object v5

    .line 34
    array-length v6, v5

    .line 35
    const/4 v7, 0x1

    .line 36
    const/4 v8, 0x0

    .line 37
    invoke-static {v5, v8, v6, v7}, Landroid/graphics/BitmapRegionDecoder;->newInstance([BIIZ)Landroid/graphics/BitmapRegionDecoder;

    .line 38
    .line 39
    .line 40
    move-result-object v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    const/16 v6, 0xb4

    .line 42
    .line 43
    if-eqz v5, :cond_3

    .line 44
    .line 45
    :try_start_1
    new-instance v9, Landroid/graphics/BitmapFactory$Options;

    .line 46
    .line 47
    invoke-direct {v9}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 48
    .line 49
    .line 50
    iput v7, v9, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 51
    .line 52
    invoke-static {v6, v0}, Ljava/lang/Math;->min(II)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    iget v10, v9, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 57
    .line 58
    mul-int/2addr v0, v10

    .line 59
    new-instance v10, Landroid/graphics/Rect;

    .line 60
    .line 61
    invoke-direct {v10, v8, v8, v0, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 62
    .line 63
    .line 64
    iget v11, v9, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 65
    .line 66
    iget v12, v9, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 67
    .line 68
    if-eq v11, v12, :cond_2

    .line 69
    .line 70
    int-to-double v11, v4

    .line 71
    const-wide v13, 0x3fc999999999999aL    # 0.2

    .line 72
    .line 73
    .line 74
    .line 75
    .line 76
    mul-double/2addr v11, v13

    .line 77
    double-to-int v4, v11

    .line 78
    invoke-virtual {v10, v8, v4}, Landroid/graphics/Rect;->offset(II)V

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :catchall_0
    move-exception v0

    .line 83
    move-object p0, v0

    .line 84
    goto/16 :goto_4

    .line 85
    .line 86
    :catch_0
    move-exception v0

    .line 87
    move-object p0, v0

    .line 88
    move-object/from16 v4, p1

    .line 89
    .line 90
    goto/16 :goto_3

    .line 91
    .line 92
    :cond_2
    :goto_0
    new-instance v4, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 95
    .line 96
    .line 97
    const-string v11, "getGalleryWallpaperBackground rect ="

    .line 98
    .line 99
    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v10}, Landroid/graphics/Rect;->toShortString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v11

    .line 106
    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    const-string v11, "-"

    .line 110
    .line 111
    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    .line 123
    .line 124
    invoke-virtual {v5, v10, v9}, Landroid/graphics/BitmapRegionDecoder;->decodeRegion(Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-static {v5}, Lx1/O;->y4(Landroid/graphics/BitmapRegionDecoder;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 129
    .line 130
    .line 131
    goto :goto_1

    .line 132
    :cond_3
    const/4 v0, 0x0

    .line 133
    :goto_1
    :try_start_2
    invoke-static {v0, v6, v8}, Lx1/O;->G4(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    new-instance v4, Ljava/lang/StringBuilder;

    .line 138
    .line 139
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 140
    .line 141
    .line 142
    const-string v5, "getGalleryWallpaperBackground1 bitmap ="

    .line 143
    .line 144
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 148
    .line 149
    .line 150
    move-result v5

    .line 151
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v4

    .line 158
    invoke-static {v1, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 159
    .line 160
    .line 161
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 162
    .line 163
    .line 164
    move-result-object v4

    .line 165
    const v5, 0x7f081a6a

    .line 166
    .line 167
    .line 168
    invoke-virtual {v4, v5}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 169
    .line 170
    .line 171
    move-result-object v4

    .line 172
    invoke-static {v4}, Lx1/O;->G(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    .line 173
    .line 174
    .line 175
    move-result-object v4

    .line 176
    invoke-static {v4, v6, v8}, Lx1/O;->G4(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    .line 177
    .line 178
    .line 179
    move-result-object v4

    .line 180
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->isMutable()Z

    .line 181
    .line 182
    .line 183
    move-result v5
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 184
    if-nez v5, :cond_4

    .line 185
    .line 186
    :try_start_3
    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 187
    .line 188
    invoke-virtual {v4, v5, v7}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    .line 189
    .line 190
    .line 191
    move-result-object v4
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 192
    :cond_4
    :try_start_4
    invoke-static {v0, v4}, Lcom/android/launcher3/resource/t;->o(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    iget-object p0, p0, Lcom/android/launcher3/resource/G1;->c:Landroid/content/Context;

    .line 197
    .line 198
    invoke-static {p0}, Lcom/android/launcher3/util/F2;->m(Landroid/content/Context;)I

    .line 199
    .line 200
    .line 201
    move-result v4

    .line 202
    const v5, 0x7f04049b

    .line 203
    .line 204
    .line 205
    invoke-static {p0, v5, v4}, Lcom/android/launcher3/util/F2;->f(Landroid/content/Context;II)Landroid/graphics/drawable/Drawable;

    .line 206
    .line 207
    .line 208
    move-result-object p0

    .line 209
    invoke-static {p0}, Lx1/O;->G(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    .line 210
    .line 211
    .line 212
    move-result-object p0

    .line 213
    invoke-static {p0, v6, v8}, Lx1/O;->G4(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    .line 214
    .line 215
    .line 216
    move-result-object p0

    .line 217
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->isMutable()Z

    .line 218
    .line 219
    .line 220
    move-result v4
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 221
    if-nez v4, :cond_5

    .line 222
    .line 223
    :try_start_5
    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 224
    .line 225
    invoke-virtual {p0, v4, v7}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    .line 226
    .line 227
    .line 228
    move-result-object p0
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 229
    :cond_5
    :try_start_6
    sget-object v4, Landroid/graphics/PorterDuff$Mode;->SRC_OVER:Landroid/graphics/PorterDuff$Mode;

    .line 230
    .line 231
    invoke-static {p0, v0, v4}, Lcom/android/launcher3/resource/t;->p(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/PorterDuff$Mode;)Landroid/graphics/Bitmap;

    .line 232
    .line 233
    .line 234
    move-result-object p0
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 235
    move-object/from16 v4, p1

    .line 236
    .line 237
    :try_start_7
    invoke-static {v4, p0}, Lx1/O;->o(Landroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;

    .line 238
    .line 239
    .line 240
    move-result-object p0
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 241
    invoke-static {v2}, Lx1/O;->w4(Landroid/graphics/Bitmap;)V

    .line 242
    .line 243
    .line 244
    return-object p0

    .line 245
    :catch_1
    move-exception v0

    .line 246
    :goto_2
    move-object p0, v0

    .line 247
    goto :goto_3

    .line 248
    :catch_2
    move-exception v0

    .line 249
    move-object/from16 v4, p1

    .line 250
    .line 251
    goto :goto_2

    .line 252
    :goto_3
    :try_start_8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 253
    .line 254
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 255
    .line 256
    .line 257
    const-string v5, "getWallpaperThumbnailFromUri IOException="

    .line 258
    .line 259
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 260
    .line 261
    .line 262
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 263
    .line 264
    .line 265
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object p0

    .line 269
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 270
    .line 271
    .line 272
    invoke-static {v2}, Lx1/O;->w4(Landroid/graphics/Bitmap;)V

    .line 273
    .line 274
    .line 275
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 276
    .line 277
    .line 278
    move-result-object p0

    .line 279
    invoke-virtual {p0, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 280
    .line 281
    .line 282
    move-result-object p0

    .line 283
    return-object p0

    .line 284
    :goto_4
    invoke-static {v2}, Lx1/O;->w4(Landroid/graphics/Bitmap;)V

    .line 285
    .line 286
    .line 287
    throw p0

    .line 288
    :goto_5
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 289
    .line 290
    .line 291
    move-result-object p0

    .line 292
    invoke-virtual {p0, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 293
    .line 294
    .line 295
    move-result-object p0

    .line 296
    return-object p0
.end method

.method private o(Ljava/util/List;Ljava/util/Set;I)Ljava/lang/String;
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/util/Map$Entry<",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/lang/String;",
            ">;>;I)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    const-string v1, " minColorDiff "

    .line 2
    .line 3
    const-string v2, "syncWallpaperStatus-- distance  "

    .line 4
    .line 5
    const-string v3, "R-Loader-WALLPAPER"

    .line 6
    .line 7
    const-string v0, ""

    .line 8
    .line 9
    if-eqz p1, :cond_7

    .line 10
    .line 11
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v4

    .line 15
    if-nez v4, :cond_0

    .line 16
    .line 17
    goto/16 :goto_5

    .line 18
    .line 19
    :cond_0
    const-wide v4, 0x7fefffffffffffffL    # Double.MAX_VALUE

    .line 20
    .line 21
    .line 22
    .line 23
    .line 24
    const/4 v6, 0x0

    .line 25
    :try_start_0
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object v7

    .line 29
    const/4 v8, 0x0

    .line 30
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    .line 31
    .line 32
    .line 33
    move-result v9

    .line 34
    if-eqz v9, :cond_4

    .line 35
    .line 36
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v9

    .line 40
    check-cast v9, Ljava/lang/String;

    .line 41
    .line 42
    invoke-interface/range {p2 .. p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 43
    .line 44
    .line 45
    move-result-object v10
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 46
    :goto_1
    :try_start_1
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    .line 47
    .line 48
    .line 49
    move-result v11

    .line 50
    if-eqz v11, :cond_3

    .line 51
    .line 52
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v11

    .line 56
    check-cast v11, Ljava/util/Map$Entry;

    .line 57
    .line 58
    invoke-interface {v11}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v12

    .line 62
    check-cast v12, Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v12, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v12

    .line 68
    if-eqz v12, :cond_2

    .line 69
    .line 70
    invoke-interface {v11}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v12

    .line 74
    check-cast v12, Landroid/util/Pair;

    .line 75
    .line 76
    iget-object v12, v12, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 77
    .line 78
    check-cast v12, Ljava/lang/Integer;

    .line 79
    .line 80
    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    .line 81
    .line 82
    .line 83
    move-result v12
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 84
    move-object/from16 v13, p0

    .line 85
    .line 86
    move/from16 v14, p3

    .line 87
    .line 88
    move v15, v6

    .line 89
    move-object/from16 p1, v7

    .line 90
    .line 91
    :try_start_2
    invoke-direct {v13, v14, v12}, Lcom/android/launcher3/resource/G1;->h(II)D

    .line 92
    .line 93
    .line 94
    move-result-wide v6

    .line 95
    invoke-static {v6, v7, v4, v5}, Ljava/lang/Math;->min(DD)D

    .line 96
    .line 97
    .line 98
    move-result-wide v4

    .line 99
    sub-double/2addr v6, v4

    .line 100
    invoke-static {v6, v7}, Ljava/lang/Math;->abs(D)D

    .line 101
    .line 102
    .line 103
    move-result-wide v6

    .line 104
    const-wide v16, 0x3e7ad7f29abcaf48L    # 1.0E-7

    .line 105
    .line 106
    .line 107
    .line 108
    .line 109
    cmpg-double v6, v6, v16

    .line 110
    .line 111
    if-gez v6, :cond_1

    .line 112
    .line 113
    invoke-interface {v11}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v6

    .line 117
    check-cast v6, Landroid/util/Pair;

    .line 118
    .line 119
    iget-object v6, v6, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 120
    .line 121
    check-cast v6, Ljava/lang/Integer;

    .line 122
    .line 123
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 124
    .line 125
    .line 126
    move-result v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 127
    move-object v8, v9

    .line 128
    goto :goto_2

    .line 129
    :catchall_0
    move-exception v0

    .line 130
    move v6, v15

    .line 131
    goto/16 :goto_4

    .line 132
    .line 133
    :cond_1
    move v6, v15

    .line 134
    goto :goto_2

    .line 135
    :catchall_1
    move-exception v0

    .line 136
    move v15, v6

    .line 137
    goto :goto_4

    .line 138
    :cond_2
    move-object/from16 v13, p0

    .line 139
    .line 140
    move/from16 v14, p3

    .line 141
    .line 142
    move v15, v6

    .line 143
    move-object/from16 p1, v7

    .line 144
    .line 145
    :goto_2
    move-object/from16 v7, p1

    .line 146
    .line 147
    goto :goto_1

    .line 148
    :cond_3
    move-object/from16 v13, p0

    .line 149
    .line 150
    move/from16 v14, p3

    .line 151
    .line 152
    move v15, v6

    .line 153
    goto :goto_0

    .line 154
    :catchall_2
    move-exception v0

    .line 155
    goto :goto_4

    .line 156
    :cond_4
    const-wide/high16 v9, 0x403e000000000000L    # 30.0

    .line 157
    .line 158
    cmpg-double v7, v4, v9

    .line 159
    .line 160
    if-gez v7, :cond_5

    .line 161
    .line 162
    new-instance v0, Ljava/lang/StringBuilder;

    .line 163
    .line 164
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 165
    .line 166
    .line 167
    :goto_3
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 184
    .line 185
    .line 186
    return-object v8

    .line 187
    :cond_5
    const-wide v9, 0x4051800000000000L    # 70.0

    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    cmpg-double v7, v4, v9

    .line 193
    .line 194
    if-gez v7, :cond_6

    .line 195
    .line 196
    const/16 v7, 0xe

    .line 197
    .line 198
    if-ge v6, v7, :cond_6

    .line 199
    .line 200
    new-instance v0, Ljava/lang/StringBuilder;

    .line 201
    .line 202
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 203
    .line 204
    .line 205
    goto :goto_3

    .line 206
    :cond_6
    new-instance v7, Ljava/lang/StringBuilder;

    .line 207
    .line 208
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 209
    .line 210
    .line 211
    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 218
    .line 219
    .line 220
    invoke-virtual {v7, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object v1

    .line 227
    invoke-static {v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 228
    .line 229
    .line 230
    return-object v0

    .line 231
    :goto_4
    new-instance v7, Ljava/lang/StringBuilder;

    .line 232
    .line 233
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 234
    .line 235
    .line 236
    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 237
    .line 238
    .line 239
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 240
    .line 241
    .line 242
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 243
    .line 244
    .line 245
    invoke-virtual {v7, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v1

    .line 252
    invoke-static {v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 253
    .line 254
    .line 255
    throw v0

    .line 256
    :cond_7
    :goto_5
    return-object v0
.end method

.method private p(Lcom/android/launcher3/resource/K$d;Ljava/lang/String;II)Ljava/lang/String;
    .locals 8

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, ""

    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    return-object v1

    .line 11
    :cond_0
    invoke-virtual {p1}, Lcom/android/launcher3/resource/K$d;->f()Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    const-string v3, "R-Loader-WALLPAPER"

    .line 24
    .line 25
    if-eqz v2, :cond_3

    .line 26
    .line 27
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Lcom/android/launcher3/resource/K$e;

    .line 32
    .line 33
    instance-of v4, v2, Lcom/android/launcher3/resource/K$f;

    .line 34
    .line 35
    if-eqz v4, :cond_1

    .line 36
    .line 37
    move-object v4, v2

    .line 38
    check-cast v4, Lcom/android/launcher3/resource/K$f;

    .line 39
    .line 40
    invoke-virtual {v4}, Lcom/android/launcher3/resource/K$f;->b0()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v5

    .line 44
    invoke-static {p2, v5}, Lcom/android/launcher3/resource/A1;->g(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    move-result v5

    .line 48
    invoke-virtual {v4}, Lcom/android/launcher3/resource/K$f;->Y()I

    .line 49
    .line 50
    .line 51
    move-result v6

    .line 52
    invoke-virtual {v4}, Lcom/android/launcher3/resource/K$f;->X()I

    .line 53
    .line 54
    .line 55
    move-result v7

    .line 56
    if-eq p4, v7, :cond_2

    .line 57
    .line 58
    new-instance v2, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    .line 62
    .line 63
    const-string v5, "syncWallpaperStatus diff targetFore  "

    .line 64
    .line 65
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v4}, Lcom/android/launcher3/resource/K$f;->X()I

    .line 69
    .line 70
    .line 71
    move-result v5

    .line 72
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    const-string v5, "/"

    .line 76
    .line 77
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v5, "-"

    .line 84
    .line 85
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v4}, Lcom/android/launcher3/resource/K$e;->p()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v4

    .line 92
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-static {v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_2
    new-instance v3, Landroid/util/Pair;

    .line 104
    .line 105
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 106
    .line 107
    .line 108
    move-result-object v4

    .line 109
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 110
    .line 111
    .line 112
    move-result-object v5

    .line 113
    invoke-direct {v3, v4, v5}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v2}, Lcom/android/launcher3/resource/K$e;->p()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_3
    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    .line 125
    .line 126
    .line 127
    move-result p1

    .line 128
    if-nez p1, :cond_4

    .line 129
    .line 130
    return-object v1

    .line 131
    :cond_4
    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    invoke-direct {p0, p1}, Lcom/android/launcher3/resource/G1;->m(Ljava/util/Set;)Ljava/util/Set;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-interface {p1}, Ljava/util/Set;->toArray()[Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    invoke-static {p1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 144
    .line 145
    .line 146
    const/4 p2, 0x0

    .line 147
    aget-object p1, p1, p2

    .line 148
    .line 149
    check-cast p1, Ljava/lang/Integer;

    .line 150
    .line 151
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 152
    .line 153
    .line 154
    move-result p1

    .line 155
    new-instance p2, Ljava/lang/StringBuilder;

    .line 156
    .line 157
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 158
    .line 159
    .line 160
    const-string p4, "syncWallpaperStatus-- minDistance  "

    .line 161
    .line 162
    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object p2

    .line 172
    invoke-static {v3, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 173
    .line 174
    .line 175
    new-instance p2, Ljava/util/ArrayList;

    .line 176
    .line 177
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 178
    .line 179
    .line 180
    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 181
    .line 182
    .line 183
    move-result-object p4

    .line 184
    invoke-interface {p4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 185
    .line 186
    .line 187
    move-result-object p4

    .line 188
    const-wide/16 v1, 0x0

    .line 189
    .line 190
    const/4 v3, 0x0

    .line 191
    :cond_5
    :goto_1
    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    .line 192
    .line 193
    .line 194
    move-result v4

    .line 195
    if-eqz v4, :cond_7

    .line 196
    .line 197
    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 198
    .line 199
    .line 200
    move-result-object v4

    .line 201
    check-cast v4, Ljava/util/Map$Entry;

    .line 202
    .line 203
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 204
    .line 205
    .line 206
    move-result-object v5

    .line 207
    check-cast v5, Landroid/util/Pair;

    .line 208
    .line 209
    iget-object v5, v5, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 210
    .line 211
    check-cast v5, Ljava/lang/Integer;

    .line 212
    .line 213
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 214
    .line 215
    .line 216
    move-result v5

    .line 217
    const/16 v6, 0x14

    .line 218
    .line 219
    if-gt v5, v6, :cond_6

    .line 220
    .line 221
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 222
    .line 223
    .line 224
    move-result-object v5

    .line 225
    check-cast v5, Ljava/lang/String;

    .line 226
    .line 227
    invoke-interface {p2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 228
    .line 229
    .line 230
    :cond_6
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 231
    .line 232
    .line 233
    move-result-object v5

    .line 234
    check-cast v5, Landroid/util/Pair;

    .line 235
    .line 236
    iget-object v5, v5, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 237
    .line 238
    check-cast v5, Ljava/lang/Integer;

    .line 239
    .line 240
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 241
    .line 242
    .line 243
    move-result v5

    .line 244
    if-ne v5, p1, :cond_5

    .line 245
    .line 246
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 247
    .line 248
    .line 249
    move-result-object v1

    .line 250
    check-cast v1, Landroid/util/Pair;

    .line 251
    .line 252
    iget-object v1, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 253
    .line 254
    check-cast v1, Ljava/lang/Integer;

    .line 255
    .line 256
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 257
    .line 258
    .line 259
    move-result v1

    .line 260
    invoke-direct {p0, p3, v1}, Lcom/android/launcher3/resource/G1;->h(II)D

    .line 261
    .line 262
    .line 263
    move-result-wide v1

    .line 264
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 265
    .line 266
    .line 267
    move-result-object v3

    .line 268
    check-cast v3, Ljava/lang/String;

    .line 269
    .line 270
    goto :goto_1

    .line 271
    :cond_7
    const/16 p4, 0x8

    .line 272
    .line 273
    if-ge p1, p4, :cond_8

    .line 274
    .line 275
    const-wide/high16 v4, 0x403e000000000000L    # 30.0

    .line 276
    .line 277
    cmpg-double p1, v1, v4

    .line 278
    .line 279
    if-gez p1, :cond_8

    .line 280
    .line 281
    return-object v3

    .line 282
    :cond_8
    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 283
    .line 284
    .line 285
    move-result-object p1

    .line 286
    invoke-direct {p0, p2, p1, p3}, Lcom/android/launcher3/resource/G1;->o(Ljava/util/List;Ljava/util/Set;I)Ljava/lang/String;

    .line 287
    .line 288
    .line 289
    move-result-object p0

    .line 290
    return-object p0
.end method

.method private q()Landroid/graphics/Bitmap;
    .locals 6

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/android/launcher3/resource/g0;->d:Lcom/android/launcher3/resource/r0;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    const/16 v2, 0x5a

    .line 9
    .line 10
    const-string v3, "R-Loader-WALLPAPER"

    .line 11
    .line 12
    if-eqz v0, :cond_2

    .line 13
    .line 14
    :try_start_0
    const-string v0, "getWallpaperFile is null so we get WallPaperDrawable from Adapter"

    .line 15
    .line 16
    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v0, v0, Lcom/android/launcher3/resource/g0;->d:Lcom/android/launcher3/resource/r0;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/android/launcher3/resource/r0;->n()Landroid/graphics/Bitmap;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    if-eq v4, v2, :cond_0

    .line 36
    .line 37
    invoke-static {v0, v2, v1}, Lx1/O;->G4(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0

    .line 42
    :catch_0
    move-exception v0

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    if-eqz v0, :cond_1

    .line 45
    .line 46
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    if-nez v4, :cond_1

    .line 51
    .line 52
    return-object v0

    .line 53
    :cond_1
    const-string v0, "getWallPaperDrawable: drawable is null or recycled."

    .line 54
    .line 55
    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    .line 57
    .line 58
    goto :goto_1

    .line 59
    :goto_0
    new-instance v4, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 62
    .line 63
    .line 64
    const-string v5, "getWallPaperDrawable from adapter Exception: "

    .line 65
    .line 66
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    .line 82
    .line 83
    :cond_2
    :goto_1
    :try_start_1
    iget-object p0, p0, Lcom/android/launcher3/resource/G1;->c:Landroid/content/Context;

    .line 84
    .line 85
    invoke-static {p0}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {p0}, Landroid/app/WallpaperManager;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    if-eqz p0, :cond_4

    .line 94
    .line 95
    check-cast p0, Landroid/graphics/drawable/BitmapDrawable;

    .line 96
    .line 97
    invoke-virtual {p0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    if-eqz p0, :cond_3

    .line 102
    .line 103
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-eq v0, v2, :cond_3

    .line 108
    .line 109
    invoke-static {p0, v2, v1}, Lx1/O;->G4(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    .line 110
    .line 111
    .line 112
    move-result-object p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 113
    return-object p0

    .line 114
    :catch_1
    move-exception p0

    .line 115
    goto :goto_2

    .line 116
    :cond_3
    return-object p0

    .line 117
    :goto_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 118
    .line 119
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 120
    .line 121
    .line 122
    const-string v1, "getWallPaperDrawable from sys Exception: "

    .line 123
    .line 124
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    invoke-static {v3, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    .line 140
    .line 141
    :cond_4
    const-string p0, "getWallPaperDrawable bitmap is null "

    .line 142
    .line 143
    invoke-static {v3, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 144
    .line 145
    .line 146
    const/4 p0, 0x0

    .line 147
    return-object p0
.end method

.method private r()Landroid/graphics/Bitmap;
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/G1;->c:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/app/WallpaperManager;->getWallpaperInfo()Landroid/app/WallpaperInfo;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v2, "getWallpaperFromSystem: wallpaperInfo="

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const-string v2, "R-Loader-WALLPAPER"

    .line 29
    .line 30
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v1, v0}, Lcom/android/launcher3/resource/g0;->J2(Landroid/app/WallpaperInfo;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    const/4 v1, 0x0

    .line 47
    const/4 v3, 0x1

    .line 48
    if-eqz v0, :cond_4

    .line 49
    .line 50
    invoke-virtual {v0}, Landroid/app/WallpaperInfo;->getPackageName()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    iput-object v2, p0, Lcom/android/launcher3/resource/G1;->j:Ljava/lang/String;

    .line 55
    .line 56
    iget-object v2, p0, Lcom/android/launcher3/resource/G1;->c:Landroid/content/Context;

    .line 57
    .line 58
    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v0, v2}, Landroid/app/WallpaperInfo;->loadThumbnail(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-direct {p0, v0}, Lcom/android/launcher3/resource/G1;->j(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    if-eqz v0, :cond_3

    .line 75
    .line 76
    invoke-static {}, Lx1/S;->r()Z

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    if-eqz v2, :cond_1

    .line 81
    .line 82
    invoke-virtual {v0}, Lcom/android/launcher3/resource/g0;->j2()Z

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    if-nez v2, :cond_3

    .line 87
    .line 88
    :cond_1
    if-eqz p0, :cond_2

    .line 89
    .line 90
    move v1, v3

    .line 91
    :cond_2
    invoke-virtual {v0, v1}, Lcom/android/launcher3/resource/g0;->K2(Z)V

    .line 92
    .line 93
    .line 94
    :cond_3
    return-object p0

    .line 95
    :cond_4
    const/4 v0, 0x0

    .line 96
    iput-object v0, p0, Lcom/android/launcher3/resource/G1;->j:Ljava/lang/String;

    .line 97
    .line 98
    iget-object v4, p0, Lcom/android/launcher3/resource/G1;->c:Landroid/content/Context;

    .line 99
    .line 100
    invoke-static {v4}, Lx1/O;->z1(Landroid/content/Context;)Z

    .line 101
    .line 102
    .line 103
    move-result v4

    .line 104
    if-nez v4, :cond_8

    .line 105
    .line 106
    new-instance v4, Landroid/graphics/BitmapFactory$Options;

    .line 107
    .line 108
    invoke-direct {v4}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 109
    .line 110
    .line 111
    iget-object v5, p0, Lcom/android/launcher3/resource/G1;->c:Landroid/content/Context;

    .line 112
    .line 113
    invoke-static {v5}, Lx1/O;->S0(Landroid/content/Context;)Z

    .line 114
    .line 115
    .line 116
    move-result v5

    .line 117
    const/16 v6, 0x5a

    .line 118
    .line 119
    if-nez v5, :cond_5

    .line 120
    .line 121
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 122
    .line 123
    .line 124
    move-result-object v5

    .line 125
    iget-object v5, v5, Lcom/android/launcher3/resource/g0;->d:Lcom/android/launcher3/resource/r0;

    .line 126
    .line 127
    if-eqz v5, :cond_5

    .line 128
    .line 129
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 130
    .line 131
    .line 132
    move-result-object v5

    .line 133
    iget-object v5, v5, Lcom/android/launcher3/resource/g0;->d:Lcom/android/launcher3/resource/r0;

    .line 134
    .line 135
    invoke-virtual {v5, v6}, Lcom/android/launcher3/resource/r0;->r(I)Landroid/graphics/Bitmap;

    .line 136
    .line 137
    .line 138
    move-result-object v5

    .line 139
    if-eqz v5, :cond_5

    .line 140
    .line 141
    invoke-virtual {v5}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 142
    .line 143
    .line 144
    move-result v7

    .line 145
    if-nez v7, :cond_5

    .line 146
    .line 147
    return-object v5

    .line 148
    :cond_5
    :try_start_0
    iget-object v5, p0, Lcom/android/launcher3/resource/G1;->c:Landroid/content/Context;

    .line 149
    .line 150
    invoke-virtual {v5}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    .line 151
    .line 152
    .line 153
    move-result-object v5

    .line 154
    invoke-static {v5}, Lcom/zte/mifavor/launcher/adapter/compat/e;->a(Landroid/os/Looper;)Lcom/zte/mifavor/launcher/adapter/compat/e;

    .line 155
    .line 156
    .line 157
    move-result-object v5

    .line 158
    iget-object v7, p0, Lcom/android/launcher3/resource/G1;->c:Landroid/content/Context;

    .line 159
    .line 160
    invoke-virtual {v5, v7}, Lcom/zte/mifavor/launcher/adapter/compat/e;->b(Landroid/content/Context;)Landroid/os/ParcelFileDescriptor;

    .line 161
    .line 162
    .line 163
    move-result-object v5

    .line 164
    new-instance v7, Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;

    .line 165
    .line 166
    invoke-direct {v7, v5}, Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;-><init>(Landroid/os/ParcelFileDescriptor;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 167
    .line 168
    .line 169
    :try_start_1
    iput-boolean v3, v4, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 170
    .line 171
    invoke-static {v7, v0, v4}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 172
    .line 173
    .line 174
    iget-object v5, p0, Lcom/android/launcher3/resource/G1;->c:Landroid/content/Context;

    .line 175
    .line 176
    invoke-virtual {v5}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    .line 177
    .line 178
    .line 179
    move-result-object v5

    .line 180
    invoke-static {v5}, Lcom/zte/mifavor/launcher/adapter/compat/e;->a(Landroid/os/Looper;)Lcom/zte/mifavor/launcher/adapter/compat/e;

    .line 181
    .line 182
    .line 183
    move-result-object v5

    .line 184
    iget-object v8, p0, Lcom/android/launcher3/resource/G1;->c:Landroid/content/Context;

    .line 185
    .line 186
    invoke-virtual {v5, v8}, Lcom/zte/mifavor/launcher/adapter/compat/e;->b(Landroid/content/Context;)Landroid/os/ParcelFileDescriptor;

    .line 187
    .line 188
    .line 189
    move-result-object v5

    .line 190
    new-instance v8, Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;

    .line 191
    .line 192
    invoke-direct {v8, v5}, Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;-><init>(Landroid/os/ParcelFileDescriptor;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 193
    .line 194
    .line 195
    :try_start_2
    iput-boolean v1, v4, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 196
    .line 197
    iput-boolean v3, v4, Landroid/graphics/BitmapFactory$Options;->inMutable:Z

    .line 198
    .line 199
    iget v5, v4, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 200
    .line 201
    div-int/2addr v5, v6

    .line 202
    iput v5, v4, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 203
    .line 204
    const/4 v9, 0x2

    .line 205
    if-ge v5, v9, :cond_6

    .line 206
    .line 207
    iput v3, v4, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 208
    .line 209
    invoke-static {v8, v0, v4}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    invoke-static {v0, v6, v1}, Lx1/O;->G4(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    .line 214
    .line 215
    .line 216
    move-result-object p0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 217
    :goto_0
    invoke-static {v8}, Lx1/O;->z(Ljava/io/Closeable;)V

    .line 218
    .line 219
    .line 220
    invoke-static {v7}, Lx1/O;->z(Ljava/io/Closeable;)V

    .line 221
    .line 222
    .line 223
    return-object p0

    .line 224
    :catchall_0
    move-exception p0

    .line 225
    move-object v0, v8

    .line 226
    goto :goto_3

    .line 227
    :catch_0
    move-exception v0

    .line 228
    goto :goto_2

    .line 229
    :cond_6
    :try_start_3
    invoke-static {v8, v0, v4}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 234
    .line 235
    .line 236
    move-result v1

    .line 237
    if-eq v1, v6, :cond_7

    .line 238
    .line 239
    invoke-static {v0, v6, v3}, Lx1/O;->G4(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    .line 240
    .line 241
    .line 242
    move-result-object p0
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 243
    goto :goto_0

    .line 244
    :cond_7
    invoke-static {v8}, Lx1/O;->z(Ljava/io/Closeable;)V

    .line 245
    .line 246
    .line 247
    invoke-static {v7}, Lx1/O;->z(Ljava/io/Closeable;)V

    .line 248
    .line 249
    .line 250
    return-object v0

    .line 251
    :catchall_1
    move-exception p0

    .line 252
    goto :goto_3

    .line 253
    :catch_1
    move-exception v1

    .line 254
    move-object v8, v0

    .line 255
    :goto_1
    move-object v0, v1

    .line 256
    goto :goto_2

    .line 257
    :catchall_2
    move-exception p0

    .line 258
    move-object v7, v0

    .line 259
    goto :goto_3

    .line 260
    :catch_2
    move-exception v1

    .line 261
    move-object v7, v0

    .line 262
    move-object v8, v7

    .line 263
    goto :goto_1

    .line 264
    :goto_2
    :try_start_4
    new-instance v1, Ljava/lang/StringBuilder;

    .line 265
    .line 266
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 267
    .line 268
    .line 269
    const-string v3, "getWallpaperFromSystem: "

    .line 270
    .line 271
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 272
    .line 273
    .line 274
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 275
    .line 276
    .line 277
    move-result-object v0

    .line 278
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object v0

    .line 282
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 283
    .line 284
    .line 285
    const-string v0, "\n"

    .line 286
    .line 287
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 288
    .line 289
    .line 290
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 291
    .line 292
    .line 293
    move-result-object v0

    .line 294
    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 295
    .line 296
    .line 297
    invoke-static {v8}, Lx1/O;->z(Ljava/io/Closeable;)V

    .line 298
    .line 299
    .line 300
    invoke-static {v7}, Lx1/O;->z(Ljava/io/Closeable;)V

    .line 301
    .line 302
    .line 303
    goto :goto_4

    .line 304
    :goto_3
    invoke-static {v0}, Lx1/O;->z(Ljava/io/Closeable;)V

    .line 305
    .line 306
    .line 307
    invoke-static {v7}, Lx1/O;->z(Ljava/io/Closeable;)V

    .line 308
    .line 309
    .line 310
    throw p0

    .line 311
    :cond_8
    :goto_4
    invoke-direct {p0}, Lcom/android/launcher3/resource/G1;->q()Landroid/graphics/Bitmap;

    .line 312
    .line 313
    .line 314
    move-result-object p0

    .line 315
    return-object p0
.end method

.method private synthetic t(Landroid/content/ComponentName;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/G1;->c:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/android/launcher3/resource/A1;->i(Landroid/content/Context;Landroid/content/ComponentName;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic u(Ljava/io/InputStream;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/G1;->E(Ljava/io/InputStream;)Z

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic v(Landroid/graphics/Bitmap;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/resource/G1;->c:Landroid/content/Context;

    .line 10
    .line 11
    const/high16 v1, 0x41a00000    # 20.0f

    .line 12
    .line 13
    invoke-static {v0, p1, v1}, Lcom/android/launcher3/resource/A1;->d(Landroid/content/Context;Landroid/graphics/Bitmap;F)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/launcher3/resource/G1;->h:Ljava/lang/Object;

    .line 17
    .line 18
    monitor-enter v0

    .line 19
    :try_start_0
    const-string v1, "R-Loader-WALLPAPER"

    .line 20
    .line 21
    const-string v2, "syncBlurredWallpaperCache blur lock locked"

    .line 22
    .line 23
    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Lcom/android/launcher3/resource/G1;->g:Landroid/graphics/Bitmap;

    .line 27
    .line 28
    invoke-static {v1}, Lx1/O;->w4(Landroid/graphics/Bitmap;)V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Lcom/android/launcher3/resource/G1;->g:Landroid/graphics/Bitmap;

    .line 32
    .line 33
    const-string p0, "R-Loader-WALLPAPER"

    .line 34
    .line 35
    const-string p1, "syncBlurredWallpaperCache finished"

    .line 36
    .line 37
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    monitor-exit v0

    .line 41
    return-void

    .line 42
    :catchall_0
    move-exception p0

    .line 43
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    throw p0

    .line 45
    :cond_0
    return-void
.end method

.method private synthetic w(Lcom/android/launcher3/resource/K$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/resource/G1;->H(Lcom/android/launcher3/resource/K$a;)Z

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic x()V
    .locals 19

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const-string v0, "default_wallpaper_gallery"

    .line 4
    .line 5
    const-string v2, "System_wallpaper_id"

    .line 6
    .line 7
    const-string v3, "wallpaper"

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    iput-boolean v4, v1, Lcom/android/launcher3/resource/G1;->a:Z

    .line 11
    .line 12
    new-instance v5, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    const-string v6, "syncWallpaperStatus-- begin "

    .line 18
    .line 19
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 23
    .line 24
    .line 25
    move-result-object v6

    .line 26
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    const-string v6, "R-Loader-WALLPAPER"

    .line 34
    .line 35
    invoke-static {v6, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 39
    .line 40
    .line 41
    move-result-wide v7

    .line 42
    invoke-static {}, Lcom/android/launcher3/resource/K;->n()Lcom/android/launcher3/resource/K;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    if-nez v5, :cond_0

    .line 47
    .line 48
    const-string v0, "syncWallpaperStatus--MenuResource is null "

    .line 49
    .line 50
    invoke-static {v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_0
    invoke-static {}, Lcom/android/launcher3/resource/K;->n()Lcom/android/launcher3/resource/K;

    .line 55
    .line 56
    .line 57
    move-result-object v5

    .line 58
    invoke-virtual {v5}, Lcom/android/launcher3/resource/K;->m()Lcom/android/launcher3/resource/K$a;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    if-nez v5, :cond_1

    .line 63
    .line 64
    const-string v0, "syncDynamicWallpaperInfo -- menu is null, no need to modify status!!!"

    .line 65
    .line 66
    invoke-static {v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 71
    .line 72
    .line 73
    move-result-object v9

    .line 74
    invoke-static {v9}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    .line 75
    .line 76
    .line 77
    move-result-object v9

    .line 78
    iget-object v10, v1, Lcom/android/launcher3/resource/G1;->c:Landroid/content/Context;

    .line 79
    .line 80
    invoke-direct {v1, v10}, Lcom/android/launcher3/resource/G1;->J(Landroid/content/Context;)Z

    .line 81
    .line 82
    .line 83
    move-result v10

    .line 84
    const/4 v12, -0x1

    .line 85
    const/4 v13, 0x1

    .line 86
    if-eqz v10, :cond_6

    .line 87
    .line 88
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    if-eqz v0, :cond_2

    .line 93
    .line 94
    invoke-virtual {v0}, Lcom/android/launcher3/resource/g0;->y2()Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    if-nez v1, :cond_2

    .line 99
    .line 100
    invoke-virtual {v0, v13}, Lcom/android/launcher3/resource/g0;->L2(Z)V

    .line 101
    .line 102
    .line 103
    :cond_2
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {v0}, Lcom/android/launcher3/resource/o0;->t()Lcom/android/launcher3/resource/K$c;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    sget-boolean v1, Lcom/android/launcher3/N5;->e:Z

    .line 112
    .line 113
    if-eqz v1, :cond_3

    .line 114
    .line 115
    invoke-virtual {v9, v13}, Landroid/app/WallpaperManager;->getWallpaperColors(I)Landroid/app/WallpaperColors;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    if-eqz v1, :cond_3

    .line 120
    .line 121
    invoke-virtual {v1}, Landroid/app/WallpaperColors;->getColorHints()I

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    and-int/2addr v1, v13

    .line 126
    if-eqz v1, :cond_3

    .line 127
    .line 128
    move v4, v13

    .line 129
    :cond_3
    if-eqz v4, :cond_4

    .line 130
    .line 131
    const/high16 v1, -0x1000000

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_4
    move v1, v12

    .line 135
    :goto_0
    invoke-virtual {v0, v1, v13}, Lcom/android/launcher3/resource/K$c;->k(IZ)V

    .line 136
    .line 137
    .line 138
    if-eqz v4, :cond_5

    .line 139
    .line 140
    move v11, v12

    .line 141
    goto :goto_1

    .line 142
    :cond_5
    const/high16 v11, -0x1000000

    .line 143
    .line 144
    :goto_1
    invoke-virtual {v0, v11, v13}, Lcom/android/launcher3/resource/K$c;->q(IZ)V

    .line 145
    .line 146
    .line 147
    return-void

    .line 148
    :cond_6
    const/4 v10, 0x0

    .line 149
    :try_start_0
    invoke-direct {v1, v5}, Lcom/android/launcher3/resource/G1;->H(Lcom/android/launcher3/resource/K$a;)Z

    .line 150
    .line 151
    .line 152
    move-result v14
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 153
    if-eqz v14, :cond_7

    .line 154
    .line 155
    :try_start_1
    new-instance v0, Lcom/android/launcher3/resource/F1;

    .line 156
    .line 157
    invoke-direct {v0, v1, v5}, Lcom/android/launcher3/resource/F1;-><init>(Lcom/android/launcher3/resource/G1;Lcom/android/launcher3/resource/K$a;)V

    .line 158
    .line 159
    .line 160
    const-wide/16 v2, 0xfa0

    .line 161
    .line 162
    invoke-static {v0, v2, v3}, Lcom/android/launcher3/resource/o0;->Q(Ljava/lang/Runnable;J)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 163
    .line 164
    .line 165
    iput-boolean v13, v1, Lcom/android/launcher3/resource/G1;->a:Z

    .line 166
    .line 167
    invoke-static {v10}, Lx1/O;->w4(Landroid/graphics/Bitmap;)V

    .line 168
    .line 169
    .line 170
    return-void

    .line 171
    :catchall_0
    move-exception v0

    .line 172
    move v3, v13

    .line 173
    goto/16 :goto_18

    .line 174
    .line 175
    :catch_0
    move-exception v0

    .line 176
    goto/16 :goto_17

    .line 177
    .line 178
    :cond_7
    :try_start_2
    invoke-direct {v1}, Lcom/android/launcher3/resource/G1;->r()Landroid/graphics/Bitmap;

    .line 179
    .line 180
    .line 181
    move-result-object v10

    .line 182
    if-eqz v10, :cond_1e

    .line 183
    .line 184
    invoke-virtual {v10}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 185
    .line 186
    .line 187
    move-result v14

    .line 188
    if-eqz v14, :cond_8

    .line 189
    .line 190
    goto/16 :goto_16

    .line 191
    .line 192
    :cond_8
    invoke-static {v10}, Lcom/android/launcher3/resource/A1;->e(Landroid/graphics/Bitmap;)Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v14

    .line 196
    invoke-virtual {v5, v3}, Lcom/android/launcher3/resource/K$a;->e(Ljava/lang/String;)Lcom/android/launcher3/resource/K$d;

    .line 197
    .line 198
    .line 199
    move-result-object v5

    .line 200
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 201
    .line 202
    .line 203
    move-result-object v15

    .line 204
    invoke-virtual {v15}, Lcom/android/launcher3/resource/o0;->t()Lcom/android/launcher3/resource/K$c;

    .line 205
    .line 206
    .line 207
    move-result-object v15

    .line 208
    invoke-virtual {v9, v13}, Landroid/app/WallpaperManager;->getWallpaperId(I)I

    .line 209
    .line 210
    .line 211
    move-result v9

    .line 212
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 213
    .line 214
    .line 215
    move-result-object v16

    .line 216
    invoke-virtual/range {v16 .. v16}, Lcom/android/launcher3/resource/o0;->u()Landroid/content/SharedPreferences;

    .line 217
    .line 218
    .line 219
    move-result-object v4

    .line 220
    invoke-interface {v4, v2, v12}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 221
    .line 222
    .line 223
    move-result v4

    .line 224
    new-instance v11, Ljava/lang/StringBuilder;

    .line 225
    .line 226
    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    .line 227
    .line 228
    .line 229
    const-string v12, "syncWallpaperStatus currentId "

    .line 230
    .line 231
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 235
    .line 236
    .line 237
    const-string v12, " savedId "

    .line 238
    .line 239
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 240
    .line 241
    .line 242
    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 243
    .line 244
    .line 245
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object v11

    .line 249
    invoke-static {v6, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 250
    .line 251
    .line 252
    if-eq v4, v9, :cond_9

    .line 253
    .line 254
    :try_start_3
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 255
    .line 256
    .line 257
    move-result-object v4

    .line 258
    invoke-virtual {v4, v2, v9}, Lcom/android/launcher3/resource/o0;->U(Ljava/lang/String;I)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 259
    .line 260
    .line 261
    :cond_9
    :try_start_4
    new-instance v2, Lcom/android/launcher3/resource/K$f;

    .line 262
    .line 263
    invoke-direct {v2}, Lcom/android/launcher3/resource/K$f;-><init>()V

    .line 264
    .line 265
    .line 266
    invoke-virtual {v2, v0}, Lcom/android/launcher3/resource/K$e;->F(Ljava/lang/String;)V

    .line 267
    .line 268
    .line 269
    invoke-virtual {v2, v10, v13}, Lcom/android/launcher3/resource/K$e;->e(Landroid/graphics/Bitmap;Z)V

    .line 270
    .line 271
    .line 272
    invoke-virtual {v2}, Lcom/android/launcher3/resource/K$f;->Y()I

    .line 273
    .line 274
    .line 275
    move-result v4

    .line 276
    invoke-virtual {v2}, Lcom/android/launcher3/resource/K$f;->X()I

    .line 277
    .line 278
    .line 279
    move-result v9

    .line 280
    invoke-direct {v1, v5, v14, v4, v9}, Lcom/android/launcher3/resource/G1;->p(Lcom/android/launcher3/resource/K$d;Ljava/lang/String;II)Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object v4

    .line 284
    new-instance v9, Ljava/lang/StringBuilder;

    .line 285
    .line 286
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 287
    .line 288
    .line 289
    const-string v11, "syncWallpaperStatus-- wallpaperFinger  itemId "

    .line 290
    .line 291
    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 292
    .line 293
    .line 294
    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 295
    .line 296
    .line 297
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 298
    .line 299
    .line 300
    move-result-object v9

    .line 301
    invoke-static {v6, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 302
    .line 303
    .line 304
    invoke-virtual {v15}, Lcom/android/launcher3/resource/K$c;->h()Ljava/lang/String;

    .line 305
    .line 306
    .line 307
    move-result-object v9

    .line 308
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 309
    .line 310
    .line 311
    move-result v11
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 312
    if-nez v11, :cond_a

    .line 313
    .line 314
    :try_start_5
    invoke-virtual {v4, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 315
    .line 316
    .line 317
    move-result v11

    .line 318
    if-eqz v11, :cond_a

    .line 319
    .line 320
    invoke-virtual {v2}, Lcom/android/launcher3/resource/K$f;->X()I

    .line 321
    .line 322
    .line 323
    move-result v11

    .line 324
    invoke-virtual {v15}, Lcom/android/launcher3/resource/K$c;->c()I

    .line 325
    .line 326
    .line 327
    move-result v12

    .line 328
    if-ne v11, v12, :cond_a

    .line 329
    .line 330
    invoke-virtual {v2}, Lcom/android/launcher3/resource/K$f;->Z()I

    .line 331
    .line 332
    .line 333
    move-result v11

    .line 334
    invoke-virtual {v15}, Lcom/android/launcher3/resource/K$c;->i()I

    .line 335
    .line 336
    .line 337
    move-result v12

    .line 338
    if-ne v11, v12, :cond_a

    .line 339
    .line 340
    new-instance v0, Ljava/lang/StringBuilder;

    .line 341
    .line 342
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 343
    .line 344
    .line 345
    const-string v2, "syncWallpaperStatus-- not need to update "

    .line 346
    .line 347
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 348
    .line 349
    .line 350
    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 351
    .line 352
    .line 353
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 354
    .line 355
    .line 356
    move-result-object v0

    .line 357
    invoke-static {v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 358
    .line 359
    .line 360
    iput-boolean v13, v1, Lcom/android/launcher3/resource/G1;->a:Z

    .line 361
    .line 362
    invoke-static {v10}, Lx1/O;->w4(Landroid/graphics/Bitmap;)V

    .line 363
    .line 364
    .line 365
    return-void

    .line 366
    :cond_a
    :try_start_6
    invoke-static {}, Lx1/O;->l3()Z

    .line 367
    .line 368
    .line 369
    move-result v9

    .line 370
    const/16 v11, 0xa

    .line 371
    .line 372
    if-eqz v9, :cond_10

    .line 373
    .line 374
    sget-boolean v9, Lx1/O;->T:Z

    .line 375
    .line 376
    if-eqz v9, :cond_d

    .line 377
    .line 378
    const-string v9, "111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111000111111111000111111110000111111110000111111111000"

    .line 379
    .line 380
    invoke-static {v9, v14}, Lcom/android/launcher3/resource/A1;->g(Ljava/lang/String;Ljava/lang/String;)I

    .line 381
    .line 382
    .line 383
    move-result v9
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 384
    if-eqz v9, :cond_c

    .line 385
    .line 386
    :try_start_7
    const-string v9, "111111111111111111111111111111111111111111111111111111111111011111111111011111111111011110000111011111000001011111000000000111011000000001100000"

    .line 387
    .line 388
    invoke-static {v9, v14}, Lcom/android/launcher3/resource/A1;->g(Ljava/lang/String;Ljava/lang/String;)I

    .line 389
    .line 390
    .line 391
    move-result v9

    .line 392
    if-eqz v9, :cond_c

    .line 393
    .line 394
    const-string v9, "111111111111111111111111111111111111111111111110111111111110111111111100111111111000111111110000111111110000111111110000111111111000111111111000"

    .line 395
    .line 396
    invoke-static {v9, v14}, Lcom/android/launcher3/resource/A1;->g(Ljava/lang/String;Ljava/lang/String;)I

    .line 397
    .line 398
    .line 399
    move-result v9
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 400
    if-nez v9, :cond_b

    .line 401
    .line 402
    goto :goto_2

    .line 403
    :cond_b
    const/4 v9, 0x0

    .line 404
    goto :goto_3

    .line 405
    :cond_c
    :goto_2
    move v9, v13

    .line 406
    :goto_3
    :try_start_8
    new-instance v12, Ljava/lang/StringBuilder;

    .line 407
    .line 408
    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    .line 409
    .line 410
    .line 411
    const-string v13, "syncWallpaperStatus: isRedMagic isLimitDefaultWallpaper="

    .line 412
    .line 413
    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 414
    .line 415
    .line 416
    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 417
    .line 418
    .line 419
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 420
    .line 421
    .line 422
    move-result-object v12

    .line 423
    invoke-static {v6, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 424
    .line 425
    .line 426
    move-wide/from16 v17, v7

    .line 427
    .line 428
    goto :goto_6

    .line 429
    :catchall_1
    move-exception v0

    .line 430
    const/4 v3, 0x1

    .line 431
    goto/16 :goto_18

    .line 432
    .line 433
    :cond_d
    const-string v9, "111111111000111111111000111111111000111111111000111100000000111000000000111110000000111111111000111111111000111111111000111111111000111111111000"

    .line 434
    .line 435
    invoke-static {v9, v14}, Lcom/android/launcher3/resource/A1;->g(Ljava/lang/String;Ljava/lang/String;)I

    .line 436
    .line 437
    .line 438
    move-result v9

    .line 439
    const-string v12, "111111111111111111111111111111111111111111111111111111111111110000000011111100000000000000000000000000000000000000000000000000000000000000000000"

    .line 440
    .line 441
    invoke-static {v12, v14}, Lcom/android/launcher3/resource/A1;->g(Ljava/lang/String;Ljava/lang/String;)I

    .line 442
    .line 443
    .line 444
    move-result v12

    .line 445
    const-string v13, "111111111111111111111100111111100000111100000000111100000000111111100000000000111110000000000000000000000000000000000000000000001111001111111111"

    .line 446
    .line 447
    invoke-static {v13, v14}, Lcom/android/launcher3/resource/A1;->g(Ljava/lang/String;Ljava/lang/String;)I

    .line 448
    .line 449
    .line 450
    move-result v13

    .line 451
    move-wide/from16 v17, v7

    .line 452
    .line 453
    const/16 v7, 0x1c

    .line 454
    .line 455
    if-le v9, v7, :cond_f

    .line 456
    .line 457
    if-le v12, v11, :cond_f

    .line 458
    .line 459
    if-nez v13, :cond_e

    .line 460
    .line 461
    goto :goto_4

    .line 462
    :cond_e
    const/4 v7, 0x0

    .line 463
    goto :goto_5

    .line 464
    :cond_f
    :goto_4
    const/4 v7, 0x1

    .line 465
    :goto_5
    new-instance v8, Ljava/lang/StringBuilder;

    .line 466
    .line 467
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 468
    .line 469
    .line 470
    const-string v11, "syncWallpaperStatus: isRedMagic isLimitColorDefaultWallpaper="

    .line 471
    .line 472
    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 473
    .line 474
    .line 475
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 476
    .line 477
    .line 478
    const-string v11, ",distance1="

    .line 479
    .line 480
    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 481
    .line 482
    .line 483
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 484
    .line 485
    .line 486
    const-string v9, ", distance2="

    .line 487
    .line 488
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 489
    .line 490
    .line 491
    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 492
    .line 493
    .line 494
    const-string v9, ", distance3="

    .line 495
    .line 496
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 497
    .line 498
    .line 499
    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 500
    .line 501
    .line 502
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 503
    .line 504
    .line 505
    move-result-object v8

    .line 506
    invoke-static {v6, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 507
    .line 508
    .line 509
    move v9, v7

    .line 510
    goto :goto_6

    .line 511
    :cond_10
    move-wide/from16 v17, v7

    .line 512
    .line 513
    const/4 v9, 0x0

    .line 514
    :goto_6
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 515
    .line 516
    .line 517
    move-result v7

    .line 518
    if-nez v7, :cond_17

    .line 519
    .line 520
    if-eqz v5, :cond_17

    .line 521
    .line 522
    invoke-virtual {v5, v4}, Lcom/android/launcher3/resource/K$d;->e(Ljava/lang/String;)Lcom/android/launcher3/resource/K$e;

    .line 523
    .line 524
    .line 525
    move-result-object v0

    .line 526
    instance-of v3, v0, Lcom/android/launcher3/resource/K$f;

    .line 527
    .line 528
    if-eqz v3, :cond_16

    .line 529
    .line 530
    check-cast v0, Lcom/android/launcher3/resource/K$f;

    .line 531
    .line 532
    invoke-virtual {v0}, Lcom/android/launcher3/resource/K$f;->X()I

    .line 533
    .line 534
    .line 535
    move-result v3

    .line 536
    if-nez v3, :cond_11

    .line 537
    .line 538
    invoke-virtual {v2}, Lcom/android/launcher3/resource/K$f;->X()I

    .line 539
    .line 540
    .line 541
    move-result v3

    .line 542
    goto :goto_7

    .line 543
    :cond_11
    invoke-virtual {v0}, Lcom/android/launcher3/resource/K$f;->X()I

    .line 544
    .line 545
    .line 546
    move-result v3

    .line 547
    :goto_7
    if-eqz v9, :cond_12

    .line 548
    .line 549
    const/4 v12, -0x1

    .line 550
    :goto_8
    const/4 v3, 0x1

    .line 551
    goto :goto_9

    .line 552
    :cond_12
    move v12, v3

    .line 553
    goto :goto_8

    .line 554
    :goto_9
    invoke-virtual {v15, v12, v3}, Lcom/android/launcher3/resource/K$c;->k(IZ)V

    .line 555
    .line 556
    .line 557
    invoke-virtual {v0}, Lcom/android/launcher3/resource/K$f;->Y()I

    .line 558
    .line 559
    .line 560
    move-result v3

    .line 561
    if-nez v3, :cond_13

    .line 562
    .line 563
    invoke-virtual {v2}, Lcom/android/launcher3/resource/K$f;->Y()I

    .line 564
    .line 565
    .line 566
    move-result v3

    .line 567
    :goto_a
    const/4 v7, 0x1

    .line 568
    goto :goto_b

    .line 569
    :cond_13
    invoke-virtual {v0}, Lcom/android/launcher3/resource/K$f;->Y()I

    .line 570
    .line 571
    .line 572
    move-result v3

    .line 573
    goto :goto_a

    .line 574
    :goto_b
    invoke-virtual {v15, v3, v7}, Lcom/android/launcher3/resource/K$c;->n(IZ)V

    .line 575
    .line 576
    .line 577
    invoke-virtual {v0}, Lcom/android/launcher3/resource/K$f;->Y()I

    .line 578
    .line 579
    .line 580
    move-result v3

    .line 581
    if-nez v3, :cond_14

    .line 582
    .line 583
    invoke-virtual {v2}, Lcom/android/launcher3/resource/K$f;->Z()I

    .line 584
    .line 585
    .line 586
    move-result v0

    .line 587
    goto :goto_c

    .line 588
    :cond_14
    invoke-virtual {v0}, Lcom/android/launcher3/resource/K$f;->Z()I

    .line 589
    .line 590
    .line 591
    move-result v0

    .line 592
    :goto_c
    if-eqz v9, :cond_15

    .line 593
    .line 594
    const/high16 v11, -0x1000000

    .line 595
    .line 596
    :goto_d
    const/4 v3, 0x1

    .line 597
    goto :goto_e

    .line 598
    :cond_15
    move v11, v0

    .line 599
    goto :goto_d

    .line 600
    :goto_e
    invoke-virtual {v15, v11, v3}, Lcom/android/launcher3/resource/K$c;->q(IZ)V

    .line 601
    .line 602
    .line 603
    invoke-virtual {v15, v4, v3}, Lcom/android/launcher3/resource/K$c;->p(Ljava/lang/String;Z)V

    .line 604
    .line 605
    .line 606
    :cond_16
    invoke-virtual {v5, v2}, Lcom/android/launcher3/resource/K$d;->c(Lcom/android/launcher3/resource/K$e;)V

    .line 607
    .line 608
    .line 609
    goto :goto_13

    .line 610
    :cond_17
    iget-object v4, v1, Lcom/android/launcher3/resource/G1;->c:Landroid/content/Context;

    .line 611
    .line 612
    invoke-direct {v1, v4}, Lcom/android/launcher3/resource/G1;->n(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    .line 613
    .line 614
    .line 615
    move-result-object v4

    .line 616
    invoke-virtual {v2, v4}, Lcom/android/launcher3/resource/K$e;->C(Landroid/graphics/drawable/Drawable;)V

    .line 617
    .line 618
    .line 619
    invoke-virtual {v2, v3}, Lcom/android/launcher3/resource/K$e;->G(Ljava/lang/String;)V

    .line 620
    .line 621
    .line 622
    const/4 v3, 0x3

    .line 623
    invoke-virtual {v2, v3}, Lcom/android/launcher3/resource/K$e;->I(I)V

    .line 624
    .line 625
    .line 626
    invoke-virtual {v2}, Lcom/android/launcher3/resource/K$e;->o()Landroid/database/Cursor;

    .line 627
    .line 628
    .line 629
    move-result-object v3

    .line 630
    if-eqz v3, :cond_18

    .line 631
    .line 632
    invoke-static {v3}, Lx1/O;->x(Landroid/database/Cursor;)V

    .line 633
    .line 634
    .line 635
    invoke-static {v4}, Lx1/O;->I(Landroid/graphics/drawable/Drawable;)[B

    .line 636
    .line 637
    .line 638
    move-result-object v3

    .line 639
    invoke-virtual {v2, v3}, Lcom/android/launcher3/resource/K$e;->N([B)V

    .line 640
    .line 641
    .line 642
    goto :goto_f

    .line 643
    :cond_18
    invoke-virtual {v2}, Lcom/android/launcher3/resource/K$f;->W()V

    .line 644
    .line 645
    .line 646
    :goto_f
    if-eqz v9, :cond_19

    .line 647
    .line 648
    const/4 v12, -0x1

    .line 649
    :goto_10
    const/4 v3, 0x1

    .line 650
    goto :goto_11

    .line 651
    :cond_19
    invoke-virtual {v2}, Lcom/android/launcher3/resource/K$f;->X()I

    .line 652
    .line 653
    .line 654
    move-result v12

    .line 655
    goto :goto_10

    .line 656
    :goto_11
    invoke-virtual {v15, v12, v3}, Lcom/android/launcher3/resource/K$c;->k(IZ)V

    .line 657
    .line 658
    .line 659
    invoke-virtual {v2}, Lcom/android/launcher3/resource/K$f;->Y()I

    .line 660
    .line 661
    .line 662
    move-result v4

    .line 663
    invoke-virtual {v15, v4, v3}, Lcom/android/launcher3/resource/K$c;->n(IZ)V

    .line 664
    .line 665
    .line 666
    if-eqz v9, :cond_1a

    .line 667
    .line 668
    const/high16 v11, -0x1000000

    .line 669
    .line 670
    goto :goto_12

    .line 671
    :cond_1a
    invoke-virtual {v2}, Lcom/android/launcher3/resource/K$f;->Z()I

    .line 672
    .line 673
    .line 674
    move-result v11

    .line 675
    :goto_12
    invoke-virtual {v15, v11, v3}, Lcom/android/launcher3/resource/K$c;->q(IZ)V

    .line 676
    .line 677
    .line 678
    invoke-virtual {v15, v0, v3}, Lcom/android/launcher3/resource/K$c;->p(Ljava/lang/String;Z)V

    .line 679
    .line 680
    .line 681
    :goto_13
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 682
    .line 683
    .line 684
    move-result-object v0

    .line 685
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->p()Z

    .line 686
    .line 687
    .line 688
    move-result v0

    .line 689
    if-eqz v0, :cond_1c

    .line 690
    .line 691
    const-string v0, "111111111111111111111111111111111111111100000000111000000000111000001111111111111111111111111111111111111111111111111111111111111111111111111111"

    .line 692
    .line 693
    invoke-static {v0, v14}, Lcom/android/launcher3/resource/A1;->g(Ljava/lang/String;Ljava/lang/String;)I

    .line 694
    .line 695
    .line 696
    move-result v0

    .line 697
    const/16 v2, 0xa

    .line 698
    .line 699
    if-ge v0, v2, :cond_1b

    .line 700
    .line 701
    const/4 v4, 0x1

    .line 702
    :goto_14
    const/4 v3, 0x1

    .line 703
    goto :goto_15

    .line 704
    :cond_1b
    const/4 v4, 0x0

    .line 705
    goto :goto_14

    .line 706
    :goto_15
    invoke-virtual {v15, v4, v3}, Lcom/android/launcher3/resource/K$c;->l(ZZ)V

    .line 707
    .line 708
    .line 709
    :cond_1c
    invoke-static {}, Lx1/O;->N1()Z

    .line 710
    .line 711
    .line 712
    move-result v0

    .line 713
    if-nez v0, :cond_1d

    .line 714
    .line 715
    invoke-static {}, Lx1/O;->C2()Z

    .line 716
    .line 717
    .line 718
    move-result v0

    .line 719
    if-nez v0, :cond_1d

    .line 720
    .line 721
    invoke-static {}, Lx1/O;->l2()Z

    .line 722
    .line 723
    .line 724
    move-result v0

    .line 725
    if-nez v0, :cond_1d

    .line 726
    .line 727
    invoke-static {}, Lx1/O;->m1()Z

    .line 728
    .line 729
    .line 730
    move-result v0

    .line 731
    if-eqz v0, :cond_1d

    .line 732
    .line 733
    invoke-direct {v1}, Lcom/android/launcher3/resource/G1;->r()Landroid/graphics/Bitmap;

    .line 734
    .line 735
    .line 736
    move-result-object v0

    .line 737
    invoke-direct {v1, v0}, Lcom/android/launcher3/resource/G1;->G(Landroid/graphics/Bitmap;)V

    .line 738
    .line 739
    .line 740
    :cond_1d
    new-instance v0, Ljava/lang/StringBuilder;

    .line 741
    .line 742
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 743
    .line 744
    .line 745
    const-string v2, "syncWallpaperStatus-- finish  time "

    .line 746
    .line 747
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 748
    .line 749
    .line 750
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 751
    .line 752
    .line 753
    move-result-wide v2

    .line 754
    sub-long v2, v2, v17

    .line 755
    .line 756
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 757
    .line 758
    .line 759
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 760
    .line 761
    .line 762
    move-result-object v0

    .line 763
    invoke-static {v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 764
    .line 765
    .line 766
    const/4 v3, 0x1

    .line 767
    iput-boolean v3, v1, Lcom/android/launcher3/resource/G1;->a:Z

    .line 768
    .line 769
    invoke-static {v10}, Lx1/O;->w4(Landroid/graphics/Bitmap;)V

    .line 770
    .line 771
    .line 772
    return-void

    .line 773
    :cond_1e
    :goto_16
    :try_start_9
    const-string v0, "syncWallpaperStatus-- get wallpaper error!! "

    .line 774
    .line 775
    invoke-static {v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 776
    .line 777
    .line 778
    const/4 v3, 0x1

    .line 779
    iput-boolean v3, v1, Lcom/android/launcher3/resource/G1;->a:Z

    .line 780
    .line 781
    invoke-static {v10}, Lx1/O;->w4(Landroid/graphics/Bitmap;)V

    .line 782
    .line 783
    .line 784
    return-void

    .line 785
    :goto_17
    :try_start_a
    new-instance v2, Ljava/lang/StringBuilder;

    .line 786
    .line 787
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 788
    .line 789
    .line 790
    const-string v3, "syncWallpaperStatus-- Exception "

    .line 791
    .line 792
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 793
    .line 794
    .line 795
    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 796
    .line 797
    .line 798
    move-result-object v3

    .line 799
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 800
    .line 801
    .line 802
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 803
    .line 804
    .line 805
    move-result-object v2

    .line 806
    invoke-static {v6, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 807
    .line 808
    .line 809
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    .line 810
    .line 811
    .line 812
    const/4 v3, 0x1

    .line 813
    iput-boolean v3, v1, Lcom/android/launcher3/resource/G1;->a:Z

    .line 814
    .line 815
    invoke-static {v10}, Lx1/O;->w4(Landroid/graphics/Bitmap;)V

    .line 816
    .line 817
    .line 818
    return-void

    .line 819
    :goto_18
    iput-boolean v3, v1, Lcom/android/launcher3/resource/G1;->a:Z

    .line 820
    .line 821
    invoke-static {v10}, Lx1/O;->w4(Landroid/graphics/Bitmap;)V

    .line 822
    .line 823
    .line 824
    throw v0
.end method

.method private y()Ljava/io/InputStream;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/G1;->b:Landroid/net/Uri;

    .line 2
    .line 3
    const-string v1, "R-Loader-WALLPAPER"

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget v2, p0, Lcom/android/launcher3/resource/G1;->f:I

    .line 8
    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    iget-object v2, p0, Lcom/android/launcher3/resource/G1;->d:Ljava/lang/String;

    .line 12
    .line 13
    if-nez v2, :cond_0

    .line 14
    .line 15
    iget-object v2, p0, Lcom/android/launcher3/resource/G1;->e:[B

    .line 16
    .line 17
    if-nez v2, :cond_0

    .line 18
    .line 19
    const-string p0, "cannot read original file, no input URI, resource ID, or image byte array given"

    .line 20
    .line 21
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    goto/16 :goto_1

    .line 25
    .line 26
    :cond_0
    if-eqz v0, :cond_1

    .line 27
    .line 28
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 31
    .line 32
    .line 33
    const-string v2, "mInUri "

    .line 34
    .line 35
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v2, p0, Lcom/android/launcher3/resource/G1;->b:Landroid/net/Uri;

    .line 39
    .line 40
    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/android/launcher3/resource/G1;->c:Landroid/content/Context;

    .line 55
    .line 56
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iget-object p0, p0, Lcom/android/launcher3/resource/G1;->b:Landroid/net/Uri;

    .line 61
    .line 62
    invoke-virtual {v0, p0}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    return-object p0

    .line 67
    :catch_0
    move-exception p0

    .line 68
    goto :goto_0

    .line 69
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/resource/G1;->d:Ljava/lang/String;

    .line 70
    .line 71
    if-eqz v0, :cond_2

    .line 72
    .line 73
    new-instance v0, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 76
    .line 77
    .line 78
    const-string v2, "mInFilePath "

    .line 79
    .line 80
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    iget-object v2, p0, Lcom/android/launcher3/resource/G1;->d:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Lcom/android/launcher3/resource/G1;->c:Landroid/content/Context;

    .line 96
    .line 97
    iget-object p0, p0, Lcom/android/launcher3/resource/G1;->d:Ljava/lang/String;

    .line 98
    .line 99
    invoke-static {v0, p0}, Lcom/android/launcher3/resource/A1;->c(Landroid/content/Context;Ljava/lang/String;)Ljava/io/InputStream;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    return-object p0

    .line 104
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/resource/G1;->e:[B

    .line 105
    .line 106
    if-eqz v0, :cond_3

    .line 107
    .line 108
    new-instance v0, Ljava/lang/StringBuilder;

    .line 109
    .line 110
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 111
    .line 112
    .line 113
    const-string v2, "mInImageBytes length :"

    .line 114
    .line 115
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    iget-object v2, p0, Lcom/android/launcher3/resource/G1;->e:[B

    .line 119
    .line 120
    array-length v2, v2

    .line 121
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    .line 130
    .line 131
    new-instance v0, Ljava/io/BufferedInputStream;

    .line 132
    .line 133
    new-instance v2, Ljava/io/ByteArrayInputStream;

    .line 134
    .line 135
    iget-object p0, p0, Lcom/android/launcher3/resource/G1;->e:[B

    .line 136
    .line 137
    invoke-direct {v2, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 138
    .line 139
    .line 140
    invoke-direct {v0, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 141
    .line 142
    .line 143
    return-object v0

    .line 144
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 145
    .line 146
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 147
    .line 148
    .line 149
    const-string v2, "mInResId "

    .line 150
    .line 151
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    iget v2, p0, Lcom/android/launcher3/resource/G1;->f:I

    .line 155
    .line 156
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 164
    .line 165
    .line 166
    iget-object v0, p0, Lcom/android/launcher3/resource/G1;->c:Landroid/content/Context;

    .line 167
    .line 168
    iget p0, p0, Lcom/android/launcher3/resource/G1;->f:I

    .line 169
    .line 170
    invoke-static {v0, p0}, Lcom/android/launcher3/resource/A1;->b(Landroid/content/Context;I)Ljava/io/InputStream;

    .line 171
    .line 172
    .line 173
    move-result-object p0
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 174
    return-object p0

    .line 175
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 176
    .line 177
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 178
    .line 179
    .line 180
    const-string v2, "cannot read file: "

    .line 181
    .line 182
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    invoke-virtual {p0}, Ljava/io/FileNotFoundException;->toString()Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 197
    .line 198
    .line 199
    :goto_1
    const/4 p0, 0x0

    .line 200
    return-object p0
.end method


# virtual methods
.method public A(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/resource/G1;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public B([B)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/resource/G1;->e:[B

    .line 2
    .line 3
    return-void
.end method

.method public C(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/resource/G1;->f:I

    .line 2
    .line 3
    return-void
.end method

.method D()Z
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/resource/G1;->y()Ljava/io/InputStream;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, "R-Loader-WALLPAPER"

    .line 8
    .line 9
    const-string v0, "setWallpaper-- no wallpaperSrc was found!!"

    .line 10
    .line 11
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_0
    new-instance v1, Lcom/android/launcher3/resource/D1;

    .line 17
    .line 18
    invoke-direct {v1, p0, v0}, Lcom/android/launcher3/resource/D1;-><init>(Lcom/android/launcher3/resource/G1;Ljava/io/InputStream;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v1}, Lcom/android/launcher3/resource/o0;->P(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0
.end method

.method E(Ljava/io/InputStream;)Z
    .locals 5

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/resource/G1;->a:Z

    .line 2
    .line 3
    const-string v0, "R-Loader-WALLPAPER"

    .line 4
    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const-string p0, "setWallpaper lastSetWallpaperFlag:false"

    .line 8
    .line 9
    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_0
    const-string p0, "setWallpaper-- start"

    .line 15
    .line 16
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 20
    .line 21
    .line 22
    move-result-wide v1

    .line 23
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p1, p0}, Lcom/android/launcher3/resource/A1;->h(Ljava/io/InputStream;Landroid/content/Context;)Z

    .line 28
    .line 29
    .line 30
    new-instance p0, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 33
    .line 34
    .line 35
    const-string p1, "setWallpaper-- end "

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 41
    .line 42
    .line 43
    move-result-wide v3

    .line 44
    sub-long/2addr v3, v1

    .line 45
    invoke-virtual {p0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    const/4 p0, 0x1

    .line 56
    return p0
.end method

.method I()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/resource/B1;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/resource/B1;-><init>(Lcom/android/launcher3/resource/G1;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lcom/android/launcher3/resource/o0;->P(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method g()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/launcher3/resource/G1;->b:Landroid/net/Uri;

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    iput v1, p0, Lcom/android/launcher3/resource/G1;->f:I

    .line 6
    .line 7
    iput-object v0, p0, Lcom/android/launcher3/resource/G1;->d:Ljava/lang/String;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/resource/G1;->e:[B

    .line 10
    .line 11
    return-void
.end method

.method k()Landroid/graphics/Bitmap;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/G1;->h:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    const-string v1, "R-Loader-WALLPAPER"

    .line 5
    .line 6
    const-string v2, "getBlurredWallpaperCache blur lock locked"

    .line 7
    .line 8
    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/resource/G1;->g:Landroid/graphics/Bitmap;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catchall_0
    move-exception p0

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    :goto_0
    const/high16 v1, -0x1000000

    .line 25
    .line 26
    const/16 v2, 0x8c

    .line 27
    .line 28
    invoke-static {v1, v2}, Ls1/q;->h(II)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-static {v1}, Lcom/android/launcher3/resource/t;->h(I)Landroid/graphics/Bitmap;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iput-object v1, p0, Lcom/android/launcher3/resource/G1;->g:Landroid/graphics/Bitmap;

    .line 37
    .line 38
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/resource/G1;->g:Landroid/graphics/Bitmap;

    .line 39
    .line 40
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 41
    .line 42
    const/4 v2, 0x1

    .line 43
    invoke-virtual {p0, v1, v2}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    monitor-exit v0

    .line 48
    return-object p0

    .line 49
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    throw p0
.end method

.method public l()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/G1;->j:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method s(Z)V
    .locals 5

    .line 1
    invoke-static {}, Lx1/O;->C2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "R-Loader-WALLPAPER"

    .line 6
    .line 7
    if-nez v0, :cond_4

    .line 8
    .line 9
    invoke-static {}, Lx1/O;->l2()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_4

    .line 14
    .line 15
    invoke-static {}, Lx1/O;->m1()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_4

    .line 20
    .line 21
    invoke-static {}, Lx1/O;->N1()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    goto :goto_2

    .line 28
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/resource/G1;->i:Z

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/resource/G1;->c:Landroid/content/Context;

    .line 34
    .line 35
    invoke-static {v0}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Landroid/app/WallpaperManager;->getWallpaperInfo()Landroid/app/WallpaperInfo;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const/4 v2, 0x1

    .line 44
    if-eqz v0, :cond_2

    .line 45
    .line 46
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iget-object v0, v0, Lcom/android/launcher3/resource/g0;->d:Lcom/android/launcher3/resource/r0;

    .line 51
    .line 52
    if-eqz v0, :cond_2

    .line 53
    .line 54
    const-wide/16 v3, 0x320

    .line 55
    .line 56
    invoke-static {v3, v4}, Landroid/os/SystemClock;->sleep(J)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    move p1, v2

    .line 61
    :goto_0
    if-eqz p1, :cond_3

    .line 62
    .line 63
    invoke-direct {p0}, Lcom/android/launcher3/resource/G1;->r()Landroid/graphics/Bitmap;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    if-eqz p1, :cond_3

    .line 68
    .line 69
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-nez v0, :cond_3

    .line 74
    .line 75
    invoke-direct {p0, p1}, Lcom/android/launcher3/resource/G1;->G(Landroid/graphics/Bitmap;)V

    .line 76
    .line 77
    .line 78
    const-string p1, "initBlurredCacheWallpaper finish"

    .line 79
    .line 80
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    .line 82
    .line 83
    iput-boolean v2, p0, Lcom/android/launcher3/resource/G1;->i:Z

    .line 84
    .line 85
    :cond_3
    :goto_1
    return-void

    .line 86
    :cond_4
    :goto_2
    const-string p0, "initBlurredCacheWallpaper: do not need blurred wallpaper cache."

    .line 87
    .line 88
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method z(Landroid/content/ComponentName;)Z
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    const-string v1, "R-Loader-WALLPAPER"

    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    const-string p0, "setAliveWallpaper componentName is null, not target to start!"

    .line 7
    .line 8
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    return v0

    .line 12
    :cond_0
    iget-object v2, p0, Lcom/android/launcher3/resource/G1;->c:Landroid/content/Context;

    .line 13
    .line 14
    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    iget-object v3, p0, Lcom/android/launcher3/resource/G1;->c:Landroid/content/Context;

    .line 19
    .line 20
    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    const-string v4, "android.permission.SET_WALLPAPER_COMPONENT"

    .line 25
    .line 26
    invoke-virtual {v2, v4, v3}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    const/4 v3, 0x1

    .line 31
    if-nez v2, :cond_1

    .line 32
    .line 33
    move v2, v3

    .line 34
    goto :goto_0

    .line 35
    :cond_1
    move v2, v0

    .line 36
    :goto_0
    new-instance v4, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 39
    .line 40
    .line 41
    const-string v5, "setAliveWallpaper permission "

    .line 42
    .line 43
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    invoke-static {v1, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    if-eqz v2, :cond_2

    .line 57
    .line 58
    new-instance v0, Lcom/android/launcher3/resource/C1;

    .line 59
    .line 60
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/resource/C1;-><init>(Lcom/android/launcher3/resource/G1;Landroid/content/ComponentName;)V

    .line 61
    .line 62
    .line 63
    invoke-static {v0}, Lcom/android/launcher3/resource/o0;->P(Ljava/lang/Runnable;)V

    .line 64
    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_2
    new-instance v2, Landroid/content/Intent;

    .line 68
    .line 69
    const-string v4, "android.service.wallpaper.CHANGE_LIVE_WALLPAPER"

    .line 70
    .line 71
    invoke-direct {v2, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    const-string v4, "android.service.wallpaper.extra.LIVE_WALLPAPER_COMPONENT"

    .line 75
    .line 76
    invoke-virtual {v2, v4, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 77
    .line 78
    .line 79
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {p1}, Lcom/android/launcher3/resource/o0;->e()Lcom/android/launcher3/H5$i;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    if-eqz p1, :cond_4

    .line 88
    .line 89
    invoke-interface {p1}, Lcom/android/launcher3/H5$i;->h()Lcom/android/launcher3/views/k;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-static {p1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    if-nez p1, :cond_3

    .line 98
    .line 99
    const-string p0, "setAliveWallpaper find no activity instance to start activity! "

    .line 100
    .line 101
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    .line 103
    .line 104
    return v0

    .line 105
    :cond_3
    const/4 v0, 0x6

    .line 106
    invoke-direct {p0, p1, v2, v0}, Lcom/android/launcher3/resource/G1;->F(Landroid/app/Activity;Landroid/content/Intent;I)V

    .line 107
    .line 108
    .line 109
    return v3

    .line 110
    :cond_4
    const-string p0, "setAliveWallpaper find no ui callback to start activity!"

    .line 111
    .line 112
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    .line 114
    .line 115
    :goto_1
    return v3
.end method
