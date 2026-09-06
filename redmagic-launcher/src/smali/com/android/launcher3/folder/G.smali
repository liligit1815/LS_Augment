.class public Lcom/android/launcher3/folder/G;
.super Ljava/lang/Object;
.source "FolderInIconArrangeStyle.java"

# interfaces
.implements Lcom/android/launcher3/folder/Folder$k;


# instance fields
.field private a:Landroid/view/View;

.field private b:I

.field private c:Landroid/graphics/Rect;

.field private d:F

.field private final e:Landroid/graphics/PointF;


# direct methods
.method constructor <init>(Lcom/android/launcher3/folder/Folder;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/PointF;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/folder/G;->e:Landroid/graphics/PointF;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getFooter()Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/android/launcher3/folder/G;->a:Landroid/view/View;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getFooterHeight()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iput v0, p0, Lcom/android/launcher3/folder/G;->b:I

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getTempRect()Landroid/graphics/Rect;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/android/launcher3/folder/G;->c:Landroid/graphics/Rect;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getFooterHeight()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getContentAreaHeight()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    add-int/2addr v0, v1

    .line 38
    int-to-float v0, v0

    .line 39
    const/high16 v1, 0x3e800000    # 0.25f

    .line 40
    .line 41
    mul-float/2addr v0, v1

    .line 42
    const/high16 v1, 0x40000000    # 2.0f

    .line 43
    .line 44
    div-float/2addr v0, v1

    .line 45
    iput v0, p0, Lcom/android/launcher3/folder/G;->d:F

    .line 46
    .line 47
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_0

    .line 52
    .line 53
    iget-object v0, p1, Lcom/android/launcher3/folder/Folder;->o:Lcom/android/launcher3/views/k;

    .line 54
    .line 55
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->N0:Z

    .line 60
    .line 61
    if-eqz v0, :cond_0

    .line 62
    .line 63
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getFolderHeight()I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    int-to-float p1, p1

    .line 68
    const v0, 0x3ebd70a4    # 0.37f

    .line 69
    .line 70
    .line 71
    mul-float/2addr p1, v0

    .line 72
    div-float/2addr p1, v1

    .line 73
    iput p1, p0, Lcom/android/launcher3/folder/G;->d:F

    .line 74
    .line 75
    :cond_0
    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/folder/Folder;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getRightCellLayout()Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-ge p1, v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Landroid/view/View;->getAlpha()F

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/high16 v1, 0x3f800000    # 1.0f

    .line 21
    .line 22
    cmpl-float v0, v0, v1

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 31
    .line 32
    .line 33
    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    return-void
.end method

.method public b()F
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/folder/G;->a:Landroid/view/View;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->N0:Z

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const p0, 0x3f2147ae    # 0.63f

    .line 26
    .line 27
    .line 28
    return p0

    .line 29
    :cond_0
    const/high16 p0, 0x3f400000    # 0.75f

    .line 30
    .line 31
    return p0
.end method

.method public c(Lcom/android/launcher3/folder/Folder;Lcom/android/launcher3/views/BaseDragLayer;Lcom/android/launcher3/h0;)V
    .locals 9

    .line 1
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getPaddingRight()I

    .line 5
    .line 6
    .line 7
    iget-object v0, p1, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/folder/FolderPagedView;->getDesiredWidth()I

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getRightCellLayout()Lcom/android/launcher3/CellLayout;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Lcom/android/launcher3/folder/G;->c:Landroid/graphics/Rect;

    .line 17
    .line 18
    invoke-virtual {p2, v0, v1}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/launcher3/folder/G;->c:Landroid/graphics/Rect;

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iget-object p0, p0, Lcom/android/launcher3/folder/G;->c:Landroid/graphics/Rect;

    .line 28
    .line 29
    iget p0, p0, Landroid/graphics/Rect;->top:I

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getFolderHeight()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    sub-int/2addr v1, v0

    .line 36
    sub-int/2addr p0, v1

    .line 37
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-virtual {p2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    iget p2, p2, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 49
    .line 50
    int-to-float p2, p2

    .line 51
    const/high16 v0, 0x40000000    # 2.0f

    .line 52
    .line 53
    div-float/2addr p2, v0

    .line 54
    int-to-float p0, p0

    .line 55
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getFolderHeight()I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    int-to-float v1, v1

    .line 60
    div-float/2addr v1, v0

    .line 61
    add-float/2addr p0, v1

    .line 62
    const/4 v1, 0x2

    .line 63
    new-array v1, v1, [I

    .line 64
    .line 65
    iget-object v2, p1, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 66
    .line 67
    invoke-virtual {v2, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 68
    .line 69
    .line 70
    const/4 v3, 0x0

    .line 71
    aget v3, v1, v3

    .line 72
    .line 73
    int-to-float v3, v3

    .line 74
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    int-to-float v2, v2

    .line 79
    const/high16 v4, 0x3f400000    # 0.75f

    .line 80
    .line 81
    mul-float/2addr v2, v4

    .line 82
    div-float/2addr v2, v0

    .line 83
    add-float/2addr v3, v2

    .line 84
    const/4 v2, 0x1

    .line 85
    aget v5, v1, v2

    .line 86
    .line 87
    int-to-float v5, v5

    .line 88
    iget v6, p3, Lcom/android/launcher3/X3;->s:I

    .line 89
    .line 90
    iget p3, p3, Lcom/android/launcher3/h0;->Q1:I

    .line 91
    .line 92
    div-int/lit8 v7, p3, 0x2

    .line 93
    .line 94
    add-int/2addr v6, v7

    .line 95
    int-to-float v6, v6

    .line 96
    mul-float/2addr v6, v4

    .line 97
    add-float/2addr v5, v6

    .line 98
    iget-object v6, p1, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 99
    .line 100
    instance-of v7, v6, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 101
    .line 102
    if-eqz v7, :cond_0

    .line 103
    .line 104
    check-cast v6, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 105
    .line 106
    iget-object p3, v6, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 107
    .line 108
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    .line 109
    .line 110
    .line 111
    move-result v5

    .line 112
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getMeasuredHeight()I

    .line 113
    .line 114
    .line 115
    move-result p3

    .line 116
    aget v1, v1, v2

    .line 117
    .line 118
    int-to-float v1, v1

    .line 119
    iget-object v2, p1, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 120
    .line 121
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getPaddingTop()I

    .line 122
    .line 123
    .line 124
    move-result v2

    .line 125
    int-to-float v2, v2

    .line 126
    int-to-float v6, p3

    .line 127
    div-float/2addr v6, v0

    .line 128
    add-float/2addr v2, v6

    .line 129
    mul-float/2addr v2, v4

    .line 130
    add-float v0, v1, v2

    .line 131
    .line 132
    move v8, v0

    .line 133
    move v0, p3

    .line 134
    move p3, v5

    .line 135
    move v5, v8

    .line 136
    goto :goto_0

    .line 137
    :cond_0
    move v0, p3

    .line 138
    :goto_0
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getContentAreaWidth()I

    .line 139
    .line 140
    .line 141
    move-result v1

    .line 142
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    .line 143
    .line 144
    .line 145
    move-result v2

    .line 146
    add-int/2addr v1, v2

    .line 147
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getPaddingRight()I

    .line 148
    .line 149
    .line 150
    move-result v2

    .line 151
    add-int/2addr v1, v2

    .line 152
    int-to-float v1, v1

    .line 153
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getContentAreaHeight()I

    .line 154
    .line 155
    .line 156
    move-result v2

    .line 157
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getPaddingTop()I

    .line 158
    .line 159
    .line 160
    move-result v4

    .line 161
    add-int/2addr v2, v4

    .line 162
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getPaddingBottom()I

    .line 163
    .line 164
    .line 165
    move-result v4

    .line 166
    add-int/2addr v2, v4

    .line 167
    int-to-float v2, v2

    .line 168
    int-to-float p3, p3

    .line 169
    div-float p3, v1, p3

    .line 170
    .line 171
    iput p3, p1, Lcom/android/launcher3/folder/Folder;->v0:F

    .line 172
    .line 173
    int-to-float p3, v0

    .line 174
    div-float/2addr v2, p3

    .line 175
    iput v2, p1, Lcom/android/launcher3/folder/Folder;->w0:F

    .line 176
    .line 177
    new-instance p3, Ljava/lang/StringBuilder;

    .line 178
    .line 179
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 180
    .line 181
    .line 182
    const-string v0, "pivox="

    .line 183
    .line 184
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    iget v0, p1, Lcom/android/launcher3/folder/Folder;->t0:F

    .line 188
    .line 189
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    const-string v0, "pivoy="

    .line 193
    .line 194
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    iget v0, p1, Lcom/android/launcher3/folder/Folder;->u0:F

    .line 198
    .line 199
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    const-string v0, " fold width="

    .line 203
    .line 204
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 208
    .line 209
    .line 210
    const-string v0, "floderX="

    .line 211
    .line 212
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    const-string p2, "floderY="

    .line 219
    .line 220
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 224
    .line 225
    .line 226
    const-string p0, " folderIconX="

    .line 227
    .line 228
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    const-string p0, "folderIconY="

    .line 235
    .line 236
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 237
    .line 238
    .line 239
    invoke-virtual {p3, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 240
    .line 241
    .line 242
    const-string p0, "scaleX="

    .line 243
    .line 244
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 245
    .line 246
    .line 247
    iget p0, p1, Lcom/android/launcher3/folder/Folder;->v0:F

    .line 248
    .line 249
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 250
    .line 251
    .line 252
    const-string p0, "scaleY="

    .line 253
    .line 254
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 255
    .line 256
    .line 257
    iget p0, p1, Lcom/android/launcher3/folder/Folder;->w0:F

    .line 258
    .line 259
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 260
    .line 261
    .line 262
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object p0

    .line 266
    const-string p1, "FolderInIconArrangeStyle"

    .line 267
    .line 268
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 269
    .line 270
    .line 271
    return-void
.end method

.method public d(Lcom/android/launcher3/folder/Folder;Lcom/android/launcher3/views/BaseDragLayer;Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;Lcom/android/launcher3/h0;)V
    .locals 10

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/folder/G;->b()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setScaleX(F)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/folder/G;->b()F

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setScaleY(F)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getPaddingRight()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    add-int/2addr v0, v1

    .line 24
    iget-object v1, p1, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/android/launcher3/folder/FolderPagedView;->getDesiredWidth()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    add-int/2addr v0, v1

    .line 31
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getFolderHeight()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    iget-object v2, p1, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 36
    .line 37
    iget-object v3, p0, Lcom/android/launcher3/folder/G;->c:Landroid/graphics/Rect;

    .line 38
    .line 39
    invoke-virtual {p2, v2, v3}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 40
    .line 41
    .line 42
    iget-object v2, p0, Lcom/android/launcher3/folder/G;->c:Landroid/graphics/Rect;

    .line 43
    .line 44
    invoke-virtual {v2}, Landroid/graphics/Rect;->centerX()I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    iget-object v3, p0, Lcom/android/launcher3/folder/G;->c:Landroid/graphics/Rect;

    .line 49
    .line 50
    invoke-virtual {v3}, Landroid/graphics/Rect;->centerY()I

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    div-int/lit8 v4, v0, 0x2

    .line 55
    .line 56
    sub-int/2addr v2, v4

    .line 57
    div-int/lit8 v5, v1, 0x2

    .line 58
    .line 59
    sub-int/2addr v3, v5

    .line 60
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 61
    .line 62
    .line 63
    move-result v6

    .line 64
    sub-int/2addr v6, v0

    .line 65
    div-int/lit8 v6, v6, 0x2

    .line 66
    .line 67
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 68
    .line 69
    .line 70
    move-result v7

    .line 71
    iget v8, p0, Lcom/android/launcher3/folder/G;->b:I

    .line 72
    .line 73
    sub-int v9, v1, v8

    .line 74
    .line 75
    sub-int/2addr v7, v9

    .line 76
    div-int/lit8 v7, v7, 0x2

    .line 77
    .line 78
    sub-int/2addr v7, v8

    .line 79
    sub-int/2addr v2, v6

    .line 80
    add-int/2addr v4, v2

    .line 81
    sub-int/2addr v3, v7

    .line 82
    add-int/2addr v5, v3

    .line 83
    invoke-virtual {p0, p1, p2, p4}, Lcom/android/launcher3/folder/G;->c(Lcom/android/launcher3/folder/Folder;Lcom/android/launcher3/views/BaseDragLayer;Lcom/android/launcher3/h0;)V

    .line 84
    .line 85
    .line 86
    iget-object v2, p1, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 87
    .line 88
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 89
    .line 90
    .line 91
    move-result v2

    .line 92
    int-to-float v2, v2

    .line 93
    int-to-float v3, v4

    .line 94
    const/high16 v4, 0x3f800000    # 1.0f

    .line 95
    .line 96
    mul-float/2addr v3, v4

    .line 97
    int-to-float v7, v0

    .line 98
    div-float/2addr v3, v7

    .line 99
    mul-float/2addr v2, v3

    .line 100
    float-to-int v2, v2

    .line 101
    int-to-float v2, v2

    .line 102
    iput v2, p1, Lcom/android/launcher3/folder/Folder;->r0:F

    .line 103
    .line 104
    iget-object v2, p1, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 105
    .line 106
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 107
    .line 108
    .line 109
    move-result v2

    .line 110
    int-to-float v2, v2

    .line 111
    int-to-float v3, v5

    .line 112
    mul-float/2addr v3, v4

    .line 113
    int-to-float v5, v1

    .line 114
    div-float/2addr v3, v5

    .line 115
    mul-float/2addr v2, v3

    .line 116
    float-to-int v2, v2

    .line 117
    int-to-float v2, v2

    .line 118
    iput v2, p1, Lcom/android/launcher3/folder/Folder;->s0:F

    .line 119
    .line 120
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getRightCellLayout()Lcom/android/launcher3/CellLayout;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    iget-object v3, p0, Lcom/android/launcher3/folder/G;->c:Landroid/graphics/Rect;

    .line 125
    .line 126
    invoke-virtual {p2, v2, v3}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 127
    .line 128
    .line 129
    iget-object p2, p0, Lcom/android/launcher3/folder/G;->c:Landroid/graphics/Rect;

    .line 130
    .line 131
    iget v2, p2, Landroid/graphics/Rect;->top:I

    .line 132
    .line 133
    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    .line 134
    .line 135
    .line 136
    move-result p2

    .line 137
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getFolderHeight()I

    .line 138
    .line 139
    .line 140
    move-result v3

    .line 141
    sub-int/2addr v3, p2

    .line 142
    sub-int/2addr v2, v3

    .line 143
    iput v6, p3, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->b:I

    .line 144
    .line 145
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 146
    .line 147
    .line 148
    move-result-object p2

    .line 149
    invoke-virtual {p2}, Lcom/android/launcher3/resource/B;->s()Z

    .line 150
    .line 151
    .line 152
    move-result p2

    .line 153
    if-nez p2, :cond_0

    .line 154
    .line 155
    iput v2, p3, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->c:I

    .line 156
    .line 157
    goto :goto_0

    .line 158
    :cond_0
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 159
    .line 160
    .line 161
    move-result-object p2

    .line 162
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 163
    .line 164
    .line 165
    move-result-object p2

    .line 166
    const v3, 0x7f070352

    .line 167
    .line 168
    .line 169
    invoke-virtual {p2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 170
    .line 171
    .line 172
    move-result p2

    .line 173
    iput p2, p3, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->c:I

    .line 174
    .line 175
    :goto_0
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 176
    .line 177
    .line 178
    move-result p2

    .line 179
    if-eqz p2, :cond_2

    .line 180
    .line 181
    const/4 p2, 0x0

    .line 182
    iput p2, p3, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->c:I

    .line 183
    .line 184
    iput p2, p3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 185
    .line 186
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 187
    .line 188
    .line 189
    move-result-object p2

    .line 190
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 191
    .line 192
    .line 193
    move-result-object p2

    .line 194
    iget-boolean v3, p4, Lcom/android/launcher3/h0;->N0:Z

    .line 195
    .line 196
    if-eqz v3, :cond_1

    .line 197
    .line 198
    const v3, 0x7f0c00ee

    .line 199
    .line 200
    .line 201
    goto :goto_1

    .line 202
    :cond_1
    const v3, 0x7f0c00ed

    .line 203
    .line 204
    .line 205
    :goto_1
    invoke-virtual {p2, v3}, Landroid/content/res/Resources;->getInteger(I)I

    .line 206
    .line 207
    .line 208
    move-result p2

    .line 209
    int-to-float p2, p2

    .line 210
    invoke-static {p2}, Lcom/android/launcher3/N5;->T(F)I

    .line 211
    .line 212
    .line 213
    move-result p2

    .line 214
    iget v3, p3, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->c:I

    .line 215
    .line 216
    add-int/2addr v3, p2

    .line 217
    iput v3, p3, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->c:I

    .line 218
    .line 219
    iget-boolean p2, p4, Lcom/android/launcher3/h0;->N0:Z

    .line 220
    .line 221
    if-eqz p2, :cond_2

    .line 222
    .line 223
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getContentAreaHeight()I

    .line 224
    .line 225
    .line 226
    move-result p1

    .line 227
    sub-int p1, v1, p1

    .line 228
    .line 229
    div-int/lit8 p1, p1, 0x2

    .line 230
    .line 231
    iput p1, p3, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->c:I

    .line 232
    .line 233
    :cond_2
    iput v0, p3, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 234
    .line 235
    iput v1, p3, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 236
    .line 237
    iput v2, p3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 238
    .line 239
    iput v6, p3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 240
    .line 241
    iget-object p1, p0, Lcom/android/launcher3/folder/G;->e:Landroid/graphics/PointF;

    .line 242
    .line 243
    invoke-virtual {p0}, Lcom/android/launcher3/folder/G;->b()F

    .line 244
    .line 245
    .line 246
    move-result p2

    .line 247
    sub-float p2, v4, p2

    .line 248
    .line 249
    mul-float/2addr v5, p2

    .line 250
    const/high16 p2, 0x40000000    # 2.0f

    .line 251
    .line 252
    div-float/2addr v5, p2

    .line 253
    iput v5, p1, Landroid/graphics/PointF;->y:F

    .line 254
    .line 255
    iget-object p1, p0, Lcom/android/launcher3/folder/G;->e:Landroid/graphics/PointF;

    .line 256
    .line 257
    invoke-virtual {p0}, Lcom/android/launcher3/folder/G;->b()F

    .line 258
    .line 259
    .line 260
    move-result p0

    .line 261
    sub-float/2addr v4, p0

    .line 262
    mul-float/2addr v7, v4

    .line 263
    div-float/2addr v7, p2

    .line 264
    iput v7, p1, Landroid/graphics/PointF;->x:F

    .line 265
    .line 266
    return-void
.end method

.method public e(Lcom/android/launcher3/folder/Folder;II)V
    .locals 0

    .line 1
    return-void
.end method

.method public f(Lcom/android/launcher3/folder/Folder;)Landroid/graphics/PointF;
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 6
    .line 7
    iget v1, v0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->b:I

    .line 8
    .line 9
    int-to-float v1, v1

    .line 10
    iget-object v2, p0, Lcom/android/launcher3/folder/G;->e:Landroid/graphics/PointF;

    .line 11
    .line 12
    iget v3, v2, Landroid/graphics/PointF;->x:F

    .line 13
    .line 14
    add-float/2addr v1, v3

    .line 15
    iget v0, v0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->c:I

    .line 16
    .line 17
    int-to-float v0, v0

    .line 18
    iget v2, v2, Landroid/graphics/PointF;->y:F

    .line 19
    .line 20
    add-float/2addr v0, v2

    .line 21
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    iget-object v3, p1, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 26
    .line 27
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    add-int/2addr v2, v3

    .line 32
    int-to-float v2, v2

    .line 33
    invoke-virtual {p0}, Lcom/android/launcher3/folder/G;->b()F

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    mul-float/2addr v2, v3

    .line 38
    add-float/2addr v1, v2

    .line 39
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getPaddingTop()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getFooterHeight()I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    add-int/2addr v2, v3

    .line 48
    iget-object v3, p1, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 49
    .line 50
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    add-int/2addr v2, v3

    .line 55
    iget-object p1, p1, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 56
    .line 57
    const/4 v3, 0x0

    .line 58
    invoke-virtual {p1, v3}, Lcom/android/launcher3/folder/FolderPagedView;->h0(I)Lcom/android/launcher3/CellLayout;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    add-int/2addr v2, p1

    .line 67
    int-to-float p1, v2

    .line 68
    invoke-virtual {p0}, Lcom/android/launcher3/folder/G;->b()F

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    mul-float/2addr p1, p0

    .line 73
    add-float/2addr v0, p1

    .line 74
    new-instance p0, Landroid/graphics/PointF;

    .line 75
    .line 76
    invoke-direct {p0, v1, v0}, Landroid/graphics/PointF;-><init>(FF)V

    .line 77
    .line 78
    .line 79
    return-object p0
.end method
