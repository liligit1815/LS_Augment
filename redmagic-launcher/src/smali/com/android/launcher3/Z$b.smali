.class public Lcom/android/launcher3/Z$b;
.super Lcom/android/launcher3/s$e;
.source "DefaultLayoutParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/Z;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "b"
.end annotation


# instance fields
.field final synthetic b:Lcom/android/launcher3/Z;


# direct methods
.method protected constructor <init>(Lcom/android/launcher3/Z;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/Z$b;->b:Lcom/android/launcher3/Z;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/android/launcher3/s$e;-><init>(Lcom/android/launcher3/s;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method protected d(Landroid/content/ComponentName;Landroid/os/Bundle;)I
    .locals 10

    .line 1
    const-string v0, "DefaultLayoutParser"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/Z$b;->b:Lcom/android/launcher3/Z;

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v1, v2}, Lcom/android/launcher3/s;->j(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, -0x1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    return v2

    .line 17
    :cond_0
    invoke-virtual {p1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const-string v3, "#custom-widget-"

    .line 22
    .line 23
    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    const-string v3, "_id"

    .line 28
    .line 29
    const-string v4, "appWidgetProvider"

    .line 30
    .line 31
    const-string v5, "itemType"

    .line 32
    .line 33
    const-string v6, "appWidgetId"

    .line 34
    .line 35
    if-eqz v1, :cond_2

    .line 36
    .line 37
    sget-object p2, Lk2/k;->m:Lcom/android/launcher3/util/I;

    .line 38
    .line 39
    iget-object v0, p0, Lcom/android/launcher3/Z$b;->b:Lcom/android/launcher3/Z;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/android/launcher3/s;->a:Landroid/content/Context;

    .line 42
    .line 43
    invoke-virtual {p2, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    check-cast p2, Lk2/k;

    .line 48
    .line 49
    invoke-virtual {p2, p1}, Lk2/k;->h(Landroid/content/ComponentName;)I

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    iget-object v0, p0, Lcom/android/launcher3/Z$b;->b:Lcom/android/launcher3/Z;

    .line 54
    .line 55
    iget-object v0, v0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 56
    .line 57
    const/4 v1, 0x5

    .line 58
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v0, v5, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/android/launcher3/Z$b;->b:Lcom/android/launcher3/Z;

    .line 66
    .line 67
    iget-object v0, v0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 68
    .line 69
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    invoke-virtual {v0, v6, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 74
    .line 75
    .line 76
    iget-object p2, p0, Lcom/android/launcher3/Z$b;->b:Lcom/android/launcher3/Z;

    .line 77
    .line 78
    iget-object p2, p2, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 79
    .line 80
    invoke-virtual {p1}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p2, v4, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    iget-object p1, p0, Lcom/android/launcher3/Z$b;->b:Lcom/android/launcher3/Z;

    .line 88
    .line 89
    iget-object p2, p1, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 90
    .line 91
    iget-object p1, p1, Lcom/android/launcher3/s;->c:Lcom/android/launcher3/s$d;

    .line 92
    .line 93
    invoke-interface {p1}, Lcom/android/launcher3/s$d;->c()I

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    invoke-virtual {p2, v3, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 102
    .line 103
    .line 104
    iget-object p0, p0, Lcom/android/launcher3/Z$b;->b:Lcom/android/launcher3/Z;

    .line 105
    .line 106
    iget-object p1, p0, Lcom/android/launcher3/s;->c:Lcom/android/launcher3/s$d;

    .line 107
    .line 108
    iget-object p2, p0, Lcom/android/launcher3/s;->o:Landroid/database/sqlite/SQLiteDatabase;

    .line 109
    .line 110
    iget-object p0, p0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 111
    .line 112
    invoke-interface {p1, p2, p0}, Lcom/android/launcher3/s$d;->b(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)I

    .line 113
    .line 114
    .line 115
    move-result p0

    .line 116
    if-gez p0, :cond_1

    .line 117
    .line 118
    return v2

    .line 119
    :cond_1
    return p0

    .line 120
    :cond_2
    const/4 v1, -0x2

    .line 121
    const/4 v7, 0x0

    .line 122
    :try_start_0
    iget-object v8, p0, Lcom/android/launcher3/Z$b;->b:Lcom/android/launcher3/Z;

    .line 123
    .line 124
    iget-object v8, v8, Lcom/android/launcher3/s;->d:Landroid/content/pm/PackageManager;

    .line 125
    .line 126
    invoke-virtual {v8, p1, v7}, Landroid/content/pm/PackageManager;->getReceiverInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 127
    .line 128
    .line 129
    goto :goto_0

    .line 130
    :catch_0
    iget-object v8, p0, Lcom/android/launcher3/Z$b;->b:Lcom/android/launcher3/Z;

    .line 131
    .line 132
    iget-object v8, v8, Lcom/android/launcher3/s;->d:Landroid/content/pm/PackageManager;

    .line 133
    .line 134
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v9

    .line 138
    filled-new-array {v9}, [Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v9

    .line 142
    invoke-virtual {v8, v9}, Landroid/content/pm/PackageManager;->currentToCanonicalPackageNames([Ljava/lang/String;)[Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v8

    .line 146
    new-instance v9, Landroid/content/ComponentName;

    .line 147
    .line 148
    aget-object v8, v8, v7

    .line 149
    .line 150
    invoke-virtual {p1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    invoke-direct {v9, v8, p1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    :try_start_1
    iget-object p1, p0, Lcom/android/launcher3/Z$b;->b:Lcom/android/launcher3/Z;

    .line 158
    .line 159
    iget-object p1, p1, Lcom/android/launcher3/s;->d:Landroid/content/pm/PackageManager;

    .line 160
    .line 161
    invoke-virtual {p1, v9, v7}, Landroid/content/pm/PackageManager;->getReceiverInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    .line 162
    .line 163
    .line 164
    move-object p1, v9

    .line 165
    :goto_0
    iget-object v7, p0, Lcom/android/launcher3/Z$b;->b:Lcom/android/launcher3/Z;

    .line 166
    .line 167
    iget-object v7, v7, Lcom/android/launcher3/s;->a:Landroid/content/Context;

    .line 168
    .line 169
    invoke-static {v7}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    .line 170
    .line 171
    .line 172
    move-result-object v7

    .line 173
    :try_start_2
    iget-object v8, p0, Lcom/android/launcher3/Z$b;->b:Lcom/android/launcher3/Z;

    .line 174
    .line 175
    iget-object v8, v8, Lcom/android/launcher3/s;->b:Lcom/android/launcher3/widget/l0;

    .line 176
    .line 177
    invoke-virtual {v8}, Lcom/android/launcher3/widget/l0;->r()I

    .line 178
    .line 179
    .line 180
    move-result v8
    :try_end_2
    .catch Ljava/lang/IllegalStateException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_1

    .line 181
    :try_start_3
    invoke-virtual {v7, v8, p1}, Landroid/appwidget/AppWidgetManager;->bindAppWidgetIdIfAllowed(ILandroid/content/ComponentName;)Z

    .line 182
    .line 183
    .line 184
    move-result v7

    .line 185
    if-nez v7, :cond_3

    .line 186
    .line 187
    new-instance p2, Ljava/lang/StringBuilder;

    .line 188
    .line 189
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 190
    .line 191
    .line 192
    const-string v3, "Unable to bind app widget id "

    .line 193
    .line 194
    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object p1

    .line 204
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    .line 206
    .line 207
    iget-object p0, p0, Lcom/android/launcher3/Z$b;->b:Lcom/android/launcher3/Z;

    .line 208
    .line 209
    iget-object p0, p0, Lcom/android/launcher3/s;->b:Lcom/android/launcher3/widget/l0;

    .line 210
    .line 211
    invoke-virtual {p0, v8}, Lcom/android/launcher3/widget/l0;->x(I)V

    .line 212
    .line 213
    .line 214
    return v1

    .line 215
    :catch_1
    move-exception p0

    .line 216
    goto :goto_1

    .line 217
    :cond_3
    iget-object v1, p0, Lcom/android/launcher3/Z$b;->b:Lcom/android/launcher3/Z;

    .line 218
    .line 219
    iget-object v1, v1, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 220
    .line 221
    const/4 v7, 0x4

    .line 222
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 223
    .line 224
    .line 225
    move-result-object v7

    .line 226
    invoke-virtual {v1, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 227
    .line 228
    .line 229
    iget-object v1, p0, Lcom/android/launcher3/Z$b;->b:Lcom/android/launcher3/Z;

    .line 230
    .line 231
    iget-object v1, v1, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 232
    .line 233
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 234
    .line 235
    .line 236
    move-result-object v5

    .line 237
    invoke-virtual {v1, v6, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 238
    .line 239
    .line 240
    iget-object v1, p0, Lcom/android/launcher3/Z$b;->b:Lcom/android/launcher3/Z;

    .line 241
    .line 242
    iget-object v1, v1, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 243
    .line 244
    invoke-virtual {p1}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    .line 245
    .line 246
    .line 247
    move-result-object v5

    .line 248
    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 249
    .line 250
    .line 251
    iget-object v1, p0, Lcom/android/launcher3/Z$b;->b:Lcom/android/launcher3/Z;

    .line 252
    .line 253
    iget-object v4, v1, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 254
    .line 255
    iget-object v1, v1, Lcom/android/launcher3/s;->c:Lcom/android/launcher3/s$d;

    .line 256
    .line 257
    invoke-interface {v1}, Lcom/android/launcher3/s$d;->c()I

    .line 258
    .line 259
    .line 260
    move-result v1

    .line 261
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 262
    .line 263
    .line 264
    move-result-object v1

    .line 265
    invoke-virtual {v4, v3, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 266
    .line 267
    .line 268
    iget-object v1, p0, Lcom/android/launcher3/Z$b;->b:Lcom/android/launcher3/Z;

    .line 269
    .line 270
    iget-object v3, v1, Lcom/android/launcher3/s;->c:Lcom/android/launcher3/s$d;

    .line 271
    .line 272
    iget-object v4, v1, Lcom/android/launcher3/s;->o:Landroid/database/sqlite/SQLiteDatabase;

    .line 273
    .line 274
    iget-object v1, v1, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 275
    .line 276
    invoke-interface {v3, v4, v1}, Lcom/android/launcher3/s$d;->b(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)I

    .line 277
    .line 278
    .line 279
    move-result v2

    .line 280
    if-gez v2, :cond_4

    .line 281
    .line 282
    iget-object p0, p0, Lcom/android/launcher3/Z$b;->b:Lcom/android/launcher3/Z;

    .line 283
    .line 284
    iget-object p0, p0, Lcom/android/launcher3/s;->b:Lcom/android/launcher3/widget/l0;

    .line 285
    .line 286
    invoke-virtual {p0, v8}, Lcom/android/launcher3/widget/l0;->x(I)V

    .line 287
    .line 288
    .line 289
    return v2

    .line 290
    :cond_4
    invoke-virtual {p2}, Landroid/os/Bundle;->isEmpty()Z

    .line 291
    .line 292
    .line 293
    move-result v1

    .line 294
    if-nez v1, :cond_5

    .line 295
    .line 296
    new-instance v1, Landroid/content/Intent;

    .line 297
    .line 298
    const-string v3, "com.android.launcher.action.APPWIDGET_DEFAULT_WORKSPACE_CONFIGURE"

    .line 299
    .line 300
    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 301
    .line 302
    .line 303
    invoke-virtual {v1, p1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 304
    .line 305
    .line 306
    invoke-virtual {v1, p2}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 307
    .line 308
    .line 309
    invoke-virtual {v1, v6, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 310
    .line 311
    .line 312
    iget-object p0, p0, Lcom/android/launcher3/Z$b;->b:Lcom/android/launcher3/Z;

    .line 313
    .line 314
    iget-object p0, p0, Lcom/android/launcher3/s;->a:Landroid/content/Context;

    .line 315
    .line 316
    invoke-virtual {p0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 317
    .line 318
    .line 319
    goto :goto_2

    .line 320
    :catch_2
    move-exception p0

    .line 321
    const-string p1, "verifyAndInsert, allocating appWidgetId"

    .line 322
    .line 323
    invoke-static {v0, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_1

    .line 324
    .line 325
    .line 326
    return v1

    .line 327
    :goto_1
    const-string p1, "Problem allocating appWidgetId"

    .line 328
    .line 329
    invoke-static {v0, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 330
    .line 331
    .line 332
    :cond_5
    :goto_2
    return v2

    .line 333
    :catch_3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 334
    .line 335
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 336
    .line 337
    .line 338
    const-string p1, "Can\'t find widget provider: "

    .line 339
    .line 340
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 341
    .line 342
    .line 343
    invoke-virtual {v9}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 344
    .line 345
    .line 346
    move-result-object p1

    .line 347
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 348
    .line 349
    .line 350
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 351
    .line 352
    .line 353
    move-result-object p0

    .line 354
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 355
    .line 356
    .line 357
    return v1
.end method
