.class public Lcom/android/launcher3/uioverrides/touchcontrollers/B;
.super Lcom/android/launcher3/touch/d;
.source "SearchTouchController.java"


# direct methods
.method public constructor <init>(Lcom/android/launcher3/C2;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/touch/H;->w:Lcom/android/launcher3/touch/H$c;

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/touch/d;-><init>(Lcom/android/launcher3/C2;Lcom/android/launcher3/touch/H$c;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public c()V
    .locals 5

    .line 1
    const-string v0, "openSearch!!!"

    .line 2
    .line 3
    const-string v1, "SearchTouchController"

    .line 4
    .line 5
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    .line 9
    .line 10
    const-string v2, "com.zte.mifavor.zsearch.SearchMainAty"

    .line 11
    .line 12
    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const/high16 v2, 0x10000000

    .line 16
    .line 17
    invoke-virtual {v0, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    const-string v2, "from"

    .line 21
    .line 22
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    new-instance v2, Ljava/lang/ref/WeakReference;

    .line 26
    .line 27
    iget-object v3, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 28
    .line 29
    invoke-direct {v2, v3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    if-nez v3, :cond_0

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_0
    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    check-cast v2, Landroid/content/Context;

    .line 44
    .line 45
    const v3, 0x7f01004d

    .line 46
    .line 47
    .line 48
    const/4 v4, 0x0

    .line 49
    invoke-static {v2, v3, v4}, Landroid/app/ActivityOptions;->makeCustomAnimation(Landroid/content/Context;II)Landroid/app/ActivityOptions;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 54
    .line 55
    invoke-virtual {v2}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-virtual {p0, v0, v2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;Landroid/os/Bundle;)V

    .line 60
    .line 61
    .line 62
    invoke-static {}, Lx1/S;->q()Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    if-eqz p0, :cond_1

    .line 67
    .line 68
    invoke-static {}, Lh1/a;->m()V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :catch_0
    move-exception p0

    .line 73
    goto :goto_0

    .line 74
    :cond_1
    invoke-static {}, Lh1/a;->s()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 81
    .line 82
    .line 83
    const-string v2, "jumpToSearch error "

    .line 84
    .line 85
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    .line 101
    .line 102
    :goto_1
    return-void
.end method

.method protected canInterceptTouch(Landroid/view/MotionEvent;)Z
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->g2()Lcom/android/launcher3/D3;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    const-string v2, "SearchTouchController"

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->g2()Lcom/android/launcher3/D3;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lcom/android/launcher3/D3;->t0()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    const-string p0, "canInterceptTouch return false, because (!mLauncher.getModel().isModelLoadedWithoutLock())"

    .line 25
    .line 26
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    return v1

    .line 30
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 31
    .line 32
    sget-object v3, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 33
    .line 34
    invoke-interface {v0, v3}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_8

    .line 39
    .line 40
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 41
    .line 42
    sget-object v3, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 43
    .line 44
    invoke-interface {v0, v3}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    goto/16 :goto_0

    .line 51
    .line 52
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 53
    .line 54
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->O0:Z

    .line 59
    .line 60
    if-eqz v0, :cond_2

    .line 61
    .line 62
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 63
    .line 64
    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    const v3, 0x7f070a91

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    iget-object v3, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 76
    .line 77
    invoke-virtual {v3}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    iget-object v3, v3, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 82
    .line 83
    iget v3, v3, Lcom/android/launcher3/r4;->Q:I

    .line 84
    .line 85
    add-int/2addr v0, v3

    .line 86
    int-to-float v0, v0

    .line 87
    iget-object v3, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 88
    .line 89
    sget-object v4, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 90
    .line 91
    invoke-interface {v3, v4}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 92
    .line 93
    .line 94
    move-result v3

    .line 95
    if-eqz v3, :cond_3

    .line 96
    .line 97
    iget-object v3, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 98
    .line 99
    invoke-virtual {v3}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    invoke-virtual {v3}, Lcom/android/launcher3/h0;->T0()Z

    .line 104
    .line 105
    .line 106
    move-result v3

    .line 107
    if-nez v3, :cond_3

    .line 108
    .line 109
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 110
    .line 111
    .line 112
    move-result v3

    .line 113
    add-float/2addr v3, v0

    .line 114
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    cmpl-float v0, v3, v0

    .line 119
    .line 120
    if-eqz v0, :cond_3

    .line 121
    .line 122
    const-string p0, "canInterceptTouch return false, because (mLauncher.isInState(NORMAL) && !mLauncher.getDeviceProfile().isVerticalBarLayout() && (ev.getY() + extraHeight) != ev.getRawY())"

    .line 123
    .line 124
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    .line 126
    .line 127
    return v1

    .line 128
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 129
    .line 130
    sget-object v3, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 131
    .line 132
    invoke-interface {v0, v3}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    if-eqz v0, :cond_3

    .line 137
    .line 138
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 143
    .line 144
    .line 145
    move-result v3

    .line 146
    cmpl-float v0, v0, v3

    .line 147
    .line 148
    if-eqz v0, :cond_3

    .line 149
    .line 150
    const-string p0, "canInterceptTouch return false, because (mLauncher.isInState(NORMAL) && ev.getY() != ev.getRawY())"

    .line 151
    .line 152
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 153
    .line 154
    .line 155
    return v1

    .line 156
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 157
    .line 158
    const/4 v3, 0x1

    .line 159
    if-eqz v0, :cond_4

    .line 160
    .line 161
    const-string p0, "canInterceptTouch return true, because (mCurrentAnimation != null)"

    .line 162
    .line 163
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 164
    .line 165
    .line 166
    return v3

    .line 167
    :cond_4
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 168
    .line 169
    invoke-static {v0}, Lcom/android/launcher3/a;->getTopOpenView(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/a;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    if-eqz v0, :cond_5

    .line 174
    .line 175
    const-string p0, "canInterceptTouch return false, because (AbstractFloatingView.getTopOpenView(mLauncher) != null)"

    .line 176
    .line 177
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 178
    .line 179
    .line 180
    return v1

    .line 181
    :cond_5
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 182
    .line 183
    sget-object v4, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 184
    .line 185
    invoke-interface {v0, v4}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    if-nez v0, :cond_6

    .line 190
    .line 191
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 192
    .line 193
    sget-object v4, Lcom/android/launcher3/V3;->C:Lcom/android/launcher3/V3;

    .line 194
    .line 195
    invoke-interface {v0, v4}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 196
    .line 197
    .line 198
    move-result v0

    .line 199
    if-nez v0, :cond_6

    .line 200
    .line 201
    const-string p0, "canInterceptTouch return false, because (!mLauncher.isInState(NORMAL) && !mLauncher.isInState(GLOBAL_SEARCH))"

    .line 202
    .line 203
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 204
    .line 205
    .line 206
    return v1

    .line 207
    :cond_6
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 208
    .line 209
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    sget-object v4, Lcom/android/quickstep/RotationTouchHelper;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 214
    .line 215
    iget-object v5, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 216
    .line 217
    invoke-virtual {v4, v5}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 218
    .line 219
    .line 220
    move-result-object v4

    .line 221
    check-cast v4, Lcom/android/quickstep/RotationTouchHelper;

    .line 222
    .line 223
    invoke-virtual {v4}, Lcom/android/quickstep/RotationTouchHelper;->getGesturalHeight()I

    .line 224
    .line 225
    .line 226
    move-result v4

    .line 227
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 228
    .line 229
    .line 230
    move-result v5

    .line 231
    iget-object v6, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 232
    .line 233
    invoke-virtual {v6}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 234
    .line 235
    .line 236
    move-result-object v6

    .line 237
    invoke-virtual {v6}, Landroid/widget/FrameLayout;->getHeight()I

    .line 238
    .line 239
    .line 240
    move-result v6

    .line 241
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->y0()Landroid/graphics/Rect;

    .line 242
    .line 243
    .line 244
    move-result-object v0

    .line 245
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 246
    .line 247
    invoke-static {v4, v0}, Ljava/lang/Math;->max(II)I

    .line 248
    .line 249
    .line 250
    move-result v0

    .line 251
    sub-int/2addr v6, v0

    .line 252
    int-to-float v0, v6

    .line 253
    cmpl-float v0, v5, v0

    .line 254
    .line 255
    if-lez v0, :cond_7

    .line 256
    .line 257
    new-instance v0, Ljava/lang/StringBuilder;

    .line 258
    .line 259
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 260
    .line 261
    .line 262
    const-string v3, "canInterceptTouch, Y: "

    .line 263
    .line 264
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 265
    .line 266
    .line 267
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 268
    .line 269
    .line 270
    move-result p1

    .line 271
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 272
    .line 273
    .line 274
    const-string p1, " Height:"

    .line 275
    .line 276
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 277
    .line 278
    .line 279
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 280
    .line 281
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 282
    .line 283
    .line 284
    move-result-object p0

    .line 285
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getHeight()I

    .line 286
    .line 287
    .line 288
    move-result p0

    .line 289
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 290
    .line 291
    .line 292
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 293
    .line 294
    .line 295
    move-result-object p0

    .line 296
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 297
    .line 298
    .line 299
    return v1

    .line 300
    :cond_7
    const-string p0, "canInterceptTouch!!!"

    .line 301
    .line 302
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 303
    .line 304
    .line 305
    return v3

    .line 306
    :cond_8
    :goto_0
    const-string p0, "canInterceptTouch return false, because (mLauncher.isInState(OVERVIEW) || mLauncher.isInState(MENU_OVERVIEW))"

    .line 307
    .line 308
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 309
    .line 310
    .line 311
    return v1
.end method

.method protected getConfigForStates(Lcom/android/launcher3/V3;Lcom/android/launcher3/V3;)LQ1/f;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "getConfigForStates fromState="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, ", toState="

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "SearchTouchController"

    .line 27
    .line 28
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/touch/d;->getConfigForStates(Lcom/android/launcher3/V3;Lcom/android/launcher3/V3;)LQ1/f;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method protected getTargetState(Lcom/android/launcher3/V3;Z)Lcom/android/launcher3/V3;
    .locals 2

    .line 1
    sget-object p0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 2
    .line 3
    sget-boolean v0, Lcom/android/quickstep/views/RecentsView;->sGestureActive:Z

    .line 4
    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    if-ne p1, p0, :cond_0

    .line 8
    .line 9
    if-nez p2, :cond_0

    .line 10
    .line 11
    sget-object p0, Lcom/android/launcher3/V3;->C:Lcom/android/launcher3/V3;

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    sget-object v0, Lcom/android/launcher3/V3;->C:Lcom/android/launcher3/V3;

    .line 15
    .line 16
    :cond_1
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 19
    .line 20
    .line 21
    const-string v1, "getTargetState  fromState="

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string p1, ", isDragTowardPositive="

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string p1, ", stateTemp="

    .line 38
    .line 39
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string p1, ", sGestureActive="

    .line 46
    .line 47
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    sget-boolean p1, Lcom/android/quickstep/views/RecentsView;->sGestureActive:Z

    .line 51
    .line 52
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    const-string p2, "SearchTouchController"

    .line 60
    .line 61
    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    return-object p0
.end method

.method protected goToTargetState(Lcom/android/launcher3/V3;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/touch/d;->goToTargetState(Lcom/android/launcher3/V3;)V

    .line 2
    .line 3
    .line 4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v0, "goToTargetState targetState="

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string p1, "SearchTouchController"

    .line 22
    .line 23
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method protected initCurrentAnimation()F
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/touch/d;->getShiftRange()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x40000000    # 2.0f

    .line 6
    .line 7
    mul-float/2addr v1, v0

    .line 8
    float-to-long v1, v1

    .line 9
    iget-object v3, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 10
    .line 11
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    iget-object v4, p0, Lcom/android/launcher3/touch/d;->mToState:Lcom/android/launcher3/V3;

    .line 16
    .line 17
    invoke-virtual {v3, v4, v1, v2}, Lcom/android/launcher3/statemanager/d;->n(Lcom/android/launcher3/statemanager/a;J)Lcom/android/launcher3/anim/q;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iput-object v1, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 22
    .line 23
    new-instance v1, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 26
    .line 27
    .line 28
    const-string v2, "initCurrentAnimation "

    .line 29
    .line 30
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    iget-object v2, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    const-string v2, "SearchTouchController"

    .line 43
    .line 44
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Lcom/android/launcher3/touch/d;->mFromState:Lcom/android/launcher3/V3;

    .line 48
    .line 49
    iget-object v2, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 50
    .line 51
    invoke-virtual {v1, v2}, Lcom/android/launcher3/V3;->s(Lcom/android/launcher3/C2;)F

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    mul-float/2addr v1, v0

    .line 56
    iget-object v2, p0, Lcom/android/launcher3/touch/d;->mToState:Lcom/android/launcher3/V3;

    .line 57
    .line 58
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 59
    .line 60
    invoke-virtual {v2, p0}, Lcom/android/launcher3/V3;->s(Lcom/android/launcher3/C2;)F

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    mul-float/2addr p0, v0

    .line 65
    sub-float/2addr p0, v1

    .line 66
    const/high16 v0, 0x3f800000    # 1.0f

    .line 67
    .line 68
    div-float/2addr v0, p0

    .line 69
    return v0
.end method

.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget-object v2, Lcom/android/launcher3/q4$a;->h:Lcom/android/launcher3/q4$a;

    .line 17
    .line 18
    invoke-virtual {v0, v2}, Lcom/android/launcher3/menu/c;->q(Lcom/android/launcher3/q4$a;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    return v1

    .line 25
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const/4 v2, 0x1

    .line 30
    const-string v3, "SearchTouchController"

    .line 31
    .line 32
    if-le v0, v2, :cond_1

    .line 33
    .line 34
    const-string p0, "onControllerInterceptTouchEvent return false, because the pointer count is more than 1 !!"

    .line 35
    .line 36
    invoke-static {v3, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    return v1

    .line 40
    :cond_1
    invoke-static {}, Lx1/O;->k2()Ljava/lang/Boolean;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_2

    .line 49
    .line 50
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 51
    .line 52
    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-static {v0}, Lcom/android/quickstep/util/InputInjectHelper;->getInstance(Landroid/content/Context;)Lcom/android/quickstep/util/InputInjectHelper;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Lcom/android/quickstep/util/InputInjectHelper;->hasInjectedDown()Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-eqz v0, :cond_2

    .line 65
    .line 66
    const-string p0, "onControllerInterceptTouchEvent: hasInjectedDown return false!"

    .line 67
    .line 68
    invoke-static {v3, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    return v1

    .line 72
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 73
    .line 74
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0}, Lcom/android/launcher3/dragndrop/j;->G()Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-eqz v0, :cond_3

    .line 83
    .line 84
    const-string p0, "onControllerInterceptTouchEvent: isDragging return false!"

    .line 85
    .line 86
    invoke-static {v3, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    .line 88
    .line 89
    return v1

    .line 90
    :cond_3
    invoke-super {p0, p1}, Lcom/android/launcher3/touch/d;->onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 91
    .line 92
    .line 93
    move-result p0

    .line 94
    return p0
.end method

.method public onDrag(F)Z
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onDrag displacement="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SearchTouchController"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2
    invoke-super {p0, p1}, Lcom/android/launcher3/touch/d;->onDrag(F)Z

    move-result p0

    return p0
.end method

.method public onDrag(FLandroid/view/MotionEvent;)Z
    .locals 2

    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onDrag displacement="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ", ev="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SearchTouchController"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/touch/d;->onDrag(FLandroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public onDragEnd(F)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/touch/d;->onDragEnd(F)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v0, "onDragEnd progress="

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/anim/q;->q()F

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string p1, "SearchTouchController"

    .line 28
    .line 29
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public onDragStart(ZF)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/touch/d;->onDragStart(ZF)V

    .line 2
    .line 3
    .line 4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v0, "onDragStart start="

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string p1, ", startDisplacement="

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string p1, "SearchTouchController"

    .line 30
    .line 31
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method protected onReachedFinalState(Lcom/android/launcher3/V3;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/touch/d;->onReachedFinalState(Lcom/android/launcher3/V3;)V

    .line 2
    .line 3
    .line 4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v0, "onReachedFinalState newToState="

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string p1, "SearchTouchController"

    .line 22
    .line 23
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method protected onReinitToState(Lcom/android/launcher3/V3;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/touch/d;->onReinitToState(Lcom/android/launcher3/V3;)V

    .line 2
    .line 3
    .line 4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v0, "onReinitToState newToState="

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string p1, "SearchTouchController"

    .line 22
    .line 23
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method protected onSwipeInteractionCompleted(Lcom/android/launcher3/V3;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/touch/d;->onSwipeInteractionCompleted(Lcom/android/launcher3/V3;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v1, "onSwipeInteractionCompleted targetState="

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "SearchTouchController"

    .line 22
    .line 23
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    sget-object v0, Lcom/android/launcher3/V3;->C:Lcom/android/launcher3/V3;

    .line 27
    .line 28
    if-ne p1, v0, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/B;->c()V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    sget-object p1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 40
    .line 41
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    const-wide/16 v0, 0x258

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    const-wide/16 v0, 0x1f4

    .line 51
    .line 52
    :goto_0
    invoke-virtual {p0, p1, v0, v1}, Lcom/android/launcher3/statemanager/d;->I(Lcom/android/launcher3/statemanager/a;J)V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method

.method protected updateProgress(F)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/touch/d;->updateProgress(F)V

    .line 2
    .line 3
    .line 4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v0, "updateProgress fraction="

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string p1, "SearchTouchController"

    .line 22
    .line 23
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method protected updateSwipeCompleteAnimation(Landroid/animation/ValueAnimator;JLcom/android/launcher3/V3;FZ)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p6}, Lcom/android/launcher3/touch/d;->updateSwipeCompleteAnimation(Landroid/animation/ValueAnimator;JLcom/android/launcher3/V3;FZ)V

    .line 2
    .line 3
    .line 4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string p1, "updateSwipeCompleteAnimation targetState="

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string p1, "SearchTouchController"

    .line 22
    .line 23
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    return-void
.end method
