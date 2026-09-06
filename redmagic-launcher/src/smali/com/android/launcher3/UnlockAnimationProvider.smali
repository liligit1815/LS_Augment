.class public Lcom/android/launcher3/UnlockAnimationProvider;
.super Landroid/content/ContentProvider;
.source "UnlockAnimationProvider.java"


# static fields
.field private static final g:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "content://com.android.launcher3.unlockAnimation"

    .line 2
    .line 3
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lcom/android/launcher3/UnlockAnimationProvider;->g:Landroid/net/Uri;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private a(Lcom/android/launcher3/C2;Ljava/lang/String;Landroid/graphics/Point;I)V
    .locals 8

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "UnlockAnimationProvider"

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string p0, "launcherIconAnimation: launcherOneShot:callUnlockAnimation launcher.getMFVInstance() is null, return!"

    .line 10
    .line 11
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lcom/android/launcher3/q4;->S()Lcom/android/launcher3/W3;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    const-string p0, "launcherIconAnimation: launcherOneShot:callUnlockAnimation launcher.getMFVInstance().getMfvAnimationSets() is null, return!"

    .line 26
    .line 27
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    new-instance v0, Landroid/os/Handler;

    .line 32
    .line 33
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 38
    .line 39
    .line 40
    new-instance v2, Lcom/android/launcher3/UnlockAnimationProvider$a;

    .line 41
    .line 42
    move-object v3, p0

    .line 43
    move-object v5, p1

    .line 44
    move-object v4, p2

    .line 45
    move-object v6, p3

    .line 46
    move v7, p4

    .line 47
    invoke-direct/range {v2 .. v7}, Lcom/android/launcher3/UnlockAnimationProvider$a;-><init>(Lcom/android/launcher3/UnlockAnimationProvider;Ljava/lang/String;Lcom/android/launcher3/C2;Landroid/graphics/Point;I)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 51
    .line 52
    .line 53
    return-void
.end method


# virtual methods
.method public call(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 11

    .line 1
    new-instance p2, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {p2}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v1, "launcherIconAnimation: launcherOneShot: call method="

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, " getCallingPackage="

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/content/ContentProvider;->getCallingPackage()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "UnlockAnimationProvider"

    .line 36
    .line 37
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    if-nez v0, :cond_0

    .line 45
    .line 46
    const-string p0, "launcherIconAnimation: launcherOneShot: launcher is null, return!"

    .line 47
    .line 48
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    return-object p2

    .line 52
    :cond_0
    const-string v2, "com.android.systemui"

    .line 53
    .line 54
    invoke-virtual {p0}, Landroid/content/ContentProvider;->getCallingPackage()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    if-nez v2, :cond_1

    .line 63
    .line 64
    const-string p0, "launcherIconAnimation: launcherOneShot: calling package is not systemUI, return!"

    .line 65
    .line 66
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    return-object p2

    .line 70
    :cond_1
    invoke-static {}, Lx1/O;->P1()Z

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    const-string v3, "one_shot_aod_type"

    .line 75
    .line 76
    const-string v4, "one_shot_coordinate_y"

    .line 77
    .line 78
    const-string v5, "one_shot_coordinate_x"

    .line 79
    .line 80
    const-string v6, "unlock_animation"

    .line 81
    .line 82
    const-string v7, "unlock_animation_screen_on"

    .line 83
    .line 84
    const/4 v8, -0x1

    .line 85
    if-eqz v2, :cond_6

    .line 86
    .line 87
    const-string v2, "unlock_type"

    .line 88
    .line 89
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    if-eqz p1, :cond_8

    .line 94
    .line 95
    if-nez p3, :cond_2

    .line 96
    .line 97
    const-string p0, "launcherIconAnimation: extras is null, return!"

    .line 98
    .line 99
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    .line 101
    .line 102
    return-object p2

    .line 103
    :cond_2
    const-string p1, "swipe"

    .line 104
    .line 105
    invoke-virtual {p3, v2, p1}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    new-instance v9, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 112
    .line 113
    .line 114
    const-string v10, "launcherIconAnimation: launcherOneShot: unlockType="

    .line 115
    .line 116
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v9

    .line 126
    invoke-static {v1, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    .line 128
    .line 129
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    const/4 v9, 0x1

    .line 134
    sparse-switch v1, :sswitch_data_0

    .line 135
    .line 136
    .line 137
    goto/16 :goto_0

    .line 138
    .line 139
    :sswitch_0
    const-string v1, "password"

    .line 140
    .line 141
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result v1

    .line 145
    if-eqz v1, :cond_3

    .line 146
    .line 147
    const/4 v1, 0x6

    .line 148
    goto :goto_1

    .line 149
    :sswitch_1
    const-string v1, "oneshot_screen_on"

    .line 150
    .line 151
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    if-eqz v1, :cond_3

    .line 156
    .line 157
    move v1, v9

    .line 158
    goto :goto_1

    .line 159
    :sswitch_2
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    move-result v1

    .line 163
    if-eqz v1, :cond_3

    .line 164
    .line 165
    const/4 v1, 0x3

    .line 166
    goto :goto_1

    .line 167
    :sswitch_3
    const-string v1, "none"

    .line 168
    .line 169
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    move-result v1

    .line 173
    if-eqz v1, :cond_3

    .line 174
    .line 175
    const/4 v1, 0x2

    .line 176
    goto :goto_1

    .line 177
    :sswitch_4
    const-string v1, "face"

    .line 178
    .line 179
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    move-result v1

    .line 183
    if-eqz v1, :cond_3

    .line 184
    .line 185
    const/16 v1, 0x9

    .line 186
    .line 187
    goto :goto_1

    .line 188
    :sswitch_5
    const-string v1, "pin"

    .line 189
    .line 190
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 191
    .line 192
    .line 193
    move-result v1

    .line 194
    if-eqz v1, :cond_3

    .line 195
    .line 196
    const/4 v1, 0x5

    .line 197
    goto :goto_1

    .line 198
    :sswitch_6
    const-string v1, "aod"

    .line 199
    .line 200
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 201
    .line 202
    .line 203
    move-result v1

    .line 204
    if-eqz v1, :cond_3

    .line 205
    .line 206
    const/4 v1, 0x7

    .line 207
    goto :goto_1

    .line 208
    :sswitch_7
    const-string v1, "pattern"

    .line 209
    .line 210
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 211
    .line 212
    .line 213
    move-result v1

    .line 214
    if-eqz v1, :cond_3

    .line 215
    .line 216
    const/4 v1, 0x4

    .line 217
    goto :goto_1

    .line 218
    :sswitch_8
    const-string v1, "finger"

    .line 219
    .line 220
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 221
    .line 222
    .line 223
    move-result v1

    .line 224
    if-eqz v1, :cond_3

    .line 225
    .line 226
    const/16 v1, 0x8

    .line 227
    .line 228
    goto :goto_1

    .line 229
    :sswitch_9
    const-string v1, "oneshot"

    .line 230
    .line 231
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 232
    .line 233
    .line 234
    move-result v1

    .line 235
    if-eqz v1, :cond_3

    .line 236
    .line 237
    const/4 v1, 0x0

    .line 238
    goto :goto_1

    .line 239
    :cond_3
    :goto_0
    move v1, v8

    .line 240
    :goto_1
    if-eqz v1, :cond_5

    .line 241
    .line 242
    if-eq v1, v9, :cond_4

    .line 243
    .line 244
    new-instance p3, Landroid/graphics/Point;

    .line 245
    .line 246
    invoke-direct {p3}, Landroid/graphics/Point;-><init>()V

    .line 247
    .line 248
    .line 249
    invoke-direct {p0, v0, p1, p3, v8}, Lcom/android/launcher3/UnlockAnimationProvider;->a(Lcom/android/launcher3/C2;Ljava/lang/String;Landroid/graphics/Point;I)V

    .line 250
    .line 251
    .line 252
    return-object p2

    .line 253
    :cond_4
    new-instance p1, Landroid/graphics/Point;

    .line 254
    .line 255
    invoke-direct {p1}, Landroid/graphics/Point;-><init>()V

    .line 256
    .line 257
    .line 258
    invoke-direct {p0, v0, v7, p1, v8}, Lcom/android/launcher3/UnlockAnimationProvider;->a(Lcom/android/launcher3/C2;Ljava/lang/String;Landroid/graphics/Point;I)V

    .line 259
    .line 260
    .line 261
    return-object p2

    .line 262
    :cond_5
    invoke-virtual {p3, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    .line 263
    .line 264
    .line 265
    move-result p1

    .line 266
    invoke-virtual {p3, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    .line 267
    .line 268
    .line 269
    move-result v1

    .line 270
    invoke-virtual {p3, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    .line 271
    .line 272
    .line 273
    move-result p3

    .line 274
    new-instance v2, Landroid/graphics/Point;

    .line 275
    .line 276
    invoke-direct {v2, p1, v1}, Landroid/graphics/Point;-><init>(II)V

    .line 277
    .line 278
    .line 279
    invoke-direct {p0, v0, v6, v2, p3}, Lcom/android/launcher3/UnlockAnimationProvider;->a(Lcom/android/launcher3/C2;Ljava/lang/String;Landroid/graphics/Point;I)V

    .line 280
    .line 281
    .line 282
    return-object p2

    .line 283
    :cond_6
    invoke-static {v0}, Lx1/O;->Z4(Lcom/android/launcher3/C2;)Z

    .line 284
    .line 285
    .line 286
    move-result v1

    .line 287
    if-eqz v1, :cond_8

    .line 288
    .line 289
    invoke-virtual {v6, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 290
    .line 291
    .line 292
    move-result v1

    .line 293
    if-eqz v1, :cond_7

    .line 294
    .line 295
    invoke-virtual {p3, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    .line 296
    .line 297
    .line 298
    move-result p1

    .line 299
    invoke-virtual {p3, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    .line 300
    .line 301
    .line 302
    move-result v1

    .line 303
    invoke-virtual {p3, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    .line 304
    .line 305
    .line 306
    move-result p3

    .line 307
    new-instance v2, Landroid/graphics/Point;

    .line 308
    .line 309
    invoke-direct {v2, p1, v1}, Landroid/graphics/Point;-><init>(II)V

    .line 310
    .line 311
    .line 312
    invoke-direct {p0, v0, v6, v2, p3}, Lcom/android/launcher3/UnlockAnimationProvider;->a(Lcom/android/launcher3/C2;Ljava/lang/String;Landroid/graphics/Point;I)V

    .line 313
    .line 314
    .line 315
    return-object p2

    .line 316
    :cond_7
    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 317
    .line 318
    .line 319
    move-result p1

    .line 320
    if-eqz p1, :cond_8

    .line 321
    .line 322
    new-instance p1, Landroid/graphics/Point;

    .line 323
    .line 324
    invoke-direct {p1}, Landroid/graphics/Point;-><init>()V

    .line 325
    .line 326
    .line 327
    invoke-direct {p0, v0, v7, p1, v8}, Lcom/android/launcher3/UnlockAnimationProvider;->a(Lcom/android/launcher3/C2;Ljava/lang/String;Landroid/graphics/Point;I)V

    .line 328
    .line 329
    .line 330
    :cond_8
    return-object p2

    .line 331
    :sswitch_data_0
    .sparse-switch
        -0x4eb219a0 -> :sswitch_9
        -0x4bf67c97 -> :sswitch_8
        -0x2f271470 -> :sswitch_7
        0x179f6 -> :sswitch_6
        0x1b195 -> :sswitch_5
        0x2fd65d -> :sswitch_4
        0x33af38 -> :sswitch_3
        0x68c3f3a -> :sswitch_2
        0x321f3373 -> :sswitch_1
        0x4889ba9b -> :sswitch_0
    .end sparse-switch
.end method

.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    return-object p0
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public onCreate()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
