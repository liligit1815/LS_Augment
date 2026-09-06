.class public interface abstract Lcom/android/launcher3/M6;
.super Ljava/lang/Object;
.source "WorkspaceLayoutManager.java"


# static fields
.field public static final d:Lcom/android/launcher3/util/z0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/16 v0, -0xc9

    .line 2
    .line 3
    const/16 v1, -0xc8

    .line 4
    .line 5
    filled-new-array {v0, v1}, [I

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/android/launcher3/util/z0;->wrap([I)Lcom/android/launcher3/util/z0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Lcom/android/launcher3/M6;->d:Lcom/android/launcher3/util/z0;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public abstract getCellPosMapper()Lc1/c;
.end method

.method public abstract getDragController()Lcom/android/launcher3/dragndrop/j;
.end method

.method public abstract getHotseat()Lcom/android/launcher3/Hotseat;
.end method

.method public getWorkspaceChildOnLongClickListener()Landroid/view/View$OnLongClickListener;
    .locals 0

    .line 1
    sget-object p0, Lcom/android/launcher3/touch/A;->a:Landroid/view/View$OnLongClickListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public i(Landroid/view/View;Lcom/android/launcher3/model/data/y;)V
    .locals 13

    .line 1
    invoke-interface {p0}, Lcom/android/launcher3/M6;->getCellPosMapper()Lc1/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p2}, Lc1/c;->a(Lcom/android/launcher3/model/data/y;)Lc1/c$a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget v1, v0, Lc1/c$a;->a:I

    .line 10
    .line 11
    iget v2, v0, Lc1/c$a;->b:I

    .line 12
    .line 13
    iget v3, p2, Lcom/android/launcher3/model/data/y;->container:I

    .line 14
    .line 15
    const/16 v4, -0x65

    .line 16
    .line 17
    if-eq v3, v4, :cond_1

    .line 18
    .line 19
    const/16 v4, -0x67

    .line 20
    .line 21
    if-ne v3, v4, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move v9, v1

    .line 25
    move v10, v2

    .line 26
    goto :goto_1

    .line 27
    :cond_1
    :goto_0
    iget v1, v0, Lc1/c$a;->c:I

    .line 28
    .line 29
    invoke-interface {p0}, Lcom/android/launcher3/M6;->getHotseat()Lcom/android/launcher3/Hotseat;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v2, v1}, Lcom/android/launcher3/Hotseat;->U0(I)I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    invoke-interface {p0}, Lcom/android/launcher3/M6;->getHotseat()Lcom/android/launcher3/Hotseat;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-virtual {v3, v1}, Lcom/android/launcher3/Hotseat;->V0(I)I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    new-instance v3, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 48
    .line 49
    .line 50
    const-string v4, "addInScreenFromBind: hotseat inflation with x = "

    .line 51
    .line 52
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string v4, " and y = "

    .line 59
    .line 60
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    const-string v4, "Launcher.Workspace"

    .line 71
    .line 72
    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    move v10, v1

    .line 76
    move v9, v2

    .line 77
    :goto_1
    iget v7, p2, Lcom/android/launcher3/model/data/y;->container:I

    .line 78
    .line 79
    iget v8, v0, Lc1/c$a;->c:I

    .line 80
    .line 81
    iget v11, p2, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 82
    .line 83
    iget v12, p2, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 84
    .line 85
    move-object v5, p0

    .line 86
    move-object v6, p1

    .line 87
    invoke-interface/range {v5 .. v12}, Lcom/android/launcher3/M6;->q(Landroid/view/View;IIIIII)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public j(Landroid/view/View;Lcom/android/launcher3/model/data/y;)V
    .locals 9

    .line 1
    invoke-interface {p0}, Lcom/android/launcher3/M6;->getCellPosMapper()Lc1/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p2}, Lc1/c;->a(Lcom/android/launcher3/model/data/y;)Lc1/c$a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget v3, p2, Lcom/android/launcher3/model/data/y;->container:I

    .line 10
    .line 11
    iget v4, v0, Lc1/c$a;->c:I

    .line 12
    .line 13
    iget v5, v0, Lc1/c$a;->a:I

    .line 14
    .line 15
    iget v6, v0, Lc1/c$a;->b:I

    .line 16
    .line 17
    iget v7, p2, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 18
    .line 19
    iget v8, p2, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 20
    .line 21
    move-object v1, p0

    .line 22
    move-object v2, p1

    .line 23
    invoke-interface/range {v1 .. v8}, Lcom/android/launcher3/M6;->q(Landroid/view/View;IIIIII)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public abstract n(I)Lcom/android/launcher3/CellLayout;
.end method

.method public p(Lcom/android/launcher3/n0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public q(Landroid/view/View;IIIIII)V
    .locals 14

    .line 1
    move/from16 v6, p2

    .line 2
    .line 3
    move/from16 v0, p3

    .line 4
    .line 5
    move/from16 v2, p4

    .line 6
    .line 7
    move/from16 v3, p5

    .line 8
    .line 9
    move/from16 v4, p6

    .line 10
    .line 11
    move/from16 v5, p7

    .line 12
    .line 13
    const-string v7, "Launcher.Workspace"

    .line 14
    .line 15
    const/16 v8, -0x64

    .line 16
    .line 17
    if-ne v6, v8, :cond_1

    .line 18
    .line 19
    invoke-interface {p0, v0}, Lcom/android/launcher3/M6;->n(I)Lcom/android/launcher3/CellLayout;

    .line 20
    .line 21
    .line 22
    move-result-object v9

    .line 23
    if-nez v9, :cond_1

    .line 24
    .line 25
    new-instance v1, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    const-string v2, "Skipping child, screenId "

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string v0, " not found"

    .line 39
    .line 40
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {v7, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    new-instance v0, Ljava/lang/Throwable;

    .line 51
    .line 52
    invoke-direct {v0}, Ljava/lang/Throwable;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 56
    .line 57
    .line 58
    invoke-interface {p0}, Lcom/android/launcher3/M6;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    if-eqz v0, :cond_0

    .line 63
    .line 64
    invoke-interface {p0}, Lcom/android/launcher3/M6;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v0}, Lcom/android/launcher3/dragndrop/j;->G()Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_0

    .line 73
    .line 74
    const-string v0, "addInScreen, isDragging"

    .line 75
    .line 76
    invoke-static {v7, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    .line 78
    .line 79
    invoke-interface {p0}, Lcom/android/launcher3/M6;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/j;->l()V

    .line 84
    .line 85
    .line 86
    :cond_0
    invoke-static {}, Lx1/O;->Z3()V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_1
    sget-object v9, Lcom/android/launcher3/M6;->d:Lcom/android/launcher3/util/z0;

    .line 91
    .line 92
    invoke-virtual {v9, v0}, Lcom/android/launcher3/util/z0;->contains(I)Z

    .line 93
    .line 94
    .line 95
    move-result v9

    .line 96
    if-nez v9, :cond_d

    .line 97
    .line 98
    const/4 v9, 0x1

    .line 99
    const/16 v10, -0x65

    .line 100
    .line 101
    const/4 v11, 0x0

    .line 102
    if-eq v6, v10, :cond_4

    .line 103
    .line 104
    const/16 v12, -0x67

    .line 105
    .line 106
    if-ne v6, v12, :cond_2

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_2
    instance-of v12, p1, Lcom/android/launcher3/folder/FolderIcon;

    .line 110
    .line 111
    if-eqz v12, :cond_3

    .line 112
    .line 113
    move-object v12, p1

    .line 114
    check-cast v12, Lcom/android/launcher3/folder/FolderIcon;

    .line 115
    .line 116
    invoke-virtual {v12, v9}, Lcom/android/launcher3/folder/FolderIcon;->setTextVisible(Z)V

    .line 117
    .line 118
    .line 119
    :cond_3
    invoke-interface {p0, v0}, Lcom/android/launcher3/M6;->n(I)Lcom/android/launcher3/CellLayout;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    goto :goto_1

    .line 124
    :cond_4
    :goto_0
    invoke-interface {p0}, Lcom/android/launcher3/M6;->getHotseat()Lcom/android/launcher3/Hotseat;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    instance-of v12, p1, Lcom/android/launcher3/folder/FolderIcon;

    .line 129
    .line 130
    if-eqz v12, :cond_5

    .line 131
    .line 132
    move-object v12, p1

    .line 133
    check-cast v12, Lcom/android/launcher3/folder/FolderIcon;

    .line 134
    .line 135
    invoke-virtual {v12, v11}, Lcom/android/launcher3/folder/FolderIcon;->setTextVisible(Z)V

    .line 136
    .line 137
    .line 138
    :cond_5
    :goto_1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 139
    .line 140
    .line 141
    move-result-object v12

    .line 142
    if-eqz v12, :cond_7

    .line 143
    .line 144
    instance-of v13, v12, Lc1/b;

    .line 145
    .line 146
    if-nez v13, :cond_6

    .line 147
    .line 148
    goto :goto_2

    .line 149
    :cond_6
    check-cast v12, Lc1/b;

    .line 150
    .line 151
    invoke-virtual {v12, v2}, Lc1/b;->e(I)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v12, v3}, Lc1/b;->g(I)V

    .line 155
    .line 156
    .line 157
    iput v4, v12, Lc1/b;->f:I

    .line 158
    .line 159
    iput v5, v12, Lc1/b;->g:I

    .line 160
    .line 161
    goto :goto_3

    .line 162
    :cond_7
    :goto_2
    new-instance v12, Lc1/b;

    .line 163
    .line 164
    invoke-direct {v12, v2, v3, v4, v5}, Lc1/b;-><init>(IIII)V

    .line 165
    .line 166
    .line 167
    :goto_3
    if-gez v4, :cond_8

    .line 168
    .line 169
    if-gez v5, :cond_8

    .line 170
    .line 171
    iput-boolean v11, v12, Lc1/b;->h:Z

    .line 172
    .line 173
    :cond_8
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object v2

    .line 177
    move-object v13, v2

    .line 178
    check-cast v13, Lcom/android/launcher3/model/data/y;

    .line 179
    .line 180
    invoke-virtual {v13}, Lcom/android/launcher3/model/data/y;->getViewId()I

    .line 181
    .line 182
    .line 183
    move-result v3

    .line 184
    instance-of v2, p1, Lcom/android/launcher3/folder/Folder;

    .line 185
    .line 186
    xor-int/lit8 v5, v2, 0x1

    .line 187
    .line 188
    const/4 v2, -0x1

    .line 189
    move-object v1, p1

    .line 190
    move-object v4, v12

    .line 191
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/CellLayout;->e(Landroid/view/View;IILc1/b;Z)Z

    .line 192
    .line 193
    .line 194
    move-result v0

    .line 195
    if-nez v0, :cond_9

    .line 196
    .line 197
    new-instance v0, Ljava/lang/StringBuilder;

    .line 198
    .line 199
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 200
    .line 201
    .line 202
    const-string v2, "Failed to add to item at ("

    .line 203
    .line 204
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    invoke-virtual {v4}, Lc1/b;->a()I

    .line 208
    .line 209
    .line 210
    move-result v2

    .line 211
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    const-string v2, ","

    .line 215
    .line 216
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 217
    .line 218
    .line 219
    invoke-virtual {v4}, Lc1/b;->b()I

    .line 220
    .line 221
    .line 222
    move-result v2

    .line 223
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 224
    .line 225
    .line 226
    const-string v2, ") to CellLayout"

    .line 227
    .line 228
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    invoke-static {v7, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 236
    .line 237
    .line 238
    :cond_9
    invoke-virtual {p1, v11}, Landroid/view/View;->setHapticFeedbackEnabled(Z)V

    .line 239
    .line 240
    .line 241
    invoke-interface {p0}, Lcom/android/launcher3/M6;->getWorkspaceChildOnLongClickListener()Landroid/view/View$OnLongClickListener;

    .line 242
    .line 243
    .line 244
    move-result-object v0

    .line 245
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 246
    .line 247
    .line 248
    instance-of v0, p1, Lcom/android/launcher3/n0;

    .line 249
    .line 250
    if-eqz v0, :cond_a

    .line 251
    .line 252
    move-object v0, p1

    .line 253
    check-cast v0, Lcom/android/launcher3/n0;

    .line 254
    .line 255
    invoke-interface {p0, v0}, Lcom/android/launcher3/M6;->p(Lcom/android/launcher3/n0;)V

    .line 256
    .line 257
    .line 258
    :cond_a
    invoke-static {}, Lx1/O;->C3()Z

    .line 259
    .line 260
    .line 261
    move-result p0

    .line 262
    if-eqz p0, :cond_c

    .line 263
    .line 264
    if-ne v6, v8, :cond_c

    .line 265
    .line 266
    iget p0, v13, Lcom/android/launcher3/model/data/y;->container:I

    .line 267
    .line 268
    if-ne p0, v10, :cond_c

    .line 269
    .line 270
    instance-of p0, p1, Lcom/android/launcher3/BubbleTextView;

    .line 271
    .line 272
    if-eqz p0, :cond_b

    .line 273
    .line 274
    move-object p0, p1

    .line 275
    check-cast p0, Lcom/android/launcher3/BubbleTextView;

    .line 276
    .line 277
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->F0()V

    .line 278
    .line 279
    .line 280
    return-void

    .line 281
    :cond_b
    instance-of p0, p1, Lcom/android/launcher3/folder/FolderIcon;

    .line 282
    .line 283
    if-eqz p0, :cond_c

    .line 284
    .line 285
    move-object p0, p1

    .line 286
    check-cast p0, Lcom/android/launcher3/folder/FolderIcon;

    .line 287
    .line 288
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderIcon;->j0()V

    .line 289
    .line 290
    .line 291
    :cond_c
    return-void

    .line 292
    :cond_d
    new-instance p0, Ljava/lang/RuntimeException;

    .line 293
    .line 294
    new-instance v1, Ljava/lang/StringBuilder;

    .line 295
    .line 296
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 297
    .line 298
    .line 299
    const-string v2, "Screen id should not be extra empty screen: "

    .line 300
    .line 301
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 302
    .line 303
    .line 304
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 305
    .line 306
    .line 307
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 308
    .line 309
    .line 310
    move-result-object v0

    .line 311
    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 312
    .line 313
    .line 314
    throw p0
.end method
