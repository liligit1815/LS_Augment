.class public Lcom/android/launcher3/popup/P$f;
.super Lcom/android/launcher3/popup/P;
.source "SystemShortcut.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/popup/P;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "f"
.end annotation


# direct methods
.method public constructor <init>(Lcom/android/launcher3/v;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V
    .locals 8

    .line 1
    const-string v3, "shortcut_common_bg"

    .line 2
    .line 3
    const v4, 0x7f14008f

    .line 4
    .line 5
    .line 6
    const v1, 0x7f080d20

    .line 7
    .line 8
    .line 9
    const-string v2, "remove_circle"

    .line 10
    .line 11
    move-object v0, p0

    .line 12
    move-object v5, p1

    .line 13
    move-object v6, p2

    .line 14
    move-object v7, p3

    .line 15
    invoke-direct/range {v0 .. v7}, Lcom/android/launcher3/popup/P;-><init>(ILjava/lang/String;Ljava/lang/String;ILcom/android/launcher3/views/k;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method static bridge synthetic J(Lcom/android/launcher3/popup/P$f;Lcom/android/launcher3/C2;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/popup/P$f;->K(Lcom/android/launcher3/C2;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private K(Lcom/android/launcher3/C2;Landroid/view/View;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/android/launcher3/model/data/I;

    .line 4
    .line 5
    if-eqz v1, :cond_1

    .line 6
    .line 7
    move-object v1, v0

    .line 8
    check-cast v1, Lcom/android/launcher3/model/data/I;

    .line 9
    .line 10
    iget v1, v1, Lcom/android/launcher3/model/data/I;->m:I

    .line 11
    .line 12
    const/4 v2, 0x2

    .line 13
    if-ne v1, v2, :cond_1

    .line 14
    .line 15
    check-cast v0, Lcom/android/launcher3/model/data/I;

    .line 16
    .line 17
    iget-object v1, v0, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 18
    .line 19
    invoke-virtual {v1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    iget-object v0, v0, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    iget-object v0, v0, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-nez v1, :cond_1

    .line 47
    .line 48
    new-instance v1, Lcom/android/launcher3/X0;

    .line 49
    .line 50
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-direct {v1, v2}, Lcom/android/launcher3/X0;-><init>(Landroid/content/Context;)V

    .line 55
    .line 56
    .line 57
    iget-object v2, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 58
    .line 59
    check-cast v2, Lcom/android/launcher3/model/data/I;

    .line 60
    .line 61
    invoke-virtual {v1, v0, v2}, Lcom/android/launcher3/X0;->s(Ljava/lang/String;Lcom/android/launcher3/model/data/I;)V

    .line 62
    .line 63
    .line 64
    :cond_1
    invoke-static {}, Lx1/O;->C3()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    const v1, 0x7f14021a

    .line 69
    .line 70
    .line 71
    const/4 v2, 0x1

    .line 72
    if-eqz v0, :cond_2

    .line 73
    .line 74
    iget-object v0, p0, Lcom/android/launcher3/popup/P;->mOriginalView:Landroid/view/View;

    .line 75
    .line 76
    instance-of v3, v0, Lcom/android/launcher3/BubbleTextView;

    .line 77
    .line 78
    if-eqz v3, :cond_2

    .line 79
    .line 80
    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    instance-of v0, v0, Lcom/android/launcher3/model/data/I;

    .line 85
    .line 86
    if-eqz v0, :cond_2

    .line 87
    .line 88
    iget-object v0, p0, Lcom/android/launcher3/popup/P;->mOriginalView:Landroid/view/View;

    .line 89
    .line 90
    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    check-cast v0, Lcom/android/launcher3/model/data/I;

    .line 95
    .line 96
    if-eqz v0, :cond_2

    .line 97
    .line 98
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    if-eqz v3, :cond_2

    .line 103
    .line 104
    iget-object v3, p0, Lcom/android/launcher3/popup/P;->mOriginalView:Landroid/view/View;

    .line 105
    .line 106
    check-cast v3, Lcom/android/launcher3/BubbleTextView;

    .line 107
    .line 108
    invoke-static {v3}, Lp1/f;->y(Landroid/view/View;)Z

    .line 109
    .line 110
    .line 111
    move-result v3

    .line 112
    if-eqz v3, :cond_2

    .line 113
    .line 114
    invoke-virtual {p1, v0, v2}, Lcom/android/launcher3/C2;->Q3(Lcom/android/launcher3/model/data/I;Z)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    const/4 p1, -0x1

    .line 122
    invoke-static {p0, v1, p1}, Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;->X(Landroid/view/View;II)Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-virtual {p0, v2}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->J(I)Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    check-cast p0, Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;

    .line 131
    .line 132
    invoke-virtual {p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->C()Landroid/view/View;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    const p2, 0x7f081988

    .line 137
    .line 138
    .line 139
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;->O()V

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 147
    .line 148
    iget v3, v0, Lcom/android/launcher3/model/data/y;->container:I

    .line 149
    .line 150
    iget v0, v0, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 151
    .line 152
    invoke-virtual {p1, v3, v0}, Lcom/android/launcher3/C2;->L1(II)Lcom/android/launcher3/CellLayout;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 157
    .line 158
    .line 159
    move-result-object v3

    .line 160
    iget-boolean v3, v3, Lcom/android/launcher3/X3;->B0:Z

    .line 161
    .line 162
    if-eqz v3, :cond_4

    .line 163
    .line 164
    iget-object v3, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 165
    .line 166
    iget v3, v3, Lcom/android/launcher3/model/data/y;->container:I

    .line 167
    .line 168
    if-lez v3, :cond_4

    .line 169
    .line 170
    invoke-static {p1}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    const/4 v3, 0x0

    .line 175
    if-nez v0, :cond_3

    .line 176
    .line 177
    iget-object v0, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 178
    .line 179
    invoke-virtual {p1, v3, v0, v2}, Lcom/android/launcher3/C2;->n4(Landroid/view/View;Lcom/android/launcher3/model/data/y;Z)Z

    .line 180
    .line 181
    .line 182
    invoke-static {}, Lx1/Y;->i()Ljava/lang/Boolean;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 187
    .line 188
    .line 189
    move-result v0

    .line 190
    if-eqz v0, :cond_3

    .line 191
    .line 192
    invoke-static {p1}, Lx1/Y;->j(Landroid/content/Context;)Z

    .line 193
    .line 194
    .line 195
    move-result v0

    .line 196
    if-eqz v0, :cond_3

    .line 197
    .line 198
    iget-object v0, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 199
    .line 200
    invoke-static {p1, v0}, Lcom/android/launcher3/resource/h1;->z0(Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/y;)V

    .line 201
    .line 202
    .line 203
    :cond_3
    move-object v0, v3

    .line 204
    :cond_4
    if-eqz v0, :cond_5

    .line 205
    .line 206
    iget-object v3, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 207
    .line 208
    iget v4, v3, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 209
    .line 210
    iget v3, v3, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 211
    .line 212
    invoke-virtual {v0, v4, v3}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 213
    .line 214
    .line 215
    move-result-object v3

    .line 216
    if-eqz v3, :cond_5

    .line 217
    .line 218
    iget-object v3, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 219
    .line 220
    iget v4, v3, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 221
    .line 222
    iget v3, v3, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 223
    .line 224
    invoke-virtual {v0, v4, v3}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    const/4 v3, 0x4

    .line 229
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 230
    .line 231
    .line 232
    iget-object p0, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 233
    .line 234
    invoke-virtual {p1, v0, p0, v2}, Lcom/android/launcher3/C2;->n4(Landroid/view/View;Lcom/android/launcher3/model/data/y;Z)Z

    .line 235
    .line 236
    .line 237
    goto :goto_1

    .line 238
    :cond_5
    invoke-static {p1}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    if-eqz v0, :cond_6

    .line 243
    .line 244
    iget-object v0, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 245
    .line 246
    instance-of v0, v0, Lcom/android/launcher3/model/data/I;

    .line 247
    .line 248
    if-eqz v0, :cond_6

    .line 249
    .line 250
    invoke-static {p1}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 251
    .line 252
    .line 253
    move-result-object v0

    .line 254
    iget-object v3, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 255
    .line 256
    iget v3, v3, Lcom/android/launcher3/model/data/y;->container:I

    .line 257
    .line 258
    invoke-virtual {v0}, Lcom/android/launcher3/folder/Folder;->getInfo()Lcom/android/launcher3/model/data/p;

    .line 259
    .line 260
    .line 261
    move-result-object v4

    .line 262
    iget v4, v4, Lcom/android/launcher3/model/data/y;->id:I

    .line 263
    .line 264
    if-ne v3, v4, :cond_6

    .line 265
    .line 266
    iget-object v3, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 267
    .line 268
    filled-new-array {v3}, [Lcom/android/launcher3/model/data/y;

    .line 269
    .line 270
    .line 271
    move-result-object v3

    .line 272
    invoke-virtual {v0, v2, v3}, Lcom/android/launcher3/folder/Folder;->W1(Z[Lcom/android/launcher3/model/data/y;)V

    .line 273
    .line 274
    .line 275
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    .line 276
    .line 277
    .line 278
    move-result-object v0

    .line 279
    iget-object v2, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 280
    .line 281
    const-string v3, "click delete SystemShortcut"

    .line 282
    .line 283
    invoke-virtual {v0, v2, v3}, Lz1/J3;->B(Lcom/android/launcher3/model/data/y;Ljava/lang/String;)V

    .line 284
    .line 285
    .line 286
    invoke-static {}, Lx1/Y;->i()Ljava/lang/Boolean;

    .line 287
    .line 288
    .line 289
    move-result-object v0

    .line 290
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 291
    .line 292
    .line 293
    move-result v0

    .line 294
    if-eqz v0, :cond_6

    .line 295
    .line 296
    invoke-static {p1}, Lx1/Y;->j(Landroid/content/Context;)Z

    .line 297
    .line 298
    .line 299
    move-result v0

    .line 300
    if-eqz v0, :cond_6

    .line 301
    .line 302
    iget-object p0, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 303
    .line 304
    invoke-static {p1, p0}, Lcom/android/launcher3/resource/h1;->z0(Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/y;)V

    .line 305
    .line 306
    .line 307
    :cond_6
    :goto_1
    sget-object p0, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 308
    .line 309
    invoke-interface {p1, p0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 310
    .line 311
    .line 312
    move-result p0

    .line 313
    if-eqz p0, :cond_7

    .line 314
    .line 315
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 316
    .line 317
    .line 318
    move-result-object p0

    .line 319
    sget-object v0, Lcom/android/launcher3/q4$a;->k:Lcom/android/launcher3/q4$a;

    .line 320
    .line 321
    invoke-virtual {p0, v0}, Lcom/android/launcher3/menu/c;->q(Lcom/android/launcher3/q4$a;)Z

    .line 322
    .line 323
    .line 324
    move-result p0

    .line 325
    if-nez p0, :cond_8

    .line 326
    .line 327
    :cond_7
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 328
    .line 329
    .line 330
    move-result-object p0

    .line 331
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->i3()V

    .line 332
    .line 333
    .line 334
    :cond_8
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 335
    .line 336
    .line 337
    move-result-object p0

    .line 338
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 339
    .line 340
    .line 341
    move-result-object p2

    .line 342
    invoke-virtual {p2, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 343
    .line 344
    .line 345
    move-result-object p2

    .line 346
    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->announceForAccessibility(Ljava/lang/CharSequence;)V

    .line 347
    .line 348
    .line 349
    const/4 p0, 0x0

    .line 350
    invoke-static {p1, v1, p0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    .line 351
    .line 352
    .line 353
    move-result-object p0

    .line 354
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 355
    .line 356
    .line 357
    return-void
.end method


# virtual methods
.method public L(Lcom/android/launcher3/C2;Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->K1()Lcom/android/launcher3/anim/G;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->K1()Lcom/android/launcher3/anim/G;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Lcom/android/launcher3/popup/P;->mOriginalView:Landroid/view/View;

    .line 18
    .line 19
    new-instance v2, Lcom/android/launcher3/popup/P$f$a;

    .line 20
    .line 21
    invoke-direct {v2, p0, p1, p2}, Lcom/android/launcher3/popup/P$f$a;-><init>(Lcom/android/launcher3/popup/P$f;Lcom/android/launcher3/C2;Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/anim/G;->f(Landroid/view/View;Landroid/animation/AnimatorListenerAdapter;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/popup/P$f;->K(Lcom/android/launcher3/C2;Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/popup/P;->mTarget:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    check-cast v0, Lcom/android/launcher3/C2;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 6
    .line 7
    instance-of v2, v1, Lcom/android/launcher3/model/data/A;

    .line 8
    .line 9
    if-eqz v2, :cond_1

    .line 10
    .line 11
    check-cast v1, Lcom/android/launcher3/model/data/A;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/android/launcher3/model/data/A;->h:Landroid/content/ComponentName;

    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {v1}, Lf1/d;->j(Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    iget-object v1, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 26
    .line 27
    check-cast v1, Lcom/android/launcher3/model/data/A;

    .line 28
    .line 29
    iget-object v1, v1, Lcom/android/launcher3/model/data/A;->h:Landroid/content/ComponentName;

    .line 30
    .line 31
    invoke-virtual {v1}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    iget-object v2, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 36
    .line 37
    iget-object v2, v2, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 38
    .line 39
    if-nez v2, :cond_0

    .line 40
    .line 41
    const v2, 0x7f140155

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    goto :goto_0

    .line 49
    :cond_0
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    :goto_0
    invoke-static {v1, v2}, Lh1/a;->l(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    :cond_1
    const/4 v1, 0x1

    .line 57
    const/4 v2, 0x2

    .line 58
    invoke-static {v0, v1, v2}, Lcom/android/launcher3/a;->closeOpenViews(Lcom/android/launcher3/views/k;ZI)V

    .line 59
    .line 60
    .line 61
    invoke-static {}, Lcom/android/launcher3/widget/suggest/v;->B()Z

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    if-eqz v3, :cond_2

    .line 66
    .line 67
    iget-object v3, p0, Lcom/android/launcher3/popup/P;->mOriginalView:Landroid/view/View;

    .line 68
    .line 69
    instance-of v4, v3, Lcom/android/launcher3/widget/suggest/m;

    .line 70
    .line 71
    if-eqz v4, :cond_2

    .line 72
    .line 73
    check-cast v3, Lcom/android/launcher3/widget/suggest/m;

    .line 74
    .line 75
    invoke-virtual {v3, p0, v0, p1}, Lcom/android/launcher3/widget/suggest/m;->L0(Lcom/android/launcher3/popup/P$f;Lcom/android/launcher3/C2;Landroid/view/View;)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_2
    iget-object v3, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 80
    .line 81
    instance-of v4, v3, Lcom/android/launcher3/model/data/I;

    .line 82
    .line 83
    if-eqz v4, :cond_3

    .line 84
    .line 85
    move-object v4, v3

    .line 86
    check-cast v4, Lcom/android/launcher3/model/data/I;

    .line 87
    .line 88
    iget v4, v4, Lcom/android/launcher3/model/data/I;->m:I

    .line 89
    .line 90
    if-ne v4, v2, :cond_3

    .line 91
    .line 92
    check-cast v3, Lcom/android/launcher3/model/data/I;

    .line 93
    .line 94
    invoke-virtual {v3}, Lcom/android/launcher3/model/data/I;->b0()Z

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    if-eqz v2, :cond_3

    .line 99
    .line 100
    iget-object v2, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 101
    .line 102
    invoke-static {v2}, Lx1/O;->t2(Lcom/android/launcher3/model/data/y;)Z

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    if-eqz v2, :cond_3

    .line 107
    .line 108
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    const v2, 0x7f140197

    .line 117
    .line 118
    .line 119
    invoke-virtual {p1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->announceForAccessibility(Ljava/lang/CharSequence;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    const/4 p1, -0x1

    .line 131
    invoke-static {p0, v2, p1}, Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;->X(Landroid/view/View;II)Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-virtual {p0, v1}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->J(I)Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    check-cast p0, Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;

    .line 140
    .line 141
    invoke-virtual {p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->C()Landroid/view/View;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    const v0, 0x7f081988

    .line 146
    .line 147
    .line 148
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;->O()V

    .line 152
    .line 153
    .line 154
    return-void

    .line 155
    :cond_3
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/popup/P$f;->L(Lcom/android/launcher3/C2;Landroid/view/View;)V

    .line 156
    .line 157
    .line 158
    return-void
.end method
