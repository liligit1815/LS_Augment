.class public Lcom/android/launcher3/folder/F;
.super Ljava/lang/Object;
.source "FolderInHideAppStyle.java"

# interfaces
.implements Lcom/android/launcher3/folder/Folder$k;


# instance fields
.field private a:I

.field private b:Landroid/graphics/Rect;


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
    iput v0, p0, Lcom/android/launcher3/folder/F;->a:I

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getTempRect()Landroid/graphics/Rect;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Lcom/android/launcher3/folder/F;->b:Landroid/graphics/Rect;

    .line 15
    .line 16
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
    .locals 7

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
    iget v5, p0, Lcom/android/launcher3/folder/F;->a:I

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
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    sub-int/2addr v4, v3

    .line 62
    div-int/2addr v4, v0

    .line 63
    :cond_0
    iget v3, p0, Lcom/android/launcher3/folder/F;->a:I

    .line 64
    .line 65
    add-int/2addr v3, v4

    .line 66
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getFolderHeight()I

    .line 67
    .line 68
    .line 69
    move-result v5

    .line 70
    iget p0, p0, Lcom/android/launcher3/folder/F;->a:I

    .line 71
    .line 72
    sub-int/2addr v5, p0

    .line 73
    div-int/2addr v5, v0

    .line 74
    add-int/2addr v3, v5

    .line 75
    int-to-float p0, v3

    .line 76
    new-array v3, v0, [I

    .line 77
    .line 78
    iget-object v5, p1, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 79
    .line 80
    invoke-virtual {v5, v3}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    div-int/2addr v3, v0

    .line 88
    int-to-float v3, v3

    .line 89
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 90
    .line 91
    .line 92
    move-result p2

    .line 93
    div-int/2addr p2, v0

    .line 94
    int-to-float p2, p2

    .line 95
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getContentAreaWidth()I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    .line 100
    .line 101
    .line 102
    move-result v5

    .line 103
    add-int/2addr v0, v5

    .line 104
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getPaddingRight()I

    .line 105
    .line 106
    .line 107
    move-result v5

    .line 108
    add-int/2addr v0, v5

    .line 109
    int-to-float v0, v0

    .line 110
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getContentAreaHeight()I

    .line 111
    .line 112
    .line 113
    move-result v5

    .line 114
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getPaddingTop()I

    .line 115
    .line 116
    .line 117
    move-result v6

    .line 118
    add-int/2addr v5, v6

    .line 119
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getPaddingBottom()I

    .line 120
    .line 121
    .line 122
    move-result v6

    .line 123
    add-int/2addr v5, v6

    .line 124
    int-to-float v5, v5

    .line 125
    iget p3, p3, Lcom/android/launcher3/h0;->Q1:I

    .line 126
    .line 127
    int-to-float v6, p3

    .line 128
    div-float/2addr v0, v6

    .line 129
    iput v0, p1, Lcom/android/launcher3/folder/Folder;->v0:F

    .line 130
    .line 131
    int-to-float p3, p3

    .line 132
    div-float/2addr v5, p3

    .line 133
    iput v5, p1, Lcom/android/launcher3/folder/Folder;->w0:F

    .line 134
    .line 135
    sub-float/2addr v2, v3

    .line 136
    const/high16 p3, 0x3f800000    # 1.0f

    .line 137
    .line 138
    sub-float/2addr v0, p3

    .line 139
    div-float/2addr v2, v0

    .line 140
    sub-float v0, v3, v2

    .line 141
    .line 142
    int-to-float v1, v1

    .line 143
    sub-float/2addr v0, v1

    .line 144
    iput v0, p1, Lcom/android/launcher3/folder/Folder;->t0:F

    .line 145
    .line 146
    sub-float v0, p0, p2

    .line 147
    .line 148
    sub-float/2addr v5, p3

    .line 149
    div-float/2addr v0, v5

    .line 150
    sub-float p3, p2, v0

    .line 151
    .line 152
    int-to-float v0, v4

    .line 153
    sub-float/2addr p3, v0

    .line 154
    iput p3, p1, Lcom/android/launcher3/folder/Folder;->u0:F

    .line 155
    .line 156
    new-instance p3, Ljava/lang/StringBuilder;

    .line 157
    .line 158
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 159
    .line 160
    .line 161
    const-string v0, "pivox="

    .line 162
    .line 163
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    iget v0, p1, Lcom/android/launcher3/folder/Folder;->t0:F

    .line 167
    .line 168
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    const-string v0, "pivoy="

    .line 172
    .line 173
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    iget v0, p1, Lcom/android/launcher3/folder/Folder;->u0:F

    .line 177
    .line 178
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    const-string v0, "floderY="

    .line 182
    .line 183
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    const-string p0, " folderIconX="

    .line 190
    .line 191
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    const-string p0, "folderIconY="

    .line 198
    .line 199
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    const-string p0, "scaleX="

    .line 206
    .line 207
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 208
    .line 209
    .line 210
    iget p0, p1, Lcom/android/launcher3/folder/Folder;->v0:F

    .line 211
    .line 212
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    const-string p0, "scaleY="

    .line 216
    .line 217
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 218
    .line 219
    .line 220
    iget p0, p1, Lcom/android/launcher3/folder/Folder;->w0:F

    .line 221
    .line 222
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 223
    .line 224
    .line 225
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object p0

    .line 229
    const-string p1, "FolderInHideAppStyle"

    .line 230
    .line 231
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 232
    .line 233
    .line 234
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
    iget-object v3, p1, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 30
    .line 31
    iget-object v4, p0, Lcom/android/launcher3/folder/F;->b:Landroid/graphics/Rect;

    .line 32
    .line 33
    invoke-virtual {p2, v3, v4}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 34
    .line 35
    .line 36
    iget-object v3, p0, Lcom/android/launcher3/folder/F;->b:Landroid/graphics/Rect;

    .line 37
    .line 38
    invoke-virtual {v3}, Landroid/graphics/Rect;->centerX()I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    iget-object v4, p0, Lcom/android/launcher3/folder/F;->b:Landroid/graphics/Rect;

    .line 43
    .line 44
    invoke-virtual {v4}, Landroid/graphics/Rect;->centerY()I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    div-int/lit8 v5, v1, 0x2

    .line 49
    .line 50
    sub-int/2addr v3, v5

    .line 51
    div-int/lit8 v6, v2, 0x2

    .line 52
    .line 53
    sub-int/2addr v4, v6

    .line 54
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 55
    .line 56
    .line 57
    move-result v7

    .line 58
    sub-int/2addr v7, v1

    .line 59
    div-int/lit8 v7, v7, 0x2

    .line 60
    .line 61
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 62
    .line 63
    .line 64
    move-result v8

    .line 65
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getFolderHeight()I

    .line 66
    .line 67
    .line 68
    move-result v9

    .line 69
    iget v10, p0, Lcom/android/launcher3/folder/F;->a:I

    .line 70
    .line 71
    sub-int/2addr v9, v10

    .line 72
    sub-int/2addr v8, v9

    .line 73
    div-int/lit8 v8, v8, 0x2

    .line 74
    .line 75
    sub-int/2addr v8, v10

    .line 76
    invoke-virtual {p4}, Lcom/android/launcher3/h0;->T0()Z

    .line 77
    .line 78
    .line 79
    move-result v9

    .line 80
    if-eqz v9, :cond_0

    .line 81
    .line 82
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 83
    .line 84
    .line 85
    move-result v8

    .line 86
    sub-int/2addr v8, v2

    .line 87
    div-int/lit8 v8, v8, 0x2

    .line 88
    .line 89
    :cond_0
    sub-int/2addr v3, v7

    .line 90
    add-int/2addr v5, v3

    .line 91
    sub-int/2addr v4, v8

    .line 92
    add-int/2addr v6, v4

    .line 93
    invoke-virtual {p0, p1, p2, p4}, Lcom/android/launcher3/folder/F;->c(Lcom/android/launcher3/folder/Folder;Lcom/android/launcher3/views/BaseDragLayer;Lcom/android/launcher3/h0;)V

    .line 94
    .line 95
    .line 96
    iget-object p0, p1, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 97
    .line 98
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    int-to-float p0, p0

    .line 103
    int-to-float p2, v5

    .line 104
    mul-float/2addr p2, v0

    .line 105
    int-to-float p4, v1

    .line 106
    div-float/2addr p2, p4

    .line 107
    mul-float/2addr p0, p2

    .line 108
    float-to-int p0, p0

    .line 109
    int-to-float p0, p0

    .line 110
    iput p0, p1, Lcom/android/launcher3/folder/Folder;->r0:F

    .line 111
    .line 112
    iget-object p0, p1, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 113
    .line 114
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 115
    .line 116
    .line 117
    move-result p0

    .line 118
    int-to-float p0, p0

    .line 119
    int-to-float p2, v6

    .line 120
    mul-float/2addr p2, v0

    .line 121
    int-to-float p4, v2

    .line 122
    div-float/2addr p2, p4

    .line 123
    mul-float/2addr p0, p2

    .line 124
    float-to-int p0, p0

    .line 125
    int-to-float p0, p0

    .line 126
    iput p0, p1, Lcom/android/launcher3/folder/Folder;->s0:F

    .line 127
    .line 128
    iput v7, p3, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->b:I

    .line 129
    .line 130
    iput v8, p3, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->c:I

    .line 131
    .line 132
    iput v1, p3, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 133
    .line 134
    iput v2, p3, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 135
    .line 136
    iput v8, p3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 137
    .line 138
    iput v7, p3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 139
    .line 140
    return-void
.end method

.method public e(Lcom/android/launcher3/folder/Folder;II)V
    .locals 0

    .line 1
    return-void
.end method
