.class public Lcom/android/launcher3/taskbar/I1;
.super Lcom/android/launcher3/taskbar/b;
.source "TaskbarActivityContext.java"


# static fields
.field protected static final M:Landroid/window/DesktopModeFlags$DesktopModeFlag;


# instance fields
.field private A:Z

.field private B:Z

.field private final C:Landroid/graphics/Rect;

.field private final D:Lcom/android/launcher3/taskbar/K3;

.field private E:Lcom/android/launcher3/h0;

.field private F:Lcom/android/launcher3/h0;

.field private final G:Lcom/android/launcher3/J3;

.field private final H:Lcom/android/quickstep/SystemUiProxy;

.field private I:LY1/h;

.field private J:LY1/l;

.field private K:Landroid/view/View;

.field private L:La2/a;

.field private final h:Landroid/content/Context;

.field private final i:Lcom/android/launcher3/taskbar/TaskbarDragLayer;

.field private final j:Lcom/android/launcher3/taskbar/R1;

.field private final k:Landroid/view/WindowManager;

.field private final l:Z

.field private m:Lcom/android/launcher3/h0;

.field private n:Landroid/view/WindowManager$LayoutParams;

.field private o:Landroid/view/WindowManager$LayoutParams;

.field private p:Z

.field private q:Z

.field private r:I

.field private s:Z

.field private t:Lcom/android/launcher3/util/C1;

.field private u:Z

.field private final v:Z

.field private final w:Z

.field private final x:Z

.field private final y:Z

.field private z:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Landroid/window/DesktopModeFlags$DesktopModeFlag;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/taskbar/g1;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/android/launcher3/taskbar/g1;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-direct {v0, v1, v2}, Landroid/window/DesktopModeFlags$DesktopModeFlag;-><init>(Ljava/util/function/BooleanSupplier;Z)V

    .line 10
    .line 11
    .line 12
    sput-object v0, Lcom/android/launcher3/taskbar/I1;->M:Landroid/window/DesktopModeFlags$DesktopModeFlag;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/content/Context;Lcom/android/launcher3/h0;Lcom/android/launcher3/taskbar/l3;LF2/i;ZLcom/android/quickstep/SystemUiProxy;)V
    .locals 30

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v9, p2

    .line 4
    .line 5
    move-object/from16 v10, p3

    .line 6
    .line 7
    move/from16 v0, p6

    .line 8
    .line 9
    move-object/from16 v2, p1

    .line 10
    .line 11
    invoke-direct {v1, v2, v0}, Lcom/android/launcher3/taskbar/b;-><init>(Landroid/content/Context;Z)V

    .line 12
    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    iput-boolean v2, v1, Lcom/android/launcher3/taskbar/I1;->q:Z

    .line 16
    .line 17
    iput-boolean v2, v1, Lcom/android/launcher3/taskbar/I1;->z:Z

    .line 18
    .line 19
    iput-boolean v2, v1, Lcom/android/launcher3/taskbar/I1;->A:Z

    .line 20
    .line 21
    iput-boolean v2, v1, Lcom/android/launcher3/taskbar/I1;->B:Z

    .line 22
    .line 23
    new-instance v3, Landroid/graphics/Rect;

    .line 24
    .line 25
    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v3, v1, Lcom/android/launcher3/taskbar/I1;->C:Landroid/graphics/Rect;

    .line 29
    .line 30
    iput-boolean v0, v1, Lcom/android/launcher3/taskbar/I1;->l:Z

    .line 31
    .line 32
    iput-object v9, v1, Lcom/android/launcher3/taskbar/I1;->h:Landroid/content/Context;

    .line 33
    .line 34
    move-object/from16 v3, p7

    .line 35
    .line 36
    iput-object v3, v1, Lcom/android/launcher3/taskbar/I1;->H:Lcom/android/quickstep/SystemUiProxy;

    .line 37
    .line 38
    invoke-direct {v1, v10}, Lcom/android/launcher3/taskbar/I1;->b0(Lcom/android/launcher3/h0;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-static {v1}, LY1/h;->d(Lcom/android/launcher3/taskbar/I1;)LY1/h;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    iput-object v4, v1, Lcom/android/launcher3/taskbar/I1;->I:LY1/h;

    .line 50
    .line 51
    new-instance v5, LY1/l;

    .line 52
    .line 53
    iget-object v6, v1, Lcom/android/launcher3/taskbar/I1;->m:Lcom/android/launcher3/h0;

    .line 54
    .line 55
    iget-object v6, v6, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 56
    .line 57
    iget v7, v6, Lcom/android/launcher3/F1;->G0:I

    .line 58
    .line 59
    iget v6, v6, Lcom/android/launcher3/F1;->H0:I

    .line 60
    .line 61
    invoke-direct {v5, v1, v4, v7, v6}, LY1/l;-><init>(Lcom/android/launcher3/taskbar/I1;LY1/h;II)V

    .line 62
    .line 63
    .line 64
    iput-object v5, v1, Lcom/android/launcher3/taskbar/I1;->J:LY1/l;

    .line 65
    .line 66
    const-string v4, "config_imeDrawsImeNavBar"

    .line 67
    .line 68
    invoke-static {v4, v3, v2}, Lc2/a;->a(Ljava/lang/String;Landroid/content/res/Resources;Z)Z

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    iput-boolean v3, v1, Lcom/android/launcher3/taskbar/I1;->u:Z

    .line 73
    .line 74
    new-instance v3, Lcom/android/launcher3/taskbar/E1;

    .line 75
    .line 76
    invoke-direct {v3, v1}, Lcom/android/launcher3/taskbar/E1;-><init>(Lcom/android/launcher3/taskbar/I1;)V

    .line 77
    .line 78
    .line 79
    const-string v4, "isSafeMode"

    .line 80
    .line 81
    invoke-static {v4, v3}, Lcom/android/launcher3/util/K2;->allowIpcs(Ljava/lang/String;Ljava/util/function/Supplier;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    check-cast v3, Ljava/lang/Boolean;

    .line 86
    .line 87
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 88
    .line 89
    .line 90
    move-result v3

    .line 91
    iput-boolean v3, v1, Lcom/android/launcher3/taskbar/I1;->v:Z

    .line 92
    .line 93
    sget-object v3, Lcom/android/launcher3/util/p2;->n:Lcom/android/launcher3/util/I;

    .line 94
    .line 95
    invoke-virtual {v3, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    check-cast v3, Lcom/android/launcher3/util/p2;

    .line 100
    .line 101
    const-string v4, "user_setup_complete"

    .line 102
    .line 103
    invoke-static {v4}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    invoke-virtual {v3, v4, v2}, Lcom/android/launcher3/util/p2;->g(Landroid/net/Uri;I)Z

    .line 108
    .line 109
    .line 110
    move-result v4

    .line 111
    iput-boolean v4, v1, Lcom/android/launcher3/taskbar/I1;->w:Z

    .line 112
    .line 113
    const-string v4, "nav_bar_kids_mode"

    .line 114
    .line 115
    invoke-static {v4}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 116
    .line 117
    .line 118
    move-result-object v4

    .line 119
    invoke-virtual {v3, v4, v2}, Lcom/android/launcher3/util/p2;->g(Landroid/net/Uri;I)Z

    .line 120
    .line 121
    .line 122
    move-result v3

    .line 123
    iput-boolean v3, v1, Lcom/android/launcher3/taskbar/I1;->y:Z

    .line 124
    .line 125
    iput-boolean v3, v1, Lcom/android/launcher3/taskbar/I1;->x:Z

    .line 126
    .line 127
    invoke-virtual {v1}, Landroid/view/ContextThemeWrapper;->getApplicationContext()Landroid/content/Context;

    .line 128
    .line 129
    .line 130
    move-result-object v11

    .line 131
    const-class v3, Landroid/view/WindowManager;

    .line 132
    .line 133
    invoke-virtual {v11, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v3

    .line 137
    move-object v12, v3

    .line 138
    check-cast v12, Landroid/view/WindowManager;

    .line 139
    .line 140
    iput-object v12, v1, Lcom/android/launcher3/taskbar/I1;->k:Landroid/view/WindowManager;

    .line 141
    .line 142
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 143
    .line 144
    .line 145
    move-result v3

    .line 146
    if-eqz v3, :cond_0

    .line 147
    .line 148
    const v4, 0x7f0e024f

    .line 149
    .line 150
    .line 151
    goto :goto_0

    .line 152
    :cond_0
    const v4, 0x7f0e0227

    .line 153
    .line 154
    .line 155
    :goto_0
    iget-object v5, v1, Lcom/android/launcher3/taskbar/b;->g:Landroid/view/LayoutInflater;

    .line 156
    .line 157
    const/4 v6, 0x0

    .line 158
    invoke-virtual {v5, v4, v6, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 159
    .line 160
    .line 161
    move-result-object v4

    .line 162
    move-object v13, v4

    .line 163
    check-cast v13, Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 164
    .line 165
    iput-object v13, v1, Lcom/android/launcher3/taskbar/I1;->i:Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 166
    .line 167
    const v4, 0x7f0b05de

    .line 168
    .line 169
    .line 170
    invoke-virtual {v13, v4}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 171
    .line 172
    .line 173
    move-result-object v4

    .line 174
    move-object v14, v4

    .line 175
    check-cast v14, Lcom/android/launcher3/taskbar/TaskbarView;

    .line 176
    .line 177
    const v4, 0x7f0b05dc

    .line 178
    .line 179
    .line 180
    invoke-virtual {v13, v4}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 181
    .line 182
    .line 183
    move-result-object v4

    .line 184
    move-object v15, v4

    .line 185
    check-cast v15, Lcom/android/launcher3/taskbar/TaskbarScrimView;

    .line 186
    .line 187
    const v4, 0x7f0b0403

    .line 188
    .line 189
    .line 190
    invoke-virtual {v13, v4}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 191
    .line 192
    .line 193
    move-result-object v4

    .line 194
    check-cast v4, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;

    .line 195
    .line 196
    const v5, 0x7f0b058f

    .line 197
    .line 198
    .line 199
    invoke-virtual {v13, v5}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 200
    .line 201
    .line 202
    move-result-object v5

    .line 203
    check-cast v5, Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 204
    .line 205
    const v6, 0x7f0b05d1

    .line 206
    .line 207
    .line 208
    invoke-virtual {v13, v6}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 209
    .line 210
    .line 211
    move-result-object v6

    .line 212
    check-cast v6, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 213
    .line 214
    const v7, 0x7f0b05d2

    .line 215
    .line 216
    .line 217
    invoke-virtual {v13, v7}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 218
    .line 219
    .line 220
    move-result-object v7

    .line 221
    check-cast v7, Landroid/widget/FrameLayout;

    .line 222
    .line 223
    const v8, 0x7f0b058e

    .line 224
    .line 225
    .line 226
    invoke-virtual {v13, v8}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 227
    .line 228
    .line 229
    move-result-object v8

    .line 230
    check-cast v8, Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 231
    .line 232
    new-instance v2, Lcom/android/launcher3/taskbar/K3;

    .line 233
    .line 234
    invoke-direct {v2, v1}, Lcom/android/launcher3/taskbar/K3;-><init>(Lcom/android/launcher3/taskbar/I1;)V

    .line 235
    .line 236
    .line 237
    iput-object v2, v1, Lcom/android/launcher3/taskbar/I1;->D:Lcom/android/launcher3/taskbar/K3;

    .line 238
    .line 239
    invoke-static {}, Ljava/util/Optional;->empty()Ljava/util/Optional;

    .line 240
    .line 241
    .line 242
    move-result-object v2

    .line 243
    invoke-static {}, Lcom/android/launcher3/taskbar/bubbles/t;->W2()V

    .line 244
    .line 245
    .line 246
    invoke-static {}, LH2/c;->c()Z

    .line 247
    .line 248
    .line 249
    move-result v16

    .line 250
    if-nez v16, :cond_2

    .line 251
    .line 252
    iget-object v0, v1, Lcom/android/launcher3/taskbar/I1;->m:Lcom/android/launcher3/h0;

    .line 253
    .line 254
    move-object/from16 p7, v2

    .line 255
    .line 256
    iget-boolean v2, v0, Lcom/android/launcher3/h0;->H0:Z

    .line 257
    .line 258
    if-nez v2, :cond_1

    .line 259
    .line 260
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->T0()Z

    .line 261
    .line 262
    .line 263
    move-result v0

    .line 264
    if-nez v0, :cond_1

    .line 265
    .line 266
    goto :goto_1

    .line 267
    :cond_1
    const/4 v2, 0x0

    .line 268
    goto :goto_2

    .line 269
    :cond_2
    move-object/from16 p7, v2

    .line 270
    .line 271
    :goto_1
    const/4 v2, 0x1

    .line 272
    :goto_2
    invoke-static {}, Lcom/android/launcher3/taskbar/bubbles/t;->G2()Z

    .line 273
    .line 274
    .line 275
    move-result v0

    .line 276
    if-eqz v0, :cond_5

    .line 277
    .line 278
    if-eqz v2, :cond_5

    .line 279
    .line 280
    if-eqz v6, :cond_5

    .line 281
    .line 282
    if-eqz p6, :cond_5

    .line 283
    .line 284
    invoke-static {}, Ljava/util/Optional;->empty()Ljava/util/Optional;

    .line 285
    .line 286
    .line 287
    move-result-object v0

    .line 288
    invoke-static {}, Ljava/util/Optional;->empty()Ljava/util/Optional;

    .line 289
    .line 290
    .line 291
    move-result-object v2

    .line 292
    if-eqz v3, :cond_3

    .line 293
    .line 294
    new-instance v0, Lcom/android/launcher3/taskbar/bubbles/A0;

    .line 295
    .line 296
    invoke-direct {v0, v1, v8}, Lcom/android/launcher3/taskbar/bubbles/A0;-><init>(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/taskbar/StashedHandleView;)V

    .line 297
    .line 298
    .line 299
    invoke-static {v0}, Ljava/util/Optional;->of(Ljava/lang/Object;)Ljava/util/Optional;

    .line 300
    .line 301
    .line 302
    move-result-object v0

    .line 303
    new-instance v2, Lcom/android/launcher3/taskbar/bubbles/B;

    .line 304
    .line 305
    invoke-direct {v2, v1}, Lcom/android/launcher3/taskbar/bubbles/B;-><init>(Lcom/android/launcher3/taskbar/I1;)V

    .line 306
    .line 307
    .line 308
    invoke-static {v2}, Ljava/util/Optional;->of(Ljava/lang/Object;)Ljava/util/Optional;

    .line 309
    .line 310
    .line 311
    move-result-object v2

    .line 312
    :cond_3
    move-object/from16 v20, v0

    .line 313
    .line 314
    move-object/from16 v25, v2

    .line 315
    .line 316
    new-instance v0, LX1/c;

    .line 317
    .line 318
    invoke-direct {v0, v1}, LX1/c;-><init>(Lcom/android/launcher3/taskbar/I1;)V

    .line 319
    .line 320
    .line 321
    if-eqz v3, :cond_4

    .line 322
    .line 323
    new-instance v2, LX1/j;

    .line 324
    .line 325
    invoke-direct {v2, v0, v1}, LX1/j;-><init>(LX1/b$d;Landroid/content/Context;)V

    .line 326
    .line 327
    .line 328
    goto :goto_3

    .line 329
    :cond_4
    new-instance v2, LX1/e;

    .line 330
    .line 331
    invoke-direct {v2, v0}, LX1/e;-><init>(LX1/b$d;)V

    .line 332
    .line 333
    .line 334
    :goto_3
    invoke-virtual {v10}, Lcom/android/launcher3/h0;->Z()I

    .line 335
    .line 336
    .line 337
    move-result v0

    .line 338
    invoke-interface {v2, v0}, LX1/b;->z(I)V

    .line 339
    .line 340
    .line 341
    new-instance v16, Lcom/android/launcher3/taskbar/bubbles/m0;

    .line 342
    .line 343
    new-instance v0, Lcom/android/launcher3/taskbar/bubbles/t;

    .line 344
    .line 345
    invoke-direct {v0, v1, v6}, Lcom/android/launcher3/taskbar/bubbles/t;-><init>(Landroid/content/Context;Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;)V

    .line 346
    .line 347
    .line 348
    new-instance v3, Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 349
    .line 350
    invoke-direct {v3, v1, v6, v7}, Lcom/android/launcher3/taskbar/bubbles/g0;-><init>(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;Landroid/widget/FrameLayout;)V

    .line 351
    .line 352
    .line 353
    new-instance v6, Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 354
    .line 355
    invoke-direct {v6, v1, v13}, Lcom/android/launcher3/taskbar/bubbles/u0;-><init>(Lcom/android/launcher3/taskbar/I1;Landroid/widget/FrameLayout;)V

    .line 356
    .line 357
    .line 358
    new-instance v8, Lcom/android/launcher3/taskbar/bubbles/o0;

    .line 359
    .line 360
    invoke-direct {v8, v1, v13}, Lcom/android/launcher3/taskbar/bubbles/o0;-><init>(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/taskbar/TaskbarDragLayer;)V

    .line 361
    .line 362
    .line 363
    move-object/from16 v17, v0

    .line 364
    .line 365
    new-instance v0, Lcom/android/launcher3/taskbar/bubbles/z;

    .line 366
    .line 367
    move-object/from16 v19, v2

    .line 368
    .line 369
    new-instance v2, Lcom/android/launcher3/taskbar/F1;

    .line 370
    .line 371
    invoke-direct {v2, v1}, Lcom/android/launcher3/taskbar/F1;-><init>(Lcom/android/launcher3/taskbar/I1;)V

    .line 372
    .line 373
    .line 374
    invoke-direct {v0, v1, v7, v2}, Lcom/android/launcher3/taskbar/bubbles/z;-><init>(Landroid/content/Context;Landroid/widget/FrameLayout;Lu4/a;)V

    .line 375
    .line 376
    .line 377
    new-instance v2, Lcom/android/launcher3/taskbar/bubbles/y0;

    .line 378
    .line 379
    move-object/from16 v23, v0

    .line 380
    .line 381
    new-instance v0, Lcom/android/launcher3/taskbar/G1;

    .line 382
    .line 383
    invoke-direct {v0, v1}, Lcom/android/launcher3/taskbar/G1;-><init>(Lcom/android/launcher3/taskbar/I1;)V

    .line 384
    .line 385
    .line 386
    invoke-direct {v2, v1, v7, v0}, Lcom/android/launcher3/taskbar/bubbles/y0;-><init>(Landroid/content/Context;Landroid/widget/FrameLayout;Lu4/a;)V

    .line 387
    .line 388
    .line 389
    new-instance v0, Lcom/android/launcher3/taskbar/bubbles/n0;

    .line 390
    .line 391
    invoke-direct {v0, v1}, Lcom/android/launcher3/taskbar/bubbles/n0;-><init>(Landroid/content/Context;)V

    .line 392
    .line 393
    .line 394
    move-object/from16 v26, v0

    .line 395
    .line 396
    move-object/from16 v24, v2

    .line 397
    .line 398
    move-object/from16 v18, v3

    .line 399
    .line 400
    move-object/from16 v21, v6

    .line 401
    .line 402
    move-object/from16 v22, v8

    .line 403
    .line 404
    invoke-direct/range {v16 .. v26}, Lcom/android/launcher3/taskbar/bubbles/m0;-><init>(Lcom/android/launcher3/taskbar/bubbles/t;Lcom/android/launcher3/taskbar/bubbles/g0;LX1/b;Ljava/util/Optional;Lcom/android/launcher3/taskbar/bubbles/u0;Lcom/android/launcher3/taskbar/bubbles/o0;Lcom/android/launcher3/taskbar/bubbles/z;Lcom/android/launcher3/taskbar/bubbles/y0;Ljava/util/Optional;Lcom/android/launcher3/taskbar/bubbles/n0;)V

    .line 405
    .line 406
    .line 407
    invoke-static/range {v16 .. v16}, Ljava/util/Optional;->of(Ljava/lang/Object;)Ljava/util/Optional;

    .line 408
    .line 409
    .line 410
    move-result-object v2

    .line 411
    move-object/from16 v26, v2

    .line 412
    .line 413
    goto :goto_4

    .line 414
    :cond_5
    move-object/from16 v26, p7

    .line 415
    .line 416
    :goto_4
    new-instance v0, Lcom/android/systemui/shared/rotation/RotationButtonController;

    .line 417
    .line 418
    const v2, 0x7f0601f9

    .line 419
    .line 420
    .line 421
    invoke-virtual {v11, v2}, Landroid/content/Context;->getColor(I)I

    .line 422
    .line 423
    .line 424
    move-result v2

    .line 425
    const v3, 0x7f0601f8

    .line 426
    .line 427
    .line 428
    invoke-virtual {v11, v3}, Landroid/content/Context;->getColor(I)I

    .line 429
    .line 430
    .line 431
    move-result v3

    .line 432
    new-instance v8, Lcom/android/launcher3/taskbar/W0;

    .line 433
    .line 434
    invoke-direct {v8, v1}, Lcom/android/launcher3/taskbar/W0;-><init>(Lcom/android/launcher3/taskbar/I1;)V

    .line 435
    .line 436
    .line 437
    move-object v6, v4

    .line 438
    const v4, 0x7f080d82

    .line 439
    .line 440
    .line 441
    move-object v7, v5

    .line 442
    const v5, 0x7f080d83

    .line 443
    .line 444
    .line 445
    move-object/from16 v16, v6

    .line 446
    .line 447
    const v6, 0x7f080d84

    .line 448
    .line 449
    .line 450
    move-object/from16 v17, v7

    .line 451
    .line 452
    const v7, 0x7f080d85

    .line 453
    .line 454
    .line 455
    move-object/from16 v10, v16

    .line 456
    .line 457
    move-object/from16 v29, v17

    .line 458
    .line 459
    invoke-direct/range {v0 .. v8}, Lcom/android/systemui/shared/rotation/RotationButtonController;-><init>(Landroid/content/Context;IIIIIILjava/util/function/Supplier;)V

    .line 460
    .line 461
    .line 462
    sget-object v2, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 463
    .line 464
    invoke-virtual {v0, v2}, Lcom/android/systemui/shared/rotation/RotationButtonController;->setBgExecutor(Ljava/util/concurrent/Executor;)V

    .line 465
    .line 466
    .line 467
    move-object v5, v0

    .line 468
    new-instance v0, Lcom/android/launcher3/taskbar/R1;

    .line 469
    .line 470
    move-object v3, v2

    .line 471
    new-instance v2, Lcom/android/launcher3/taskbar/j2;

    .line 472
    .line 473
    invoke-direct {v2, v1}, Lcom/android/launcher3/taskbar/j2;-><init>(Lcom/android/launcher3/taskbar/b;)V

    .line 474
    .line 475
    .line 476
    new-instance v4, Lcom/android/launcher3/taskbar/M0;

    .line 477
    .line 478
    invoke-virtual {v1}, Landroid/view/ContextThemeWrapper;->getMainThreadHandler()Landroid/os/Handler;

    .line 479
    .line 480
    .line 481
    move-result-object v6

    .line 482
    invoke-direct {v4, v1, v9, v10, v6}, Lcom/android/launcher3/taskbar/M0;-><init>(Lcom/android/launcher3/taskbar/I1;Landroid/content/Context;Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;Landroid/os/Handler;)V

    .line 483
    .line 484
    .line 485
    new-instance v6, Lcom/android/launcher3/taskbar/s2;

    .line 486
    .line 487
    invoke-direct {v6, v1, v13}, Lcom/android/launcher3/taskbar/s2;-><init>(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/taskbar/TaskbarDragLayer;)V

    .line 488
    .line 489
    .line 490
    new-instance v7, Lcom/android/launcher3/taskbar/W4;

    .line 491
    .line 492
    invoke-direct {v7, v1, v14}, Lcom/android/launcher3/taskbar/W4;-><init>(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/taskbar/TaskbarView;)V

    .line 493
    .line 494
    .line 495
    new-instance v8, Lcom/android/launcher3/taskbar/I3;

    .line 496
    .line 497
    invoke-direct {v8, v1, v15}, Lcom/android/launcher3/taskbar/I3;-><init>(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/taskbar/TaskbarScrimView;)V

    .line 498
    .line 499
    .line 500
    new-instance v9, Lcom/android/launcher3/taskbar/q4;

    .line 501
    .line 502
    new-instance v10, LE2/c;

    .line 503
    .line 504
    const-class v13, Landroid/hardware/display/DisplayManager;

    .line 505
    .line 506
    invoke-virtual {v11, v13}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 507
    .line 508
    .line 509
    move-result-object v11

    .line 510
    check-cast v11, Landroid/hardware/display/DisplayManager;

    .line 511
    .line 512
    invoke-virtual {v3}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 513
    .line 514
    .line 515
    move-result-object v3

    .line 516
    invoke-virtual {v1}, Landroid/view/ContextThemeWrapper;->getMainThreadHandler()Landroid/os/Handler;

    .line 517
    .line 518
    .line 519
    move-result-object v13

    .line 520
    invoke-direct {v10, v11, v1, v3, v13}, LE2/c;-><init>(Landroid/hardware/display/DisplayManager;Landroid/content/Context;Landroid/os/Handler;Landroid/os/Handler;)V

    .line 521
    .line 522
    .line 523
    move-object/from16 v3, p5

    .line 524
    .line 525
    invoke-direct {v9, v1, v3, v12, v10}, Lcom/android/launcher3/taskbar/q4;-><init>(Lcom/android/launcher3/taskbar/b;LF2/i;Landroid/view/WindowManager;LE2/c;)V

    .line 526
    .line 527
    .line 528
    new-instance v10, Lcom/android/launcher3/taskbar/O2;

    .line 529
    .line 530
    invoke-direct {v10, v1}, Lcom/android/launcher3/taskbar/O2;-><init>(Lcom/android/launcher3/taskbar/I1;)V

    .line 531
    .line 532
    .line 533
    new-instance v11, Lcom/android/launcher3/taskbar/U0;

    .line 534
    .line 535
    move-object/from16 v3, v29

    .line 536
    .line 537
    invoke-direct {v11, v1, v3}, Lcom/android/launcher3/taskbar/U0;-><init>(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/taskbar/StashedHandleView;)V

    .line 538
    .line 539
    .line 540
    new-instance v12, Lcom/android/launcher3/taskbar/a4;

    .line 541
    .line 542
    invoke-direct {v12, v1}, Lcom/android/launcher3/taskbar/a4;-><init>(Lcom/android/launcher3/taskbar/I1;)V

    .line 543
    .line 544
    .line 545
    new-instance v13, Lcom/android/launcher3/taskbar/K1;

    .line 546
    .line 547
    invoke-direct {v13, v1}, Lcom/android/launcher3/taskbar/K1;-><init>(Lcom/android/launcher3/taskbar/I1;)V

    .line 548
    .line 549
    .line 550
    new-instance v14, Lcom/android/launcher3/taskbar/z3;

    .line 551
    .line 552
    invoke-direct {v14, v1}, Lcom/android/launcher3/taskbar/z3;-><init>(Lcom/android/launcher3/taskbar/I1;)V

    .line 553
    .line 554
    .line 555
    new-instance v15, Lcom/android/launcher3/taskbar/H2;

    .line 556
    .line 557
    invoke-direct {v15, v1}, Lcom/android/launcher3/taskbar/H2;-><init>(Lcom/android/launcher3/taskbar/I1;)V

    .line 558
    .line 559
    .line 560
    new-instance v3, La2/e;

    .line 561
    .line 562
    move-object/from16 p1, v0

    .line 563
    .line 564
    move-object/from16 v0, p3

    .line 565
    .line 566
    invoke-direct {v3, v1, v0}, La2/e;-><init>(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/h0;)V

    .line 567
    .line 568
    .line 569
    new-instance v17, Lcom/android/launcher3/taskbar/allapps/c;

    .line 570
    .line 571
    invoke-direct/range {v17 .. v17}, Lcom/android/launcher3/taskbar/allapps/c;-><init>()V

    .line 572
    .line 573
    .line 574
    new-instance v0, Lcom/android/launcher3/taskbar/N2;

    .line 575
    .line 576
    invoke-direct {v0, v1}, Lcom/android/launcher3/taskbar/N2;-><init>(Lcom/android/launcher3/taskbar/I1;)V

    .line 577
    .line 578
    .line 579
    move-object/from16 v18, v0

    .line 580
    .line 581
    new-instance v0, Lcom/android/launcher3/taskbar/c5;

    .line 582
    .line 583
    invoke-direct {v0, v1}, Lcom/android/launcher3/taskbar/c5;-><init>(Lcom/android/launcher3/taskbar/I1;)V

    .line 584
    .line 585
    .line 586
    move-object/from16 v19, v0

    .line 587
    .line 588
    new-instance v0, Lcom/android/launcher3/taskbar/j4;

    .line 589
    .line 590
    invoke-direct {v0, v1}, Lcom/android/launcher3/taskbar/j4;-><init>(Lcom/android/launcher3/taskbar/I1;)V

    .line 591
    .line 592
    .line 593
    move-object/from16 v20, v0

    .line 594
    .line 595
    new-instance v0, Lcom/android/launcher3/taskbar/M3;

    .line 596
    .line 597
    invoke-direct {v0, v1}, Lcom/android/launcher3/taskbar/M3;-><init>(Lcom/android/launcher3/taskbar/I1;)V

    .line 598
    .line 599
    .line 600
    move-object/from16 v21, v0

    .line 601
    .line 602
    new-instance v0, Lcom/android/launcher3/taskbar/F3;

    .line 603
    .line 604
    move-object/from16 p6, v2

    .line 605
    .line 606
    sget-object v2, Lcom/android/quickstep/RecentsModel;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 607
    .line 608
    invoke-virtual {v2, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 609
    .line 610
    .line 611
    move-result-object v2

    .line 612
    check-cast v2, Lcom/android/quickstep/RecentsModel;

    .line 613
    .line 614
    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/taskbar/F3;-><init>(Landroid/content/Context;Lcom/android/quickstep/RecentsModel;)V

    .line 615
    .line 616
    .line 617
    invoke-static {v1}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->y(Landroid/content/Context;)Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;

    .line 618
    .line 619
    .line 620
    move-result-object v23

    .line 621
    new-instance v24, Lcom/android/launcher3/taskbar/s;

    .line 622
    .line 623
    invoke-direct/range {v24 .. v24}, Lcom/android/launcher3/taskbar/s;-><init>()V

    .line 624
    .line 625
    .line 626
    new-instance v2, Lcom/android/launcher3/taskbar/q3;

    .line 627
    .line 628
    invoke-direct {v2, v1}, Lcom/android/launcher3/taskbar/q3;-><init>(Lcom/android/launcher3/taskbar/I1;)V

    .line 629
    .line 630
    .line 631
    move-object/from16 v22, v0

    .line 632
    .line 633
    new-instance v0, Lcom/android/launcher3/taskbar/S1;

    .line 634
    .line 635
    move-object/from16 v25, v2

    .line 636
    .line 637
    sget-object v2, LP1/k;->o:Lcom/android/launcher3/util/I;

    .line 638
    .line 639
    invoke-virtual {v2, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 640
    .line 641
    .line 642
    move-result-object v2

    .line 643
    check-cast v2, LP1/k;

    .line 644
    .line 645
    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/taskbar/S1;-><init>(Landroid/content/Context;LP1/k;)V

    .line 646
    .line 647
    .line 648
    new-instance v2, LZ1/a;

    .line 649
    .line 650
    invoke-direct {v2, v1}, LZ1/a;-><init>(Landroid/content/Context;)V

    .line 651
    .line 652
    .line 653
    move-object/from16 v27, v0

    .line 654
    .line 655
    move-object/from16 v28, v2

    .line 656
    .line 657
    move-object/from16 v16, v3

    .line 658
    .line 659
    move-object/from16 v0, p1

    .line 660
    .line 661
    move-object/from16 v3, p4

    .line 662
    .line 663
    move-object/from16 v2, p6

    .line 664
    .line 665
    invoke-direct/range {v0 .. v28}, Lcom/android/launcher3/taskbar/R1;-><init>(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/taskbar/j2;Lcom/android/launcher3/taskbar/l3;Lcom/android/launcher3/taskbar/M0;Lcom/android/systemui/shared/rotation/RotationButtonController;Lcom/android/launcher3/taskbar/s2;Lcom/android/launcher3/taskbar/W4;Lcom/android/launcher3/taskbar/I3;Lcom/android/launcher3/taskbar/q4;Lcom/android/launcher3/taskbar/O2;Lcom/android/launcher3/taskbar/U0;Lcom/android/launcher3/taskbar/a4;Lcom/android/launcher3/taskbar/K1;Lcom/android/launcher3/taskbar/z3;Lcom/android/launcher3/taskbar/H2;La2/e;Lcom/android/launcher3/taskbar/allapps/c;Lcom/android/launcher3/taskbar/N2;Lcom/android/launcher3/taskbar/c5;Lcom/android/launcher3/taskbar/j4;Lcom/android/launcher3/taskbar/M3;Lcom/android/launcher3/taskbar/F3;Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;Lcom/android/launcher3/taskbar/s;Lcom/android/launcher3/taskbar/q3;Ljava/util/Optional;Lcom/android/launcher3/taskbar/S1;LZ1/a;)V

    .line 666
    .line 667
    .line 668
    iput-object v0, v1, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 669
    .line 670
    invoke-static {v1}, Lcom/android/launcher3/J3;->g(Landroid/content/Context;)Lcom/android/launcher3/J3;

    .line 671
    .line 672
    .line 673
    move-result-object v0

    .line 674
    iput-object v0, v1, Lcom/android/launcher3/taskbar/I1;->G:Lcom/android/launcher3/J3;

    .line 675
    .line 676
    invoke-virtual {v1}, Lcom/android/launcher3/util/s;->onViewCreated()V

    .line 677
    .line 678
    .line 679
    return-void
.end method

.method private synthetic A1(Lcom/android/quickstep/util/SingleTask;Landroid/window/RemoteTransition;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->V0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sget-object v1, LO2/f;->i:LO2/f;

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/android/launcher3/taskbar/I1;->K0(Lcom/android/quickstep/util/GroupTask;Landroid/window/RemoteTransition;ZLO2/f;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic B(Lcom/android/launcher3/taskbar/I1;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/I1;->v1()Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private synthetic B1(Lcom/android/quickstep/util/SingleTask;Landroid/window/RemoteTransition;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/taskbar/c1;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2}, Lcom/android/launcher3/taskbar/c1;-><init>(Lcom/android/launcher3/taskbar/I1;Lcom/android/quickstep/util/SingleTask;Landroid/window/RemoteTransition;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic C(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/model/data/D;Landroid/window/RemoteTransition;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/I1;->E1(Lcom/android/launcher3/model/data/D;Landroid/window/RemoteTransition;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic C1(Lcom/android/launcher3/model/data/D;Landroid/window/RemoteTransition;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/quickstep/SystemUiProxy;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/D;->j0()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    sget-object v0, LO2/f;->i:LO2/f;

    .line 14
    .line 15
    invoke-virtual {p0, p1, p2, v0}, Lcom/android/quickstep/SystemUiProxy;->showDesktopApp(ILandroid/window/RemoteTransition;LO2/f;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic D(Lcom/android/launcher3/taskbar/I1;Landroid/window/RemoteTransition;Lcom/android/quickstep/util/SingleTask;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/I1;->q1(Landroid/window/RemoteTransition;Lcom/android/quickstep/util/SingleTask;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic D1(Lcom/android/launcher3/model/data/D;Landroid/window/RemoteTransition;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/taskbar/h1;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2}, Lcom/android/launcher3/taskbar/h1;-><init>(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/model/data/D;Landroid/window/RemoteTransition;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private D2(Landroid/animation/AnimatorSet;Z)V
    .locals 7

    .line 1
    sget-object v0, Lcom/android/launcher3/taskbar/I1;->M:Landroid/window/DesktopModeFlags$DesktopModeFlag;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/window/DesktopModeFlags$DesktopModeFlag;->isTrue()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_0

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->K:Landroid/view/View;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    new-instance v0, Landroid/view/View;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/android/launcher3/taskbar/I1;->K:Landroid/view/View;

    .line 21
    .line 22
    :cond_1
    const/4 v0, 0x0

    .line 23
    if-eqz p2, :cond_3

    .line 24
    .line 25
    iget-object p2, p0, Lcom/android/launcher3/taskbar/I1;->K:Landroid/view/View;

    .line 26
    .line 27
    invoke-virtual {p2}, Landroid/view/View;->isAttachedToWindow()Z

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    if-nez p2, :cond_2

    .line 32
    .line 33
    iget-object p2, p0, Lcom/android/launcher3/taskbar/I1;->i:Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 34
    .line 35
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->isAttachedToWindow()Z

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    if-eqz p2, :cond_2

    .line 40
    .line 41
    iget-object p2, p0, Lcom/android/launcher3/taskbar/I1;->i:Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 42
    .line 43
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->isLaidOut()Z

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    if-eqz p2, :cond_2

    .line 48
    .line 49
    iget-object p2, p0, Lcom/android/launcher3/taskbar/I1;->K:Landroid/view/View;

    .line 50
    .line 51
    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    if-nez p2, :cond_2

    .line 56
    .line 57
    iget-object p2, p0, Lcom/android/launcher3/taskbar/I1;->i:Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 58
    .line 59
    const v1, 0x7f0b0403

    .line 60
    .line 61
    .line 62
    invoke-virtual {p2, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    check-cast p2, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;

    .line 67
    .line 68
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getVisibility()I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    const/4 v2, 0x4

    .line 73
    invoke-virtual {p2, v2}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 74
    .line 75
    .line 76
    new-instance v2, Ls1/o;

    .line 77
    .line 78
    iget-object v3, p0, Lcom/android/launcher3/taskbar/I1;->i:Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 79
    .line 80
    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getWidth()I

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    iget-object v4, p0, Lcom/android/launcher3/taskbar/I1;->i:Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 85
    .line 86
    invoke-virtual {v4}, Landroid/widget/FrameLayout;->getHeight()I

    .line 87
    .line 88
    .line 89
    move-result v4

    .line 90
    iget-object v5, p0, Lcom/android/launcher3/taskbar/I1;->i:Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 91
    .line 92
    invoke-static {v5}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    new-instance v6, Lcom/android/launcher3/taskbar/q1;

    .line 96
    .line 97
    invoke-direct {v6, v5}, Lcom/android/launcher3/taskbar/q1;-><init>(Lcom/android/launcher3/taskbar/TaskbarDragLayer;)V

    .line 98
    .line 99
    .line 100
    invoke-static {v3, v4, v6}, Ls1/e;->a(IILs1/e;)Landroid/graphics/Bitmap;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    invoke-direct {v2, v3}, Ls1/o;-><init>(Landroid/graphics/Bitmap;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p2, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 108
    .line 109
    .line 110
    iget-object p2, p0, Lcom/android/launcher3/taskbar/I1;->K:Landroid/view/View;

    .line 111
    .line 112
    invoke-virtual {p2, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 113
    .line 114
    .line 115
    iget-object p2, p0, Lcom/android/launcher3/taskbar/I1;->K:Landroid/view/View;

    .line 116
    .line 117
    invoke-virtual {p2, v0}, Landroid/view/View;->setAlpha(F)V

    .line 118
    .line 119
    .line 120
    iget-object p2, p0, Lcom/android/launcher3/taskbar/I1;->K:Landroid/view/View;

    .line 121
    .line 122
    new-instance v0, Lcom/android/launcher3/taskbar/I1$a;

    .line 123
    .line 124
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/taskbar/I1$a;-><init>(Lcom/android/launcher3/taskbar/I1;Landroid/animation/AnimatorSet;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p2, v0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 128
    .line 129
    .line 130
    new-instance p1, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 131
    .line 132
    iget-object p2, p0, Lcom/android/launcher3/taskbar/I1;->i:Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 133
    .line 134
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getWidth()I

    .line 135
    .line 136
    .line 137
    move-result p2

    .line 138
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->i:Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 139
    .line 140
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getHeight()I

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    invoke-direct {p1, p2, v0}, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;-><init>(II)V

    .line 145
    .line 146
    .line 147
    iget-object p2, p0, Lcom/android/launcher3/taskbar/I1;->n:Landroid/view/WindowManager$LayoutParams;

    .line 148
    .line 149
    iget p2, p2, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 150
    .line 151
    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 152
    .line 153
    const/4 p2, 0x1

    .line 154
    iput-boolean p2, p1, Lcom/android/launcher3/h1$a;->a:Z

    .line 155
    .line 156
    iget-object p2, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 157
    .line 158
    iget-object p2, p2, Lcom/android/launcher3/taskbar/R1;->v:La2/e;

    .line 159
    .line 160
    invoke-virtual {p2}, La2/e;->s()La2/a;

    .line 161
    .line 162
    .line 163
    move-result-object p2

    .line 164
    iput-object p2, p0, Lcom/android/launcher3/taskbar/I1;->L:La2/a;

    .line 165
    .line 166
    invoke-virtual {p2}, La2/a;->n()La2/h;

    .line 167
    .line 168
    .line 169
    move-result-object p2

    .line 170
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->K:Landroid/view/View;

    .line 171
    .line 172
    invoke-virtual {p2, p0, p1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 173
    .line 174
    .line 175
    :cond_2
    :goto_0
    return-void

    .line 176
    :cond_3
    new-instance p2, Lcom/android/launcher3/taskbar/s1;

    .line 177
    .line 178
    invoke-direct {p2, p0}, Lcom/android/launcher3/taskbar/s1;-><init>(Lcom/android/launcher3/taskbar/I1;)V

    .line 179
    .line 180
    .line 181
    iget-object v1, p0, Lcom/android/launcher3/taskbar/I1;->K:Landroid/view/View;

    .line 182
    .line 183
    invoke-virtual {v1}, Landroid/view/View;->isAttachedToWindow()Z

    .line 184
    .line 185
    .line 186
    move-result v1

    .line 187
    if-eqz v1, :cond_5

    .line 188
    .line 189
    iget-object v1, p0, Lcom/android/launcher3/taskbar/I1;->K:Landroid/view/View;

    .line 190
    .line 191
    invoke-virtual {v1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->end()V

    .line 195
    .line 196
    .line 197
    invoke-static {}, Lcom/android/launcher3/N5;->E()Z

    .line 198
    .line 199
    .line 200
    move-result p1

    .line 201
    if-eqz p1, :cond_4

    .line 202
    .line 203
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 204
    .line 205
    .line 206
    return-void

    .line 207
    :cond_4
    iget-object p1, p0, Lcom/android/launcher3/taskbar/I1;->i:Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 208
    .line 209
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->K:Landroid/view/View;

    .line 210
    .line 211
    invoke-static {p1, p0, p2}, Lu2/I;->b(Landroid/view/View;Landroid/view/View;Ljava/lang/Runnable;)V

    .line 212
    .line 213
    .line 214
    return-void

    .line 215
    :cond_5
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 216
    .line 217
    .line 218
    return-void
.end method

.method public static synthetic E(Lcom/android/launcher3/taskbar/bubbles/m0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/m0;->c:LX1/b;

    .line 2
    .line 3
    invoke-interface {v0}, LX1/b;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/m0;->c:LX1/b;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-interface {p0, v0}, LX1/b;->g(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method private synthetic E1(Lcom/android/launcher3/model/data/D;Landroid/window/RemoteTransition;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/quickstep/SystemUiProxy;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/D;->j0()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    sget-object v0, LO2/f;->i:LO2/f;

    .line 14
    .line 15
    invoke-virtual {p0, p1, p2, v0}, Lcom/android/quickstep/SystemUiProxy;->showDesktopApp(ILandroid/window/RemoteTransition;LO2/f;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic F(Lcom/android/launcher3/h0;Lcom/android/launcher3/taskbar/bubbles/m0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->Z()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    iget-object p1, p1, Lcom/android/launcher3/taskbar/bubbles/m0;->c:LX1/b;

    .line 6
    .line 7
    invoke-interface {p1, p0}, LX1/b;->z(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic F1(Lcom/android/launcher3/BubbleTextView;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->n:Lcom/android/launcher3/taskbar/z3;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/z3;->C(Lcom/android/launcher3/BubbleTextView;)Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic G(Landroid/animation/AnimatorSet;FLcom/android/launcher3/taskbar/bubbles/m0;)V
    .locals 2

    .line 1
    iget-object v0, p2, Lcom/android/launcher3/taskbar/bubbles/m0;->b:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->S()Lcom/android/launcher3/util/v1;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/v1$c;->b(F)Landroid/animation/Animator;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 17
    .line 18
    .line 19
    iget-object p2, p2, Lcom/android/launcher3/taskbar/bubbles/m0;->c:LX1/b;

    .line 20
    .line 21
    invoke-interface {p2}, LX1/b;->B()Lcom/android/launcher3/util/v1$c;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    if-eqz p2, :cond_0

    .line 26
    .line 27
    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/v1$c;->b(F)Landroid/animation/Animator;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0, p1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method private synthetic G1(Lcom/android/launcher3/taskbar/bubbles/A0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/M0;->q0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {p1, p0}, Lcom/android/launcher3/taskbar/bubbles/A0;->w(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic H(Lcom/android/launcher3/taskbar/I1;JLcom/android/launcher3/taskbar/bubbles/m0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/taskbar/I1;->H1(JLcom/android/launcher3/taskbar/bubbles/m0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic H1(JLcom/android/launcher3/taskbar/bubbles/m0;)V
    .locals 1

    .line 1
    iget-object v0, p3, Lcom/android/launcher3/taskbar/bubbles/m0;->a:Lcom/android/launcher3/taskbar/bubbles/t;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Lcom/android/launcher3/taskbar/bubbles/t;->f3(J)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p3, Lcom/android/launcher3/taskbar/bubbles/m0;->d:Ljava/util/Optional;

    .line 7
    .line 8
    new-instance p2, Lcom/android/launcher3/taskbar/k1;

    .line 9
    .line 10
    invoke-direct {p2, p0}, Lcom/android/launcher3/taskbar/k1;-><init>(Lcom/android/launcher3/taskbar/I1;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, p2}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic I(Lcom/android/launcher3/taskbar/I1;Ljava/util/List;Lcom/android/systemui/shared/recents/model/Task;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/I1;->s1(Ljava/util/List;Lcom/android/systemui/shared/recents/model/Task;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic I1()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->L:La2/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, La2/a;->n()La2/h;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/android/launcher3/taskbar/I1;->K:Landroid/view/View;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Lcom/android/launcher3/taskbar/I1;->K:Landroid/view/View;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/android/launcher3/taskbar/I1;->L:La2/a;

    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public static synthetic J(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/folder/Folder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/I1;->n1(Lcom/android/launcher3/folder/Folder;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private J1(Landroid/content/Intent;Lcom/android/launcher3/model/data/y;I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->s:Lcom/android/launcher3/taskbar/F3;

    .line 4
    .line 5
    invoke-virtual {v0, p2}, Lcom/android/launcher3/taskbar/F3;->k(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/taskbar/F3$b;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/F3$b;->a()Lcom/android/launcher3/BubbleTextView$f;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget-object v1, Lcom/android/launcher3/BubbleTextView$f;->h:Lcom/android/launcher3/BubbleTextView$f;

    .line 14
    .line 15
    if-eq v0, v1, :cond_2

    .line 16
    .line 17
    sget-object v1, Lcom/android/launcher3/BubbleTextView$f;->i:Lcom/android/launcher3/BubbleTextView$f;

    .line 18
    .line 19
    if-ne v0, v1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/I1;->p0()Lcom/android/launcher3/util/b;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    sget-object v0, Landroid/window/DesktopModeFlags;->ENABLE_START_LAUNCH_TRANSITION_FROM_TASKBAR_BUGFIX:Landroid/window/DesktopModeFlags;

    .line 27
    .line 28
    invoke-virtual {v0}, Landroid/window/DesktopModeFlags;->isTrue()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->H:Lcom/android/quickstep/SystemUiProxy;

    .line 35
    .line 36
    iget-object p2, p2, Lcom/android/launcher3/util/b;->a:Landroid/app/ActivityOptions;

    .line 37
    .line 38
    invoke-virtual {p2}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/quickstep/SystemUiProxy;->startLaunchIntentTransition(Landroid/content/Intent;Landroid/os/Bundle;I)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    iget-object p2, p2, Lcom/android/launcher3/util/b;->a:Landroid/app/ActivityOptions;

    .line 47
    .line 48
    invoke-virtual {p2}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    invoke-virtual {p0, p1, p2}, Landroid/view/ContextThemeWrapper;->startActivity(Landroid/content/Intent;Landroid/os/Bundle;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_2
    :goto_0
    sget-object p1, Lcom/android/launcher3/BubbleTextView$f;->i:Lcom/android/launcher3/BubbleTextView$f;

    .line 57
    .line 58
    if-ne v0, p1, :cond_3

    .line 59
    .line 60
    sget-object p1, Lj1/i$a;->j:Lj1/i$a;

    .line 61
    .line 62
    const/16 p3, 0x7c

    .line 63
    .line 64
    invoke-direct {p0, p1, p3}, Lcom/android/launcher3/taskbar/I1;->h0(Lj1/i$a;I)Landroid/window/RemoteTransition;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    goto :goto_1

    .line 69
    :cond_3
    const/4 p1, 0x0

    .line 70
    :goto_1
    sget-object p3, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 71
    .line 72
    new-instance v0, Lcom/android/launcher3/taskbar/d1;

    .line 73
    .line 74
    invoke-direct {v0, p0, p2, p1}, Lcom/android/launcher3/taskbar/d1;-><init>(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/taskbar/F3$b;Landroid/window/RemoteTransition;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p3, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public static synthetic K(Lcom/android/quickstep/views/RecentsView;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getSplitSelectController()Lcom/android/quickstep/util/SplitSelectStateController;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/util/SplitSelectStateController;->getAppPairsController()Lcom/android/quickstep/util/AppPairsController;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p1, Lcom/android/launcher3/apppairs/AppPairIcon;

    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    invoke-virtual {p0, p1, v0}, Lcom/android/quickstep/util/AppPairsController;->launchAppPair(Lcom/android/launcher3/apppairs/AppPairIcon;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private K1(Lcom/android/quickstep/views/RecentsView;Landroid/view/View;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/views/RecentsView;",
            "Landroid/view/View;",
            "Ljava/util/List<",
            "+",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Landroid/window/DesktopExperienceFlags;->ENABLE_TASKBAR_CONNECTED_DISPLAYS:Landroid/window/DesktopExperienceFlags;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/window/DesktopExperienceFlags;->isTrue()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/I1;->l:Z

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move v0, v1

    .line 17
    :goto_0
    if-nez p1, :cond_1

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const/4 v2, 0x2

    .line 27
    if-ne v0, v2, :cond_2

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/android/quickstep/views/RecentsView;->getSplitSelectController()Lcom/android/quickstep/util/SplitSelectStateController;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Lcom/android/quickstep/util/SplitSelectStateController;->getAppPairsController()Lcom/android/quickstep/util/AppPairsController;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    check-cast p2, Lcom/android/launcher3/apppairs/AppPairIcon;

    .line 38
    .line 39
    invoke-virtual {p0, p2, p3}, Lcom/android/quickstep/util/AppPairsController;->handleAppPairLaunchInApp(Lcom/android/launcher3/apppairs/AppPairIcon;Ljava/util/List;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_2
    invoke-interface {p3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    check-cast p1, Lcom/android/launcher3/model/data/y;

    .line 48
    .line 49
    const/4 p2, 0x0

    .line 50
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/I1;->u2(Lcom/android/launcher3/model/data/y;Lcom/android/systemui/shared/recents/model/Task;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public static synthetic L(Landroid/view/View;)V
    .locals 1

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private L1(Lcom/android/quickstep/views/RecentsView;Landroid/view/View;Ljava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/views/RecentsView;",
            "Landroid/view/View;",
            "Ljava/util/List<",
            "+",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x2

    .line 9
    if-ne v0, v1, :cond_1

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    :goto_0
    move v4, v0

    .line 13
    goto :goto_1

    .line 14
    :cond_1
    const/4 v0, 0x0

    .line 15
    goto :goto_0

    .line 16
    :goto_1
    invoke-interface {p3}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Lcom/android/launcher3/taskbar/l1;

    .line 21
    .line 22
    invoke-direct {v1}, Lcom/android/launcher3/taskbar/l1;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-interface {v0}, Ljava/util/stream/Stream;->toList()Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p1}, Lcom/android/quickstep/views/RecentsView;->getSplitSelectController()Lcom/android/quickstep/util/SplitSelectStateController;

    .line 34
    .line 35
    .line 36
    move-result-object v7

    .line 37
    new-instance v1, Lcom/android/launcher3/taskbar/m1;

    .line 38
    .line 39
    move-object v2, p0

    .line 40
    move-object v3, p1

    .line 41
    move-object v5, p2

    .line 42
    move-object v6, p3

    .line 43
    invoke-direct/range {v1 .. v6}, Lcom/android/launcher3/taskbar/m1;-><init>(Lcom/android/launcher3/taskbar/I1;Lcom/android/quickstep/views/RecentsView;ZLandroid/view/View;Ljava/util/List;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v7, v0, v4, v1}, Lcom/android/quickstep/util/SplitSelectStateController;->findLastActiveTasksAndRunCallback(Ljava/util/List;ZLjava/util/function/Consumer;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public static synthetic M(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/BubbleTextView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/I1;->F1(Lcom/android/launcher3/BubbleTextView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private M1(Lcom/android/quickstep/views/RecentsView;Landroid/view/View;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/views/RecentsView;",
            "Landroid/view/View;",
            "Ljava/util/List<",
            "+",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->U0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/taskbar/I1;->K1(Lcom/android/quickstep/views/RecentsView;Landroid/view/View;Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/taskbar/I1;->L1(Lcom/android/quickstep/views/RecentsView;Landroid/view/View;Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic N(Lcom/android/launcher3/taskbar/I1;)Landroid/graphics/Point;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/I1;->w1()Landroid/graphics/Point;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic O(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/h0;Lcom/android/launcher3/h0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/I1;->l1(Lcom/android/launcher3/h0;Lcom/android/launcher3/h0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private O0()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 4
    .line 5
    new-instance v0, Lcom/android/launcher3/taskbar/z1;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/android/launcher3/taskbar/z1;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ljava/util/Optional;->map(Ljava/util/function/Function;)Ljava/util/Optional;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Ljava/lang/Boolean;

    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0
.end method

.method public static synthetic P(Lcom/android/launcher3/taskbar/I1;Lcom/android/quickstep/views/RecentsView;ZLandroid/view/View;Ljava/util/List;[Lcom/android/systemui/shared/recents/model/Task;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lcom/android/launcher3/taskbar/I1;->u1(Lcom/android/quickstep/views/RecentsView;ZLandroid/view/View;Ljava/util/List;[Lcom/android/systemui/shared/recents/model/Task;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic S(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/I1;->m1(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic T(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/taskbar/F3$b;Landroid/window/RemoteTransition;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/I1;->r1(Lcom/android/launcher3/taskbar/F3$b;Landroid/window/RemoteTransition;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic U(Lcom/android/launcher3/taskbar/I1;Ljava/lang/Runnable;Lcom/android/quickstep/util/SingleTask;ZLandroid/window/RemoteTransition;LO2/f;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p6}, Lcom/android/launcher3/taskbar/I1;->p1(Ljava/lang/Runnable;Lcom/android/quickstep/util/SingleTask;ZLandroid/window/RemoteTransition;LO2/f;Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic V(Lcom/android/launcher3/taskbar/I1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/I1;->z1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private V1(ZZ)V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/I1;->q:Z

    .line 2
    .line 3
    if-eq p1, v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    :goto_0
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/I1;->q:Z

    .line 9
    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    const/high16 v1, 0x100000

    .line 13
    .line 14
    invoke-static {p0, v1}, Lcom/android/launcher3/a;->closeAllOpenViewsExcept(Lcom/android/launcher3/views/k;I)V

    .line 15
    .line 16
    .line 17
    :cond_1
    if-eqz p1, :cond_2

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    goto :goto_1

    .line 21
    :cond_2
    const/high16 v1, 0x3f800000    # 1.0f

    .line 22
    .line 23
    :goto_1
    new-instance v2, Landroid/animation/AnimatorSet;

    .line 24
    .line 25
    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 26
    .line 27
    .line 28
    iget-object v3, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 29
    .line 30
    iget-object v3, v3, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 31
    .line 32
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/W4;->S()Lcom/android/launcher3/util/v1;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    const/4 v4, 0x4

    .line 37
    invoke-virtual {v3, v4}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-virtual {v3, v1}, Lcom/android/launcher3/util/v1$c;->b(F)Landroid/animation/Animator;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 46
    .line 47
    .line 48
    iget-object v3, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 49
    .line 50
    iget-object v3, v3, Lcom/android/launcher3/taskbar/R1;->f:Lcom/android/launcher3/taskbar/s2;

    .line 51
    .line 52
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/s2;->r()Lcom/android/launcher3/anim/d;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-virtual {v3, v1}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 61
    .line 62
    .line 63
    if-eqz v0, :cond_3

    .line 64
    .line 65
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 66
    .line 67
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 68
    .line 69
    new-instance v3, Lcom/android/launcher3/taskbar/i1;

    .line 70
    .line 71
    invoke-direct {v3, v2, v1}, Lcom/android/launcher3/taskbar/i1;-><init>(Landroid/animation/AnimatorSet;F)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, v3}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 75
    .line 76
    .line 77
    :cond_3
    invoke-virtual {v2}, Landroid/animation/AnimatorSet;->start()V

    .line 78
    .line 79
    .line 80
    if-eqz p2, :cond_4

    .line 81
    .line 82
    invoke-virtual {v2}, Landroid/animation/AnimatorSet;->end()V

    .line 83
    .line 84
    .line 85
    :cond_4
    invoke-direct {p0, v2, p1}, Lcom/android/launcher3/taskbar/I1;->D2(Landroid/animation/AnimatorSet;Z)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method static bridge synthetic W(Lcom/android/launcher3/taskbar/I1;)Lcom/android/launcher3/taskbar/R1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic X(Lcom/android/launcher3/taskbar/I1;)Lcom/android/launcher3/taskbar/TaskbarDragLayer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->i:Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic Y(Lcom/android/launcher3/taskbar/I1;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->K:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method private b0(Lcom/android/launcher3/h0;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/taskbar/e1;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/taskbar/e1;-><init>(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/h0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, p0}, Lcom/android/launcher3/h0;->f1(Landroid/content/Context;)Lcom/android/launcher3/h0$a;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1, v0}, Lcom/android/launcher3/h0$a;->j(Ljava/util/function/Consumer;)Lcom/android/launcher3/h0$a;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Lcom/android/launcher3/h0$a;->a()Lcom/android/launcher3/h0;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Lcom/android/launcher3/taskbar/I1;->m:Lcom/android/launcher3/h0;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    iget-object p1, p0, Lcom/android/launcher3/taskbar/I1;->m:Lcom/android/launcher3/h0;

    .line 27
    .line 28
    iput-object p1, p0, Lcom/android/launcher3/taskbar/I1;->E:Lcom/android/launcher3/h0;

    .line 29
    .line 30
    invoke-virtual {p1, p0}, Lcom/android/launcher3/h0;->f1(Landroid/content/Context;)Lcom/android/launcher3/h0$a;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p1, v0}, Lcom/android/launcher3/h0$a;->j(Ljava/util/function/Consumer;)Lcom/android/launcher3/h0$a;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const/4 v0, 0x0

    .line 39
    invoke-virtual {p1, v0}, Lcom/android/launcher3/h0$a;->e(Z)Lcom/android/launcher3/h0$a;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1}, Lcom/android/launcher3/h0$a;->a()Lcom/android/launcher3/h0;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iput-object p1, p0, Lcom/android/launcher3/taskbar/I1;->F:Lcom/android/launcher3/h0;

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/taskbar/I1;->m:Lcom/android/launcher3/h0;

    .line 51
    .line 52
    iput-object p1, p0, Lcom/android/launcher3/taskbar/I1;->F:Lcom/android/launcher3/h0;

    .line 53
    .line 54
    invoke-virtual {p1, p0}, Lcom/android/launcher3/h0;->f1(Landroid/content/Context;)Lcom/android/launcher3/h0$a;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p1, v0}, Lcom/android/launcher3/h0$a;->j(Ljava/util/function/Consumer;)Lcom/android/launcher3/h0$a;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    const/4 v0, 0x1

    .line 63
    invoke-virtual {p1, v0}, Lcom/android/launcher3/h0$a;->e(Z)Lcom/android/launcher3/h0$a;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {p1}, Lcom/android/launcher3/h0$a;->a()Lcom/android/launcher3/h0;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    iput-object p1, p0, Lcom/android/launcher3/taskbar/I1;->E:Lcom/android/launcher3/h0;

    .line 72
    .line 73
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->z0()Lcom/android/launcher3/util/C1;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iput-object p1, p0, Lcom/android/launcher3/taskbar/I1;->t:Lcom/android/launcher3/util/C1;

    .line 78
    .line 79
    return-void
.end method

.method private e2(ILandroid/view/WindowManager$LayoutParams;)V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    iput v0, p2, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 3
    .line 4
    iput v0, p2, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 5
    .line 6
    const/16 v0, 0x50

    .line 7
    .line 8
    iput v0, p2, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 9
    .line 10
    if-eqz p1, :cond_2

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    if-eq p1, v0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    if-eq p1, v0, :cond_2

    .line 17
    .line 18
    const/4 v0, 0x3

    .line 19
    if-eq p1, v0, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iget p0, p0, Lcom/android/launcher3/taskbar/I1;->r:I

    .line 23
    .line 24
    iput p0, p2, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 25
    .line 26
    const p0, 0x800003

    .line 27
    .line 28
    .line 29
    iput p0, p2, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    iget p0, p0, Lcom/android/launcher3/taskbar/I1;->r:I

    .line 33
    .line 34
    iput p0, p2, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 35
    .line 36
    const p0, 0x800005

    .line 37
    .line 38
    .line 39
    iput p0, p2, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 40
    .line 41
    return-void

    .line 42
    :cond_2
    iget p0, p0, Lcom/android/launcher3/taskbar/I1;->r:I

    .line 43
    .line 44
    iput p0, p2, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 45
    .line 46
    return-void
.end method

.method private g0()Landroid/view/WindowManager$LayoutParams;
    .locals 6

    .line 1
    sget-boolean v0, Lf1/a;->g:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/I1;->l:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/16 v0, 0x7e3

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/16 v0, 0x7e8

    .line 13
    .line 14
    :goto_0
    const-string v1, "Taskbar"

    .line 15
    .line 16
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/taskbar/I1;->createDefaultWindowLayoutParams(ILjava/lang/String;)Landroid/view/WindowManager$LayoutParams;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    const/4 v3, 0x4

    .line 21
    new-array v3, v3, [Landroid/view/WindowManager$LayoutParams;

    .line 22
    .line 23
    iput-object v3, v2, Landroid/view/WindowManager$LayoutParams;->paramsForRotation:[Landroid/view/WindowManager$LayoutParams;

    .line 24
    .line 25
    const/4 v3, 0x0

    .line 26
    :goto_1
    const/4 v4, 0x3

    .line 27
    if-gt v3, v4, :cond_2

    .line 28
    .line 29
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/taskbar/I1;->createDefaultWindowLayoutParams(ILjava/lang/String;)Landroid/view/WindowManager$LayoutParams;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->a1()Z

    .line 34
    .line 35
    .line 36
    move-result v5

    .line 37
    if-eqz v5, :cond_1

    .line 38
    .line 39
    invoke-direct {p0, v3, v4}, Lcom/android/launcher3/taskbar/I1;->e2(ILandroid/view/WindowManager$LayoutParams;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    iget-object v5, v2, Landroid/view/WindowManager$LayoutParams;->paramsForRotation:[Landroid/view/WindowManager$LayoutParams;

    .line 43
    .line 44
    aput-object v4, v5, v3

    .line 45
    .line 46
    add-int/lit8 v3, v3, 0x1

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_2
    iget-object v0, v2, Landroid/view/WindowManager$LayoutParams;->paramsForRotation:[Landroid/view/WindowManager$LayoutParams;

    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/view/ContextThemeWrapper;->getDisplay()Landroid/view/Display;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0}, Landroid/view/Display;->getRotation()I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    aget-object p0, v0, p0

    .line 60
    .line 61
    iget v0, p0, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 62
    .line 63
    iput v0, v2, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 64
    .line 65
    iget v0, p0, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 66
    .line 67
    iput v0, v2, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 68
    .line 69
    iget p0, p0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 70
    .line 71
    iput p0, v2, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 72
    .line 73
    return-object v2
.end method

.method private h0(Lj1/i$a;I)Landroid/window/RemoteTransition;
    .locals 3

    .line 1
    new-instance v0, Landroid/window/RemoteTransition;

    .line 2
    .line 3
    new-instance v1, Lj1/i;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/ContextThemeWrapper;->getMainExecutor()Ljava/util/concurrent/Executor;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-direct {v1, p0, p1, p2, v2}, Lj1/i;-><init>(Landroid/content/Context;Lj1/i$a;ILjava/util/concurrent/Executor;)V

    .line 10
    .line 11
    .line 12
    const-string p0, "TaskbarDesktopAppLaunch"

    .line 13
    .line 14
    invoke-direct {v0, v1, p0}, Landroid/window/RemoteTransition;-><init>(Landroid/window/IRemoteTransition;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method

.method public static synthetic k(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/taskbar/bubbles/A0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/I1;->G1(Lcom/android/launcher3/taskbar/bubbles/A0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l(Lcom/android/launcher3/taskbar/I1;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/I1;->y1()Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private synthetic l1(Lcom/android/launcher3/h0;Lcom/android/launcher3/h0;)V
    .locals 1

    .line 1
    iget v0, p1, Lcom/android/launcher3/h0;->a2:I

    .line 2
    .line 3
    iput v0, p2, Lcom/android/launcher3/h0;->a2:I

    .line 4
    .line 5
    iget p1, p1, Lcom/android/launcher3/h0;->o2:I

    .line 6
    .line 7
    iput p1, p2, Lcom/android/launcher3/h0;->o2:I

    .line 8
    .line 9
    iget p1, p2, Lcom/android/launcher3/h0;->u3:I

    .line 10
    .line 11
    iput p1, p2, Lcom/android/launcher3/h0;->B1:I

    .line 12
    .line 13
    const/high16 p1, 0x3f800000    # 1.0f

    .line 14
    .line 15
    invoke-virtual {p2, p1, p0}, Lcom/android/launcher3/h0;->p1(FLandroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private synthetic m1(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 4
    .line 5
    invoke-virtual {p0, p2}, Lcom/android/launcher3/taskbar/W4;->p0(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    invoke-virtual {p2, p0}, Landroid/view/View;->setHapticFeedbackEnabled(Z)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public static synthetic n(Lcom/android/launcher3/taskbar/bubbles/m0;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/m0;->b:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->n0()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method private n0(Lcom/android/launcher3/folder/FolderIcon;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/folder/FolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Lcom/android/launcher3/taskbar/I1$c;

    .line 6
    .line 7
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/taskbar/I1$c;-><init>(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/folder/Folder;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v0}, Lcom/android/launcher3/folder/Folder;->setPriorityOnFolderStateChangedListener(Lcom/android/launcher3/folder/Folder$m;)V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/I1;->l2(Z)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->w0()Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Lcom/android/launcher3/taskbar/j1;

    .line 22
    .line 23
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/taskbar/j1;-><init>(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/folder/Folder;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->post(Ljava/lang/Runnable;)Z

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private synthetic n1(Lcom/android/launcher3/folder/Folder;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->animateOpen()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p1, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 13
    .line 14
    invoke-interface {v0, v1}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget-object v1, Lcom/android/launcher3/logging/StatsLogManager$e;->W:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 19
    .line 20
    invoke-interface {v0, v1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 21
    .line 22
    .line 23
    new-instance v0, Lcom/android/launcher3/taskbar/t1;

    .line 24
    .line 25
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/t1;-><init>(Lcom/android/launcher3/taskbar/I1;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, v0}, Lcom/android/launcher3/folder/Folder;->e(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    const/16 p1, 0x20

    .line 32
    .line 33
    invoke-static {p0, p1}, Lcom/android/launcher3/a;->hasOpenView(Lcom/android/launcher3/views/k;I)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    invoke-static {p0, p1}, Lcom/android/launcher3/a;->getOpenView(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const/4 p1, 0x0

    .line 44
    invoke-virtual {p0, p1}, Lcom/android/launcher3/a;->close(Z)V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public static synthetic o(Lcom/android/launcher3/taskbar/I1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/I1;->I1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic o1(Landroid/window/RemoteTransition;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/android/quickstep/SystemUiProxy;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/ContextThemeWrapper;->getDisplay()Landroid/view/Display;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Landroid/view/Display;->getDisplayId()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    invoke-virtual {v0, p0, p1}, Lcom/android/quickstep/SystemUiProxy;->showDesktopApps(ILandroid/window/RemoteTransition;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic p(Lcom/android/quickstep/views/RecentsView;Landroid/view/View;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/taskbar/w1;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/taskbar/w1;-><init>(Lcom/android/quickstep/views/RecentsView;Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, p1, v1, v0}, Lcom/android/quickstep/views/RecentsView;->finishRecentsAnimation(ZZLjava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private p0()Lcom/android/launcher3/util/b;
    .locals 2

    .line 1
    sget-object v0, Lj1/i$a;->i:Lj1/i$a;

    .line 2
    .line 3
    const/16 v1, 0x7c

    .line 4
    .line 5
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/taskbar/I1;->h0(Lj1/i$a;I)Landroid/window/RemoteTransition;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Landroid/app/ActivityOptions;->makeRemoteTransition(Landroid/window/RemoteTransition;)Landroid/app/ActivityOptions;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance v0, Lcom/android/launcher3/util/b;

    .line 14
    .line 15
    new-instance v1, Lcom/android/launcher3/util/Y1;

    .line 16
    .line 17
    invoke-direct {v1}, Lcom/android/launcher3/util/Y1;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-direct {v0, p0, v1}, Lcom/android/launcher3/util/b;-><init>(Landroid/app/ActivityOptions;Lcom/android/launcher3/util/Y1;)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method private synthetic p1(Ljava/lang/Runnable;Lcom/android/quickstep/util/SingleTask;ZLandroid/window/RemoteTransition;LO2/f;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 4
    .line 5
    .line 6
    :cond_0
    sget-object p1, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 7
    .line 8
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/android/quickstep/SystemUiProxy;

    .line 13
    .line 14
    invoke-virtual {p2}, Lcom/android/quickstep/util/SingleTask;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object p1, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 19
    .line 20
    iget p1, p1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 21
    .line 22
    if-eqz p3, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    const/4 p4, 0x0

    .line 26
    :goto_0
    invoke-virtual {p0, p1, p4, p5}, Lcom/android/quickstep/SystemUiProxy;->showDesktopApp(ILandroid/window/RemoteTransition;LO2/f;)V

    .line 27
    .line 28
    .line 29
    if-eqz p6, :cond_2

    .line 30
    .line 31
    invoke-interface {p6}, Ljava/lang/Runnable;->run()V

    .line 32
    .line 33
    .line 34
    :cond_2
    return-void
.end method

.method public static synthetic q(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/model/data/D;Landroid/window/RemoteTransition;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/I1;->C1(Lcom/android/launcher3/model/data/D;Landroid/window/RemoteTransition;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic q1(Landroid/window/RemoteTransition;Lcom/android/quickstep/util/SingleTask;)V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/I1;->makeDefaultActivityOptions(I)Lcom/android/launcher3/util/b;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    iget-object p0, p0, Lcom/android/launcher3/util/b;->a:Landroid/app/ActivityOptions;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroid/app/ActivityOptions;->setRemoteTransition(Landroid/window/RemoteTransition;)Landroid/app/ActivityOptions;

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->getInstance()Lcom/android/systemui/shared/system/ActivityManagerWrapper;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p2}, Lcom/android/quickstep/util/SingleTask;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    iget-object p2, p2, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 20
    .line 21
    invoke-virtual {p1, p2, p0}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->startActivityFromRecents(Lcom/android/systemui/shared/recents/model/Task$TaskKey;Landroid/app/ActivityOptions;)Z

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic r(Lcom/android/launcher3/taskbar/I1;Landroid/window/RemoteTransition;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/I1;->o1(Landroid/window/RemoteTransition;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic r1(Lcom/android/launcher3/taskbar/F3$b;Landroid/window/RemoteTransition;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/quickstep/SystemUiProxy;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/F3$b;->b()Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    sget-object v0, LO2/f;->i:LO2/f;

    .line 18
    .line 19
    invoke-virtual {p0, p1, p2, v0}, Lcom/android/quickstep/SystemUiProxy;->showDesktopApp(ILandroid/window/RemoteTransition;LO2/f;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic s(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/model/data/D;Landroid/window/RemoteTransition;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/I1;->D1(Lcom/android/launcher3/model/data/D;Landroid/window/RemoteTransition;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic s1(Ljava/util/List;Lcom/android/systemui/shared/recents/model/Task;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    check-cast p1, Lcom/android/launcher3/model/data/y;

    .line 7
    .line 8
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/I1;->u2(Lcom/android/launcher3/model/data/y;Lcom/android/systemui/shared/recents/model/Task;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic t(Lcom/android/launcher3/taskbar/I1;)Landroid/graphics/Point;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/I1;->x1()Landroid/graphics/Point;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private synthetic t1(Ljava/util/List;Lcom/android/systemui/shared/recents/model/Task;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/taskbar/x1;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2}, Lcom/android/launcher3/taskbar/x1;-><init>(Lcom/android/launcher3/taskbar/I1;Ljava/util/List;Lcom/android/systemui/shared/recents/model/Task;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic u(Lcom/android/launcher3/taskbar/I1;Lcom/android/quickstep/util/SingleTask;Landroid/window/RemoteTransition;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/I1;->A1(Lcom/android/quickstep/util/SingleTask;Landroid/window/RemoteTransition;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic u1(Lcom/android/quickstep/views/RecentsView;ZLandroid/view/View;Ljava/util/List;[Lcom/android/systemui/shared/recents/model/Task;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object p5, p5, v0

    .line 3
    .line 4
    if-eqz p5, :cond_0

    .line 5
    .line 6
    iget-object v1, p5, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 7
    .line 8
    iget v1, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 9
    .line 10
    invoke-virtual {p1, v1}, Lcom/android/quickstep/views/RecentsView;->getTaskViewByTaskId(I)Lcom/android/quickstep/views/TaskView;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->isVisibleToUser()Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    instance-of v2, v1, Lcom/android/quickstep/views/DesktopTaskView;

    .line 23
    .line 24
    if-nez v2, :cond_0

    .line 25
    .line 26
    const-string p0, "Main"

    .line 27
    .line 28
    const-string p1, "start: taskbarAppIcon"

    .line 29
    .line 30
    invoke-static {p0, p1}, Lcom/android/launcher3/testing/K;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskView;->launchWithAnimation()Lcom/android/launcher3/util/Y1;

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    if-eqz p2, :cond_1

    .line 38
    .line 39
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/o4;->M()V

    .line 44
    .line 45
    .line 46
    new-instance p0, Lcom/android/launcher3/taskbar/u1;

    .line 47
    .line 48
    invoke-direct {p0, p1, p3}, Lcom/android/launcher3/taskbar/u1;-><init>(Lcom/android/quickstep/views/RecentsView;Landroid/view/View;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1, p0}, Lcom/android/quickstep/views/RecentsView;->switchToScreenshot(Ljava/lang/Runnable;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->V0()Z

    .line 56
    .line 57
    .line 58
    move-result p2

    .line 59
    if-eqz p2, :cond_3

    .line 60
    .line 61
    iget-object p2, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 62
    .line 63
    iget-object p2, p2, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 64
    .line 65
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/o4;->v()Z

    .line 66
    .line 67
    .line 68
    move-result p2

    .line 69
    if-eqz p2, :cond_3

    .line 70
    .line 71
    invoke-virtual {p1}, Lcom/android/quickstep/views/RecentsView;->launchRunningDesktopTaskView()Lcom/android/launcher3/util/Y1;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    if-eqz p1, :cond_2

    .line 76
    .line 77
    new-instance p2, Lcom/android/launcher3/taskbar/v1;

    .line 78
    .line 79
    invoke-direct {p2, p0, p4, p5}, Lcom/android/launcher3/taskbar/v1;-><init>(Lcom/android/launcher3/taskbar/I1;Ljava/util/List;Lcom/android/systemui/shared/recents/model/Task;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p1, p2}, Lcom/android/launcher3/util/Y1;->a(Ljava/lang/Runnable;)V

    .line 83
    .line 84
    .line 85
    :cond_2
    return-void

    .line 86
    :cond_3
    invoke-interface {p4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    check-cast p1, Lcom/android/launcher3/model/data/y;

    .line 91
    .line 92
    invoke-direct {p0, p1, p5}, Lcom/android/launcher3/taskbar/I1;->u2(Lcom/android/launcher3/model/data/y;Lcom/android/systemui/shared/recents/model/Task;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method private u2(Lcom/android/launcher3/model/data/y;Lcom/android/systemui/shared/recents/model/Task;)V
    .locals 7

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 8
    .line 9
    .line 10
    const/high16 v1, 0x10000000

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v1, 0x0

    .line 17
    :try_start_0
    const-string v2, "Main"

    .line 18
    .line 19
    const-string v3, "start: taskbarAppIcon"

    .line 20
    .line 21
    invoke-static {v2, v3}, Lcom/android/launcher3/testing/K;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v2, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 25
    .line 26
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-virtual {v2, v3}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    const/4 v3, 0x0

    .line 35
    if-nez v2, :cond_0

    .line 36
    .line 37
    const-class p2, Landroid/content/pm/LauncherApps;

    .line 38
    .line 39
    invoke-virtual {p0, p2}, Landroid/view/ContextThemeWrapper;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    check-cast p2, Landroid/content/pm/LauncherApps;

    .line 44
    .line 45
    invoke-virtual {v0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    iget-object v4, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 50
    .line 51
    invoke-virtual {v0}, Landroid/content/Intent;->getSourceBounds()Landroid/graphics/Rect;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    invoke-virtual {p2, v2, v4, v5, v3}, Landroid/content/pm/LauncherApps;->startMainActivity(Landroid/content/ComponentName;Landroid/os/UserHandle;Landroid/graphics/Rect;Landroid/os/Bundle;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :catch_0
    move-exception p2

    .line 60
    goto :goto_1

    .line 61
    :cond_0
    invoke-virtual {p0}, Landroid/view/ContextThemeWrapper;->getDisplay()Landroid/view/Display;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    if-nez v2, :cond_1

    .line 66
    .line 67
    move v2, v1

    .line 68
    goto :goto_0

    .line 69
    :cond_1
    invoke-virtual {p0}, Landroid/view/ContextThemeWrapper;->getDisplay()Landroid/view/Display;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-virtual {v2}, Landroid/view/Display;->getDisplayId()I

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    :goto_0
    if-eqz p2, :cond_2

    .line 78
    .line 79
    invoke-virtual {p0, v3, p1}, Lcom/android/launcher3/taskbar/I1;->getActivityLaunchOptions(Landroid/view/View;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/b;

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    iget-object v5, v4, Lcom/android/launcher3/util/b;->a:Landroid/app/ActivityOptions;

    .line 84
    .line 85
    invoke-virtual {v5, v2}, Landroid/app/ActivityOptions;->setLaunchDisplayId(I)Landroid/app/ActivityOptions;

    .line 86
    .line 87
    .line 88
    invoke-static {}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->getInstance()Lcom/android/systemui/shared/system/ActivityManagerWrapper;

    .line 89
    .line 90
    .line 91
    move-result-object v5

    .line 92
    iget-object p2, p2, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 93
    .line 94
    iget-object v6, v4, Lcom/android/launcher3/util/b;->a:Landroid/app/ActivityOptions;

    .line 95
    .line 96
    invoke-virtual {v5, p2, v6}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->startActivityFromRecents(Lcom/android/systemui/shared/recents/model/Task$TaskKey;Landroid/app/ActivityOptions;)Z

    .line 97
    .line 98
    .line 99
    move-result p2

    .line 100
    if-eqz p2, :cond_2

    .line 101
    .line 102
    iget-object p2, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 103
    .line 104
    iget-object p2, p2, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 105
    .line 106
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/o4;->k()Lcom/android/quickstep/views/RecentsView;

    .line 107
    .line 108
    .line 109
    move-result-object p2

    .line 110
    iget-object v2, v4, Lcom/android/launcher3/util/b;->b:Lcom/android/launcher3/util/Y1;

    .line 111
    .line 112
    invoke-virtual {p2, v2}, Lcom/android/quickstep/views/RecentsView;->addSideTaskLaunchCallback(Lcom/android/launcher3/util/Y1;)V

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->V0()Z

    .line 117
    .line 118
    .line 119
    move-result p2

    .line 120
    if-eqz p2, :cond_3

    .line 121
    .line 122
    sget-object p2, Landroid/window/DesktopModeFlags;->ENABLE_DESKTOP_APP_LAUNCH_TRANSITIONS_BUGFIX:Landroid/window/DesktopModeFlags;

    .line 123
    .line 124
    invoke-virtual {p2}, Landroid/window/DesktopModeFlags;->isTrue()Z

    .line 125
    .line 126
    .line 127
    move-result p2

    .line 128
    if-eqz p2, :cond_3

    .line 129
    .line 130
    invoke-direct {p0, v0, p1, v2}, Lcom/android/launcher3/taskbar/I1;->J1(Landroid/content/Intent;Lcom/android/launcher3/model/data/y;I)V

    .line 131
    .line 132
    .line 133
    return-void

    .line 134
    :cond_3
    invoke-virtual {p0, v0, v3}, Landroid/view/ContextThemeWrapper;->startActivity(Landroid/content/Intent;Landroid/os/Bundle;)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 135
    .line 136
    .line 137
    return-void

    .line 138
    :goto_1
    const v2, 0x7f140047

    .line 139
    .line 140
    .line 141
    invoke-static {p0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 146
    .line 147
    .line 148
    new-instance p0, Ljava/lang/StringBuilder;

    .line 149
    .line 150
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 151
    .line 152
    .line 153
    const-string v1, "Unable to launch. tag="

    .line 154
    .line 155
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    const-string p1, " intent="

    .line 162
    .line 163
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    const-string p1, "TaskbarActivityContext"

    .line 174
    .line 175
    invoke-static {p1, p0, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 176
    .line 177
    .line 178
    return-void
.end method

.method public static synthetic v(Landroid/view/View;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private synthetic v1()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/ContextThemeWrapper;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/pm/PackageManager;->isSafeMode()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic w(Lcom/android/launcher3/taskbar/I1;Lcom/android/quickstep/util/SingleTask;Landroid/window/RemoteTransition;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/I1;->B1(Lcom/android/quickstep/util/SingleTask;Landroid/window/RemoteTransition;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic w1()Landroid/graphics/Point;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/util/Z;->r:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/launcher3/util/Z;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/util/Z;->w()Lcom/android/launcher3/util/Z$c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget-object p0, p0, Lcom/android/launcher3/util/Z$c;->c:Landroid/graphics/Point;

    .line 14
    .line 15
    return-object p0
.end method

.method public static synthetic x(Lcom/android/launcher3/taskbar/bubbles/m0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/m0;->b:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->y0()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method private synthetic x1()Landroid/graphics/Point;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/util/Z;->r:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/launcher3/util/Z;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/util/Z;->w()Lcom/android/launcher3/util/Z$c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget-object p0, p0, Lcom/android/launcher3/util/Z$c;->c:Landroid/graphics/Point;

    .line 14
    .line 15
    return-object p0
.end method

.method private synthetic y1()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/ContextThemeWrapper;->getDisplay()Landroid/view/Display;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/view/Display;->getRotation()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic z(Lcom/android/launcher3/taskbar/I1;Ljava/util/List;Lcom/android/systemui/shared/recents/model/Task;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/I1;->t1(Ljava/util/List;Lcom/android/systemui/shared/recents/model/Task;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic z1()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/a4;->N0(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public A0()Lcom/android/launcher3/h0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->F:Lcom/android/launcher3/h0;

    .line 2
    .line 3
    return-object p0
.end method

.method public A2()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/a4;->N0(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public B0()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const v0, 0x7f070bb8

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public B2(Lcom/android/launcher3/h0;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/I1;->b0(Lcom/android/launcher3/h0;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->v:La2/e;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, La2/e;->u(Lcom/android/launcher3/h0;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 14
    .line 15
    new-instance v1, Lcom/android/launcher3/taskbar/Y0;

    .line 16
    .line 17
    invoke-direct {v1, p1}, Lcom/android/launcher3/taskbar/Y0;-><init>(Lcom/android/launcher3/h0;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 21
    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    const v0, 0x70d66274

    .line 25
    .line 26
    .line 27
    invoke-static {p0, p1, v0}, Lcom/android/launcher3/a;->closeAllOpenViewsExcept(Lcom/android/launcher3/views/k;ZI)V

    .line 28
    .line 29
    .line 30
    iget-boolean p1, p0, Lcom/android/launcher3/taskbar/I1;->p:Z

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/I1;->l2(Z)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->dispatchDeviceProfileChanged()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public C0()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->k:Lcom/android/launcher3/taskbar/U0;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/U0;->n()Lcom/android/launcher3/anim/d;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget p0, p0, Lcom/android/launcher3/anim/d;->d:F

    .line 10
    .line 11
    return p0
.end method

.method public C2(JZ)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2, p3}, Lcom/android/launcher3/taskbar/M0;->g1(JZ)V

    .line 6
    .line 7
    .line 8
    const-wide/32 v0, 0x40000000

    .line 9
    .line 10
    .line 11
    and-long/2addr v0, p1

    .line 12
    const-wide/16 v2, 0x0

    .line 13
    .line 14
    cmp-long v0, v0, v2

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    const/4 v4, 0x1

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    move v0, v4

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    move v0, v1

    .line 23
    :goto_0
    if-nez p3, :cond_2

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 26
    .line 27
    .line 28
    move-result v5

    .line 29
    if-eqz v5, :cond_1

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_1
    move v5, v1

    .line 33
    goto :goto_2

    .line 34
    :cond_2
    :goto_1
    move v5, v4

    .line 35
    :goto_2
    invoke-direct {p0, v0, v5}, Lcom/android/launcher3/taskbar/I1;->V1(ZZ)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 39
    .line 40
    iget-object v5, v0, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 43
    .line 44
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/M0;->t0()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_4

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->Z0()Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_3

    .line 55
    .line 56
    goto :goto_3

    .line 57
    :cond_3
    move v0, v1

    .line 58
    goto :goto_4

    .line 59
    :cond_4
    :goto_3
    move v0, v4

    .line 60
    :goto_4
    invoke-virtual {v5, v0}, Lcom/android/launcher3/taskbar/W4;->s0(Z)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 64
    .line 65
    iget-object v5, v0, Lcom/android/launcher3/taskbar/R1;->k:Lcom/android/launcher3/taskbar/U0;

    .line 66
    .line 67
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 68
    .line 69
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/M0;->q0()Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    invoke-virtual {v5, v0}, Lcom/android/launcher3/taskbar/U0;->v(Z)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 77
    .line 78
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->k:Lcom/android/launcher3/taskbar/U0;

    .line 79
    .line 80
    invoke-virtual {v0, p1, p2}, Lcom/android/launcher3/taskbar/U0;->C(J)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 84
    .line 85
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->j:Lcom/android/launcher3/taskbar/O2;

    .line 86
    .line 87
    invoke-virtual {v0, p1, p2}, Lcom/android/launcher3/taskbar/O2;->d(J)V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 91
    .line 92
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 93
    .line 94
    if-nez p3, :cond_6

    .line 95
    .line 96
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->k1()Z

    .line 97
    .line 98
    .line 99
    move-result v5

    .line 100
    if-nez v5, :cond_5

    .line 101
    .line 102
    goto :goto_5

    .line 103
    :cond_5
    move v5, v1

    .line 104
    goto :goto_6

    .line 105
    :cond_6
    :goto_5
    move v5, v4

    .line 106
    :goto_6
    invoke-virtual {v0, p1, p2, v5}, Lcom/android/launcher3/taskbar/a4;->S0(JZ)V

    .line 107
    .line 108
    .line 109
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 110
    .line 111
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->g:Lcom/android/launcher3/taskbar/I3;

    .line 112
    .line 113
    invoke-virtual {v0, p1, p2, p3}, Lcom/android/launcher3/taskbar/I3;->m(JZ)V

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 117
    .line 118
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->c:Lcom/android/launcher3/taskbar/l3;

    .line 119
    .line 120
    invoke-virtual {v0, p1, p2}, Lcom/android/launcher3/taskbar/l3;->x(J)V

    .line 121
    .line 122
    .line 123
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 124
    .line 125
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->o:Lcom/android/launcher3/taskbar/H2;

    .line 126
    .line 127
    invoke-virtual {v0, p1, p2}, Lcom/android/launcher3/taskbar/H2;->n(J)V

    .line 128
    .line 129
    .line 130
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 131
    .line 132
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->r:Lcom/android/launcher3/taskbar/c5;

    .line 133
    .line 134
    const-wide/32 v5, 0x2000000

    .line 135
    .line 136
    .line 137
    and-long/2addr v5, p1

    .line 138
    cmp-long v2, v5, v2

    .line 139
    .line 140
    if-eqz v2, :cond_7

    .line 141
    .line 142
    move v1, v4

    .line 143
    :cond_7
    invoke-virtual {v0, v1, p3}, Lcom/android/launcher3/taskbar/c5;->r(ZZ)V

    .line 144
    .line 145
    .line 146
    iget-object p3, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 147
    .line 148
    iget-object p3, p3, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 149
    .line 150
    invoke-virtual {p3, p1, p2}, Lcom/android/launcher3/taskbar/o4;->T(J)V

    .line 151
    .line 152
    .line 153
    iget-object p3, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 154
    .line 155
    iget-object p3, p3, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 156
    .line 157
    new-instance v0, Lcom/android/launcher3/taskbar/Z0;

    .line 158
    .line 159
    invoke-direct {v0, p0, p1, p2}, Lcom/android/launcher3/taskbar/Z0;-><init>(Lcom/android/launcher3/taskbar/I1;J)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {p3, v0}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 163
    .line 164
    .line 165
    return-void
.end method

.method public D0()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->p:Lcom/android/launcher3/taskbar/allapps/c;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/allapps/c;->e()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public E0()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->p:Lcom/android/launcher3/taskbar/allapps/c;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/allapps/c;->f()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public F0()LY1/h;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->I:LY1/h;

    .line 2
    .line 3
    return-object p0
.end method

.method public G0()LY1/l;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->J:LY1/l;

    .line 2
    .line 3
    return-object p0
.end method

.method public H0()Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->C:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method

.method public I0()Lcom/android/launcher3/h0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->E:Lcom/android/launcher3/h0;

    .line 2
    .line 3
    return-object p0
.end method

.method public J0()Lcom/android/launcher3/taskbar/j4$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->t:Lcom/android/launcher3/taskbar/j4;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/j4;->p()Lcom/android/launcher3/taskbar/j4$b;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public K0(Lcom/android/quickstep/util/GroupTask;Landroid/window/RemoteTransition;ZLO2/f;)V
    .locals 7

    .line 1
    const/4 v5, 0x0

    .line 2
    const/4 v6, 0x0

    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move-object v2, p2

    .line 6
    move v3, p3

    .line 7
    move-object v4, p4

    .line 8
    invoke-virtual/range {v0 .. v6}, Lcom/android/launcher3/taskbar/I1;->L0(Lcom/android/quickstep/util/GroupTask;Landroid/window/RemoteTransition;ZLO2/f;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public L0(Lcom/android/quickstep/util/GroupTask;Landroid/window/RemoteTransition;ZLO2/f;Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .locals 8

    .line 1
    instance-of v0, p1, Lcom/android/quickstep/util/DesktopTask;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object p1, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 6
    .line 7
    new-instance p3, Lcom/android/launcher3/taskbar/n1;

    .line 8
    .line 9
    invoke-direct {p3, p0, p2}, Lcom/android/launcher3/taskbar/n1;-><init>(Lcom/android/launcher3/taskbar/I1;Landroid/window/RemoteTransition;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, p3}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    if-eqz p3, :cond_1

    .line 17
    .line 18
    instance-of p3, p1, Lcom/android/quickstep/util/SingleTask;

    .line 19
    .line 20
    if-eqz p3, :cond_1

    .line 21
    .line 22
    move-object v3, p1

    .line 23
    check-cast v3, Lcom/android/quickstep/util/SingleTask;

    .line 24
    .line 25
    invoke-virtual {v3}, Lcom/android/quickstep/util/SingleTask;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iget-object p1, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 30
    .line 31
    iget p1, p1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/I1;->e0(I)Z

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    sget-object p1, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 38
    .line 39
    new-instance v0, Lcom/android/launcher3/taskbar/o1;

    .line 40
    .line 41
    move-object v1, p0

    .line 42
    move-object v5, p2

    .line 43
    move-object v6, p4

    .line 44
    move-object v2, p5

    .line 45
    move-object v7, p6

    .line 46
    invoke-direct/range {v0 .. v7}, Lcom/android/launcher3/taskbar/o1;-><init>(Lcom/android/launcher3/taskbar/I1;Ljava/lang/Runnable;Lcom/android/quickstep/util/SingleTask;ZLandroid/window/RemoteTransition;LO2/f;Ljava/lang/Runnable;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    move-object v1, p0

    .line 54
    move-object v5, p2

    .line 55
    instance-of p0, p1, Lcom/android/quickstep/util/SingleTask;

    .line 56
    .line 57
    if-eqz p0, :cond_2

    .line 58
    .line 59
    check-cast p1, Lcom/android/quickstep/util/SingleTask;

    .line 60
    .line 61
    sget-object p0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 62
    .line 63
    new-instance p2, Lcom/android/launcher3/taskbar/p1;

    .line 64
    .line 65
    invoke-direct {p2, v1, v5, p1}, Lcom/android/launcher3/taskbar/p1;-><init>(Lcom/android/launcher3/taskbar/I1;Landroid/window/RemoteTransition;Lcom/android/quickstep/util/SingleTask;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0, p2}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_2
    iget-object p0, v1, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 73
    .line 74
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 75
    .line 76
    check-cast p1, Lcom/android/quickstep/util/SplitTask;

    .line 77
    .line 78
    invoke-virtual {p0, p1, v5}, Lcom/android/launcher3/taskbar/o4;->B(Lcom/android/quickstep/util/SplitTask;Landroid/window/RemoteTransition;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public M0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/I1;->u:Z

    .line 2
    .line 3
    return p0
.end method

.method public N0(Lcom/android/launcher3/taskbar/J3;I)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "config_imeDrawsImeNavBar"

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-static {v1, v0, v2}, Lc2/a;->a(Ljava/lang/String;Landroid/content/res/Resources;Z)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/I1;->u:Z

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->u0()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iput v0, p0, Lcom/android/launcher3/taskbar/I1;->r:I

    .line 19
    .line 20
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/I1;->g0()Landroid/view/WindowManager$LayoutParams;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Lcom/android/launcher3/taskbar/I1;->n:Landroid/view/WindowManager$LayoutParams;

    .line 25
    .line 26
    new-instance v0, Landroid/view/WindowManager$LayoutParams;

    .line 27
    .line 28
    invoke-direct {v0}, Landroid/view/WindowManager$LayoutParams;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/android/launcher3/taskbar/I1;->o:Landroid/view/WindowManager$LayoutParams;

    .line 32
    .line 33
    if-lez p2, :cond_0

    .line 34
    .line 35
    invoke-virtual {p0, p2}, Lcom/android/launcher3/taskbar/I1;->W1(I)Landroid/animation/AnimatorSet;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const/4 p2, 0x0

    .line 41
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 42
    .line 43
    invoke-virtual {v0, p1, p2}, Lcom/android/launcher3/taskbar/R1;->j(Lcom/android/launcher3/taskbar/J3;Landroid/animation/AnimatorSet;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->e:Lcom/android/systemui/shared/rotation/RotationButtonController;

    .line 49
    .line 50
    iget-object v1, p0, Lcom/android/launcher3/taskbar/I1;->t:Lcom/android/launcher3/util/C1;

    .line 51
    .line 52
    iget v1, v1, Lcom/android/launcher3/util/C1;->h:I

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Lcom/android/systemui/shared/rotation/RotationButtonController;->onNavigationModeChanged(I)V

    .line 55
    .line 56
    .line 57
    iget-wide v0, p1, Lcom/android/launcher3/taskbar/J3;->b:J

    .line 58
    .line 59
    const/4 v3, 0x1

    .line 60
    invoke-virtual {p0, v0, v1, v3}, Lcom/android/launcher3/taskbar/I1;->C2(JZ)V

    .line 61
    .line 62
    .line 63
    iget v0, p1, Lcom/android/launcher3/taskbar/J3;->c:I

    .line 64
    .line 65
    iget v1, p1, Lcom/android/launcher3/taskbar/J3;->d:I

    .line 66
    .line 67
    iget v4, p1, Lcom/android/launcher3/taskbar/J3;->e:I

    .line 68
    .line 69
    invoke-virtual {p0, v0, v1, v4, v2}, Lcom/android/launcher3/taskbar/I1;->j0(IIIZ)V

    .line 70
    .line 71
    .line 72
    iget v0, p1, Lcom/android/launcher3/taskbar/J3;->f:I

    .line 73
    .line 74
    iget v1, p1, Lcom/android/launcher3/taskbar/J3;->g:I

    .line 75
    .line 76
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/taskbar/I1;->Z1(II)V

    .line 77
    .line 78
    .line 79
    iget v0, p1, Lcom/android/launcher3/taskbar/J3;->h:F

    .line 80
    .line 81
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/I1;->T1(F)V

    .line 82
    .line 83
    .line 84
    iget v0, p1, Lcom/android/launcher3/taskbar/J3;->j:I

    .line 85
    .line 86
    iget-boolean v1, p1, Lcom/android/launcher3/taskbar/J3;->k:Z

    .line 87
    .line 88
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/taskbar/I1;->U1(IZ)V

    .line 89
    .line 90
    .line 91
    iget-boolean v0, p1, Lcom/android/launcher3/taskbar/J3;->m:Z

    .line 92
    .line 93
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/I1;->o2(Z)V

    .line 94
    .line 95
    .line 96
    iget p1, p1, Lcom/android/launcher3/taskbar/J3;->i:I

    .line 97
    .line 98
    invoke-virtual {p0, p1, v3}, Lcom/android/launcher3/taskbar/I1;->c2(IZ)V

    .line 99
    .line 100
    .line 101
    sget-boolean p1, Lf1/a;->g:Z

    .line 102
    .line 103
    if-eqz p1, :cond_1

    .line 104
    .line 105
    iput-boolean v2, p0, Lcom/android/launcher3/taskbar/I1;->z:Z

    .line 106
    .line 107
    :cond_1
    invoke-static {}, Lf1/a;->d()Z

    .line 108
    .line 109
    .line 110
    move-result p1

    .line 111
    if-nez p1, :cond_2

    .line 112
    .line 113
    iget-boolean p1, p0, Lcom/android/launcher3/taskbar/I1;->B:Z

    .line 114
    .line 115
    if-nez p1, :cond_2

    .line 116
    .line 117
    iget-object p1, p0, Lcom/android/launcher3/taskbar/I1;->k:Landroid/view/WindowManager;

    .line 118
    .line 119
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->i:Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 120
    .line 121
    iget-object v1, p0, Lcom/android/launcher3/taskbar/I1;->n:Landroid/view/WindowManager$LayoutParams;

    .line 122
    .line 123
    invoke-interface {p1, v0, v1}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 124
    .line 125
    .line 126
    iput-boolean v3, p0, Lcom/android/launcher3/taskbar/I1;->B:Z

    .line 127
    .line 128
    goto :goto_1

    .line 129
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->O1()V

    .line 130
    .line 131
    .line 132
    :goto_1
    if-eqz p2, :cond_3

    .line 133
    .line 134
    invoke-virtual {p2}, Landroid/animation/AnimatorSet;->start()V

    .line 135
    .line 136
    .line 137
    :cond_3
    return-void
.end method

.method public N1()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/o4;->A()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method O1()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->i:Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->isAttachedToWindow()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->o:Landroid/view/WindowManager$LayoutParams;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/taskbar/I1;->n:Landroid/view/WindowManager$LayoutParams;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/view/WindowManager$LayoutParams;->copyFrom(Landroid/view/WindowManager$LayoutParams;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-static {}, Lf1/a;->d()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->k:Landroid/view/WindowManager;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/android/launcher3/taskbar/I1;->i:Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 29
    .line 30
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getRootView()Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->n:Landroid/view/WindowManager$LayoutParams;

    .line 35
    .line 36
    invoke-interface {v0, v1, p0}, Landroid/view/WindowManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->k:Landroid/view/WindowManager;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/android/launcher3/taskbar/I1;->i:Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->n:Landroid/view/WindowManager$LayoutParams;

    .line 45
    .line 46
    invoke-interface {v0, v1, p0}, Landroid/view/WindowManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 47
    .line 48
    .line 49
    :cond_2
    :goto_0
    return-void
.end method

.method public P0()Z
    .locals 1

    .line 1
    invoke-static {}, LH2/c;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, LH2/c;->b()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->m:Lcom/android/launcher3/h0;

    .line 14
    .line 15
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->H0:Z

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public P1(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/taskbar/R1;->n(I)V

    .line 4
    .line 5
    .line 6
    iget-boolean p1, p0, Lcom/android/launcher3/taskbar/I1;->w:Z

    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->B0()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/I1;->m2(I)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public Q0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/I1;->z:Z

    .line 2
    .line 3
    return p0
.end method

.method public Q1()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/util/s;->onViewDestroyed()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/I1;->z:Z

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->I:LY1/h;

    .line 8
    .line 9
    invoke-virtual {v0}, LY1/h;->h()V

    .line 10
    .line 11
    .line 12
    sget-object v0, Lcom/android/launcher3/taskbar/o4;->i:Lcom/android/launcher3/taskbar/o4;

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/I1;->n2(Lcom/android/launcher3/taskbar/o4;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/R1;->o()V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Lf1/a;->d()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    sget-boolean v0, Lf1/a;->g:Z

    .line 29
    .line 30
    if-nez v0, :cond_0

    .line 31
    .line 32
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->k:Landroid/view/WindowManager;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/android/launcher3/taskbar/I1;->i:Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 35
    .line 36
    invoke-interface {v0, v1}, Landroid/view/WindowManager;->removeViewImmediate(Landroid/view/View;)V

    .line 37
    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/I1;->B:Z

    .line 41
    .line 42
    :cond_0
    const/4 v0, 0x0

    .line 43
    iput-object v0, p0, Lcom/android/launcher3/taskbar/I1;->K:Landroid/view/View;

    .line 44
    .line 45
    iput-object v0, p0, Lcom/android/launcher3/taskbar/I1;->L:La2/a;

    .line 46
    .line 47
    return-void
.end method

.method public R0()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->t:Lcom/android/launcher3/util/C1;

    .line 2
    .line 3
    sget-object v0, Lcom/android/launcher3/util/C1;->l:Lcom/android/launcher3/util/C1;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public R1(I)Landroid/animation/AnimatorSet;
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/I1;->z:Z

    .line 3
    .line 4
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Lcom/android/launcher3/taskbar/W4;->m0(Landroid/animation/AnimatorSet;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->f:Lcom/android/launcher3/taskbar/s2;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/s2;->A(Landroid/animation/AnimatorSet;)V

    .line 21
    .line 22
    .line 23
    sget-object p0, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 26
    .line 27
    .line 28
    int-to-long p0, p1

    .line 29
    invoke-virtual {v0, p0, p1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 30
    .line 31
    .line 32
    return-object v0
.end method

.method S0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/o4;->u()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method S1()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->b:Lcom/android/launcher3/taskbar/j2;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/j2;->n0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const v1, 0x7feeffff

    .line 12
    .line 13
    .line 14
    invoke-static {p0, v1}, Lcom/android/launcher3/a;->hasOpenView(Lcom/android/launcher3/views/k;I)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-virtual {p0, v1}, Lcom/android/launcher3/taskbar/I1;->l2(Z)V

    .line 22
    .line 23
    .line 24
    :cond_0
    const/4 v1, 0x2

    .line 25
    invoke-virtual {p0, v1, v0}, Lcom/android/launcher3/taskbar/I1;->g2(IZ)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public T0()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->w0()Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getRootWindowInsets()Landroid/view/WindowInsets;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/4 v2, 0x0

    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    return v2

    .line 13
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v1, v0}, LJ/Y;->w(Landroid/view/WindowInsets;Landroid/view/View;)LJ/Y;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {}, LJ/Y$k;->c()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-virtual {v0, v1}, LJ/Y;->p(I)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    invoke-static {}, LJ/Y$k;->c()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    invoke-virtual {v0, v1}, LJ/Y;->f(I)LB/b;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget v0, v0, LB/b;->d:I

    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const v1, 0x7f070328

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-lt v0, p0, :cond_1

    .line 53
    .line 54
    const/4 p0, 0x1

    .line 55
    return p0

    .line 56
    :cond_1
    return v2
.end method

.method public T1(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/M0;->h0()Lcom/android/launcher3/anim/d;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public U0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/a4;->c0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public U1(IZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->k:Lcom/android/launcher3/taskbar/U0;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/U0;->t(IZ)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public V0()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->A:Lcom/android/launcher3/taskbar/S1;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/ContextThemeWrapper;->getDisplayId()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-virtual {v0, p0}, Lcom/android/launcher3/taskbar/S1;->c(I)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public W0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/a4;->d0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public W1(I)Landroid/animation/AnimatorSet;
    .locals 2

    .line 1
    new-instance p0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    int-to-long v0, p1

    .line 7
    invoke-virtual {p0, v0, v1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 8
    .line 9
    .line 10
    return-object p0
.end method

.method public X0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/a4;->e0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public X1(IZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->e:Lcom/android/systemui/shared/rotation/RotationButtonController;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/android/systemui/shared/rotation/RotationButtonController;->onRotationProposal(IZ)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Y0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/I1;->x:Z

    .line 2
    .line 3
    return p0
.end method

.method public Y1(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/o4;->H()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/a4;->g0()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iget-object v1, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    sget-boolean v3, Lcom/android/launcher3/taskbar/a4;->J:Z

    .line 22
    .line 23
    invoke-virtual {v1, v2, v3, p1}, Lcom/android/launcher3/taskbar/a4;->P0(ZZZ)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 27
    .line 28
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/a4;->g0()Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eq p1, v0, :cond_0

    .line 35
    .line 36
    sget-object p1, Lcom/android/launcher3/util/V2;->e:Lcom/android/launcher3/util/I;

    .line 37
    .line 38
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    check-cast p1, Lcom/android/launcher3/util/V2;

    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/android/launcher3/util/V2;->o()V

    .line 45
    .line 46
    .line 47
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->w:Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->l()V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public Z(Landroid/view/View;Landroid/view/WindowManager$LayoutParams;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->isAttachedToWindow()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->k:Landroid/view/WindowManager;

    .line 8
    .line 9
    invoke-interface {p0, p1, p2}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public Z0()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/I1;->y:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->i1()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public Z1(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->e:Lcom/android/systemui/shared/rotation/RotationButtonController;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/android/systemui/shared/rotation/RotationButtonController;->onBehaviorChanged(II)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public a0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->k:Lcom/android/launcher3/taskbar/U0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/U0;->u(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public a1()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->i1()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method protected a2(Landroid/view/View;)V
    .locals 14

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/o4;->k()Lcom/android/quickstep/views/RecentsView;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    iget-object v3, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 14
    .line 15
    iget-object v3, v3, Lcom/android/launcher3/taskbar/R1;->x:Lcom/android/launcher3/taskbar/s;

    .line 16
    .line 17
    const/4 v4, 0x0

    .line 18
    invoke-virtual {v3, v4}, Lcom/android/launcher3/taskbar/s;->u(Z)V

    .line 19
    .line 20
    .line 21
    instance-of v3, v2, Lcom/android/quickstep/util/SingleTask;

    .line 22
    .line 23
    const/4 v5, 0x0

    .line 24
    const/16 v6, 0x7c

    .line 25
    .line 26
    const/4 v7, 0x1

    .line 27
    if-eqz v3, :cond_3

    .line 28
    .line 29
    check-cast v2, Lcom/android/quickstep/util/SingleTask;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->V0()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    invoke-virtual {v2}, Lcom/android/quickstep/util/SingleTask;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget-object p1, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 42
    .line 43
    iget p1, p1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/I1;->e0(I)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_0

    .line 50
    .line 51
    sget-object p1, Lj1/i$a;->j:Lj1/i$a;

    .line 52
    .line 53
    invoke-direct {p0, p1, v6}, Lcom/android/launcher3/taskbar/I1;->h0(Lj1/i$a;I)Landroid/window/RemoteTransition;

    .line 54
    .line 55
    .line 56
    move-result-object v5

    .line 57
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->V0()Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-eqz p1, :cond_1

    .line 62
    .line 63
    iget-object p1, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 64
    .line 65
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 66
    .line 67
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/o4;->v()Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-eqz p1, :cond_1

    .line 72
    .line 73
    invoke-virtual {v1}, Lcom/android/quickstep/views/RecentsView;->launchRunningDesktopTaskView()Lcom/android/launcher3/util/Y1;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    if-eqz p1, :cond_2

    .line 78
    .line 79
    new-instance v0, Lcom/android/launcher3/taskbar/B1;

    .line 80
    .line 81
    invoke-direct {v0, p0, v2, v5}, Lcom/android/launcher3/taskbar/B1;-><init>(Lcom/android/launcher3/taskbar/I1;Lcom/android/quickstep/util/SingleTask;Landroid/window/RemoteTransition;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/Y1;->a(Ljava/lang/Runnable;)V

    .line 85
    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->V0()Z

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    sget-object v0, LO2/f;->i:LO2/f;

    .line 93
    .line 94
    invoke-virtual {p0, v2, v5, p1, v0}, Lcom/android/launcher3/taskbar/I1;->K0(Lcom/android/quickstep/util/GroupTask;Landroid/window/RemoteTransition;ZLO2/f;)V

    .line 95
    .line 96
    .line 97
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 98
    .line 99
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 100
    .line 101
    invoke-virtual {p1, v7}, Lcom/android/launcher3/taskbar/a4;->N0(Z)V

    .line 102
    .line 103
    .line 104
    goto/16 :goto_5

    .line 105
    .line 106
    :cond_3
    instance-of v3, v2, Lcom/android/launcher3/model/data/p;

    .line 107
    .line 108
    if-eqz v3, :cond_4

    .line 109
    .line 110
    check-cast p1, Lcom/android/launcher3/folder/FolderIcon;

    .line 111
    .line 112
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/I1;->n0(Lcom/android/launcher3/folder/FolderIcon;)V

    .line 113
    .line 114
    .line 115
    goto/16 :goto_6

    .line 116
    .line 117
    :cond_4
    instance-of v3, v2, Lcom/android/launcher3/model/data/l;

    .line 118
    .line 119
    if-eqz v3, :cond_6

    .line 120
    .line 121
    check-cast v2, Lcom/android/launcher3/model/data/l;

    .line 122
    .line 123
    if-eqz v1, :cond_5

    .line 124
    .line 125
    invoke-virtual {v1}, Lcom/android/quickstep/views/RecentsView;->isSplitSelectionActive()Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-eqz v0, :cond_5

    .line 130
    .line 131
    const-string p1, "Unable to split with an app pair. Select another app."

    .line 132
    .line 133
    invoke-static {p0, p1, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 138
    .line 139
    .line 140
    goto/16 :goto_5

    .line 141
    .line 142
    :cond_5
    invoke-virtual {v2}, Lcom/android/launcher3/model/data/l;->y()Ljava/util/ArrayList;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    invoke-direct {p0, v1, p1, v0}, Lcom/android/launcher3/taskbar/I1;->M1(Lcom/android/quickstep/views/RecentsView;Landroid/view/View;Ljava/util/List;)V

    .line 147
    .line 148
    .line 149
    iget-object p1, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 150
    .line 151
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 152
    .line 153
    invoke-virtual {p1, v2}, Lcom/android/launcher3/taskbar/o4;->I(Lcom/android/launcher3/model/data/y;)V

    .line 154
    .line 155
    .line 156
    iget-object p1, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 157
    .line 158
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 159
    .line 160
    invoke-virtual {p1, v7}, Lcom/android/launcher3/taskbar/a4;->N0(Z)V

    .line 161
    .line 162
    .line 163
    goto/16 :goto_5

    .line 164
    .line 165
    :cond_6
    instance-of v3, v2, Lcom/android/launcher3/model/data/D;

    .line 166
    .line 167
    if-eqz v3, :cond_a

    .line 168
    .line 169
    check-cast v2, Lcom/android/launcher3/model/data/D;

    .line 170
    .line 171
    invoke-virtual {v2}, Lcom/android/launcher3/model/data/D;->j0()I

    .line 172
    .line 173
    .line 174
    move-result p1

    .line 175
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/I1;->e0(I)Z

    .line 176
    .line 177
    .line 178
    move-result p1

    .line 179
    if-eqz p1, :cond_7

    .line 180
    .line 181
    sget-object p1, Lj1/i$a;->j:Lj1/i$a;

    .line 182
    .line 183
    invoke-direct {p0, p1, v6}, Lcom/android/launcher3/taskbar/I1;->h0(Lj1/i$a;I)Landroid/window/RemoteTransition;

    .line 184
    .line 185
    .line 186
    move-result-object v5

    .line 187
    :cond_7
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->V0()Z

    .line 188
    .line 189
    .line 190
    move-result p1

    .line 191
    if-eqz p1, :cond_8

    .line 192
    .line 193
    iget-object p1, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 194
    .line 195
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 196
    .line 197
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/o4;->v()Z

    .line 198
    .line 199
    .line 200
    move-result p1

    .line 201
    if-eqz p1, :cond_8

    .line 202
    .line 203
    invoke-virtual {v1}, Lcom/android/quickstep/views/RecentsView;->launchRunningDesktopTaskView()Lcom/android/launcher3/util/Y1;

    .line 204
    .line 205
    .line 206
    move-result-object p1

    .line 207
    if-eqz p1, :cond_9

    .line 208
    .line 209
    new-instance v0, Lcom/android/launcher3/taskbar/C1;

    .line 210
    .line 211
    invoke-direct {v0, p0, v2, v5}, Lcom/android/launcher3/taskbar/C1;-><init>(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/model/data/D;Landroid/window/RemoteTransition;)V

    .line 212
    .line 213
    .line 214
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/Y1;->a(Ljava/lang/Runnable;)V

    .line 215
    .line 216
    .line 217
    goto :goto_1

    .line 218
    :cond_8
    sget-object p1, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 219
    .line 220
    new-instance v0, Lcom/android/launcher3/taskbar/D1;

    .line 221
    .line 222
    invoke-direct {v0, p0, v2, v5}, Lcom/android/launcher3/taskbar/D1;-><init>(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/model/data/D;Landroid/window/RemoteTransition;)V

    .line 223
    .line 224
    .line 225
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 226
    .line 227
    .line 228
    :cond_9
    :goto_1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 229
    .line 230
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 231
    .line 232
    invoke-virtual {p1, v7}, Lcom/android/launcher3/taskbar/a4;->N0(Z)V

    .line 233
    .line 234
    .line 235
    goto/16 :goto_5

    .line 236
    .line 237
    :cond_a
    instance-of v3, v2, Lcom/android/launcher3/model/data/I;

    .line 238
    .line 239
    const-string v5, "TaskbarActivityContext"

    .line 240
    .line 241
    if-eqz v3, :cond_11

    .line 242
    .line 243
    check-cast v2, Lcom/android/launcher3/model/data/I;

    .line 244
    .line 245
    invoke-virtual {v2}, Lcom/android/launcher3/model/data/z;->isDisabled()Z

    .line 246
    .line 247
    .line 248
    move-result v3

    .line 249
    if-eqz v3, :cond_b

    .line 250
    .line 251
    invoke-static {v2, p0}, Lcom/android/launcher3/touch/v;->n(Lcom/android/launcher3/model/data/I;Landroid/content/Context;)Z

    .line 252
    .line 253
    .line 254
    move-result v3

    .line 255
    if-nez v3, :cond_15

    .line 256
    .line 257
    :cond_b
    if-eqz v1, :cond_c

    .line 258
    .line 259
    invoke-virtual {v1}, Lcom/android/quickstep/views/RecentsView;->isSplitSelectionActive()Z

    .line 260
    .line 261
    .line 262
    move-result v3

    .line 263
    if-eqz v3, :cond_c

    .line 264
    .line 265
    iget-object v1, v2, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 266
    .line 267
    invoke-virtual {v0, v2, v1, p1}, Lcom/android/launcher3/taskbar/o4;->S(Lcom/android/launcher3/model/data/z;Landroid/content/Intent;Landroid/view/View;)V

    .line 268
    .line 269
    .line 270
    goto/16 :goto_2

    .line 271
    .line 272
    :cond_c
    new-instance v0, Landroid/content/Intent;

    .line 273
    .line 274
    invoke-virtual {v2}, Lcom/android/launcher3/model/data/I;->getIntent()Landroid/content/Intent;

    .line 275
    .line 276
    .line 277
    move-result-object v3

    .line 278
    invoke-direct {v0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 279
    .line 280
    .line 281
    const/high16 v3, 0x10000000

    .line 282
    .line 283
    invoke-virtual {v0, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 284
    .line 285
    .line 286
    move-result-object v3

    .line 287
    :try_start_0
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/I1;->v:Z

    .line 288
    .line 289
    if-eqz v0, :cond_d

    .line 290
    .line 291
    new-instance v0, Lcom/android/launcher3/util/k;

    .line 292
    .line 293
    invoke-direct {v0, p0, v3}, Lcom/android/launcher3/util/k;-><init>(Landroid/content/Context;Landroid/content/Intent;)V

    .line 294
    .line 295
    .line 296
    invoke-virtual {v0}, Lcom/android/launcher3/util/k;->n()Z

    .line 297
    .line 298
    .line 299
    move-result v0

    .line 300
    if-nez v0, :cond_d

    .line 301
    .line 302
    const p1, 0x7f140344

    .line 303
    .line 304
    .line 305
    invoke-static {p0, p1, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    .line 306
    .line 307
    .line 308
    move-result-object p1

    .line 309
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 310
    .line 311
    .line 312
    goto :goto_2

    .line 313
    :catch_0
    move-exception v0

    .line 314
    move-object p1, v0

    .line 315
    goto/16 :goto_3

    .line 316
    .line 317
    :cond_d
    invoke-virtual {v2}, Lcom/android/launcher3/model/data/I;->b0()Z

    .line 318
    .line 319
    .line 320
    move-result v0
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 321
    const-string v6, "Main"

    .line 322
    .line 323
    if-eqz v0, :cond_e

    .line 324
    .line 325
    :try_start_1
    const-string p1, "start: taskbarPromiseIcon"

    .line 326
    .line 327
    invoke-static {v6, p1}, Lcom/android/launcher3/testing/K;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 328
    .line 329
    .line 330
    sget-object p1, Lcom/android/launcher3/util/f;->c:Lcom/android/launcher3/util/I;

    .line 331
    .line 332
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 333
    .line 334
    .line 335
    move-result-object p1

    .line 336
    check-cast p1, Lcom/android/launcher3/util/f;

    .line 337
    .line 338
    invoke-virtual {v2}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 339
    .line 340
    .line 341
    move-result-object v0

    .line 342
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 343
    .line 344
    .line 345
    move-result-object v1

    .line 346
    invoke-virtual {p1, v0, v1}, Lcom/android/launcher3/util/f;->d(Ljava/lang/String;Landroid/os/UserHandle;)Landroid/content/Intent;

    .line 347
    .line 348
    .line 349
    move-result-object v3

    .line 350
    invoke-virtual {p0, v3}, Landroid/view/ContextThemeWrapper;->startActivity(Landroid/content/Intent;)V

    .line 351
    .line 352
    .line 353
    goto :goto_2

    .line 354
    :cond_e
    iget v0, v2, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 355
    .line 356
    const/4 v8, 0x6

    .line 357
    if-ne v0, v8, :cond_f

    .line 358
    .line 359
    const-string p1, "start: taskbarDeepShortcut"

    .line 360
    .line 361
    invoke-static {v6, p1}, Lcom/android/launcher3/testing/K;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 362
    .line 363
    .line 364
    invoke-virtual {v2}, Lcom/android/launcher3/model/data/I;->Q()Ljava/lang/String;

    .line 365
    .line 366
    .line 367
    move-result-object v10

    .line 368
    invoke-virtual {v3}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    .line 369
    .line 370
    .line 371
    move-result-object v9

    .line 372
    const-class p1, Landroid/content/pm/LauncherApps;

    .line 373
    .line 374
    invoke-virtual {p0, p1}, Landroid/view/ContextThemeWrapper;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 375
    .line 376
    .line 377
    move-result-object p1

    .line 378
    move-object v8, p1

    .line 379
    check-cast v8, Landroid/content/pm/LauncherApps;

    .line 380
    .line 381
    iget-object v13, v2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 382
    .line 383
    const/4 v11, 0x0

    .line 384
    const/4 v12, 0x0

    .line 385
    invoke-virtual/range {v8 .. v13}, Landroid/content/pm/LauncherApps;->startShortcut(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Rect;Landroid/os/Bundle;Landroid/os/UserHandle;)V

    .line 386
    .line 387
    .line 388
    goto :goto_2

    .line 389
    :cond_f
    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 390
    .line 391
    .line 392
    move-result-object v0

    .line 393
    invoke-direct {p0, v1, p1, v0}, Lcom/android/launcher3/taskbar/I1;->M1(Lcom/android/quickstep/views/RecentsView;Landroid/view/View;Ljava/util/List;)V
    :try_end_1
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_0

    .line 394
    .line 395
    .line 396
    :goto_2
    invoke-static {p0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 397
    .line 398
    .line 399
    move-result-object p1

    .line 400
    if-eqz p1, :cond_10

    .line 401
    .line 402
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getInfo()Lcom/android/launcher3/model/data/p;

    .line 403
    .line 404
    .line 405
    move-result-object v0

    .line 406
    iget v0, v0, Lcom/android/launcher3/model/data/y;->id:I

    .line 407
    .line 408
    iget v1, v2, Lcom/android/launcher3/model/data/y;->container:I

    .line 409
    .line 410
    if-ne v0, v1, :cond_10

    .line 411
    .line 412
    new-instance v0, Lcom/android/launcher3/taskbar/I1$b;

    .line 413
    .line 414
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/taskbar/I1$b;-><init>(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/folder/Folder;)V

    .line 415
    .line 416
    .line 417
    invoke-virtual {p1, v0}, Lcom/android/launcher3/folder/Folder;->F0(Lcom/android/launcher3/folder/Folder$m;)V

    .line 418
    .line 419
    .line 420
    :cond_10
    iget-object p1, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 421
    .line 422
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 423
    .line 424
    invoke-virtual {p1, v2}, Lcom/android/launcher3/taskbar/o4;->I(Lcom/android/launcher3/model/data/y;)V

    .line 425
    .line 426
    .line 427
    iget-object p1, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 428
    .line 429
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 430
    .line 431
    invoke-virtual {p1, v7}, Lcom/android/launcher3/taskbar/a4;->N0(Z)V

    .line 432
    .line 433
    .line 434
    goto :goto_5

    .line 435
    :goto_3
    const v0, 0x7f140047

    .line 436
    .line 437
    .line 438
    invoke-static {p0, v0, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    .line 439
    .line 440
    .line 441
    move-result-object p0

    .line 442
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 443
    .line 444
    .line 445
    new-instance p0, Ljava/lang/StringBuilder;

    .line 446
    .line 447
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 448
    .line 449
    .line 450
    const-string v0, "Unable to launch. tag="

    .line 451
    .line 452
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 453
    .line 454
    .line 455
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 456
    .line 457
    .line 458
    const-string v0, " intent="

    .line 459
    .line 460
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 461
    .line 462
    .line 463
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 464
    .line 465
    .line 466
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 467
    .line 468
    .line 469
    move-result-object p0

    .line 470
    invoke-static {v5, p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 471
    .line 472
    .line 473
    return-void

    .line 474
    :cond_11
    instance-of v3, v2, Lcom/android/launcher3/model/data/d;

    .line 475
    .line 476
    if-eqz v3, :cond_13

    .line 477
    .line 478
    check-cast v2, Lcom/android/launcher3/model/data/d;

    .line 479
    .line 480
    if-eqz v1, :cond_12

    .line 481
    .line 482
    invoke-virtual {v1}, Lcom/android/quickstep/views/RecentsView;->isSplitSelectionActive()Z

    .line 483
    .line 484
    .line 485
    move-result v3

    .line 486
    if-eqz v3, :cond_12

    .line 487
    .line 488
    iget-object v1, v2, Lcom/android/launcher3/model/data/d;->k:Landroid/content/Intent;

    .line 489
    .line 490
    invoke-virtual {v0, v2, v1, p1}, Lcom/android/launcher3/taskbar/o4;->S(Lcom/android/launcher3/model/data/z;Landroid/content/Intent;Landroid/view/View;)V

    .line 491
    .line 492
    .line 493
    goto :goto_4

    .line 494
    :cond_12
    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 495
    .line 496
    .line 497
    move-result-object v0

    .line 498
    invoke-direct {p0, v1, p1, v0}, Lcom/android/launcher3/taskbar/I1;->M1(Lcom/android/quickstep/views/RecentsView;Landroid/view/View;Ljava/util/List;)V

    .line 499
    .line 500
    .line 501
    :goto_4
    iget-object p1, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 502
    .line 503
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 504
    .line 505
    invoke-virtual {p1, v2}, Lcom/android/launcher3/taskbar/o4;->I(Lcom/android/launcher3/model/data/y;)V

    .line 506
    .line 507
    .line 508
    iget-object p1, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 509
    .line 510
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 511
    .line 512
    invoke-virtual {p1, v7}, Lcom/android/launcher3/taskbar/a4;->N0(Z)V

    .line 513
    .line 514
    .line 515
    goto :goto_5

    .line 516
    :cond_13
    instance-of v0, v2, Lcom/android/launcher3/touch/v$a;

    .line 517
    .line 518
    if-eqz v0, :cond_14

    .line 519
    .line 520
    check-cast v2, Lcom/android/launcher3/touch/v$a;

    .line 521
    .line 522
    invoke-interface {v2, p1}, Lcom/android/launcher3/touch/v$a;->a(Landroid/view/View;)V

    .line 523
    .line 524
    .line 525
    goto :goto_5

    .line 526
    :cond_14
    new-instance p1, Ljava/lang/StringBuilder;

    .line 527
    .line 528
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 529
    .line 530
    .line 531
    const-string v0, "Unknown type clicked: "

    .line 532
    .line 533
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 534
    .line 535
    .line 536
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 537
    .line 538
    .line 539
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 540
    .line 541
    .line 542
    move-result-object p1

    .line 543
    invoke-static {v5, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 544
    .line 545
    .line 546
    :cond_15
    :goto_5
    move v4, v7

    .line 547
    :goto_6
    iget-object p1, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 548
    .line 549
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->n:Lcom/android/launcher3/taskbar/z3;

    .line 550
    .line 551
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/z3;->v()V

    .line 552
    .line 553
    .line 554
    if-eqz v4, :cond_16

    .line 555
    .line 556
    invoke-static {p0}, Lcom/android/launcher3/a;->closeAllOpenViews(Lcom/android/launcher3/views/k;)V

    .line 557
    .line 558
    .line 559
    :cond_16
    return-void
.end method

.method public applyOverwritesToLogItem(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;->hasContainerInfo()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_0

    .line 8
    .line 9
    :cond_0
    invoke-virtual {p1}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;->getContainerInfo()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$TaskBarContainer;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$TaskBarContainer$Builder;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/o4;->v()Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$TaskSwitcherContainer;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$TaskSwitcherContainer$Builder;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v1, p0}, Lcom/android/launcher3/logger/LauncherAtom$TaskBarContainer$Builder;->setTaskSwitcherContainer(Lcom/android/launcher3/logger/LauncherAtom$TaskSwitcherContainer$Builder;)Lcom/android/launcher3/logger/LauncherAtom$TaskBarContainer$Builder;

    .line 32
    .line 33
    .line 34
    :cond_1
    invoke-virtual {v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->hasPredictedHotseatContainer()Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-eqz p0, :cond_4

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getPredictedHotseatContainer()Lcom/android/launcher3/logger/LauncherAtom$PredictedHotseatContainer;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$PredictedHotseatContainer;->hasIndex()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_2

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$PredictedHotseatContainer;->getIndex()I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    invoke-virtual {v1, v0}, Lcom/android/launcher3/logger/LauncherAtom$TaskBarContainer$Builder;->setIndex(I)Lcom/android/launcher3/logger/LauncherAtom$TaskBarContainer$Builder;

    .line 55
    .line 56
    .line 57
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$PredictedHotseatContainer;->hasCardinality()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_3

    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$PredictedHotseatContainer;->getCardinality()I

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    invoke-virtual {v1, p0}, Lcom/android/launcher3/logger/LauncherAtom$TaskBarContainer$Builder;->setCardinality(I)Lcom/android/launcher3/logger/LauncherAtom$TaskBarContainer$Builder;

    .line 68
    .line 69
    .line 70
    :cond_3
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p0, v1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;->setTaskBarContainer(Lcom/android/launcher3/logger/LauncherAtom$TaskBarContainer$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p1, p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;->setContainerInfo(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_4
    invoke-virtual {v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->hasHotseat()Z

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    if-eqz p0, :cond_6

    .line 87
    .line 88
    invoke-virtual {v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getHotseat()Lcom/android/launcher3/logger/LauncherAtom$HotseatContainer;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$HotseatContainer;->hasIndex()Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-eqz v0, :cond_5

    .line 97
    .line 98
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$HotseatContainer;->getIndex()I

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    invoke-virtual {v1, p0}, Lcom/android/launcher3/logger/LauncherAtom$TaskBarContainer$Builder;->setIndex(I)Lcom/android/launcher3/logger/LauncherAtom$TaskBarContainer$Builder;

    .line 103
    .line 104
    .line 105
    :cond_5
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-virtual {p0, v1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;->setTaskBarContainer(Lcom/android/launcher3/logger/LauncherAtom$TaskBarContainer$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-virtual {p1, p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;->setContainerInfo(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_6
    invoke-virtual {v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->hasFolder()Z

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    if-eqz p0, :cond_8

    .line 122
    .line 123
    invoke-virtual {v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getFolder()Lcom/android/launcher3/logger/LauncherAtom$FolderContainer;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$FolderContainer;->hasHotseat()Z

    .line 128
    .line 129
    .line 130
    move-result p0

    .line 131
    if-eqz p0, :cond_8

    .line 132
    .line 133
    invoke-virtual {v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getFolder()Lcom/android/launcher3/logger/LauncherAtom$FolderContainer;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-virtual {p0}, Lcom/google/protobuf/y;->toBuilder()Lcom/google/protobuf/y$a;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$FolderContainer$Builder;

    .line 142
    .line 143
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$FolderContainer$Builder;->getHotseat()Lcom/android/launcher3/logger/LauncherAtom$HotseatContainer;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    invoke-virtual {v0}, Lcom/android/launcher3/logger/LauncherAtom$HotseatContainer;->hasIndex()Z

    .line 148
    .line 149
    .line 150
    move-result v2

    .line 151
    if-eqz v2, :cond_7

    .line 152
    .line 153
    invoke-virtual {v0}, Lcom/android/launcher3/logger/LauncherAtom$HotseatContainer;->getIndex()I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    invoke-virtual {v1, v0}, Lcom/android/launcher3/logger/LauncherAtom$TaskBarContainer$Builder;->setIndex(I)Lcom/android/launcher3/logger/LauncherAtom$TaskBarContainer$Builder;

    .line 158
    .line 159
    .line 160
    :cond_7
    invoke-virtual {p0, v1}, Lcom/android/launcher3/logger/LauncherAtom$FolderContainer$Builder;->setTaskbar(Lcom/android/launcher3/logger/LauncherAtom$TaskBarContainer$Builder;)Lcom/android/launcher3/logger/LauncherAtom$FolderContainer$Builder;

    .line 161
    .line 162
    .line 163
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$FolderContainer$Builder;->clearHotseat()Lcom/android/launcher3/logger/LauncherAtom$FolderContainer$Builder;

    .line 164
    .line 165
    .line 166
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    invoke-virtual {v0, p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;->setFolder(Lcom/android/launcher3/logger/LauncherAtom$FolderContainer$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    invoke-virtual {p1, p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;->setContainerInfo(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;

    .line 175
    .line 176
    .line 177
    return-void

    .line 178
    :cond_8
    invoke-virtual {v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->hasAllAppsContainer()Z

    .line 179
    .line 180
    .line 181
    move-result p0

    .line 182
    if-eqz p0, :cond_9

    .line 183
    .line 184
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 185
    .line 186
    .line 187
    move-result-object p0

    .line 188
    invoke-virtual {v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getAllAppsContainer()Lcom/android/launcher3/logger/LauncherAtom$AllAppsContainer;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    invoke-virtual {v0}, Lcom/google/protobuf/y;->toBuilder()Lcom/google/protobuf/y$a;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$AllAppsContainer$Builder;

    .line 197
    .line 198
    invoke-virtual {v0, v1}, Lcom/android/launcher3/logger/LauncherAtom$AllAppsContainer$Builder;->setTaskbarContainer(Lcom/android/launcher3/logger/LauncherAtom$TaskBarContainer$Builder;)Lcom/android/launcher3/logger/LauncherAtom$AllAppsContainer$Builder;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    invoke-virtual {p0, v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;->setAllAppsContainer(Lcom/android/launcher3/logger/LauncherAtom$AllAppsContainer$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    invoke-virtual {p1, p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;->setContainerInfo(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;

    .line 207
    .line 208
    .line 209
    return-void

    .line 210
    :cond_9
    invoke-virtual {v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->hasPredictionContainer()Z

    .line 211
    .line 212
    .line 213
    move-result p0

    .line 214
    if-eqz p0, :cond_a

    .line 215
    .line 216
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 217
    .line 218
    .line 219
    move-result-object p0

    .line 220
    invoke-virtual {v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getPredictionContainer()Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    invoke-virtual {v0}, Lcom/google/protobuf/y;->toBuilder()Lcom/google/protobuf/y$a;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$Builder;

    .line 229
    .line 230
    invoke-virtual {v0, v1}, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$Builder;->setTaskbarContainer(Lcom/android/launcher3/logger/LauncherAtom$TaskBarContainer$Builder;)Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$Builder;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    invoke-virtual {p0, v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;->setPredictionContainer(Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 235
    .line 236
    .line 237
    move-result-object p0

    .line 238
    invoke-virtual {p1, p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;->setContainerInfo(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;

    .line 239
    .line 240
    .line 241
    :cond_a
    :goto_0
    return-void
.end method

.method public b1()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->i1()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public b2(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/a4;->T0(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public c()Z
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/util/Z;->D(Landroid/content/Context;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/I1;->l:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public c0(Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    if-eqz p1, :cond_1

    .line 15
    .line 16
    iget-object p1, p0, Lcom/android/launcher3/taskbar/I1;->n:Landroid/view/WindowManager$LayoutParams;

    .line 17
    .line 18
    iget v0, p1, Landroid/view/WindowManager$LayoutParams;->forciblyShownTypes:I

    .line 19
    .line 20
    invoke-static {}, Landroid/view/WindowInsets$Type;->navigationBars()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    or-int/2addr v0, v1

    .line 25
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->forciblyShownTypes:I

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/I1;->n:Landroid/view/WindowManager$LayoutParams;

    .line 29
    .line 30
    iget v0, p1, Landroid/view/WindowManager$LayoutParams;->forciblyShownTypes:I

    .line 31
    .line 32
    invoke-static {}, Landroid/view/WindowInsets$Type;->navigationBars()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    not-int v1, v1

    .line 37
    and-int/2addr v0, v1

    .line 38
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->forciblyShownTypes:I

    .line 39
    .line 40
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->O1()V

    .line 41
    .line 42
    .line 43
    :cond_2
    :goto_1
    return-void
.end method

.method public c1()Z
    .locals 1

    .line 1
    sget-boolean v0, Lf1/a;->g:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->m:Lcom/android/launcher3/h0;

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/android/launcher3/h0;->H0:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->p3:Z

    .line 12
    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public c2(IZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/M0;->K0(IZ)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public createDefaultWindowLayoutParams(ILjava/lang/String;)Landroid/view/WindowManager$LayoutParams;
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->i1()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    :cond_0
    invoke-static {}, Lcom/android/launcher3/N5;->E()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    const v0, 0x20040028

    .line 20
    .line 21
    .line 22
    :goto_0
    move v5, v0

    .line 23
    goto :goto_1

    .line 24
    :cond_1
    const v0, 0x20000008

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :goto_1
    new-instance v1, Landroid/view/WindowManager$LayoutParams;

    .line 29
    .line 30
    iget v3, p0, Lcom/android/launcher3/taskbar/I1;->r:I

    .line 31
    .line 32
    const/4 v6, -0x3

    .line 33
    const/4 v2, -0x1

    .line 34
    move v4, p1

    .line 35
    invoke-direct/range {v1 .. v6}, Landroid/view/WindowManager$LayoutParams;-><init>(IIIII)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1, p2}, Landroid/view/WindowManager$LayoutParams;->setTitle(Ljava/lang/CharSequence;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/view/ContextThemeWrapper;->getPackageName()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iput-object p1, v1, Landroid/view/WindowManager$LayoutParams;->packageName:Ljava/lang/String;

    .line 46
    .line 47
    const/16 p1, 0x50

    .line 48
    .line 49
    iput p1, v1, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 50
    .line 51
    const/4 p1, 0x0

    .line 52
    invoke-virtual {v1, p1}, Landroid/view/WindowManager$LayoutParams;->setFitInsetsTypes(I)V

    .line 53
    .line 54
    .line 55
    const/4 p1, 0x1

    .line 56
    iput-boolean p1, v1, Landroid/view/WindowManager$LayoutParams;->receiveInsetsIgnoringZOrder:Z

    .line 57
    .line 58
    const/16 p1, 0x30

    .line 59
    .line 60
    iput p1, v1, Landroid/view/WindowManager$LayoutParams;->softInputMode:I

    .line 61
    .line 62
    const/4 p1, 0x3

    .line 63
    iput p1, v1, Landroid/view/WindowManager$LayoutParams;->layoutInDisplayCutoutMode:I

    .line 64
    .line 65
    const/16 p1, 0x40

    .line 66
    .line 67
    iput p1, v1, Landroid/view/WindowManager$LayoutParams;->privateFlags:I

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_2

    .line 74
    .line 75
    const p1, 0x7f140437

    .line 76
    .line 77
    .line 78
    goto :goto_2

    .line 79
    :cond_2
    const p1, 0x7f140420

    .line 80
    .line 81
    .line 82
    :goto_2
    invoke-virtual {p0, p1}, Landroid/view/ContextThemeWrapper;->getString(I)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    iput-object p0, v1, Landroid/view/WindowManager$LayoutParams;->accessibilityTitle:Ljava/lang/CharSequence;

    .line 87
    .line 88
    return-object v1
.end method

.method public d0(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/android/launcher3/taskbar/o4;->f(Z)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/W4;->w()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public d1()Z
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/util/Z;->C(Landroid/content/Context;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public d2()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/a4;->C0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public dispatchDeviceProfileChanged()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->dispatchDeviceProfileChanged()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->g1()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const-wide/16 v0, 0x1000

    .line 13
    .line 14
    const-string v2, "TaskbarActivityContext#DeviceProfileChanged"

    .line 15
    .line 16
    invoke-static {v0, v1, v2, p0}, Landroid/os/Trace;->instantForTrack(JLjava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public e0(I)Z
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->s:Lcom/android/launcher3/taskbar/F3;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/F3;->p(I)Lcom/android/launcher3/BubbleTextView$f;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v1, "Task id="

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string p1, ", Running app state="

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const-string v0, "TaskbarActivityContext"

    .line 35
    .line 36
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    sget-object p1, Lcom/android/launcher3/BubbleTextView$f;->i:Lcom/android/launcher3/BubbleTextView$f;

    .line 40
    .line 41
    if-ne p0, p1, :cond_0

    .line 42
    .line 43
    sget-object p0, Landroid/window/DesktopModeFlags;->ENABLE_DESKTOP_APP_LAUNCH_ALTTAB_TRANSITIONS_BUGFIX:Landroid/window/DesktopModeFlags;

    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/window/DesktopModeFlags;->isTrue()Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-eqz p0, :cond_0

    .line 50
    .line 51
    const/4 p0, 0x1

    .line 52
    return p0

    .line 53
    :cond_0
    const/4 p0, 0x0

    .line 54
    return p0
.end method

.method public e1()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/I1;->l:Z

    .line 2
    .line 3
    return p0
.end method

.method public f()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->S1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/M0;->X()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public f1()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->p:Lcom/android/launcher3/taskbar/allapps/c;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/allapps/c;->h()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public f2(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->isAttachedToWindow()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->k:Landroid/view/WindowManager;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Landroid/view/WindowManager;->removeViewImmediate(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public g1()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/a4;->g0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public g2(IZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->m:Lcom/android/launcher3/taskbar/K1;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/K1;->g(IZ)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public getAccessibilityDelegate()Landroid/view/View$AccessibilityDelegate;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->D:Lcom/android/launcher3/taskbar/K3;

    .line 2
    .line 3
    return-object p0
.end method

.method public getActivityLaunchOptions(Landroid/view/View;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/b;
    .locals 0

    .line 1
    const/4 p1, -0x1

    .line 2
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/I1;->makeDefaultActivityOptions(I)Lcom/android/launcher3/util/b;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public getAppsView()Lcom/android/launcher3/allapps/r;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/launcher3/allapps/r<",
            "*>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->p:Lcom/android/launcher3/taskbar/allapps/c;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/allapps/c;->d()Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getContent()Lcom/android/launcher3/util/Y0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/W4;->K()Lcom/android/launcher3/util/Y0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getDeviceProfile()Lcom/android/launcher3/h0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->m:Lcom/android/launcher3/h0;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic getDragController()Lcom/android/launcher3/dragndrop/j;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->v0()Lcom/android/launcher3/taskbar/j2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->w0()Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getFolderBoundingBox()Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->f:Lcom/android/launcher3/taskbar/s2;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/s2;->n()Landroid/graphics/Rect;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getForeColor()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getItemOnClickListener()Landroid/view/View$OnClickListener;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/taskbar/V0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/V0;-><init>(Lcom/android/launcher3/taskbar/I1;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public getPopupDataProvider()Lcom/android/launcher3/popup/n;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->n:Lcom/android/launcher3/taskbar/z3;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/z3;->p()Lcom/android/launcher3/popup/n;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getWindowLayoutParams()Landroid/view/WindowManager$LayoutParams;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->n:Landroid/view/WindowManager$LayoutParams;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/I1;->l2(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public h1()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/I1;->p:Z

    .line 2
    .line 3
    return p0
.end method

.method public h2(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/a4;->D0(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public i(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/taskbar/I1;->i2(ZZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method protected i0(I)Lcom/android/launcher3/anim/q;
    .locals 5

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    int-to-long v1, p1

    .line 7
    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 8
    .line 9
    .line 10
    iget-object v3, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 11
    .line 12
    iget-object v3, v3, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 13
    .line 14
    instance-of v4, v3, Lcom/android/launcher3/taskbar/V;

    .line 15
    .line 16
    if-eqz v4, :cond_0

    .line 17
    .line 18
    check-cast v3, Lcom/android/launcher3/taskbar/V;

    .line 19
    .line 20
    invoke-virtual {v3, v0, p1}, Lcom/android/launcher3/taskbar/V;->Z(Landroid/animation/AnimatorSet;I)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object v3, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 24
    .line 25
    iget-object v3, v3, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 26
    .line 27
    invoke-virtual {v3, v0, p1}, Lcom/android/launcher3/taskbar/a4;->C(Landroid/animation/AnimatorSet;I)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/W4;->J()Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {}, Lf1/a;->a()Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-nez p1, :cond_1

    .line 43
    .line 44
    const/4 p1, 0x2

    .line 45
    new-array p1, p1, [F

    .line 46
    .line 47
    fill-array-data p1, :array_0

    .line 48
    .line 49
    .line 50
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p1, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 55
    .line 56
    .line 57
    new-instance v3, Lcom/android/launcher3/taskbar/a1;

    .line 58
    .line 59
    invoke-direct {v3, p0}, Lcom/android/launcher3/taskbar/a1;-><init>(Landroid/view/View;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 63
    .line 64
    .line 65
    new-instance v3, Lcom/android/launcher3/taskbar/b1;

    .line 66
    .line 67
    invoke-direct {v3, p0}, Lcom/android/launcher3/taskbar/b1;-><init>(Landroid/view/View;)V

    .line 68
    .line 69
    .line 70
    invoke-static {v3}, Lcom/android/launcher3/anim/h;->c(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p1, p0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, p1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 78
    .line 79
    .line 80
    :cond_1
    invoke-static {v0, v1, v2}, Lcom/android/launcher3/anim/q;->z(Landroid/animation/AnimatorSet;J)Lcom/android/launcher3/anim/q;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    return-object p0

    .line 85
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public i1()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->t:Lcom/android/launcher3/util/C1;

    .line 2
    .line 3
    sget-object v0, Lcom/android/launcher3/util/C1;->j:Lcom/android/launcher3/util/C1;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public i2(ZZ)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    if-eqz p1, :cond_2

    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/launcher3/taskbar/I1;->n:Landroid/view/WindowManager$LayoutParams;

    .line 11
    .line 12
    iget v0, p1, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 13
    .line 14
    and-int/lit8 v1, v0, -0x9

    .line 15
    .line 16
    iput v1, p1, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 17
    .line 18
    if-eqz p2, :cond_1

    .line 19
    .line 20
    const p2, -0x20009

    .line 21
    .line 22
    .line 23
    and-int/2addr p2, v0

    .line 24
    iput p2, p1, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const/high16 p2, 0x20000

    .line 28
    .line 29
    or-int/2addr p2, v1

    .line 30
    iput p2, p1, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/taskbar/I1;->n:Landroid/view/WindowManager$LayoutParams;

    .line 34
    .line 35
    iget p2, p1, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 36
    .line 37
    or-int/lit8 p2, p2, 0x8

    .line 38
    .line 39
    const v0, -0x20001

    .line 40
    .line 41
    .line 42
    and-int/2addr p2, v0

    .line 43
    iput p2, p1, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 44
    .line 45
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->O1()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public isBubbleBarEnabled()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->q0()Lcom/android/launcher3/taskbar/bubbles/m0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/android/launcher3/taskbar/bubbles/t;->G2()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public j()V
    .locals 2

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->d0(Landroid/content/Context;)Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v1, Lcom/android/launcher3/taskbar/y1;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/y1;-><init>(Lcom/android/launcher3/taskbar/I1;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/android/launcher3/popup/c;->addOnCloseCallback(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public j0(IIIZ)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/ContextThemeWrapper;->getDisplayId()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eq p1, p2, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->e:Lcom/android/systemui/shared/rotation/RotationButtonController;

    .line 11
    .line 12
    invoke-virtual {p0, p3}, Lcom/android/systemui/shared/rotation/RotationButtonController;->onDisable2FlagChanged(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public j1()Z
    .locals 1

    .line 1
    invoke-static {}, LH2/c;->q()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->m:Lcom/android/launcher3/h0;

    .line 8
    .line 9
    iget-boolean v0, p0, Lcom/android/launcher3/h0;->H0:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->p3:Z

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public j2(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/M0;->E0()V

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/M0;->D0()V

    .line 16
    .line 17
    .line 18
    :goto_0
    const/4 v0, 0x1

    .line 19
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/taskbar/I1;->i2(ZZ)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method protected k0(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string v1, "TaskbarActivityContext:"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->t:Lcom/android/launcher3/util/C1;

    .line 22
    .line 23
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "%s\tmNavMode=%s"

    .line 28
    .line 29
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/I1;->u:Z

    .line 37
    .line 38
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const-string v1, "%s\tmImeDrawsImeNavBar=%b"

    .line 47
    .line 48
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/I1;->w:Z

    .line 56
    .line 57
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    const-string v1, "%s\tmIsUserSetupComplete=%b"

    .line 66
    .line 67
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->n:Landroid/view/WindowManager$LayoutParams;

    .line 75
    .line 76
    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 77
    .line 78
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    const-string v1, "%s\tmWindowLayoutParams.height=%dpx"

    .line 87
    .line 88
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 96
    .line 97
    new-instance v1, Ljava/lang/StringBuilder;

    .line 98
    .line 99
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    const-string v2, "\t"

    .line 106
    .line 107
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    invoke-virtual {v0, v1, p2}, Lcom/android/launcher3/taskbar/R1;->f(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 115
    .line 116
    .line 117
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->m:Lcom/android/launcher3/h0;

    .line 118
    .line 119
    invoke-virtual {v0, p0, p1, p2}, Lcom/android/launcher3/h0;->U(Landroid/content/Context;Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public k1()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/I1;->w:Z

    .line 2
    .line 3
    return p0
.end method

.method public k2()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/I1;->O0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->u0()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/I1;->m2(I)V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/I1;->s:Z

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/I1;->s:Z

    .line 20
    .line 21
    iget v0, p0, Lcom/android/launcher3/taskbar/I1;->r:I

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->u0()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    :goto_0
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/I1;->m2(I)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public l0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/a4;->N(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public l2(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/I1;->g2(IZ)V

    .line 3
    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/I1;->p:Z

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const/4 p1, -0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget p1, p0, Lcom/android/launcher3/taskbar/I1;->r:I

    .line 12
    .line 13
    :goto_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/I1;->m2(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public m0(Z)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/I1;->A:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_3

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    invoke-static {}, Lcom/android/launcher3/y0;->B0()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_1
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/I1;->A:Z

    .line 20
    .line 21
    if-eqz p1, :cond_2

    .line 22
    .line 23
    iget-object p1, p0, Lcom/android/launcher3/taskbar/I1;->n:Landroid/view/WindowManager$LayoutParams;

    .line 24
    .line 25
    iget v0, p1, Landroid/view/WindowManager$LayoutParams;->privateFlags:I

    .line 26
    .line 27
    const/high16 v1, 0x200000

    .line 28
    .line 29
    or-int/2addr v0, v1

    .line 30
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->privateFlags:I

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/taskbar/I1;->n:Landroid/view/WindowManager$LayoutParams;

    .line 34
    .line 35
    iget v0, p1, Landroid/view/WindowManager$LayoutParams;->privateFlags:I

    .line 36
    .line 37
    const v1, -0x200001

    .line 38
    .line 39
    .line 40
    and-int/2addr v0, v1

    .line 41
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->privateFlags:I

    .line 42
    .line 43
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->O1()V

    .line 44
    .line 45
    .line 46
    :cond_3
    :goto_1
    return-void
.end method

.method public m2(I)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->a1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->m:Lcom/android/launcher3/h0;

    .line 9
    .line 10
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->N0:Z

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move v0, v1

    .line 17
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/taskbar/I1;->n:Landroid/view/WindowManager$LayoutParams;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget v2, v2, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_1
    iget v2, v2, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 25
    .line 26
    :goto_1
    if-eq v2, p1, :cond_7

    .line 27
    .line 28
    iget-boolean v2, p0, Lcom/android/launcher3/taskbar/I1;->z:Z

    .line 29
    .line 30
    if-eqz v2, :cond_2

    .line 31
    .line 32
    goto :goto_5

    .line 33
    :cond_2
    const/4 v2, -0x1

    .line 34
    if-ne p1, v2, :cond_3

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iget p1, p1, Landroid/content/res/Configuration;->screenHeightDp:I

    .line 45
    .line 46
    int-to-float p1, p1

    .line 47
    invoke-virtual {p0}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    .line 56
    .line 57
    mul-float/2addr p1, v2

    .line 58
    float-to-int p1, p1

    .line 59
    goto :goto_2

    .line 60
    :cond_3
    iput p1, p0, Lcom/android/launcher3/taskbar/I1;->r:I

    .line 61
    .line 62
    iget-boolean v2, p0, Lcom/android/launcher3/taskbar/I1;->p:Z

    .line 63
    .line 64
    if-nez v2, :cond_7

    .line 65
    .line 66
    iget-boolean v2, p0, Lcom/android/launcher3/taskbar/I1;->s:Z

    .line 67
    .line 68
    if-eqz v2, :cond_4

    .line 69
    .line 70
    goto :goto_5

    .line 71
    :cond_4
    :goto_2
    const/4 v2, 0x3

    .line 72
    if-eqz v0, :cond_5

    .line 73
    .line 74
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->n:Landroid/view/WindowManager$LayoutParams;

    .line 75
    .line 76
    iput p1, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 77
    .line 78
    :goto_3
    if-gt v1, v2, :cond_6

    .line 79
    .line 80
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->n:Landroid/view/WindowManager$LayoutParams;

    .line 81
    .line 82
    iget-object v0, v0, Landroid/view/WindowManager$LayoutParams;->paramsForRotation:[Landroid/view/WindowManager$LayoutParams;

    .line 83
    .line 84
    aget-object v0, v0, v1

    .line 85
    .line 86
    iput p1, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 87
    .line 88
    add-int/lit8 v1, v1, 0x1

    .line 89
    .line 90
    goto :goto_3

    .line 91
    :cond_5
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->n:Landroid/view/WindowManager$LayoutParams;

    .line 92
    .line 93
    iput p1, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 94
    .line 95
    :goto_4
    if-gt v1, v2, :cond_6

    .line 96
    .line 97
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->n:Landroid/view/WindowManager$LayoutParams;

    .line 98
    .line 99
    iget-object v0, v0, Landroid/view/WindowManager$LayoutParams;->paramsForRotation:[Landroid/view/WindowManager$LayoutParams;

    .line 100
    .line 101
    aget-object v0, v0, v1

    .line 102
    .line 103
    iput p1, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 104
    .line 105
    add-int/lit8 v1, v1, 0x1

    .line 106
    .line 107
    goto :goto_4

    .line 108
    :cond_6
    iget-object p1, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 109
    .line 110
    iget-object v0, p1, Lcom/android/launcher3/taskbar/R1;->q:Lcom/android/launcher3/taskbar/N2;

    .line 111
    .line 112
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    new-instance v1, Lcom/android/launcher3/taskbar/f1;

    .line 116
    .line 117
    invoke-direct {v1, v0}, Lcom/android/launcher3/taskbar/f1;-><init>(Lcom/android/launcher3/taskbar/N2;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p1, v1}, Lcom/android/launcher3/taskbar/R1;->q(Ljava/lang/Runnable;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->O1()V

    .line 124
    .line 125
    .line 126
    :cond_7
    :goto_5
    return-void
.end method

.method public makeDefaultActivityOptions(I)Lcom/android/launcher3/util/b;
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/Y1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/util/Y1;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {p0, v1, v1}, Landroid/app/ActivityOptions;->makeCustomAnimation(Landroid/content/Context;II)Landroid/app/ActivityOptions;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1, p1}, Landroid/app/ActivityOptions;->setSplashScreenStyle(I)Landroid/app/ActivityOptions;

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    invoke-virtual {v1, p1}, Landroid/app/ActivityOptions;->setPendingIntentBackgroundActivityStartMode(I)Landroid/app/ActivityOptions;

    .line 16
    .line 17
    .line 18
    invoke-static {v0, p0}, Lcom/android/quickstep/util/AnimUtils;->completeRunnableListCallback(Lcom/android/launcher3/util/Y1;Lcom/android/launcher3/views/k;)Landroid/os/IRemoteCallback;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v1, p0}, Landroid/app/ActivityOptions;->setOnAnimationAbortListener(Landroid/os/IRemoteCallback;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1, p0}, Landroid/app/ActivityOptions;->setOnAnimationFinishedListener(Landroid/os/IRemoteCallback;)V

    .line 26
    .line 27
    .line 28
    new-instance p0, Lcom/android/launcher3/util/b;

    .line 29
    .line 30
    invoke-direct {p0, v1, v0}, Lcom/android/launcher3/util/b;-><init>(Landroid/app/ActivityOptions;Lcom/android/launcher3/util/Y1;)V

    .line 31
    .line 32
    .line 33
    return-object p0
.end method

.method public n2(Lcom/android/launcher3/taskbar/o4;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/taskbar/R1;->r(Lcom/android/launcher3/taskbar/o4;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/android/launcher3/taskbar/bubbles/t;->G2()Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 15
    .line 16
    invoke-static {p1}, Ln1/f;->a(Ljava/util/Optional;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/I1;->d0(Z)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public o0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/M0;->Z()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public o2(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/M0;->T0(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public p2()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->i1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->m:Lcom/android/launcher3/h0;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->w3:Z

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public q0()Lcom/android/launcher3/taskbar/bubbles/m0;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/android/launcher3/taskbar/bubbles/m0;

    .line 11
    .line 12
    return-object p0
.end method

.method public q2()Z
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/util/Z;->T(Landroid/content/Context;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public r0()Lcom/android/launcher3/taskbar/R1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    return-object p0
.end method

.method public r2()Z
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/util/Z;->U(Landroid/content/Context;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public s0()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-virtual {p0}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const v0, 0x7f0709d5

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0
.end method

.method public s2(Lcom/android/launcher3/BubbleTextView;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/I1;->l2(Z)V

    .line 3
    .line 4
    .line 5
    new-instance v0, Lcom/android/launcher3/taskbar/A1;

    .line 6
    .line 7
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/taskbar/A1;-><init>(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/BubbleTextView;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->post(Ljava/lang/Runnable;)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public startSplitSelection(Lcom/android/launcher3/util/y2$c;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/o4;->P(Lcom/android/launcher3/util/y2$c;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method protected t0()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/W4;->L()F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public t2()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->w:Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->q()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->w:Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->l()V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->w:Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->t()V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/a4;->N0(Z)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public u0()I
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->i1()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const p0, 0x7f070ba8

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0

    .line 25
    :cond_0
    const p0, 0x7f070bb6

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    return p0

    .line 33
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->k1()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-nez v1, :cond_2

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->B0()I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    return p0

    .line 44
    :cond_2
    iget-object v1, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 45
    .line 46
    iget-object v1, v1, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 47
    .line 48
    new-instance v2, Lcom/android/launcher3/taskbar/X0;

    .line 49
    .line 50
    invoke-direct {v2}, Lcom/android/launcher3/taskbar/X0;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1, v2}, Ljava/util/Optional;->map(Ljava/util/function/Function;)Ljava/util/Optional;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    const/4 v2, 0x0

    .line 58
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-virtual {v1, v3}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    check-cast v1, Ljava/lang/Integer;

    .line 67
    .line 68
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    const/4 v4, 0x1

    .line 77
    if-nez v3, :cond_4

    .line 78
    .line 79
    invoke-static {}, Lf1/a;->e()Z

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    if-eqz v3, :cond_3

    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->i1()Z

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    if-nez v3, :cond_3

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_3
    move v3, v2

    .line 93
    goto :goto_1

    .line 94
    :cond_4
    :goto_0
    move v3, v4

    .line 95
    :goto_1
    invoke-static {}, Lcom/android/launcher3/y0;->k()Z

    .line 96
    .line 97
    .line 98
    move-result v5

    .line 99
    if-eqz v5, :cond_5

    .line 100
    .line 101
    const v2, 0x7f070128

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    const v5, 0x7f070bc1

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 112
    .line 113
    .line 114
    move-result v5

    .line 115
    mul-int/lit8 v5, v5, 0x2

    .line 116
    .line 117
    add-int/2addr v2, v5

    .line 118
    const v5, 0x7f07012c

    .line 119
    .line 120
    .line 121
    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 122
    .line 123
    .line 124
    move-result v5

    .line 125
    int-to-float v5, v5

    .line 126
    invoke-static {v5}, Lcom/android/launcher3/N5;->f(F)I

    .line 127
    .line 128
    .line 129
    move-result v5

    .line 130
    add-int/2addr v2, v5

    .line 131
    :cond_5
    if-eqz v3, :cond_6

    .line 132
    .line 133
    iget-object v3, p0, Lcom/android/launcher3/taskbar/I1;->m:Lcom/android/launcher3/h0;

    .line 134
    .line 135
    invoke-virtual {v3, p0}, Lcom/android/launcher3/h0;->f1(Landroid/content/Context;)Lcom/android/launcher3/h0$a;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    invoke-virtual {p0, v4}, Lcom/android/launcher3/h0$a;->e(Z)Lcom/android/launcher3/h0$a;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    invoke-virtual {p0}, Lcom/android/launcher3/h0$a;->a()Lcom/android/launcher3/h0;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    iget v3, p0, Lcom/android/launcher3/h0;->r3:I

    .line 148
    .line 149
    iget p0, p0, Lcom/android/launcher3/h0;->t3:I

    .line 150
    .line 151
    mul-int/lit8 p0, p0, 0x2

    .line 152
    .line 153
    add-int/2addr v3, p0

    .line 154
    const p0, 0x7f070c22

    .line 155
    .line 156
    .line 157
    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 158
    .line 159
    .line 160
    move-result p0

    .line 161
    invoke-static {v2, p0}, Ljava/lang/Math;->max(II)I

    .line 162
    .line 163
    .line 164
    move-result p0

    .line 165
    add-int/2addr v3, p0

    .line 166
    invoke-static {v3, v1}, Ljava/lang/Math;->max(II)I

    .line 167
    .line 168
    .line 169
    move-result p0

    .line 170
    return p0

    .line 171
    :cond_6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I1;->m:Lcom/android/launcher3/h0;

    .line 172
    .line 173
    iget v0, v0, Lcom/android/launcher3/h0;->r3:I

    .line 174
    .line 175
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->s0()I

    .line 176
    .line 177
    .line 178
    move-result p0

    .line 179
    add-int/2addr v0, p0

    .line 180
    add-int/2addr v0, v2

    .line 181
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 182
    .line 183
    .line 184
    move-result p0

    .line 185
    return p0
.end method

.method public v0()Lcom/android/launcher3/taskbar/j2;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->b:Lcom/android/launcher3/taskbar/j2;

    .line 4
    .line 5
    return-object p0
.end method

.method public v2(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/a4;->J0(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public w0()Lcom/android/launcher3/taskbar/TaskbarDragLayer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->i:Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 2
    .line 3
    return-object p0
.end method

.method public w2()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/a4;->L0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public x0()Lcom/android/launcher3/J3;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->G:Lcom/android/launcher3/J3;

    .line 2
    .line 3
    return-object p0
.end method

.method public x2(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/M0;->X0(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public y0()Lcom/android/quickstep/NavHandle;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->k:Lcom/android/launcher3/taskbar/U0;

    .line 4
    .line 5
    return-object p0
.end method

.method public y2(IZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/M0;->Y0(IZ)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public z0()Lcom/android/launcher3/util/C1;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->e1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Lcom/android/launcher3/util/Z;->y(Landroid/content/Context;)Lcom/android/launcher3/util/C1;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    sget-object p0, Lcom/android/launcher3/util/C1;->j:Lcom/android/launcher3/util/C1;

    .line 13
    .line 14
    return-object p0
.end method

.method public z2()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1;->j:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 4
    .line 5
    new-instance v0, Lcom/android/launcher3/taskbar/r1;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/android/launcher3/taskbar/r1;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
