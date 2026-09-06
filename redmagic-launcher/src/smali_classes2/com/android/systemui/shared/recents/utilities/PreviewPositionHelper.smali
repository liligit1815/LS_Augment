.class public Lcom/android/systemui/shared/recents/utilities/PreviewPositionHelper;
.super Ljava/lang/Object;
.source "PreviewPositionHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/shared/recents/utilities/PreviewPositionHelper$PreviewPositionHelperFactory;
    }
.end annotation


# static fields
.field public static final MAX_PCT_BEFORE_ASPECT_RATIOS_CONSIDERED_DIFFERENT:F = 0.1f

.field public static final STAGE_POSITION_BOTTOM_OR_RIGHT:I = 0x1

.field public static final STAGE_POSITION_TOP_OR_LEFT:I


# instance fields
.field private mIsOrientationChanged:Z

.field private final mMatrix:Landroid/graphics/Matrix;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Matrix;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/systemui/shared/recents/utilities/PreviewPositionHelper;->mMatrix:Landroid/graphics/Matrix;

    .line 10
    .line 11
    return-void
.end method

.method private getRotationDelta(II)I
    .locals 0

    .line 1
    sub-int/2addr p2, p1

    .line 2
    if-gez p2, :cond_0

    .line 3
    .line 4
    add-int/lit8 p2, p2, 0x4

    .line 5
    .line 6
    :cond_0
    return p2
.end method

.method private isOrientationChange(I)Z
    .locals 1

    .line 1
    const/4 p0, 0x1

    .line 2
    if-eq p1, p0, :cond_1

    .line 3
    .line 4
    const/4 v0, 0x3

    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    :cond_1
    :goto_0
    return p0
.end method

.method private setThumbnailRotation(ILandroid/graphics/Rect;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/systemui/shared/recents/utilities/PreviewPositionHelper;->mMatrix:Landroid/graphics/Matrix;

    .line 2
    .line 3
    mul-int/lit8 v1, p1, 0x5a

    .line 4
    .line 5
    int-to-float v1, v1

    .line 6
    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->setRotate(F)V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    const/4 v1, 0x0

    .line 11
    if-eq p1, v0, :cond_2

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    if-eq p1, v0, :cond_1

    .line 15
    .line 16
    const/4 v0, 0x3

    .line 17
    if-eq p1, v0, :cond_0

    .line 18
    .line 19
    move p1, v1

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    :goto_0
    int-to-float p1, p1

    .line 26
    goto :goto_1

    .line 27
    :cond_1
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    int-to-float v1, p1

    .line 32
    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    goto :goto_0

    .line 37
    :cond_2
    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    int-to-float p1, p1

    .line 42
    move v2, v1

    .line 43
    move v1, p1

    .line 44
    move p1, v2

    .line 45
    :goto_1
    iget-object p0, p0, Lcom/android/systemui/shared/recents/utilities/PreviewPositionHelper;->mMatrix:Landroid/graphics/Matrix;

    .line 46
    .line 47
    invoke-virtual {p0, v1, p1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 48
    .line 49
    .line 50
    return-void
.end method


# virtual methods
.method public getMatrix()Landroid/graphics/Matrix;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/systemui/shared/recents/utilities/PreviewPositionHelper;->mMatrix:Landroid/graphics/Matrix;

    .line 2
    .line 3
    return-object p0
.end method

.method public isOrientationChanged()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/systemui/shared/recents/utilities/PreviewPositionHelper;->mIsOrientationChanged:Z

    .line 2
    .line 3
    return p0
.end method

.method public setOrientationChanged(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/systemui/shared/recents/utilities/PreviewPositionHelper;->mIsOrientationChanged:Z

    .line 2
    .line 3
    return-void
.end method

.method public updateThumbnailMatrix(Landroid/graphics/Rect;Lcom/android/systemui/shared/recents/model/ThumbnailData;IIZIZ)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    move/from16 v2, p3

    .line 6
    .line 7
    move/from16 v3, p4

    .line 8
    .line 9
    iget v4, v1, Lcom/android/systemui/shared/recents/model/ThumbnailData;->rotation:I

    .line 10
    .line 11
    move/from16 v5, p6

    .line 12
    .line 13
    invoke-direct {v0, v5, v4}, Lcom/android/systemui/shared/recents/utilities/PreviewPositionHelper;->getRotationDelta(II)I

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    new-instance v5, Landroid/graphics/RectF;

    .line 18
    .line 19
    invoke-direct {v5}, Landroid/graphics/RectF;-><init>()V

    .line 20
    .line 21
    .line 22
    iget v6, v1, Lcom/android/systemui/shared/recents/model/ThumbnailData;->scale:F

    .line 23
    .line 24
    iget v7, v1, Lcom/android/systemui/shared/recents/model/ThumbnailData;->windowingMode:I

    .line 25
    .line 26
    const/4 v8, 0x0

    .line 27
    const/4 v9, 0x1

    .line 28
    if-ne v7, v9, :cond_0

    .line 29
    .line 30
    if-nez p5, :cond_0

    .line 31
    .line 32
    move v7, v9

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    move v7, v8

    .line 35
    :goto_0
    invoke-direct {v0, v4}, Lcom/android/systemui/shared/recents/utilities/PreviewPositionHelper;->isOrientationChange(I)Z

    .line 36
    .line 37
    .line 38
    move-result v10

    .line 39
    if-eqz v10, :cond_1

    .line 40
    .line 41
    if-eqz v7, :cond_1

    .line 42
    .line 43
    move v10, v9

    .line 44
    goto :goto_1

    .line 45
    :cond_1
    move v10, v8

    .line 46
    :goto_1
    const/4 v11, 0x0

    .line 47
    if-eqz v2, :cond_f

    .line 48
    .line 49
    if-eqz v3, :cond_f

    .line 50
    .line 51
    cmpl-float v12, v6, v11

    .line 52
    .line 53
    if-nez v12, :cond_2

    .line 54
    .line 55
    goto/16 :goto_a

    .line 56
    .line 57
    :cond_2
    if-lez v4, :cond_3

    .line 58
    .line 59
    if-eqz v7, :cond_3

    .line 60
    .line 61
    goto :goto_2

    .line 62
    :cond_3
    move v9, v8

    .line 63
    :goto_2
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Rect;->width()I

    .line 64
    .line 65
    .line 66
    move-result v7

    .line 67
    int-to-float v7, v7

    .line 68
    div-float/2addr v7, v6

    .line 69
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Rect;->height()I

    .line 70
    .line 71
    .line 72
    move-result v12

    .line 73
    int-to-float v12, v12

    .line 74
    div-float/2addr v12, v6

    .line 75
    int-to-float v2, v2

    .line 76
    int-to-float v3, v3

    .line 77
    div-float v13, v2, v3

    .line 78
    .line 79
    if-eqz v9, :cond_4

    .line 80
    .line 81
    div-float v14, v12, v7

    .line 82
    .line 83
    goto :goto_3

    .line 84
    :cond_4
    div-float v14, v7, v12

    .line 85
    .line 86
    :goto_3
    const v15, 0x3dcccccd    # 0.1f

    .line 87
    .line 88
    .line 89
    invoke-static {v13, v14, v15}, Lcom/android/systemui/shared/recents/utilities/Utilities;->isRelativePercentDifferenceGreaterThan(FFF)Z

    .line 90
    .line 91
    .line 92
    move-result v13

    .line 93
    if-eqz v9, :cond_5

    .line 94
    .line 95
    if-eqz v13, :cond_5

    .line 96
    .line 97
    move v9, v8

    .line 98
    goto :goto_4

    .line 99
    :cond_5
    move v8, v10

    .line 100
    :goto_4
    if-eqz v13, :cond_6

    .line 101
    .line 102
    iget-object v1, v1, Lcom/android/systemui/shared/recents/model/ThumbnailData;->letterboxInsets:Landroid/graphics/Rect;

    .line 103
    .line 104
    iget v10, v1, Landroid/graphics/Rect;->left:I

    .line 105
    .line 106
    int-to-float v10, v10

    .line 107
    iput v10, v5, Landroid/graphics/RectF;->left:F

    .line 108
    .line 109
    iget v13, v1, Landroid/graphics/Rect;->right:I

    .line 110
    .line 111
    int-to-float v13, v13

    .line 112
    iput v13, v5, Landroid/graphics/RectF;->right:F

    .line 113
    .line 114
    iget v14, v1, Landroid/graphics/Rect;->top:I

    .line 115
    .line 116
    int-to-float v14, v14

    .line 117
    iput v14, v5, Landroid/graphics/RectF;->top:F

    .line 118
    .line 119
    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    .line 120
    .line 121
    int-to-float v1, v1

    .line 122
    iput v1, v5, Landroid/graphics/RectF;->bottom:F

    .line 123
    .line 124
    add-float/2addr v10, v13

    .line 125
    sub-float v10, v7, v10

    .line 126
    .line 127
    add-float/2addr v14, v1

    .line 128
    sub-float v1, v12, v14

    .line 129
    .line 130
    goto :goto_5

    .line 131
    :cond_6
    move v10, v7

    .line 132
    move v1, v12

    .line 133
    :goto_5
    if-eqz v8, :cond_7

    .line 134
    .line 135
    move/from16 v16, v3

    .line 136
    .line 137
    move v3, v2

    .line 138
    move/from16 v2, v16

    .line 139
    .line 140
    :cond_7
    div-float v13, v2, v3

    .line 141
    .line 142
    div-float v14, v10, v13

    .line 143
    .line 144
    cmpl-float v15, v14, v1

    .line 145
    .line 146
    if-lez v15, :cond_a

    .line 147
    .line 148
    cmpg-float v14, v1, v3

    .line 149
    .line 150
    if-gez v14, :cond_8

    .line 151
    .line 152
    invoke-static {v3, v12}, Ljava/lang/Math;->min(FF)F

    .line 153
    .line 154
    .line 155
    move-result v3

    .line 156
    move v14, v3

    .line 157
    goto :goto_6

    .line 158
    :cond_8
    move v14, v1

    .line 159
    :goto_6
    mul-float v3, v14, v13

    .line 160
    .line 161
    cmpl-float v12, v3, v7

    .line 162
    .line 163
    if-lez v12, :cond_9

    .line 164
    .line 165
    div-float v14, v7, v13

    .line 166
    .line 167
    goto :goto_7

    .line 168
    :cond_9
    move v7, v3

    .line 169
    goto :goto_7

    .line 170
    :cond_a
    move v7, v10

    .line 171
    :goto_7
    if-eqz p7, :cond_b

    .line 172
    .line 173
    iget v3, v5, Landroid/graphics/RectF;->left:F

    .line 174
    .line 175
    sub-float/2addr v10, v7

    .line 176
    add-float/2addr v3, v10

    .line 177
    iput v3, v5, Landroid/graphics/RectF;->left:F

    .line 178
    .line 179
    iget v10, v5, Landroid/graphics/RectF;->right:F

    .line 180
    .line 181
    cmpg-float v12, v10, v11

    .line 182
    .line 183
    if-gez v12, :cond_c

    .line 184
    .line 185
    add-float/2addr v3, v10

    .line 186
    iput v3, v5, Landroid/graphics/RectF;->left:F

    .line 187
    .line 188
    iput v11, v5, Landroid/graphics/RectF;->right:F

    .line 189
    .line 190
    goto :goto_8

    .line 191
    :cond_b
    iget v3, v5, Landroid/graphics/RectF;->right:F

    .line 192
    .line 193
    sub-float/2addr v10, v7

    .line 194
    add-float/2addr v3, v10

    .line 195
    iput v3, v5, Landroid/graphics/RectF;->right:F

    .line 196
    .line 197
    iget v10, v5, Landroid/graphics/RectF;->left:F

    .line 198
    .line 199
    cmpg-float v12, v10, v11

    .line 200
    .line 201
    if-gez v12, :cond_c

    .line 202
    .line 203
    add-float/2addr v3, v10

    .line 204
    iput v3, v5, Landroid/graphics/RectF;->right:F

    .line 205
    .line 206
    iput v11, v5, Landroid/graphics/RectF;->left:F

    .line 207
    .line 208
    :cond_c
    :goto_8
    iget v3, v5, Landroid/graphics/RectF;->bottom:F

    .line 209
    .line 210
    sub-float/2addr v1, v14

    .line 211
    add-float/2addr v3, v1

    .line 212
    iput v3, v5, Landroid/graphics/RectF;->bottom:F

    .line 213
    .line 214
    iget v1, v5, Landroid/graphics/RectF;->top:F

    .line 215
    .line 216
    cmpg-float v10, v1, v11

    .line 217
    .line 218
    if-gez v10, :cond_d

    .line 219
    .line 220
    add-float/2addr v3, v1

    .line 221
    iput v3, v5, Landroid/graphics/RectF;->bottom:F

    .line 222
    .line 223
    iput v11, v5, Landroid/graphics/RectF;->top:F

    .line 224
    .line 225
    goto :goto_9

    .line 226
    :cond_d
    cmpg-float v10, v3, v11

    .line 227
    .line 228
    if-gez v10, :cond_e

    .line 229
    .line 230
    add-float/2addr v1, v3

    .line 231
    iput v1, v5, Landroid/graphics/RectF;->top:F

    .line 232
    .line 233
    iput v11, v5, Landroid/graphics/RectF;->bottom:F

    .line 234
    .line 235
    :cond_e
    :goto_9
    mul-float/2addr v7, v6

    .line 236
    div-float v11, v2, v7

    .line 237
    .line 238
    move v10, v8

    .line 239
    move v8, v9

    .line 240
    :cond_f
    :goto_a
    if-nez v8, :cond_10

    .line 241
    .line 242
    iget-object v1, v0, Lcom/android/systemui/shared/recents/utilities/PreviewPositionHelper;->mMatrix:Landroid/graphics/Matrix;

    .line 243
    .line 244
    iget v2, v5, Landroid/graphics/RectF;->left:F

    .line 245
    .line 246
    neg-float v2, v2

    .line 247
    mul-float/2addr v2, v6

    .line 248
    iget v3, v5, Landroid/graphics/RectF;->top:F

    .line 249
    .line 250
    neg-float v3, v3

    .line 251
    mul-float/2addr v3, v6

    .line 252
    invoke-virtual {v1, v2, v3}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 253
    .line 254
    .line 255
    goto :goto_b

    .line 256
    :cond_10
    move-object/from16 v1, p1

    .line 257
    .line 258
    invoke-direct {v0, v4, v1}, Lcom/android/systemui/shared/recents/utilities/PreviewPositionHelper;->setThumbnailRotation(ILandroid/graphics/Rect;)V

    .line 259
    .line 260
    .line 261
    :goto_b
    iget-object v1, v0, Lcom/android/systemui/shared/recents/utilities/PreviewPositionHelper;->mMatrix:Landroid/graphics/Matrix;

    .line 262
    .line 263
    invoke-virtual {v1, v11, v11}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 264
    .line 265
    .line 266
    iput-boolean v10, v0, Lcom/android/systemui/shared/recents/utilities/PreviewPositionHelper;->mIsOrientationChanged:Z

    .line 267
    .line 268
    return-void
.end method
