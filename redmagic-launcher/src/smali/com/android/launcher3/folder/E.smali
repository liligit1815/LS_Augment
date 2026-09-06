.class public Lcom/android/launcher3/folder/E;
.super Ljava/lang/Object;
.source "FolderInCloudStyle.java"

# interfaces
.implements Lcom/android/launcher3/folder/Folder$k;


# instance fields
.field private a:I

.field private b:Landroid/graphics/Rect;

.field public c:I


# direct methods
.method constructor <init>(Lcom/android/launcher3/folder/Folder;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getFooterHeight()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    iput v0, p0, Lcom/android/launcher3/folder/E;->a:I

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getTempRect()Landroid/graphics/Rect;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/android/launcher3/folder/E;->b:Landroid/graphics/Rect;

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const v0, 0x7f070356

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    iput p1, p0, Lcom/android/launcher3/folder/E;->c:I

    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/folder/Folder;)V
    .locals 0

    .line 1
    return-void
.end method

.method public b()F
    .locals 0

    .line 1
    const/high16 p0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    return p0
.end method

.method public c(Lcom/android/launcher3/folder/Folder;Lcom/android/launcher3/views/BaseDragLayer;Lcom/android/launcher3/h0;)V
    .locals 9

    .line 1
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getPaddingRight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    add-int/2addr v0, v1

    .line 10
    iget-object v1, p1, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/android/launcher3/folder/FolderPagedView;->getDesiredWidth()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    add-int/2addr v0, v1

    .line 17
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    sub-int/2addr v1, v0

    .line 22
    const/4 v0, 0x2

    .line 23
    div-int/2addr v1, v0

    .line 24
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    iget v2, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 33
    .line 34
    div-int/2addr v2, v0

    .line 35
    int-to-float v2, v2

    .line 36
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getFolderHeight()I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    iget v5, p0, Lcom/android/launcher3/folder/E;->a:I

    .line 45
    .line 46
    sub-int v6, v3, v5

    .line 47
    .line 48
    sub-int/2addr v4, v6

    .line 49
    div-int/2addr v4, v0

    .line 50
    sub-int/2addr v4, v5

    .line 51
    invoke-virtual {p3}, Lcom/android/launcher3/h0;->T0()Z

    .line 52
    .line 53
    .line 54
    move-result v5

    .line 55
    if-eqz v5, :cond_0

    .line 56
    .line 57
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    int-to-float v1, v1

    .line 62
    const/high16 v4, 0x3e800000    # 0.25f

    .line 63
    .line 64
    mul-float/2addr v1, v4

    .line 65
    float-to-int v1, v1

    .line 66
    iget v4, p0, Lcom/android/launcher3/folder/E;->c:I

    .line 67
    .line 68
    sub-int/2addr v1, v4

    .line 69
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    sub-int/2addr p2, v3

    .line 74
    div-int/lit8 v4, p2, 0x2

    .line 75
    .line 76
    :cond_0
    iget p2, p0, Lcom/android/launcher3/folder/E;->a:I

    .line 77
    .line 78
    add-int/2addr p2, v4

    .line 79
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getFolderHeight()I

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    iget p0, p0, Lcom/android/launcher3/folder/E;->a:I

    .line 84
    .line 85
    sub-int/2addr v3, p0

    .line 86
    div-int/2addr v3, v0

    .line 87
    add-int/2addr p2, v3

    .line 88
    int-to-float p0, p2

    .line 89
    new-array p2, v0, [I

    .line 90
    .line 91
    iget-object v3, p1, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 92
    .line 93
    invoke-virtual {v3, p2}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 94
    .line 95
    .line 96
    iget v3, p3, Lcom/android/launcher3/h0;->Q1:I

    .line 97
    .line 98
    invoke-static {}, Lx1/O;->C3()Z

    .line 99
    .line 100
    .line 101
    move-result v5

    .line 102
    if-eqz v5, :cond_1

    .line 103
    .line 104
    iget-object v3, p1, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 105
    .line 106
    invoke-virtual {v3}, Lcom/android/launcher3/folder/FolderIcon;->getIconSize()I

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    :cond_1
    const/4 v5, 0x0

    .line 111
    aget v5, p2, v5

    .line 112
    .line 113
    iget-object v6, p1, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 114
    .line 115
    invoke-virtual {v6}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 116
    .line 117
    .line 118
    move-result v6

    .line 119
    div-int/2addr v6, v0

    .line 120
    add-int/2addr v5, v6

    .line 121
    int-to-float v0, v5

    .line 122
    const/4 v5, 0x1

    .line 123
    aget v6, p2, v5

    .line 124
    .line 125
    iget p3, p3, Lcom/android/launcher3/h0;->D1:I

    .line 126
    .line 127
    add-int/2addr v6, p3

    .line 128
    div-int/lit8 p3, v3, 0x2

    .line 129
    .line 130
    add-int/2addr v6, p3

    .line 131
    int-to-float p3, v6

    .line 132
    iget-object v6, p1, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 133
    .line 134
    instance-of v7, v6, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 135
    .line 136
    if-eqz v7, :cond_2

    .line 137
    .line 138
    check-cast v6, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 139
    .line 140
    iget-object p3, v6, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 141
    .line 142
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    .line 143
    .line 144
    .line 145
    move-result v3

    .line 146
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getMeasuredHeight()I

    .line 147
    .line 148
    .line 149
    move-result p3

    .line 150
    aget p2, p2, v5

    .line 151
    .line 152
    iget-object v5, p1, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 153
    .line 154
    invoke-virtual {v5}, Landroid/widget/FrameLayout;->getPaddingTop()I

    .line 155
    .line 156
    .line 157
    move-result v5

    .line 158
    add-int/2addr p2, v5

    .line 159
    int-to-float p2, p2

    .line 160
    int-to-float v5, p3

    .line 161
    const/high16 v6, 0x40000000    # 2.0f

    .line 162
    .line 163
    div-float/2addr v5, v6

    .line 164
    add-float/2addr p2, v5

    .line 165
    move v8, p3

    .line 166
    move p3, p2

    .line 167
    move p2, v8

    .line 168
    goto :goto_0

    .line 169
    :cond_2
    move p2, v3

    .line 170
    :goto_0
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getContentAreaWidth()I

    .line 171
    .line 172
    .line 173
    move-result v5

    .line 174
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    .line 175
    .line 176
    .line 177
    move-result v6

    .line 178
    add-int/2addr v5, v6

    .line 179
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getPaddingRight()I

    .line 180
    .line 181
    .line 182
    move-result v6

    .line 183
    add-int/2addr v5, v6

    .line 184
    int-to-float v5, v5

    .line 185
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getContentAreaHeight()I

    .line 186
    .line 187
    .line 188
    move-result v6

    .line 189
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getPaddingTop()I

    .line 190
    .line 191
    .line 192
    move-result v7

    .line 193
    add-int/2addr v6, v7

    .line 194
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getPaddingBottom()I

    .line 195
    .line 196
    .line 197
    move-result v7

    .line 198
    add-int/2addr v6, v7

    .line 199
    int-to-float v6, v6

    .line 200
    int-to-float v3, v3

    .line 201
    div-float/2addr v5, v3

    .line 202
    iput v5, p1, Lcom/android/launcher3/folder/Folder;->v0:F

    .line 203
    .line 204
    int-to-float p2, p2

    .line 205
    div-float/2addr v6, p2

    .line 206
    iput v6, p1, Lcom/android/launcher3/folder/Folder;->w0:F

    .line 207
    .line 208
    sub-float/2addr v2, v0

    .line 209
    const/high16 p2, 0x3f800000    # 1.0f

    .line 210
    .line 211
    sub-float/2addr v5, p2

    .line 212
    div-float/2addr v2, v5

    .line 213
    sub-float v2, v0, v2

    .line 214
    .line 215
    int-to-float v1, v1

    .line 216
    sub-float/2addr v2, v1

    .line 217
    iput v2, p1, Lcom/android/launcher3/folder/Folder;->t0:F

    .line 218
    .line 219
    sub-float v1, p0, p3

    .line 220
    .line 221
    sub-float/2addr v6, p2

    .line 222
    div-float/2addr v1, v6

    .line 223
    sub-float p2, p3, v1

    .line 224
    .line 225
    int-to-float v1, v4

    .line 226
    sub-float/2addr p2, v1

    .line 227
    iput p2, p1, Lcom/android/launcher3/folder/Folder;->u0:F

    .line 228
    .line 229
    new-instance p2, Ljava/lang/StringBuilder;

    .line 230
    .line 231
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 232
    .line 233
    .line 234
    const-string v1, "pivox="

    .line 235
    .line 236
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 237
    .line 238
    .line 239
    iget v1, p1, Lcom/android/launcher3/folder/Folder;->t0:F

    .line 240
    .line 241
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 242
    .line 243
    .line 244
    const-string v1, "pivoy="

    .line 245
    .line 246
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    iget v1, p1, Lcom/android/launcher3/folder/Folder;->u0:F

    .line 250
    .line 251
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 252
    .line 253
    .line 254
    const-string v1, "floderY="

    .line 255
    .line 256
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 257
    .line 258
    .line 259
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 260
    .line 261
    .line 262
    const-string p0, " folderIconX="

    .line 263
    .line 264
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 265
    .line 266
    .line 267
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 268
    .line 269
    .line 270
    const-string p0, "folderIconY="

    .line 271
    .line 272
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 273
    .line 274
    .line 275
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 276
    .line 277
    .line 278
    const-string p0, "scaleX="

    .line 279
    .line 280
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 281
    .line 282
    .line 283
    iget p0, p1, Lcom/android/launcher3/folder/Folder;->v0:F

    .line 284
    .line 285
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 286
    .line 287
    .line 288
    const-string p0, "scaleY="

    .line 289
    .line 290
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 291
    .line 292
    .line 293
    iget p0, p1, Lcom/android/launcher3/folder/Folder;->w0:F

    .line 294
    .line 295
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 296
    .line 297
    .line 298
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 299
    .line 300
    .line 301
    move-result-object p0

    .line 302
    const-string p1, "FolderInUninstallStyle"

    .line 303
    .line 304
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 305
    .line 306
    .line 307
    return-void
.end method

.method public d(Lcom/android/launcher3/folder/Folder;Lcom/android/launcher3/views/BaseDragLayer;Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;Lcom/android/launcher3/h0;)V
    .locals 11

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setScaleX(F)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setScaleY(F)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getPaddingRight()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    add-int/2addr v1, v2

    .line 18
    iget-object v2, p1, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 19
    .line 20
    invoke-virtual {v2}, Lcom/android/launcher3/folder/FolderPagedView;->getDesiredWidth()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    add-int/2addr v1, v2

    .line 25
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getFolderHeight()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    const v4, 0x7f070361

    .line 38
    .line 39
    .line 40
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    add-int/2addr v2, v3

    .line 45
    invoke-virtual {p4}, Lcom/android/launcher3/h0;->T0()Z

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    if-eqz v3, :cond_0

    .line 50
    .line 51
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    const v3, 0x7f070360

    .line 56
    .line 57
    .line 58
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    add-int/2addr v1, v2

    .line 63
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getFolderHeight()I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    :cond_0
    iget-object v3, p1, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 68
    .line 69
    iget-object v4, p0, Lcom/android/launcher3/folder/E;->b:Landroid/graphics/Rect;

    .line 70
    .line 71
    invoke-virtual {p2, v3, v4}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 72
    .line 73
    .line 74
    iget-object v3, p0, Lcom/android/launcher3/folder/E;->b:Landroid/graphics/Rect;

    .line 75
    .line 76
    invoke-virtual {v3}, Landroid/graphics/Rect;->centerX()I

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    iget-object v4, p0, Lcom/android/launcher3/folder/E;->b:Landroid/graphics/Rect;

    .line 81
    .line 82
    invoke-virtual {v4}, Landroid/graphics/Rect;->centerY()I

    .line 83
    .line 84
    .line 85
    move-result v4

    .line 86
    div-int/lit8 v5, v1, 0x2

    .line 87
    .line 88
    sub-int/2addr v3, v5

    .line 89
    div-int/lit8 v6, v2, 0x2

    .line 90
    .line 91
    sub-int/2addr v4, v6

    .line 92
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 93
    .line 94
    .line 95
    move-result v7

    .line 96
    sub-int/2addr v7, v1

    .line 97
    div-int/lit8 v7, v7, 0x2

    .line 98
    .line 99
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 100
    .line 101
    .line 102
    move-result v8

    .line 103
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getFolderHeight()I

    .line 104
    .line 105
    .line 106
    move-result v9

    .line 107
    iget v10, p0, Lcom/android/launcher3/folder/E;->a:I

    .line 108
    .line 109
    sub-int/2addr v9, v10

    .line 110
    sub-int/2addr v8, v9

    .line 111
    div-int/lit8 v8, v8, 0x2

    .line 112
    .line 113
    sub-int/2addr v8, v10

    .line 114
    invoke-virtual {p4}, Lcom/android/launcher3/h0;->T0()Z

    .line 115
    .line 116
    .line 117
    move-result v9

    .line 118
    if-eqz v9, :cond_1

    .line 119
    .line 120
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 121
    .line 122
    .line 123
    move-result v7

    .line 124
    int-to-float v7, v7

    .line 125
    const/high16 v8, 0x3e800000    # 0.25f

    .line 126
    .line 127
    mul-float/2addr v7, v8

    .line 128
    float-to-int v7, v7

    .line 129
    iget v8, p0, Lcom/android/launcher3/folder/E;->c:I

    .line 130
    .line 131
    sub-int/2addr v7, v8

    .line 132
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 133
    .line 134
    .line 135
    move-result v8

    .line 136
    sub-int/2addr v8, v2

    .line 137
    div-int/lit8 v8, v8, 0x2

    .line 138
    .line 139
    :cond_1
    sub-int/2addr v3, v7

    .line 140
    add-int/2addr v5, v3

    .line 141
    sub-int/2addr v4, v8

    .line 142
    add-int/2addr v6, v4

    .line 143
    invoke-virtual {p0, p1, p2, p4}, Lcom/android/launcher3/folder/E;->c(Lcom/android/launcher3/folder/Folder;Lcom/android/launcher3/views/BaseDragLayer;Lcom/android/launcher3/h0;)V

    .line 144
    .line 145
    .line 146
    iget-object p0, p1, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 147
    .line 148
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 149
    .line 150
    .line 151
    move-result p0

    .line 152
    int-to-float p0, p0

    .line 153
    int-to-float p2, v5

    .line 154
    mul-float/2addr p2, v0

    .line 155
    int-to-float p4, v1

    .line 156
    div-float/2addr p2, p4

    .line 157
    mul-float/2addr p0, p2

    .line 158
    float-to-int p0, p0

    .line 159
    int-to-float p0, p0

    .line 160
    iput p0, p1, Lcom/android/launcher3/folder/Folder;->r0:F

    .line 161
    .line 162
    iget-object p0, p1, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 163
    .line 164
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 165
    .line 166
    .line 167
    move-result p0

    .line 168
    int-to-float p0, p0

    .line 169
    int-to-float p2, v6

    .line 170
    mul-float/2addr p2, v0

    .line 171
    int-to-float p4, v2

    .line 172
    div-float/2addr p2, p4

    .line 173
    mul-float/2addr p0, p2

    .line 174
    float-to-int p0, p0

    .line 175
    int-to-float p0, p0

    .line 176
    iput p0, p1, Lcom/android/launcher3/folder/Folder;->s0:F

    .line 177
    .line 178
    iput v7, p3, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->b:I

    .line 179
    .line 180
    iput v8, p3, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->c:I

    .line 181
    .line 182
    iput v1, p3, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 183
    .line 184
    iput v2, p3, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 185
    .line 186
    iput v8, p3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 187
    .line 188
    iput v7, p3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 189
    .line 190
    return-void
.end method

.method public e(Lcom/android/launcher3/folder/Folder;II)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getCloudFolder()Lcom/android/launcher3/cloudfolder/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getCloudFolder()Lcom/android/launcher3/cloudfolder/a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/launcher3/cloudfolder/a;->k(Lcom/android/launcher3/folder/Folder;II)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
