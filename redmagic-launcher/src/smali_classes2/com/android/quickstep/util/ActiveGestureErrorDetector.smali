.class public Lcom/android/quickstep/util/ActiveGestureErrorDetector;
.super Ljava/lang/Object;
.source "ActiveGestureErrorDetector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;
    }
.end annotation


# static fields
.field private static final ON_START_RECENT_ANIMATION_TIME_LIMIT:J = 0x1f4L


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method protected static analyseAndDump(Ljava/lang/String;Ljava/io/PrintWriter;Lcom/android/quickstep/util/ActiveGestureLog$EventLog;)V
    .locals 11

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string v1, "Error messages for gesture ID: "

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    iget v1, p2, Lcom/android/quickstep/util/ActiveGestureLog$EventLog;->logId:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-boolean v0, p2, Lcom/android/quickstep/util/ActiveGestureLog$EventLog;->mIsFullyGesturalNavMode:Z

    .line 27
    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    new-instance p2, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string p0, "\tSkipping gesture error detection because gesture navigation not enabled"

    .line 39
    .line 40
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_0
    new-instance v0, Landroid/util/ArraySet;

    .line 52
    .line 53
    invoke-direct {v0}, Landroid/util/ArraySet;-><init>()V

    .line 54
    .line 55
    .line 56
    iget-object p2, p2, Lcom/android/quickstep/util/ActiveGestureLog$EventLog;->eventEntries:Ljava/util/List;

    .line 57
    .line 58
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    const-wide/16 v1, 0x0

    .line 63
    .line 64
    const/4 v3, 0x0

    .line 65
    move-wide v5, v1

    .line 66
    move v4, v3

    .line 67
    :cond_1
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 68
    .line 69
    .line 70
    move-result v7

    .line 71
    const/4 v8, 0x1

    .line 72
    if-eqz v7, :cond_5

    .line 73
    .line 74
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v7

    .line 78
    check-cast v7, Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;

    .line 79
    .line 80
    invoke-virtual {v7}, Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;->getGestureEvent()Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 81
    .line 82
    .line 83
    move-result-object v9

    .line 84
    if-nez v9, :cond_2

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_2
    invoke-interface {v0, v9}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    invoke-virtual {v9}, Ljava/lang/Enum;->ordinal()I

    .line 91
    .line 92
    .line 93
    move-result v9

    .line 94
    packed-switch v9, :pswitch_data_0

    .line 95
    .line 96
    .line 97
    :pswitch_0
    goto :goto_0

    .line 98
    :pswitch_1
    sget-object v7, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->START_RECENTS_ANIMATION:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 99
    .line 100
    invoke-interface {v0, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result v7

    .line 104
    xor-int/2addr v7, v8

    .line 105
    const-string v8, "STATE_RECENTS_ANIMATION_CANCELED set before/without startRecentsAnimation."

    .line 106
    .line 107
    invoke-static {v7, p0, v8, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 108
    .line 109
    .line 110
    move-result v7

    .line 111
    :goto_1
    or-int/2addr v4, v7

    .line 112
    goto :goto_0

    .line 113
    :pswitch_2
    sget-object v7, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_CAPTURE_SCREENSHOT:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 114
    .line 115
    invoke-interface {v0, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result v7

    .line 119
    xor-int/2addr v7, v8

    .line 120
    const-string v8, "STATE_SCREENSHOT_CAPTURED set before/without STATE_CAPTURE_SCREENSHOT."

    .line 121
    .line 122
    invoke-static {v7, p0, v8, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 123
    .line 124
    .line 125
    move-result v7

    .line 126
    goto :goto_1

    .line 127
    :pswitch_3
    sget-object v7, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->SET_ON_PAGE_TRANSITION_END_CALLBACK:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 128
    .line 129
    invoke-interface {v0, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result v7

    .line 133
    xor-int/2addr v7, v8

    .line 134
    const-string v8, "STATE_RECENTS_SCROLLING_FINISHED set before/without calling setOnPageTransitionEndCallback."

    .line 135
    .line 136
    invoke-static {v7, p0, v8, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 137
    .line 138
    .line 139
    move-result v7

    .line 140
    goto :goto_1

    .line 141
    :pswitch_4
    sget-object v7, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->MOTION_UP:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 142
    .line 143
    invoke-interface {v0, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result v7

    .line 147
    xor-int/2addr v7, v8

    .line 148
    const-string v9, "STATE_GESTURE_CANCELLED set before/without motion up."

    .line 149
    .line 150
    invoke-static {v7, p0, v9, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 151
    .line 152
    .line 153
    move-result v7

    .line 154
    or-int/2addr v4, v7

    .line 155
    sget-object v7, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_GESTURE_STARTED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 156
    .line 157
    invoke-interface {v0, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result v7

    .line 161
    xor-int/2addr v7, v8

    .line 162
    const-string v8, "STATE_GESTURE_CANCELLED set before/without STATE_GESTURE_STARTED."

    .line 163
    .line 164
    invoke-static {v7, p0, v8, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 165
    .line 166
    .line 167
    move-result v7

    .line 168
    goto :goto_1

    .line 169
    :pswitch_5
    sget-object v7, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->MOTION_UP:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 170
    .line 171
    invoke-interface {v0, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result v7

    .line 175
    xor-int/2addr v7, v8

    .line 176
    const-string v9, "STATE_GESTURE_COMPLETED set before/without motion up."

    .line 177
    .line 178
    invoke-static {v7, p0, v9, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 179
    .line 180
    .line 181
    move-result v7

    .line 182
    or-int/2addr v4, v7

    .line 183
    sget-object v7, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_GESTURE_STARTED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 184
    .line 185
    invoke-interface {v0, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    move-result v7

    .line 189
    xor-int/2addr v7, v8

    .line 190
    const-string v8, "STATE_GESTURE_COMPLETED set before/without STATE_GESTURE_STARTED."

    .line 191
    .line 192
    invoke-static {v7, p0, v8, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 193
    .line 194
    .line 195
    move-result v7

    .line 196
    goto :goto_1

    .line 197
    :pswitch_6
    const-string v7, "Navigation mode switched mid-gesture."

    .line 198
    .line 199
    invoke-static {v8, p0, v7, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 200
    .line 201
    .line 202
    move-result v7

    .line 203
    goto :goto_1

    .line 204
    :pswitch_7
    const-string v7, "Quick switch from home failed: the TaskViews at the current page index and index 0 were missing."

    .line 205
    .line 206
    invoke-static {v8, p0, v7, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 207
    .line 208
    .line 209
    move-result v7

    .line 210
    goto :goto_1

    .line 211
    :pswitch_8
    const-string v7, "Quick switch from home fallback case: the TaskView at the current page index was missing."

    .line 212
    .line 213
    invoke-static {v8, p0, v7, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 214
    .line 215
    .line 216
    move-result v7

    .line 217
    goto :goto_1

    .line 218
    :pswitch_9
    new-instance v9, Ljava/lang/StringBuilder;

    .line 219
    .line 220
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 221
    .line 222
    .line 223
    invoke-virtual {v7}, Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;->getDuplicateCount()I

    .line 224
    .line 225
    .line 226
    move-result v7

    .line 227
    add-int/2addr v7, v8

    .line 228
    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    const-string v7, " gesture(s) attempted while a requested recents animation is still pending."

    .line 232
    .line 233
    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 234
    .line 235
    .line 236
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object v7

    .line 240
    invoke-static {v8, p0, v7, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 241
    .line 242
    .line 243
    move-result v7

    .line 244
    goto/16 :goto_1

    .line 245
    .line 246
    :pswitch_a
    const-string v7, "invalid velocity on swipe up gesture."

    .line 247
    .line 248
    invoke-static {v8, p0, v7, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 249
    .line 250
    .line 251
    move-result v7

    .line 252
    goto/16 :goto_1

    .line 253
    .line 254
    :pswitch_b
    const-string v7, "SystemUiProxy.mRecentTasks missing, couldn\'t start the recents activity"

    .line 255
    .line 256
    invoke-static {v8, p0, v7, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 257
    .line 258
    .line 259
    move-result v7

    .line 260
    goto/16 :goto_1

    .line 261
    .line 262
    :pswitch_c
    const-string v7, "Launcher destroyed mid-gesture"

    .line 263
    .line 264
    invoke-static {v8, p0, v7, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 265
    .line 266
    .line 267
    move-result v7

    .line 268
    goto/16 :goto_1

    .line 269
    .line 270
    :pswitch_d
    sget-object v7, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->EXPECTING_TASK_APPEARED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 271
    .line 272
    invoke-interface {v0, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 273
    .line 274
    .line 275
    move-result v9

    .line 276
    xor-int/2addr v8, v9

    .line 277
    const-string v9, "onTasksAppeared was not expected to be called"

    .line 278
    .line 279
    invoke-static {v8, p0, v9, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 280
    .line 281
    .line 282
    move-result v8

    .line 283
    or-int/2addr v4, v8

    .line 284
    invoke-interface {v0, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 285
    .line 286
    .line 287
    move-result v8

    .line 288
    if-eqz v8, :cond_1

    .line 289
    .line 290
    invoke-interface {v0, v7}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 291
    .line 292
    .line 293
    sget-object v7, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->TASK_APPEARED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 294
    .line 295
    invoke-interface {v0, v7}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 296
    .line 297
    .line 298
    goto/16 :goto_0

    .line 299
    .line 300
    :pswitch_e
    sget-object v7, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->SET_END_TARGET_HOME:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 301
    .line 302
    invoke-interface {v0, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 303
    .line 304
    .line 305
    move-result v7

    .line 306
    if-eqz v7, :cond_3

    .line 307
    .line 308
    sget-object v7, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->ON_SETTLED_ON_END_TARGET:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 309
    .line 310
    invoke-interface {v0, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 311
    .line 312
    .line 313
    move-result v7

    .line 314
    if-nez v7, :cond_3

    .line 315
    .line 316
    goto :goto_2

    .line 317
    :cond_3
    move v8, v3

    .line 318
    :goto_2
    const-string v7, "recents view scroller animation aborted after setting end target HOME, but before settling on end target."

    .line 319
    .line 320
    invoke-static {v8, p0, v7, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 321
    .line 322
    .line 323
    move-result v7

    .line 324
    goto/16 :goto_1

    .line 325
    .line 326
    :pswitch_f
    sget-object v7, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_SCREENSHOT_CAPTURED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 327
    .line 328
    invoke-interface {v0, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 329
    .line 330
    .line 331
    move-result v7

    .line 332
    xor-int/2addr v7, v8

    .line 333
    const-string v8, "recents activity screenshot was cleaned up before/without STATE_SCREENSHOT_CAPTURED being set."

    .line 334
    .line 335
    invoke-static {v7, p0, v8, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 336
    .line 337
    .line 338
    move-result v7

    .line 339
    goto/16 :goto_1

    .line 340
    .line 341
    :pswitch_10
    sget-object v7, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->START_RECENTS_ANIMATION:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 342
    .line 343
    invoke-interface {v0, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 344
    .line 345
    .line 346
    move-result v7

    .line 347
    xor-int/2addr v7, v8

    .line 348
    const-string v8, "cancelRecentsAnimation called before/without startRecentsAnimation."

    .line 349
    .line 350
    invoke-static {v7, p0, v8, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 351
    .line 352
    .line 353
    move-result v7

    .line 354
    goto/16 :goto_1

    .line 355
    .line 356
    :pswitch_11
    sget-object v7, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->START_RECENTS_ANIMATION:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 357
    .line 358
    invoke-interface {v0, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 359
    .line 360
    .line 361
    move-result v7

    .line 362
    xor-int/2addr v7, v8

    .line 363
    const-string v8, "finishRecentsAnimation called before/without startRecentsAnimation."

    .line 364
    .line 365
    invoke-static {v7, p0, v8, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 366
    .line 367
    .line 368
    move-result v7

    .line 369
    goto/16 :goto_1

    .line 370
    .line 371
    :pswitch_12
    invoke-virtual {v7}, Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;->getTime()J

    .line 372
    .line 373
    .line 374
    move-result-wide v5

    .line 375
    goto/16 :goto_0

    .line 376
    .line 377
    :pswitch_13
    sget-object v7, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->ON_START_RECENTS_ANIMATION:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 378
    .line 379
    invoke-interface {v0, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 380
    .line 381
    .line 382
    move-result v7

    .line 383
    xor-int/2addr v7, v8

    .line 384
    const-string v8, "ON_CANCEL_RECENTS_ANIMATION onAnimationCanceled callback ran before onAnimationStart callback"

    .line 385
    .line 386
    invoke-static {v7, p0, v8, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 387
    .line 388
    .line 389
    move-result v7

    .line 390
    goto/16 :goto_1

    .line 391
    .line 392
    :pswitch_14
    sget-object v7, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->ON_START_RECENTS_ANIMATION:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 393
    .line 394
    invoke-interface {v0, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 395
    .line 396
    .line 397
    move-result v7

    .line 398
    xor-int/2addr v7, v8

    .line 399
    const-string v8, "ON_FINISH_RECENTS_ANIMATION onAnimationFinished callback ran before onAnimationStart callback"

    .line 400
    .line 401
    invoke-static {v7, p0, v8, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 402
    .line 403
    .line 404
    move-result v7

    .line 405
    goto/16 :goto_1

    .line 406
    .line 407
    :pswitch_15
    sget-object v9, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->START_RECENTS_ANIMATION:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 408
    .line 409
    invoke-interface {v0, v9}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 410
    .line 411
    .line 412
    move-result v9

    .line 413
    xor-int/2addr v9, v8

    .line 414
    const-string v10, "ON_START_RECENTS_ANIMATION onAnimationStart callback ran before startRecentsAnimation"

    .line 415
    .line 416
    invoke-static {v9, p0, v10, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 417
    .line 418
    .line 419
    move-result v9

    .line 420
    or-int/2addr v4, v9

    .line 421
    invoke-virtual {v7}, Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;->getTime()J

    .line 422
    .line 423
    .line 424
    move-result-wide v9

    .line 425
    sub-long/2addr v9, v5

    .line 426
    const-wide/16 v5, 0x1f4

    .line 427
    .line 428
    cmp-long v5, v9, v5

    .line 429
    .line 430
    if-lez v5, :cond_4

    .line 431
    .line 432
    goto :goto_3

    .line 433
    :cond_4
    move v8, v3

    .line 434
    :goto_3
    const-string v5, "ON_START_RECENTS_ANIMATION startRecentsAnimation was never called or onAnimationStart callback was called more than 500 ms after startRecentsAnimation."

    .line 435
    .line 436
    invoke-static {v8, p0, v5, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 437
    .line 438
    .line 439
    move-result v5

    .line 440
    or-int/2addr v4, v5

    .line 441
    move-wide v5, v1

    .line 442
    goto/16 :goto_0

    .line 443
    .line 444
    :pswitch_16
    sget-object v7, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->SET_END_TARGET:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 445
    .line 446
    invoke-interface {v0, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 447
    .line 448
    .line 449
    move-result v7

    .line 450
    xor-int/2addr v7, v8

    .line 451
    const-string v8, "onSettledOnEndTarget called before/without setEndTarget."

    .line 452
    .line 453
    invoke-static {v7, p0, v8, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 454
    .line 455
    .line 456
    move-result v7

    .line 457
    goto/16 :goto_1

    .line 458
    .line 459
    :pswitch_17
    sget-object v7, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->MOTION_DOWN:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 460
    .line 461
    invoke-interface {v0, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 462
    .line 463
    .line 464
    move-result v7

    .line 465
    xor-int/2addr v7, v8

    .line 466
    const-string v8, "Motion up detected before/without motion down."

    .line 467
    .line 468
    invoke-static {v7, p0, v8, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 469
    .line 470
    .line 471
    move-result v7

    .line 472
    goto/16 :goto_1

    .line 473
    .line 474
    :cond_5
    sget-object p2, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->MOTION_DOWN:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 475
    .line 476
    invoke-interface {v0, p2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 477
    .line 478
    .line 479
    move-result p2

    .line 480
    xor-int/2addr p2, v8

    .line 481
    const-string v1, "Motion down never detected."

    .line 482
    .line 483
    invoke-static {p2, p0, v1, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 484
    .line 485
    .line 486
    move-result p2

    .line 487
    or-int/2addr p2, v4

    .line 488
    sget-object v1, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->MOTION_UP:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 489
    .line 490
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 491
    .line 492
    .line 493
    move-result v1

    .line 494
    xor-int/2addr v1, v8

    .line 495
    const-string v2, "Motion up never detected."

    .line 496
    .line 497
    invoke-static {v1, p0, v2, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 498
    .line 499
    .line 500
    move-result v1

    .line 501
    or-int/2addr p2, v1

    .line 502
    sget-object v1, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->SET_END_TARGET:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 503
    .line 504
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 505
    .line 506
    .line 507
    move-result v2

    .line 508
    if-eqz v2, :cond_6

    .line 509
    .line 510
    sget-object v2, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->ON_SETTLED_ON_END_TARGET:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 511
    .line 512
    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 513
    .line 514
    .line 515
    move-result v2

    .line 516
    if-nez v2, :cond_6

    .line 517
    .line 518
    move v2, v8

    .line 519
    goto :goto_4

    .line 520
    :cond_6
    move v2, v3

    .line 521
    :goto_4
    const-string v4, "setEndTarget was called, but onSettledOnEndTarget wasn\'t."

    .line 522
    .line 523
    invoke-static {v2, p0, v4, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 524
    .line 525
    .line 526
    move-result v2

    .line 527
    or-int/2addr p2, v2

    .line 528
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 529
    .line 530
    .line 531
    move-result v2

    .line 532
    if-eqz v2, :cond_7

    .line 533
    .line 534
    sget-object v2, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_END_TARGET_ANIMATION_FINISHED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 535
    .line 536
    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 537
    .line 538
    .line 539
    move-result v2

    .line 540
    if-nez v2, :cond_7

    .line 541
    .line 542
    move v2, v8

    .line 543
    goto :goto_5

    .line 544
    :cond_7
    move v2, v3

    .line 545
    :goto_5
    const-string v4, "setEndTarget was called, but STATE_END_TARGET_ANIMATION_FINISHED was never set."

    .line 546
    .line 547
    invoke-static {v2, p0, v4, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 548
    .line 549
    .line 550
    move-result v2

    .line 551
    or-int/2addr p2, v2

    .line 552
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 553
    .line 554
    .line 555
    move-result v1

    .line 556
    if-eqz v1, :cond_8

    .line 557
    .line 558
    sget-object v1, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_RECENTS_SCROLLING_FINISHED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 559
    .line 560
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 561
    .line 562
    .line 563
    move-result v1

    .line 564
    if-nez v1, :cond_8

    .line 565
    .line 566
    move v1, v8

    .line 567
    goto :goto_6

    .line 568
    :cond_8
    move v1, v3

    .line 569
    :goto_6
    const-string v2, "setEndTarget was called, but STATE_RECENTS_SCROLLING_FINISHED was never set."

    .line 570
    .line 571
    invoke-static {v1, p0, v2, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 572
    .line 573
    .line 574
    move-result v1

    .line 575
    or-int/2addr p2, v1

    .line 576
    sget-object v1, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_END_TARGET_ANIMATION_FINISHED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 577
    .line 578
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 579
    .line 580
    .line 581
    move-result v1

    .line 582
    if-eqz v1, :cond_9

    .line 583
    .line 584
    sget-object v1, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_RECENTS_SCROLLING_FINISHED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 585
    .line 586
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 587
    .line 588
    .line 589
    move-result v1

    .line 590
    if-eqz v1, :cond_9

    .line 591
    .line 592
    sget-object v1, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->ON_SETTLED_ON_END_TARGET:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 593
    .line 594
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 595
    .line 596
    .line 597
    move-result v1

    .line 598
    if-nez v1, :cond_9

    .line 599
    .line 600
    move v1, v8

    .line 601
    goto :goto_7

    .line 602
    :cond_9
    move v1, v3

    .line 603
    :goto_7
    const-string v2, "STATE_END_TARGET_ANIMATION_FINISHED and STATE_RECENTS_SCROLLING_FINISHED were set, but onSettledOnEndTarget wasn\'t called."

    .line 604
    .line 605
    invoke-static {v1, p0, v2, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 606
    .line 607
    .line 608
    move-result v1

    .line 609
    or-int/2addr p2, v1

    .line 610
    sget-object v1, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->START_RECENTS_ANIMATION:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 611
    .line 612
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 613
    .line 614
    .line 615
    move-result v2

    .line 616
    if-eqz v2, :cond_a

    .line 617
    .line 618
    sget-object v2, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->FINISH_RECENTS_ANIMATION:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 619
    .line 620
    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 621
    .line 622
    .line 623
    move-result v2

    .line 624
    if-nez v2, :cond_a

    .line 625
    .line 626
    sget-object v2, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->CANCEL_RECENTS_ANIMATION:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 627
    .line 628
    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 629
    .line 630
    .line 631
    move-result v2

    .line 632
    if-nez v2, :cond_a

    .line 633
    .line 634
    move v2, v8

    .line 635
    goto :goto_8

    .line 636
    :cond_a
    move v2, v3

    .line 637
    :goto_8
    const-string v4, "startRecentsAnimation was called, but finishRecentsAnimation and cancelRecentsAnimation weren\'t."

    .line 638
    .line 639
    invoke-static {v2, p0, v4, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 640
    .line 641
    .line 642
    move-result v2

    .line 643
    or-int/2addr p2, v2

    .line 644
    sget-object v2, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_GESTURE_STARTED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 645
    .line 646
    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 647
    .line 648
    .line 649
    move-result v2

    .line 650
    if-eqz v2, :cond_b

    .line 651
    .line 652
    sget-object v2, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_GESTURE_COMPLETED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 653
    .line 654
    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 655
    .line 656
    .line 657
    move-result v2

    .line 658
    if-nez v2, :cond_b

    .line 659
    .line 660
    sget-object v2, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_GESTURE_CANCELLED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 661
    .line 662
    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 663
    .line 664
    .line 665
    move-result v2

    .line 666
    if-nez v2, :cond_b

    .line 667
    .line 668
    move v2, v8

    .line 669
    goto :goto_9

    .line 670
    :cond_b
    move v2, v3

    .line 671
    :goto_9
    const-string v4, "STATE_GESTURE_STARTED was set, but STATE_GESTURE_COMPLETED and STATE_GESTURE_CANCELLED weren\'t."

    .line 672
    .line 673
    invoke-static {v2, p0, v4, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 674
    .line 675
    .line 676
    move-result v2

    .line 677
    or-int/2addr p2, v2

    .line 678
    sget-object v2, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_CAPTURE_SCREENSHOT:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 679
    .line 680
    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 681
    .line 682
    .line 683
    move-result v2

    .line 684
    if-eqz v2, :cond_c

    .line 685
    .line 686
    sget-object v2, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_SCREENSHOT_CAPTURED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 687
    .line 688
    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 689
    .line 690
    .line 691
    move-result v2

    .line 692
    if-nez v2, :cond_c

    .line 693
    .line 694
    move v2, v8

    .line 695
    goto :goto_a

    .line 696
    :cond_c
    move v2, v3

    .line 697
    :goto_a
    const-string v4, "STATE_CAPTURE_SCREENSHOT was set, but STATE_SCREENSHOT_CAPTURED wasn\'t."

    .line 698
    .line 699
    invoke-static {v2, p0, v4, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 700
    .line 701
    .line 702
    move-result v2

    .line 703
    or-int/2addr p2, v2

    .line 704
    sget-object v2, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->SET_ON_PAGE_TRANSITION_END_CALLBACK:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 705
    .line 706
    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 707
    .line 708
    .line 709
    move-result v2

    .line 710
    if-eqz v2, :cond_d

    .line 711
    .line 712
    sget-object v2, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_RECENTS_SCROLLING_FINISHED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 713
    .line 714
    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 715
    .line 716
    .line 717
    move-result v2

    .line 718
    if-nez v2, :cond_d

    .line 719
    .line 720
    move v2, v8

    .line 721
    goto :goto_b

    .line 722
    :cond_d
    move v2, v3

    .line 723
    :goto_b
    const-string v4, "setOnPageTransitionEndCallback called, but STATE_RECENTS_SCROLLING_FINISHED wasn\'t set."

    .line 724
    .line 725
    invoke-static {v2, p0, v4, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 726
    .line 727
    .line 728
    move-result v2

    .line 729
    or-int/2addr p2, v2

    .line 730
    sget-object v2, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->FLAG_USING_OTHER_ACTIVITY_INPUT_CONSUMER:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 731
    .line 732
    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 733
    .line 734
    .line 735
    move-result v2

    .line 736
    if-eqz v2, :cond_e

    .line 737
    .line 738
    sget-object v2, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->CANCEL_CURRENT_ANIMATION:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 739
    .line 740
    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 741
    .line 742
    .line 743
    move-result v2

    .line 744
    if-nez v2, :cond_e

    .line 745
    .line 746
    sget-object v2, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_HANDLER_INVALIDATED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 747
    .line 748
    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 749
    .line 750
    .line 751
    move-result v2

    .line 752
    if-nez v2, :cond_e

    .line 753
    .line 754
    move v2, v8

    .line 755
    goto :goto_c

    .line 756
    :cond_e
    move v2, v3

    .line 757
    :goto_c
    const-string v4, "AbsSwipeUpHandler.cancelCurrentAnimation wasn\'t called and STATE_HANDLER_INVALIDATED wasn\'t set."

    .line 758
    .line 759
    invoke-static {v2, p0, v4, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 760
    .line 761
    .line 762
    move-result v2

    .line 763
    or-int/2addr p2, v2

    .line 764
    sget-object v2, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_RECENTS_ANIMATION_CANCELED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 765
    .line 766
    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 767
    .line 768
    .line 769
    move-result v2

    .line 770
    if-eqz v2, :cond_f

    .line 771
    .line 772
    sget-object v2, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->CLEANUP_SCREENSHOT:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 773
    .line 774
    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 775
    .line 776
    .line 777
    move-result v2

    .line 778
    if-nez v2, :cond_f

    .line 779
    .line 780
    move v2, v8

    .line 781
    goto :goto_d

    .line 782
    :cond_f
    move v2, v3

    .line 783
    :goto_d
    const-string v4, "STATE_RECENTS_ANIMATION_CANCELED was set but the task screenshot wasn\'t cleaned up."

    .line 784
    .line 785
    invoke-static {v2, p0, v4, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 786
    .line 787
    .line 788
    move-result v2

    .line 789
    or-int/2addr p2, v2

    .line 790
    sget-object v2, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->EXPECTING_TASK_APPEARED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 791
    .line 792
    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 793
    .line 794
    .line 795
    move-result v2

    .line 796
    if-eqz v2, :cond_10

    .line 797
    .line 798
    sget-object v2, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->TASK_APPEARED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 799
    .line 800
    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 801
    .line 802
    .line 803
    move-result v2

    .line 804
    if-nez v2, :cond_10

    .line 805
    .line 806
    move v2, v8

    .line 807
    goto :goto_e

    .line 808
    :cond_10
    move v2, v3

    .line 809
    :goto_e
    const-string v4, "onTaskAppeared was expected to be called but wasn\'t."

    .line 810
    .line 811
    invoke-static {v2, p0, v4, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 812
    .line 813
    .line 814
    move-result v2

    .line 815
    or-int/2addr p2, v2

    .line 816
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 817
    .line 818
    .line 819
    move-result v1

    .line 820
    if-eqz v1, :cond_11

    .line 821
    .line 822
    sget-object v1, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->ON_START_RECENTS_ANIMATION:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 823
    .line 824
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 825
    .line 826
    .line 827
    move-result v1

    .line 828
    if-nez v1, :cond_11

    .line 829
    .line 830
    move v1, v8

    .line 831
    goto :goto_f

    .line 832
    :cond_11
    move v1, v3

    .line 833
    :goto_f
    const-string v2, "startRecentAnimation was called but onAnimationStart callback was not"

    .line 834
    .line 835
    invoke-static {v1, p0, v2, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 836
    .line 837
    .line 838
    move-result v1

    .line 839
    or-int/2addr p2, v1

    .line 840
    sget-object v1, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->FINISH_RECENTS_ANIMATION:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 841
    .line 842
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 843
    .line 844
    .line 845
    move-result v1

    .line 846
    if-eqz v1, :cond_12

    .line 847
    .line 848
    sget-object v1, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->ON_FINISH_RECENTS_ANIMATION:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 849
    .line 850
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 851
    .line 852
    .line 853
    move-result v1

    .line 854
    if-nez v1, :cond_12

    .line 855
    .line 856
    move v1, v8

    .line 857
    goto :goto_10

    .line 858
    :cond_12
    move v1, v3

    .line 859
    :goto_10
    const-string v2, "finishController was called but onAnimationFinished callback was not"

    .line 860
    .line 861
    invoke-static {v1, p0, v2, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 862
    .line 863
    .line 864
    move-result v1

    .line 865
    or-int/2addr p2, v1

    .line 866
    sget-object v1, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->CANCEL_RECENTS_ANIMATION:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 867
    .line 868
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 869
    .line 870
    .line 871
    move-result v1

    .line 872
    if-eqz v1, :cond_13

    .line 873
    .line 874
    sget-object v1, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->ON_CANCEL_RECENTS_ANIMATION:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 875
    .line 876
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 877
    .line 878
    .line 879
    move-result v0

    .line 880
    if-nez v0, :cond_13

    .line 881
    .line 882
    move v3, v8

    .line 883
    :cond_13
    const-string v0, "onRecentsAnimationCanceled was called but onAnimationCanceled was not"

    .line 884
    .line 885
    invoke-static {v3, p0, v0, p1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    .line 886
    .line 887
    .line 888
    move-result v0

    .line 889
    or-int/2addr p2, v0

    .line 890
    if-nez p2, :cond_14

    .line 891
    .line 892
    new-instance p2, Ljava/lang/StringBuilder;

    .line 893
    .line 894
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 895
    .line 896
    .line 897
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 898
    .line 899
    .line 900
    const-string p0, "\tNo errors detected."

    .line 901
    .line 902
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 903
    .line 904
    .line 905
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 906
    .line 907
    .line 908
    move-result-object p0

    .line 909
    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 910
    .line 911
    .line 912
    :cond_14
    return-void

    .line 913
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_17
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_0
        :pswitch_0
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_0
        :pswitch_0
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_0
        :pswitch_5
        :pswitch_4
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private static printErrorIfTrue(ZLjava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)Z
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p1, "\t- "

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p3, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    return p0
.end method
