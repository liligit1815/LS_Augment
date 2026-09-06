.class public final Lf1/a;
.super Ljava/lang/Object;
.source "FeatureFlags.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lf1/a$a;
    }
.end annotation


# static fields
.field public static final A:Lf1/a$a;

.field public static final B:Lf1/a$a;

.field public static final C:Lf1/a$a;

.field public static final D:Lf1/a$a;

.field public static final E:Lf1/a$a;

.field public static final F:Lf1/a$a;

.field public static final G:Lf1/a$a;

.field public static final H:Z

.field public static final I:Z

.field public static final J:Lf1/a$a;

.field public static final K:Lf1/a$a;

.field public static final a:Lf1/a$a;

.field public static final b:Lf1/a$a;

.field public static final c:Lf1/a$a;

.field public static final d:Lf1/a$a;

.field public static final e:Lf1/a$a;

.field public static final f:Lf1/a$a;

.field public static final g:Z

.field public static final h:Lf1/a$a;

.field public static final i:Lf1/a$a;

.field public static final j:Lf1/a$a;

.field public static final k:Lf1/a$a;

.field private static final l:Lf1/a$a;

.field public static final m:Lf1/a$a;

.field public static final n:Lf1/a$a;

.field public static final o:Lf1/a$a;

.field public static final p:Lf1/a$a;

.field public static final q:Lf1/a$a;

.field public static final r:Lf1/a$a;

.field public static final s:Lf1/a$a;

.field public static final t:Lf1/a$a;

.field public static final u:Lf1/a$a;

.field public static final v:Lf1/a$a;

.field public static final w:Lf1/a$a;

.field public static final x:Lf1/a$a;

.field public static final y:Lf1/a$a;

.field public static final z:Lf1/a$a;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 1
    sget-object v0, Lf1/a$a;->i:Lf1/a$a;

    .line 2
    .line 3
    const-string v1, "Enable dragging and dropping to pin apps within secondary display"

    .line 4
    .line 5
    const v2, 0x101de704

    .line 6
    .line 7
    .line 8
    const-string v3, "SECONDARY_DRAG_N_DROP_TO_PIN"

    .line 9
    .line 10
    invoke-static {v2, v3, v0, v1}, Lf1/a;->f(ILjava/lang/String;Lf1/a$a;Ljava/lang/String;)Lf1/a$a;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    sput-object v1, Lf1/a;->a:Lf1/a$a;

    .line 15
    .line 16
    const-string v1, "MULTI_SELECT_EDIT_MODE"

    .line 17
    .line 18
    const-string v2, "Enable new multi-select edit mode for home screen"

    .line 19
    .line 20
    const v3, 0x1022b1e4

    .line 21
    .line 22
    .line 23
    invoke-static {v3, v1, v0, v2}, Lf1/a;->f(ILjava/lang/String;Lf1/a$a;Ljava/lang/String;)Lf1/a$a;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sput-object v1, Lf1/a;->b:Lf1/a$a;

    .line 28
    .line 29
    const-string v1, "FOLDABLE_SINGLE_PAGE"

    .line 30
    .line 31
    const-string v2, "Use a single page for the workspace"

    .line 32
    .line 33
    const v3, 0x101de78a

    .line 34
    .line 35
    .line 36
    invoke-static {v3, v1, v0, v2}, Lf1/a;->f(ILjava/lang/String;Lf1/a$a;Ljava/lang/String;)Lf1/a$a;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    sput-object v1, Lf1/a;->c:Lf1/a$a;

    .line 41
    .line 42
    const-string v1, "ENABLE_MULTI_INSTANCE"

    .line 43
    .line 44
    const-string v2, "Enables creation and filtering of multiple task instances in overview"

    .line 45
    .line 46
    const v3, 0x101ded08

    .line 47
    .line 48
    .line 49
    invoke-static {v3, v1, v0, v2}, Lf1/a;->f(ILjava/lang/String;Lf1/a$a;Ljava/lang/String;)Lf1/a$a;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    sput-object v1, Lf1/a;->d:Lf1/a$a;

    .line 54
    .line 55
    const-string v1, "ENABLE_DEVICE_SEARCH_PERFORMANCE_LOGGING"

    .line 56
    .line 57
    const-string v2, "Allows on device search in all apps logging"

    .line 58
    .line 59
    const v3, 0x101dd865

    .line 60
    .line 61
    .line 62
    invoke-static {v3, v1, v0, v2}, Lf1/a;->g(ILjava/lang/String;Lf1/a$a;Ljava/lang/String;)Lf1/a$a;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    sput-object v1, Lf1/a;->e:Lf1/a$a;

    .line 67
    .line 68
    const-string v1, "NOTIFY_CRASHES"

    .line 69
    .line 70
    const-string v2, "Sends a notification whenever launcher encounters an uncaught exception."

    .line 71
    .line 72
    const v3, 0x101ddf14

    .line 73
    .line 74
    .line 75
    invoke-static {v3, v1, v0, v2}, Lf1/a;->f(ILjava/lang/String;Lf1/a$a;Ljava/lang/String;)Lf1/a$a;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    sput-object v1, Lf1/a;->f:Lf1/a$a;

    .line 80
    .line 81
    invoke-static {}, LH2/c;->o()Z

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    const/4 v2, 0x0

    .line 86
    const/4 v3, 0x1

    .line 87
    if-eqz v1, :cond_1

    .line 88
    .line 89
    invoke-static {}, Lf1/a;->h()Z

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    if-eqz v1, :cond_0

    .line 94
    .line 95
    invoke-static {}, LH2/c;->p()Z

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    if-eqz v1, :cond_1

    .line 100
    .line 101
    :cond_0
    move v1, v3

    .line 102
    goto :goto_0

    .line 103
    :cond_1
    move v1, v2

    .line 104
    :goto_0
    sput-boolean v1, Lf1/a;->g:Z

    .line 105
    .line 106
    const-string v1, "ENABLE_TASKBAR_NO_RECREATION"

    .line 107
    .line 108
    const-string v4, "Enables taskbar with no recreation from lifecycle changes of TaskbarActivityContext."

    .line 109
    .line 110
    const v5, 0x11d554f5

    .line 111
    .line 112
    .line 113
    invoke-static {v5, v1, v0, v4}, Lf1/a;->f(ILjava/lang/String;Lf1/a$a;Ljava/lang/String;)Lf1/a$a;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    sput-object v1, Lf1/a;->h:Lf1/a$a;

    .line 118
    .line 119
    const-string v1, "PROMISE_APPS_IN_ALL_APPS"

    .line 120
    .line 121
    const-string v4, "Add promise icon in all-apps"

    .line 122
    .line 123
    const v5, 0x101dd2fc

    .line 124
    .line 125
    .line 126
    invoke-static {v5, v1, v0, v4}, Lf1/a;->f(ILjava/lang/String;Lf1/a$a;Ljava/lang/String;)Lf1/a$a;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    sput-object v1, Lf1/a;->i:Lf1/a$a;

    .line 131
    .line 132
    const-string v1, "ENABLE_EXPANDING_PAUSE_WORK_BUTTON"

    .line 133
    .line 134
    const-string v4, "Expand and collapse pause work button while scrolling"

    .line 135
    .line 136
    const v5, 0x101dd5fb

    .line 137
    .line 138
    .line 139
    invoke-static {v5, v1, v0, v4}, Lf1/a;->f(ILjava/lang/String;Lf1/a$a;Ljava/lang/String;)Lf1/a$a;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    sput-object v1, Lf1/a;->j:Lf1/a$a;

    .line 144
    .line 145
    const-string v1, "INJECT_FALLBACK_APP_CORPUS_RESULTS"

    .line 146
    .line 147
    const-string v4, "Inject fallback app corpus result when AiAi fails to return it."

    .line 148
    .line 149
    const v5, 0x101dd99a

    .line 150
    .line 151
    .line 152
    invoke-static {v5, v1, v0, v4}, Lf1/a;->g(ILjava/lang/String;Lf1/a$a;Ljava/lang/String;)Lf1/a$a;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    sput-object v1, Lf1/a;->k:Lf1/a$a;

    .line 157
    .line 158
    const-string v1, "ENABLE_TASKBAR_PINNING"

    .line 159
    .line 160
    const-string v4, "Enables taskbar pinning to allow user to switch between transient and persistent taskbar flavors"

    .line 161
    .line 162
    const v5, 0x11a82342

    .line 163
    .line 164
    .line 165
    invoke-static {v5, v1, v0, v4}, Lf1/a;->f(ILjava/lang/String;Lf1/a$a;Ljava/lang/String;)Lf1/a$a;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    sput-object v1, Lf1/a;->l:Lf1/a$a;

    .line 170
    .line 171
    const-string v1, "ENABLE_HOME_TRANSITION_LISTENER"

    .line 172
    .line 173
    const-string v4, "Enables launcher to listen to all transitions that include home activity."

    .line 174
    .line 175
    const v5, 0x123e0126

    .line 176
    .line 177
    .line 178
    invoke-static {v5, v1, v0, v4}, Lf1/a;->f(ILjava/lang/String;Lf1/a$a;Ljava/lang/String;)Lf1/a$a;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    sput-object v1, Lf1/a;->m:Lf1/a$a;

    .line 183
    .line 184
    const-string v1, "ENABLE_APP_ICON_IN_INLINE_SHORTCUTS"

    .line 185
    .line 186
    const-string v4, "Show app icon for inline shortcut"

    .line 187
    .line 188
    const v5, 0x101de6cf

    .line 189
    .line 190
    .line 191
    invoke-static {v5, v1, v0, v4}, Lf1/a;->f(ILjava/lang/String;Lf1/a$a;Ljava/lang/String;)Lf1/a$a;

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    sput-object v1, Lf1/a;->n:Lf1/a$a;

    .line 196
    .line 197
    const-string v1, "ENABLE_WIDGET_TRANSITION_FOR_RESIZING"

    .line 198
    .line 199
    const-string v4, "Enable widget transition animation when resizing the widgets"

    .line 200
    .line 201
    const v5, 0x1001cc62

    .line 202
    .line 203
    .line 204
    invoke-static {v5, v1, v0, v4}, Lf1/a;->f(ILjava/lang/String;Lf1/a$a;Ljava/lang/String;)Lf1/a$a;

    .line 205
    .line 206
    .line 207
    move-result-object v1

    .line 208
    sput-object v1, Lf1/a;->o:Lf1/a$a;

    .line 209
    .line 210
    const-string v1, "ENABLE_OVERLAY_CONNECTION_OPTIM"

    .line 211
    .line 212
    const-string v4, "Enable optimizing overlay service connection"

    .line 213
    .line 214
    const v5, 0x101ddd35

    .line 215
    .line 216
    .line 217
    invoke-static {v5, v1, v0, v4}, Lf1/a;->f(ILjava/lang/String;Lf1/a$a;Ljava/lang/String;)Lf1/a$a;

    .line 218
    .line 219
    .line 220
    move-result-object v1

    .line 221
    sput-object v1, Lf1/a;->p:Lf1/a$a;

    .line 222
    .line 223
    const-string v1, "ENABLE_REGION_SAMPLING"

    .line 224
    .line 225
    const-string v4, "Enable region sampling to determine color of text on screen."

    .line 226
    .line 227
    const v5, 0x101dd975

    .line 228
    .line 229
    .line 230
    invoke-static {v5, v1, v0, v4}, Lf1/a;->f(ILjava/lang/String;Lf1/a$a;Ljava/lang/String;)Lf1/a$a;

    .line 231
    .line 232
    .line 233
    move-result-object v1

    .line 234
    sput-object v1, Lf1/a;->q:Lf1/a$a;

    .line 235
    .line 236
    const-string v1, "ALWAYS_USE_HARDWARE_OPTIMIZATION_FOR_FOLDER_ANIMATIONS"

    .line 237
    .line 238
    const-string v4, "Always use hardware optimization for folder animations."

    .line 239
    .line 240
    const v5, 0x101ddf08

    .line 241
    .line 242
    .line 243
    invoke-static {v5, v1, v0, v4}, Lf1/a;->f(ILjava/lang/String;Lf1/a$a;Ljava/lang/String;)Lf1/a$a;

    .line 244
    .line 245
    .line 246
    move-result-object v1

    .line 247
    sput-object v1, Lf1/a;->r:Lf1/a$a;

    .line 248
    .line 249
    const-string v1, "SEPARATE_RECENTS_ACTIVITY"

    .line 250
    .line 251
    const-string v4, "Uses a separate recents activity instead of using the integrated recents+Launcher UI"

    .line 252
    .line 253
    const v5, 0x101dde94

    .line 254
    .line 255
    .line 256
    invoke-static {v5, v1, v0, v4}, Lf1/a;->f(ILjava/lang/String;Lf1/a$a;Ljava/lang/String;)Lf1/a$a;

    .line 257
    .line 258
    .line 259
    move-result-object v1

    .line 260
    sput-object v1, Lf1/a;->s:Lf1/a$a;

    .line 261
    .line 262
    sget-object v1, Lf1/a$a;->h:Lf1/a$a;

    .line 263
    .line 264
    const-string v4, "Use inbuilt monochrome icons if app doesn\'t provide one"

    .line 265
    .line 266
    const v5, 0x101de65d

    .line 267
    .line 268
    .line 269
    const-string v6, "USE_LOCAL_ICON_OVERRIDES"

    .line 270
    .line 271
    invoke-static {v5, v6, v1, v4}, Lf1/a;->f(ILjava/lang/String;Lf1/a$a;Ljava/lang/String;)Lf1/a$a;

    .line 272
    .line 273
    .line 274
    move-result-object v4

    .line 275
    sput-object v4, Lf1/a;->t:Lf1/a$a;

    .line 276
    .line 277
    const-string v4, "ENABLE_ALL_APPS_BUTTON_IN_HOTSEAT"

    .line 278
    .line 279
    const-string v5, "Enables displaying the all apps button in the hotseat."

    .line 280
    .line 281
    const v6, 0x101de229

    .line 282
    .line 283
    .line 284
    invoke-static {v6, v4, v0, v5}, Lf1/a;->f(ILjava/lang/String;Lf1/a$a;Ljava/lang/String;)Lf1/a$a;

    .line 285
    .line 286
    .line 287
    move-result-object v4

    .line 288
    sput-object v4, Lf1/a;->u:Lf1/a$a;

    .line 289
    .line 290
    const-string v4, "USE_SEARCH_REQUEST_TIMEOUT_OVERRIDES"

    .line 291
    .line 292
    const-string v5, "Use local overrides for search request timeout"

    .line 293
    .line 294
    const v6, 0x101de682

    .line 295
    .line 296
    .line 297
    invoke-static {v6, v4, v0, v5}, Lf1/a;->f(ILjava/lang/String;Lf1/a$a;Ljava/lang/String;)Lf1/a$a;

    .line 298
    .line 299
    .line 300
    move-result-object v4

    .line 301
    sput-object v4, Lf1/a;->v:Lf1/a$a;

    .line 302
    .line 303
    const-string v4, "ENABLE_RESPONSIVE_WORKSPACE"

    .line 304
    .line 305
    const-string v5, "Enables new workspace grid calculations method."

    .line 306
    .line 307
    const v6, 0xe6343c4

    .line 308
    .line 309
    .line 310
    invoke-static {v6, v4, v0, v5}, Lf1/a;->f(ILjava/lang/String;Lf1/a$a;Ljava/lang/String;)Lf1/a$a;

    .line 311
    .line 312
    .line 313
    move-result-object v4

    .line 314
    sput-object v4, Lf1/a;->w:Lf1/a$a;

    .line 315
    .line 316
    invoke-static {}, Lm1/a;->a()Z

    .line 317
    .line 318
    .line 319
    move-result v4

    .line 320
    if-eqz v4, :cond_2

    .line 321
    .line 322
    move-object v4, v0

    .line 323
    goto :goto_1

    .line 324
    :cond_2
    move-object v4, v1

    .line 325
    :goto_1
    const-string v5, "All-apps icon is not added to the hotseat"

    .line 326
    .line 327
    const v6, 0x53724e01

    .line 328
    .line 329
    .line 330
    const-string v7, "NO_ALL_APPS_ICON"

    .line 331
    .line 332
    invoke-static {v6, v7, v4, v5}, Lf1/a;->f(ILjava/lang/String;Lf1/a$a;Ljava/lang/String;)Lf1/a$a;

    .line 333
    .line 334
    .line 335
    move-result-object v4

    .line 336
    sput-object v4, Lf1/a;->x:Lf1/a$a;

    .line 337
    .line 338
    const-string v4, "HOTSEAT_AVERAGE_ANIMATION_ENABLED"

    .line 339
    .line 340
    const-string v5, "Hoseat may do average animation"

    .line 341
    .line 342
    const v6, 0x53724e02

    .line 343
    .line 344
    .line 345
    invoke-static {v6, v4, v1, v5}, Lf1/a;->f(ILjava/lang/String;Lf1/a$a;Ljava/lang/String;)Lf1/a$a;

    .line 346
    .line 347
    .line 348
    move-result-object v4

    .line 349
    sput-object v4, Lf1/a;->y:Lf1/a$a;

    .line 350
    .line 351
    const-string v4, "LAUNCHER3_MIFAVOR_PINCH_IMMEDIATELY"

    .line 352
    .line 353
    const-string v5, "Animation (workspace/overview) will done immediately"

    .line 354
    .line 355
    const v6, 0x53724e03

    .line 356
    .line 357
    .line 358
    invoke-static {v6, v4, v1, v5}, Lf1/a;->f(ILjava/lang/String;Lf1/a$a;Ljava/lang/String;)Lf1/a$a;

    .line 359
    .line 360
    .line 361
    move-result-object v4

    .line 362
    sput-object v4, Lf1/a;->z:Lf1/a$a;

    .line 363
    .line 364
    const-string v4, "SUPPORT_SYSTEM_LEVEL_CUSTOM"

    .line 365
    .line 366
    const-string v5, "System etc\'s config is higher priority"

    .line 367
    .line 368
    const v6, 0x53724e04

    .line 369
    .line 370
    .line 371
    invoke-static {v6, v4, v1, v5}, Lf1/a;->f(ILjava/lang/String;Lf1/a$a;Ljava/lang/String;)Lf1/a$a;

    .line 372
    .line 373
    .line 374
    move-result-object v4

    .line 375
    sput-object v4, Lf1/a;->A:Lf1/a$a;

    .line 376
    .line 377
    const-string v4, "ICON_CLICK_ANIMATION"

    .line 378
    .line 379
    const-string v5, "Animation (FastBitmapDrawable) will done immediately"

    .line 380
    .line 381
    const v6, 0x53724e05

    .line 382
    .line 383
    .line 384
    invoke-static {v6, v4, v0, v5}, Lf1/a;->f(ILjava/lang/String;Lf1/a$a;Ljava/lang/String;)Lf1/a$a;

    .line 385
    .line 386
    .line 387
    move-result-object v4

    .line 388
    sput-object v4, Lf1/a;->B:Lf1/a$a;

    .line 389
    .line 390
    const-string v4, "FOLDERICON_SNAP_ANIM"

    .line 391
    .line 392
    const-string v5, "FolderIcon will do snap anim when folder close end"

    .line 393
    .line 394
    const v6, 0x53724e06

    .line 395
    .line 396
    .line 397
    invoke-static {v6, v4, v0, v5}, Lf1/a;->f(ILjava/lang/String;Lf1/a$a;Ljava/lang/String;)Lf1/a$a;

    .line 398
    .line 399
    .line 400
    move-result-object v4

    .line 401
    sput-object v4, Lf1/a;->C:Lf1/a$a;

    .line 402
    .line 403
    const-string v4, "FOLDERICON_ANIM_MFV"

    .line 404
    .line 405
    const-string v5, "Folder use mfv anim"

    .line 406
    .line 407
    const v6, 0x53724e07

    .line 408
    .line 409
    .line 410
    invoke-static {v6, v4, v1, v5}, Lf1/a;->f(ILjava/lang/String;Lf1/a$a;Ljava/lang/String;)Lf1/a$a;

    .line 411
    .line 412
    .line 413
    move-result-object v1

    .line 414
    sput-object v1, Lf1/a;->D:Lf1/a$a;

    .line 415
    .line 416
    const-string v1, "HORZ_SLIDE_MONITOR_ENABLE"

    .line 417
    .line 418
    const-string v4, "Horizontal slide not valid under no-button nav mode"

    .line 419
    .line 420
    const v5, 0x53724e08

    .line 421
    .line 422
    .line 423
    invoke-static {v5, v1, v0, v4}, Lf1/a;->f(ILjava/lang/String;Lf1/a$a;Ljava/lang/String;)Lf1/a$a;

    .line 424
    .line 425
    .line 426
    move-result-object v1

    .line 427
    sput-object v1, Lf1/a;->E:Lf1/a$a;

    .line 428
    .line 429
    const-string v1, "DISABLE_FOLDER_BATCH"

    .line 430
    .line 431
    const-string v4, "Add folder batch icon"

    .line 432
    .line 433
    const v5, 0x53724e09

    .line 434
    .line 435
    .line 436
    invoke-static {v5, v1, v0, v4}, Lf1/a;->f(ILjava/lang/String;Lf1/a$a;Ljava/lang/String;)Lf1/a$a;

    .line 437
    .line 438
    .line 439
    move-result-object v1

    .line 440
    sput-object v1, Lf1/a;->F:Lf1/a$a;

    .line 441
    .line 442
    const-string v1, "ENABLE_TASKBAR"

    .line 443
    .line 444
    const-string v4, "Allows a system Taskbar to be shown on larger devices."

    .line 445
    .line 446
    const v5, 0x53724e0a

    .line 447
    .line 448
    .line 449
    invoke-static {v5, v1, v0, v4}, Lf1/a;->f(ILjava/lang/String;Lf1/a$a;Ljava/lang/String;)Lf1/a$a;

    .line 450
    .line 451
    .line 452
    move-result-object v1

    .line 453
    sput-object v1, Lf1/a;->G:Lf1/a$a;

    .line 454
    .line 455
    invoke-static {}, Lx1/O;->Y2()Z

    .line 456
    .line 457
    .line 458
    move-result v1

    .line 459
    if-nez v1, :cond_3

    .line 460
    .line 461
    invoke-static {}, Lx1/O;->V2()Z

    .line 462
    .line 463
    .line 464
    move-result v1

    .line 465
    if-nez v1, :cond_3

    .line 466
    .line 467
    move v1, v3

    .line 468
    goto :goto_2

    .line 469
    :cond_3
    move v1, v2

    .line 470
    :goto_2
    sput-boolean v1, Lf1/a;->H:Z

    .line 471
    .line 472
    invoke-static {}, Lx1/O;->U2()Z

    .line 473
    .line 474
    .line 475
    move-result v1

    .line 476
    if-nez v1, :cond_4

    .line 477
    .line 478
    invoke-static {}, Lx1/O;->Y2()Z

    .line 479
    .line 480
    .line 481
    move-result v1

    .line 482
    if-nez v1, :cond_4

    .line 483
    .line 484
    invoke-static {}, Lx1/O;->V2()Z

    .line 485
    .line 486
    .line 487
    move-result v1

    .line 488
    if-nez v1, :cond_4

    .line 489
    .line 490
    move v2, v3

    .line 491
    :cond_4
    sput-boolean v2, Lf1/a;->I:Z

    .line 492
    .line 493
    const-string v1, "ENABLE_QUICKSTEP_LIVE_TILE"

    .line 494
    .line 495
    const-string v2, "Enable live tile in Quickstep overview"

    .line 496
    .line 497
    const v3, 0x53724e0b

    .line 498
    .line 499
    .line 500
    invoke-static {v3, v1, v0, v2}, Lf1/a;->f(ILjava/lang/String;Lf1/a$a;Ljava/lang/String;)Lf1/a$a;

    .line 501
    .line 502
    .line 503
    move-result-object v1

    .line 504
    sput-object v1, Lf1/a;->J:Lf1/a$a;

    .line 505
    .line 506
    const-string v1, "enable_add_app_widget_via_config_activity_v2"

    .line 507
    .line 508
    const-string v2, "When adding app widget through config activity, directly add it to workspace to reduce flicker"

    .line 509
    .line 510
    const v3, 0x10f11ca4

    .line 511
    .line 512
    .line 513
    invoke-static {v3, v1, v0, v2}, Lf1/a;->f(ILjava/lang/String;Lf1/a$a;Ljava/lang/String;)Lf1/a$a;

    .line 514
    .line 515
    .line 516
    move-result-object v0

    .line 517
    sput-object v0, Lf1/a;->K:Lf1/a$a;

    .line 518
    .line 519
    return-void
.end method

.method public static a()Z
    .locals 1

    .line 1
    sget-object v0, Lf1/a;->u:Lf1/a$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-static {}, Lcom/android/launcher3/y0;->g()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    return v0

    .line 18
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 19
    return v0
.end method

.method public static b()Z
    .locals 1

    .line 1
    sget-object v0, Lf1/a;->m:Lf1/a$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-static {}, Lcom/android/launcher3/y0;->A()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    return v0

    .line 18
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 19
    return v0
.end method

.method public static c()Z
    .locals 1

    .line 1
    sget-object v0, Lf1/a;->w:Lf1/a$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-static {}, Lcom/android/launcher3/y0;->T()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    return v0

    .line 18
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 19
    return v0
.end method

.method public static d()Z
    .locals 1

    .line 1
    sget-object v0, Lf1/a;->h:Lf1/a$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-static {}, Lcom/android/launcher3/y0;->d0()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lf1/a;->e()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    sget-boolean v0, Lf1/a;->g:Z

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 v0, 0x0

    .line 27
    return v0

    .line 28
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 29
    return v0
.end method

.method public static e()Z
    .locals 1

    .line 1
    sget-object v0, Lf1/a;->l:Lf1/a$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-static {}, Lcom/android/launcher3/y0;->e0()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    return v0

    .line 18
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 19
    return v0
.end method

.method public static f(ILjava/lang/String;Lf1/a$a;Ljava/lang/String;)Lf1/a$a;
    .locals 0

    .line 1
    return-object p2
.end method

.method public static g(ILjava/lang/String;Lf1/a$a;Ljava/lang/String;)Lf1/a$a;
    .locals 0

    .line 1
    return-object p2
.end method

.method private static h()Z
    .locals 4

    .line 1
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "array"

    .line 6
    .line 7
    const-string v2, "android"

    .line 8
    .line 9
    const-string v3, "config_foldedDeviceStates"

    .line 10
    .line 11
    invoke-virtual {v0, v3, v1, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x1

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v2, v0}, Landroid/content/res/Resources;->getIntArray(I)[I

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    array-length v0, v0

    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    return v1

    .line 30
    :cond_0
    const/4 v0, 0x0

    .line 31
    return v0

    .line 32
    :cond_1
    return v1
.end method
