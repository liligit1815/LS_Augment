.class Lcom/android/quickstep/OrientationTouchTransformer;
.super Ljava/lang/Object;
.source "OrientationTouchTransformer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/OrientationTouchTransformer$QuickStepContractInfo;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field private static final QUICKSTEP_ROTATION_UNINITIALIZED:I = -0x1

.field private static final TAG:Ljava/lang/String; = "OrientationTouchTransformer"


# instance fields
.field private mActiveTouchRotation:I

.field private final mAssistantLeftRegion:Lcom/android/quickstep/OrientationRectF;

.field private final mAssistantRightRegion:Lcom/android/quickstep/OrientationRectF;

.field private mCachedDisplayInfo:Lcom/android/launcher3/util/window/a;

.field private final mContext:Landroid/content/Context;

.field private mContractInfo:Lcom/android/quickstep/OrientationTouchTransformer$QuickStepContractInfo;

.field private mEnableMultipleRegions:Z

.field protected mGesturalHeight:I

.field private final mHigherGestureRegion:Landroid/graphics/RectF;

.field private mIsShowingGestureIndcator:Z

.field private mLastRectTouched:Lcom/android/quickstep/OrientationRectF;

.field private mMode:Lcom/android/launcher3/util/C1;

.field private mNavBarGesturalHeight:I

.field private final mNavBarLargerGesturalHeight:I

.field private mNotInjectLeftRegionLeftX:F

.field private mNotInjectLeftRegionRightX:F

.field private mNotInjectRightRegionLeftX:F

.field private mNotInjectRightRegionRightX:F

.field private final mOneHandedModeRegion:Landroid/graphics/RectF;

.field private mQuickStepStartingRotation:I

.field private mResources:Landroid/content/res/Resources;

.field private final mSwipeTouchRegions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/android/launcher3/util/window/a;",
            "Lcom/android/quickstep/OrientationRectF;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/content/res/Resources;Lcom/android/launcher3/util/C1;Lcom/android/quickstep/OrientationTouchTransformer$QuickStepContractInfo;Landroid/content/Context;)V
    .locals 8

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mSwipeTouchRegions:Ljava/util/Map;

    .line 10
    .line 11
    new-instance v1, Lcom/android/quickstep/OrientationRectF;

    .line 12
    .line 13
    const/4 v5, 0x0

    .line 14
    const/4 v6, 0x0

    .line 15
    const/4 v2, 0x0

    .line 16
    const/4 v3, 0x0

    .line 17
    const/4 v4, 0x0

    .line 18
    invoke-direct/range {v1 .. v6}, Lcom/android/quickstep/OrientationRectF;-><init>(FFFFI)V

    .line 19
    .line 20
    .line 21
    iput-object v1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mAssistantLeftRegion:Lcom/android/quickstep/OrientationRectF;

    .line 22
    .line 23
    new-instance v2, Lcom/android/quickstep/OrientationRectF;

    .line 24
    .line 25
    const/4 v6, 0x0

    .line 26
    const/4 v7, 0x0

    .line 27
    invoke-direct/range {v2 .. v7}, Lcom/android/quickstep/OrientationRectF;-><init>(FFFFI)V

    .line 28
    .line 29
    .line 30
    iput-object v2, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mAssistantRightRegion:Lcom/android/quickstep/OrientationRectF;

    .line 31
    .line 32
    new-instance v0, Landroid/graphics/RectF;

    .line 33
    .line 34
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mOneHandedModeRegion:Landroid/graphics/RectF;

    .line 38
    .line 39
    new-instance v0, Lcom/android/launcher3/util/window/a;

    .line 40
    .line 41
    invoke-direct {v0}, Lcom/android/launcher3/util/window/a;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mCachedDisplayInfo:Lcom/android/launcher3/util/window/a;

    .line 45
    .line 46
    const/4 v0, -0x1

    .line 47
    iput v0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mQuickStepStartingRotation:I

    .line 48
    .line 49
    new-instance v0, Landroid/graphics/RectF;

    .line 50
    .line 51
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 52
    .line 53
    .line 54
    iput-object v0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mHigherGestureRegion:Landroid/graphics/RectF;

    .line 55
    .line 56
    iput-object p1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mResources:Landroid/content/res/Resources;

    .line 57
    .line 58
    iput-object p2, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mMode:Lcom/android/launcher3/util/C1;

    .line 59
    .line 60
    iput-object p3, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mContractInfo:Lcom/android/quickstep/OrientationTouchTransformer$QuickStepContractInfo;

    .line 61
    .line 62
    const-string p2, "navigation_bar_gesture_height"

    .line 63
    .line 64
    invoke-direct {p0, p2}, Lcom/android/quickstep/OrientationTouchTransformer;->getNavbarSize(Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    move-result p2

    .line 68
    iput p2, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mNavBarGesturalHeight:I

    .line 69
    .line 70
    const-string p3, "navigation_bar_gesture_larger_height"

    .line 71
    .line 72
    invoke-static {p3, p1, p2}, Lc2/a;->b(Ljava/lang/String;Landroid/content/res/Resources;I)I

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    iput p1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mNavBarLargerGesturalHeight:I

    .line 77
    .line 78
    invoke-static {}, Lx1/O;->H0()Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    iput-boolean p1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mIsShowingGestureIndcator:Z

    .line 83
    .line 84
    iput-object p4, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mContext:Landroid/content/Context;

    .line 85
    .line 86
    return-void
.end method

.method private createRegionForDisplay(Lcom/android/launcher3/util/Z$c;Ljava/lang/String;)Lcom/android/quickstep/OrientationRectF;
    .locals 11

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/OrientationTouchTransformer;->enableLog()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "OrientationTouchTransformer"

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v2, "creating rotation region for: "

    .line 15
    .line 16
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    iget-object v2, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mCachedDisplayInfo:Lcom/android/launcher3/util/window/a;

    .line 20
    .line 21
    iget v2, v2, Lcom/android/launcher3/util/window/a;->b:I

    .line 22
    .line 23
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v2, " with mode: "

    .line 27
    .line 28
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget-object v2, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mMode:Lcom/android/launcher3/util/C1;

    .line 32
    .line 33
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v2, " displayRotation: "

    .line 37
    .line 38
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget v2, p1, Lcom/android/launcher3/util/Z$c;->b:I

    .line 42
    .line 43
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v2, " displaySize: "

    .line 47
    .line 48
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    iget-object v2, p1, Lcom/android/launcher3/util/Z$c;->c:Landroid/graphics/Point;

    .line 52
    .line 53
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string v2, " navBarHeight: "

    .line 57
    .line 58
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    iget v2, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mNavBarGesturalHeight:I

    .line 62
    .line 63
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string v2, " reason: "

    .line 67
    .line 68
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    .line 80
    .line 81
    :cond_0
    iget-object v3, p1, Lcom/android/launcher3/util/Z$c;->c:Landroid/graphics/Point;

    .line 82
    .line 83
    iget v2, p1, Lcom/android/launcher3/util/Z$c;->b:I

    .line 84
    .line 85
    iget-object p1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mMode:Lcom/android/launcher3/util/C1;

    .line 86
    .line 87
    sget-object v0, Lcom/android/launcher3/util/C1;->l:Lcom/android/launcher3/util/C1;

    .line 88
    .line 89
    const/4 v10, 0x2

    .line 90
    if-ne p1, v0, :cond_2

    .line 91
    .line 92
    invoke-static {}, Lx1/O;->H0()Z

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    if-eqz p1, :cond_2

    .line 97
    .line 98
    if-eqz v2, :cond_1

    .line 99
    .line 100
    if-ne v2, v10, :cond_2

    .line 101
    .line 102
    :cond_1
    const p1, 0x7f07037d

    .line 103
    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_2
    invoke-static {}, Lx1/O;->k2()Ljava/lang/Boolean;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    if-eqz p1, :cond_3

    .line 115
    .line 116
    const p1, 0x7f07037a

    .line 117
    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_3
    const p1, 0x7f070376

    .line 121
    .line 122
    .line 123
    :goto_0
    iget-object v4, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mContext:Landroid/content/Context;

    .line 124
    .line 125
    iget-object v5, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mResources:Landroid/content/res/Resources;

    .line 126
    .line 127
    const/4 v6, 0x0

    .line 128
    invoke-static {v4, v5, v6}, Lx1/O;->D(Landroid/content/Context;Landroid/content/res/Resources;Z)V

    .line 129
    .line 130
    .line 131
    iget-object v4, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mResources:Landroid/content/res/Resources;

    .line 132
    .line 133
    invoke-virtual {v4, p1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 134
    .line 135
    .line 136
    move-result p1

    .line 137
    float-to-double v4, p1

    .line 138
    invoke-static {v4, v5}, Ljava/lang/Math;->floor(D)D

    .line 139
    .line 140
    .line 141
    move-result-wide v4

    .line 142
    double-to-int p1, v4

    .line 143
    new-instance v4, Lcom/android/quickstep/OrientationRectF;

    .line 144
    .line 145
    iget v5, v3, Landroid/graphics/Point;->x:I

    .line 146
    .line 147
    int-to-float v7, v5

    .line 148
    iget v5, v3, Landroid/graphics/Point;->y:I

    .line 149
    .line 150
    int-to-float v8, v5

    .line 151
    const/4 v5, 0x0

    .line 152
    const/4 v6, 0x0

    .line 153
    move v9, v2

    .line 154
    invoke-direct/range {v4 .. v9}, Lcom/android/quickstep/OrientationRectF;-><init>(FFFFI)V

    .line 155
    .line 156
    .line 157
    iget-object v5, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mMode:Lcom/android/launcher3/util/C1;

    .line 158
    .line 159
    if-eq v5, v0, :cond_7

    .line 160
    .line 161
    sget-object v6, Lcom/android/launcher3/util/C1;->j:Lcom/android/launcher3/util/C1;

    .line 162
    .line 163
    if-ne v5, v6, :cond_4

    .line 164
    .line 165
    invoke-static {}, Lcom/android/systemui/shared/Flags;->threeButtonCornerSwipe()Z

    .line 166
    .line 167
    .line 168
    move-result v5

    .line 169
    if-eqz v5, :cond_4

    .line 170
    .line 171
    goto :goto_1

    .line 172
    :cond_4
    iget-object v5, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mAssistantLeftRegion:Lcom/android/quickstep/OrientationRectF;

    .line 173
    .line 174
    invoke-virtual {v5}, Landroid/graphics/RectF;->setEmpty()V

    .line 175
    .line 176
    .line 177
    iget-object v5, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mAssistantRightRegion:Lcom/android/quickstep/OrientationRectF;

    .line 178
    .line 179
    invoke-virtual {v5}, Landroid/graphics/RectF;->setEmpty()V

    .line 180
    .line 181
    .line 182
    const-string v5, "navigation_bar_width"

    .line 183
    .line 184
    invoke-direct {p0, v5}, Lcom/android/quickstep/OrientationTouchTransformer;->getNavbarSize(Ljava/lang/String;)I

    .line 185
    .line 186
    .line 187
    move-result v5

    .line 188
    const/4 v6, 0x1

    .line 189
    if-eq v2, v6, :cond_6

    .line 190
    .line 191
    const/4 v6, 0x3

    .line 192
    if-eq v2, v6, :cond_5

    .line 193
    .line 194
    iget v5, v4, Landroid/graphics/RectF;->bottom:F

    .line 195
    .line 196
    int-to-float v6, p1

    .line 197
    sub-float/2addr v5, v6

    .line 198
    iput v5, v4, Landroid/graphics/RectF;->top:F

    .line 199
    .line 200
    goto :goto_2

    .line 201
    :cond_5
    iget v6, v4, Landroid/graphics/RectF;->left:F

    .line 202
    .line 203
    int-to-float v5, v5

    .line 204
    add-float/2addr v6, v5

    .line 205
    iput v6, v4, Landroid/graphics/RectF;->right:F

    .line 206
    .line 207
    goto :goto_2

    .line 208
    :cond_6
    iget v6, v4, Landroid/graphics/RectF;->right:F

    .line 209
    .line 210
    int-to-float v5, v5

    .line 211
    sub-float/2addr v6, v5

    .line 212
    iput v6, v4, Landroid/graphics/RectF;->left:F

    .line 213
    .line 214
    goto :goto_2

    .line 215
    :cond_7
    :goto_1
    iget v5, v4, Landroid/graphics/RectF;->bottom:F

    .line 216
    .line 217
    int-to-float v6, p1

    .line 218
    sub-float/2addr v5, v6

    .line 219
    iput v5, v4, Landroid/graphics/RectF;->top:F

    .line 220
    .line 221
    invoke-direct {p0, v4}, Lcom/android/quickstep/OrientationTouchTransformer;->updateAssistantRegions(Lcom/android/quickstep/OrientationRectF;)V

    .line 222
    .line 223
    .line 224
    :goto_2
    invoke-direct {p0, v4}, Lcom/android/quickstep/OrientationTouchTransformer;->updateOneHandedRegions(Lcom/android/quickstep/OrientationRectF;)V

    .line 225
    .line 226
    .line 227
    iget-object v5, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mOneHandedModeRegion:Landroid/graphics/RectF;

    .line 228
    .line 229
    iget v6, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mNavBarGesturalHeight:I

    .line 230
    .line 231
    iget v7, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mNavBarLargerGesturalHeight:I

    .line 232
    .line 233
    move-object v8, p2

    .line 234
    invoke-static/range {v2 .. v8}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logCreateTouchRegionForDisplay(ILandroid/graphics/Point;Landroid/graphics/RectF;Landroid/graphics/RectF;IILjava/lang/String;)V

    .line 235
    .line 236
    .line 237
    iget-object p2, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mHigherGestureRegion:Landroid/graphics/RectF;

    .line 238
    .line 239
    iget v2, v4, Landroid/graphics/RectF;->bottom:F

    .line 240
    .line 241
    int-to-float v5, p1

    .line 242
    sub-float/2addr v2, v5

    .line 243
    iget-object v5, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mResources:Landroid/content/res/Resources;

    .line 244
    .line 245
    const v6, 0x7f070377

    .line 246
    .line 247
    .line 248
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimension(I)F

    .line 249
    .line 250
    .line 251
    move-result v5

    .line 252
    float-to-double v5, v5

    .line 253
    invoke-static {v5, v6}, Ljava/lang/Math;->floor(D)D

    .line 254
    .line 255
    .line 256
    move-result-wide v5

    .line 257
    double-to-int v5, v5

    .line 258
    int-to-float v5, v5

    .line 259
    sub-float/2addr v2, v5

    .line 260
    iget v5, v3, Landroid/graphics/Point;->x:I

    .line 261
    .line 262
    int-to-float v5, v5

    .line 263
    iget v3, v3, Landroid/graphics/Point;->y:I

    .line 264
    .line 265
    int-to-float v3, v3

    .line 266
    const/4 v6, 0x0

    .line 267
    invoke-virtual {p2, v6, v2, v5, v3}, Landroid/graphics/RectF;->set(FFFF)V

    .line 268
    .line 269
    .line 270
    iget p2, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mNavBarLargerGesturalHeight:I

    .line 271
    .line 272
    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    .line 273
    .line 274
    .line 275
    move-result p1

    .line 276
    iput p1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mGesturalHeight:I

    .line 277
    .line 278
    iget-object p1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mMode:Lcom/android/launcher3/util/C1;

    .line 279
    .line 280
    if-ne p1, v0, :cond_a

    .line 281
    .line 282
    iget-object p1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mContext:Landroid/content/Context;

    .line 283
    .line 284
    if-eqz p1, :cond_a

    .line 285
    .line 286
    iget-object p1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mResources:Landroid/content/res/Resources;

    .line 287
    .line 288
    iget p2, v4, Lcom/android/quickstep/OrientationRectF;->mRotation:I

    .line 289
    .line 290
    if-eqz p2, :cond_9

    .line 291
    .line 292
    if-ne p2, v10, :cond_8

    .line 293
    .line 294
    goto :goto_3

    .line 295
    :cond_8
    const p2, 0x7f07037e

    .line 296
    .line 297
    .line 298
    goto :goto_4

    .line 299
    :cond_9
    :goto_3
    const p2, 0x7f07037f

    .line 300
    .line 301
    .line 302
    :goto_4
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 303
    .line 304
    .line 305
    move-result p1

    .line 306
    float-to-double p1, p1

    .line 307
    invoke-static {p1, p2}, Ljava/lang/Math;->floor(D)D

    .line 308
    .line 309
    .line 310
    move-result-wide p1

    .line 311
    double-to-int p1, p1

    .line 312
    new-instance p2, Ljava/lang/StringBuilder;

    .line 313
    .line 314
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 315
    .line 316
    .line 317
    const-string v0, "InputInjectUtils "

    .line 318
    .line 319
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 320
    .line 321
    .line 322
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 323
    .line 324
    .line 325
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 326
    .line 327
    .line 328
    move-result-object p2

    .line 329
    invoke-static {v1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 330
    .line 331
    .line 332
    iget-object p0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mContext:Landroid/content/Context;

    .line 333
    .line 334
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 335
    .line 336
    .line 337
    move-result-object p0

    .line 338
    invoke-static {p0}, Lcom/android/quickstep/util/InputInjectHelper;->getInstance(Landroid/content/Context;)Lcom/android/quickstep/util/InputInjectHelper;

    .line 339
    .line 340
    .line 341
    move-result-object p0

    .line 342
    int-to-float p1, p1

    .line 343
    iget p2, v4, Landroid/graphics/RectF;->right:F

    .line 344
    .line 345
    sub-float v0, p2, p1

    .line 346
    .line 347
    invoke-virtual {p0, v6, p1, v0, p2}, Lcom/android/quickstep/util/InputInjectHelper;->setNotInjectRegion(FFFF)V

    .line 348
    .line 349
    .line 350
    :cond_a
    return-object v4
.end method

.method private enableLog()Z
    .locals 0

    .line 1
    sget-boolean p0, Lc2/b;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method private getNavbarSize(Ljava/lang/String;)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mResources:Landroid/content/res/Resources;

    .line 2
    .line 3
    invoke-static {p1, p0}, Lc2/a;->d(Ljava/lang/String;Landroid/content/res/Resources;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method private refreshTouchRegion(Lcom/android/launcher3/util/Z$c;Landroid/content/res/Resources;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mResources:Landroid/content/res/Resources;

    .line 2
    .line 3
    iget-object p2, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mSwipeTouchRegions:Ljava/util/Map;

    .line 4
    .line 5
    invoke-interface {p2}, Ljava/util/Map;->clear()V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, p1, p3}, Lcom/android/quickstep/OrientationTouchTransformer;->resetSwipeRegions(Lcom/android/launcher3/util/Z$c;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private resetSwipeRegions()V
    .locals 3

    .line 11
    iget-object v0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mSwipeTouchRegions:Ljava/util/Map;

    iget-object v1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mCachedDisplayInfo:Lcom/android/launcher3/util/window/a;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/quickstep/OrientationRectF;

    .line 12
    iget-object v1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mSwipeTouchRegions:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    if-eqz v0, :cond_0

    .line 13
    iget-object v1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mSwipeTouchRegions:Ljava/util/Map;

    iget-object v2, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mCachedDisplayInfo:Lcom/android/launcher3/util/window/a;

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    invoke-direct {p0, v0}, Lcom/android/quickstep/OrientationTouchTransformer;->updateAssistantRegions(Lcom/android/quickstep/OrientationRectF;)V

    .line 15
    invoke-direct {p0, v0}, Lcom/android/quickstep/OrientationTouchTransformer;->updateOneHandedRegions(Lcom/android/quickstep/OrientationRectF;)V

    :cond_0
    return-void
.end method

.method private resetSwipeRegions(Lcom/android/launcher3/util/Z$c;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/OrientationTouchTransformer;->enableLog()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "clearing all regions except rotation: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mCachedDisplayInfo:Lcom/android/launcher3/util/window/a;

    iget v1, v1, Lcom/android/launcher3/util/window/a;->b:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " reason="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OrientationTouchTransformer"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3
    :cond_0
    new-instance v0, Lcom/android/launcher3/util/window/a;

    iget-object v1, p1, Lcom/android/launcher3/util/Z$c;->c:Landroid/graphics/Point;

    iget v2, p1, Lcom/android/launcher3/util/Z$c;->b:I

    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/util/window/a;-><init>(Landroid/graphics/Point;I)V

    iput-object v0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mCachedDisplayInfo:Lcom/android/launcher3/util/window/a;

    .line 4
    iget-object v1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mSwipeTouchRegions:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/quickstep/OrientationRectF;

    if-eqz v0, :cond_1

    .line 5
    iget-boolean v1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mIsShowingGestureIndcator:Z

    invoke-static {}, Lx1/O;->H0()Z

    move-result v2

    if-eq v1, v2, :cond_2

    .line 6
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/OrientationTouchTransformer;->createRegionForDisplay(Lcom/android/launcher3/util/Z$c;Ljava/lang/String;)Lcom/android/quickstep/OrientationRectF;

    move-result-object v0

    .line 7
    :cond_2
    iget-object p1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mSwipeTouchRegions:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->clear()V

    .line 8
    iget-object p1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mSwipeTouchRegions:Ljava/util/Map;

    iget-object p2, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mCachedDisplayInfo:Lcom/android/launcher3/util/window/a;

    invoke-interface {p1, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    invoke-direct {p0, v0}, Lcom/android/quickstep/OrientationTouchTransformer;->updateAssistantRegions(Lcom/android/quickstep/OrientationRectF;)V

    .line 10
    invoke-direct {p0, v0}, Lcom/android/quickstep/OrientationTouchTransformer;->updateOneHandedRegions(Lcom/android/quickstep/OrientationRectF;)V

    return-void
.end method

.method private updateAssistantRegions(Lcom/android/quickstep/OrientationRectF;)V
    .locals 4

    .line 1
    invoke-static {}, Lx1/O;->H0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget v0, p1, Lcom/android/quickstep/OrientationRectF;->mRotation:I

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    if-ne v0, v1, :cond_1

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mResources:Landroid/content/res/Resources;

    .line 15
    .line 16
    const v1, 0x7f07037d

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    float-to-double v0, v0

    .line 24
    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    .line 25
    .line 26
    .line 27
    move-result-wide v0

    .line 28
    :goto_0
    double-to-int v0, v0

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    invoke-static {}, Lx1/O;->k2()Ljava/lang/Boolean;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    iget-object v0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mResources:Landroid/content/res/Resources;

    .line 41
    .line 42
    const v1, 0x7f07037a

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    float-to-double v0, v0

    .line 50
    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    .line 51
    .line 52
    .line 53
    move-result-wide v0

    .line 54
    goto :goto_0

    .line 55
    :cond_2
    iget-object v0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mResources:Landroid/content/res/Resources;

    .line 56
    .line 57
    const v1, 0x7f070376

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    float-to-double v0, v0

    .line 65
    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    .line 66
    .line 67
    .line 68
    move-result-wide v0

    .line 69
    goto :goto_0

    .line 70
    :goto_1
    iget-object v1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mResources:Landroid/content/res/Resources;

    .line 71
    .line 72
    const v2, 0x7f0703e5

    .line 73
    .line 74
    .line 75
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    int-to-float v0, v0

    .line 80
    iget-object v2, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mContractInfo:Lcom/android/quickstep/OrientationTouchTransformer$QuickStepContractInfo;

    .line 81
    .line 82
    invoke-interface {v2}, Lcom/android/quickstep/OrientationTouchTransformer$QuickStepContractInfo;->getWindowCornerRadius()F

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    invoke-static {v0, v2}, Ljava/lang/Math;->max(FF)F

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    iget-object v2, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mAssistantLeftRegion:Lcom/android/quickstep/OrientationRectF;

    .line 91
    .line 92
    iget-object p0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mAssistantRightRegion:Lcom/android/quickstep/OrientationRectF;

    .line 93
    .line 94
    iget v3, p1, Landroid/graphics/RectF;->bottom:F

    .line 95
    .line 96
    iput v3, p0, Landroid/graphics/RectF;->bottom:F

    .line 97
    .line 98
    iput v3, v2, Landroid/graphics/RectF;->bottom:F

    .line 99
    .line 100
    iget v3, p1, Landroid/graphics/RectF;->bottom:F

    .line 101
    .line 102
    sub-float/2addr v3, v0

    .line 103
    iput v3, p0, Landroid/graphics/RectF;->top:F

    .line 104
    .line 105
    iput v3, v2, Landroid/graphics/RectF;->top:F

    .line 106
    .line 107
    const/4 v0, 0x0

    .line 108
    iput v0, v2, Landroid/graphics/RectF;->left:F

    .line 109
    .line 110
    int-to-float v0, v1

    .line 111
    iput v0, v2, Landroid/graphics/RectF;->right:F

    .line 112
    .line 113
    iget v1, p1, Landroid/graphics/RectF;->right:F

    .line 114
    .line 115
    iput v1, p0, Landroid/graphics/RectF;->right:F

    .line 116
    .line 117
    iget p1, p1, Landroid/graphics/RectF;->right:F

    .line 118
    .line 119
    sub-float/2addr p1, v0

    .line 120
    iput p1, p0, Landroid/graphics/RectF;->left:F

    .line 121
    .line 122
    return-void
.end method

.method private updateOneHandedRegions(Lcom/android/quickstep/OrientationRectF;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mOneHandedModeRegion:Landroid/graphics/RectF;

    .line 2
    .line 3
    iget v1, p1, Landroid/graphics/RectF;->bottom:F

    .line 4
    .line 5
    iget p0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mNavBarLargerGesturalHeight:I

    .line 6
    .line 7
    int-to-float p0, p0

    .line 8
    sub-float p0, v1, p0

    .line 9
    .line 10
    iget p1, p1, Landroid/graphics/RectF;->right:F

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-virtual {v0, v2, p0, p1, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method createOrAddTouchRegion(Lcom/android/launcher3/util/Z$c;Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/android/launcher3/util/window/a;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/android/launcher3/util/Z$c;->c:Landroid/graphics/Point;

    .line 4
    .line 5
    iget v2, p1, Lcom/android/launcher3/util/Z$c;->b:I

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/util/window/a;-><init>(Landroid/graphics/Point;I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mCachedDisplayInfo:Lcom/android/launcher3/util/window/a;

    .line 11
    .line 12
    iget v1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mQuickStepStartingRotation:I

    .line 13
    .line 14
    const/4 v2, -0x1

    .line 15
    if-le v1, v2, :cond_0

    .line 16
    .line 17
    iget v2, v0, Lcom/android/launcher3/util/window/a;->b:I

    .line 18
    .line 19
    if-ne v2, v1, :cond_0

    .line 20
    .line 21
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/OrientationTouchTransformer;->resetSwipeRegions(Lcom/android/launcher3/util/Z$c;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-object v1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mSwipeTouchRegions:Ljava/util/Map;

    .line 26
    .line 27
    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lcom/android/quickstep/OrientationRectF;

    .line 32
    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    iget-boolean v0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mIsShowingGestureIndcator:Z

    .line 36
    .line 37
    invoke-static {}, Lx1/O;->H0()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-ne v0, v1, :cond_1

    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 47
    .line 48
    .line 49
    const-string v1, "mEnableMultipleRegions "

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    iget-boolean v1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mEnableMultipleRegions:Z

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const-string v1, "OrientationTouchTransformer"

    .line 64
    .line 65
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    iget-boolean v0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mEnableMultipleRegions:Z

    .line 69
    .line 70
    if-eqz v0, :cond_2

    .line 71
    .line 72
    iget-object v0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mSwipeTouchRegions:Ljava/util/Map;

    .line 73
    .line 74
    iget-object v1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mCachedDisplayInfo:Lcom/android/launcher3/util/window/a;

    .line 75
    .line 76
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/OrientationTouchTransformer;->createRegionForDisplay(Lcom/android/launcher3/util/Z$c;Ljava/lang/String;)Lcom/android/quickstep/OrientationRectF;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_2
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/OrientationTouchTransformer;->resetSwipeRegions(Lcom/android/launcher3/util/Z$c;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    :goto_0
    invoke-static {}, Lx1/O;->H0()Z

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    iput-boolean p1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mIsShowingGestureIndcator:Z

    .line 92
    .line 93
    return-void
.end method

.method public dump(Ljava/io/PrintWriter;)V
    .locals 4

    .line 1
    const-string v0, "OrientationTouchTransformerState: "

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v1, "  currentActiveRotation="

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/quickstep/OrientationTouchTransformer;->getCurrentActiveRotation()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    new-instance v0, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 33
    .line 34
    .line 35
    const-string v1, "  lastTouchedRegion="

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mLastRectTouched:Lcom/android/quickstep/OrientationRectF;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    new-instance v0, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 55
    .line 56
    .line 57
    const-string v1, "  multipleRegionsEnabled="

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    iget-boolean v1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mEnableMultipleRegions:Z

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    new-instance v0, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    const-string v1, "  currentTouchableRotations="

    .line 77
    .line 78
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    iget-object v1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mSwipeTouchRegions:Ljava/util/Map;

    .line 82
    .line 83
    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    if-eqz v2, :cond_0

    .line 96
    .line 97
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    check-cast v2, Lcom/android/launcher3/util/window/a;

    .line 102
    .line 103
    iget-object v3, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mSwipeTouchRegions:Ljava/util/Map;

    .line 104
    .line 105
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    check-cast v2, Lcom/android/quickstep/OrientationRectF;

    .line 110
    .line 111
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    const-string v2, " "

    .line 115
    .line 116
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_0
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 121
    .line 122
    .line 123
    new-instance v0, Ljava/lang/StringBuilder;

    .line 124
    .line 125
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 126
    .line 127
    .line 128
    const-string v1, "  mNavBarGesturalHeight="

    .line 129
    .line 130
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    iget v1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mNavBarGesturalHeight:I

    .line 134
    .line 135
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    new-instance v0, Ljava/lang/StringBuilder;

    .line 146
    .line 147
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 148
    .line 149
    .line 150
    const-string v1, "  mNavBarLargerGesturalHeight="

    .line 151
    .line 152
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    iget v1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mNavBarLargerGesturalHeight:I

    .line 156
    .line 157
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    new-instance v0, Ljava/lang/StringBuilder;

    .line 168
    .line 169
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 170
    .line 171
    .line 172
    const-string v1, "  mAssistantLeftRegion="

    .line 173
    .line 174
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    iget-object v1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mAssistantLeftRegion:Lcom/android/quickstep/OrientationRectF;

    .line 178
    .line 179
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    new-instance v0, Ljava/lang/StringBuilder;

    .line 190
    .line 191
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 192
    .line 193
    .line 194
    const-string v1, "  mAssistantRightRegion="

    .line 195
    .line 196
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    iget-object v1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mAssistantRightRegion:Lcom/android/quickstep/OrientationRectF;

    .line 200
    .line 201
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 209
    .line 210
    .line 211
    new-instance v0, Ljava/lang/StringBuilder;

    .line 212
    .line 213
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 214
    .line 215
    .line 216
    const-string v1, "  mOneHandedModeRegion="

    .line 217
    .line 218
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    iget-object p0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mOneHandedModeRegion:Landroid/graphics/RectF;

    .line 222
    .line 223
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 224
    .line 225
    .line 226
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object p0

    .line 230
    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 231
    .line 232
    .line 233
    return-void
.end method

.method enableMultipleRegions(ZLcom/android/launcher3/util/Z$c;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mMode:Lcom/android/launcher3/util/C1;

    .line 5
    .line 6
    sget-object v1, Lcom/android/launcher3/util/C1;->k:Lcom/android/launcher3/util/C1;

    .line 7
    .line 8
    if-eq p1, v1, :cond_0

    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move p1, v0

    .line 13
    :goto_0
    iput-boolean p1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mEnableMultipleRegions:Z

    .line 14
    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    iget p1, p2, Lcom/android/launcher3/util/Z$c;->b:I

    .line 18
    .line 19
    iput p1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mQuickStepStartingRotation:I

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_1
    iput v0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mActiveTouchRotation:I

    .line 23
    .line 24
    const/4 p1, -0x1

    .line 25
    iput p1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mQuickStepStartingRotation:I

    .line 26
    .line 27
    :goto_1
    const-string p1, "enableMultipleRegions"

    .line 28
    .line 29
    invoke-direct {p0, p2, p1}, Lcom/android/quickstep/OrientationTouchTransformer;->resetSwipeRegions(Lcom/android/launcher3/util/Z$c;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method getCurrentActiveRotation()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mActiveTouchRotation:I

    .line 2
    .line 3
    return p0
.end method

.method getQuickStepStartingRotation()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mQuickStepStartingRotation:I

    .line 2
    .line 3
    return p0
.end method

.method resetLastRectTouched()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mLastRectTouched:Lcom/android/quickstep/OrientationRectF;

    .line 3
    .line 4
    return-void
.end method

.method public setActivityTouchRotationAsDisplay(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mActiveTouchRotation:I

    .line 2
    .line 3
    return-void
.end method

.method setGesturalHeight(ILcom/android/launcher3/util/Z$c;Landroid/content/res/Resources;)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mNavBarGesturalHeight:I

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput p1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mNavBarGesturalHeight:I

    .line 7
    .line 8
    const-string p1, "setGesturalHeight"

    .line 9
    .line 10
    invoke-direct {p0, p2, p3, p1}, Lcom/android/quickstep/OrientationTouchTransformer;->refreshTouchRegion(Lcom/android/launcher3/util/Z$c;Landroid/content/res/Resources;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method setNavigationMode(Lcom/android/launcher3/util/C1;Lcom/android/launcher3/util/Z$c;Landroid/content/res/Resources;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/OrientationTouchTransformer;->enableLog()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v1, "setNavigationMode new: "

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v1, " oldMode: "

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mMode:Lcom/android/launcher3/util/C1;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v1, " "

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const-string v1, "OrientationTouchTransformer"

    .line 43
    .line 44
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mMode:Lcom/android/launcher3/util/C1;

    .line 48
    .line 49
    if-ne v0, p1, :cond_1

    .line 50
    .line 51
    return-void

    .line 52
    :cond_1
    iput-object p1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mMode:Lcom/android/launcher3/util/C1;

    .line 53
    .line 54
    const-string p1, "setNavigationMode"

    .line 55
    .line 56
    invoke-direct {p0, p2, p3, p1}, Lcom/android/quickstep/OrientationTouchTransformer;->refreshTouchRegion(Lcom/android/launcher3/util/Z$c;Landroid/content/res/Resources;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method setSingleActiveRegion(Lcom/android/launcher3/util/Z$c;)V
    .locals 1

    .line 1
    iget v0, p1, Lcom/android/launcher3/util/Z$c;->b:I

    .line 2
    .line 3
    iput v0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mActiveTouchRotation:I

    .line 4
    .line 5
    const-string v0, "setSingleActiveRegion"

    .line 6
    .line 7
    invoke-direct {p0, p1, v0}, Lcom/android/quickstep/OrientationTouchTransformer;->resetSwipeRegions(Lcom/android/launcher3/util/Z$c;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method touchHigherValidSwipeRegions(FF)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mHigherGestureRegion:Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Landroid/graphics/RectF;->contains(FF)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method touchInAssistantRegion(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-boolean v1, v1, Lcom/android/launcher3/h0;->G0:Z

    .line 18
    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/android/launcher3/v;->hasBeenResumed()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mAssistantLeftRegion:Lcom/android/quickstep/OrientationRectF;

    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    invoke-virtual {v0, v1, v2}, Lcom/android/quickstep/OrientationRectF;->contains(FF)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_2

    .line 43
    .line 44
    :goto_0
    iget-object p0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mAssistantRightRegion:Lcom/android/quickstep/OrientationRectF;

    .line 45
    .line 46
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    invoke-virtual {p0, v0, p1}, Lcom/android/quickstep/OrientationRectF;->contains(FF)Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    if-eqz p0, :cond_1

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_1
    const/4 p0, 0x0

    .line 62
    return p0

    .line 63
    :cond_2
    :goto_1
    const/4 p0, 0x1

    .line 64
    return p0
.end method

.method touchInLeftAssistantRegion(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->G0:Z

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mAssistantLeftRegion:Lcom/android/quickstep/OrientationRectF;

    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    invoke-virtual {p0, v0, p1}, Lcom/android/quickstep/OrientationRectF;->contains(FF)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_0
    const/4 p0, 0x0

    .line 40
    return p0
.end method

.method touchInOneHandedModeRegion(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mOneHandedModeRegion:Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {p0, v0, p1}, Landroid/graphics/RectF;->contains(FF)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method touchInValidSwipeRegions(FF)Z
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/OrientationTouchTransformer;->enableLog()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, " in "

    .line 6
    .line 7
    const-string v2, ","

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v3, "touchInValidSwipeRegions "

    .line 17
    .line 18
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    iget-object v3, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mLastRectTouched:Lcom/android/quickstep/OrientationRectF;

    .line 34
    .line 35
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const-string v3, "OrientationTouchTransformer"

    .line 43
    .line 44
    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    :cond_0
    invoke-static {}, Lx1/O;->a4()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_1

    .line 52
    .line 53
    new-instance v0, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 56
    .line 57
    .line 58
    const-string v3, "touchInValidSwipeRegions / "

    .line 59
    .line 60
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    iget-object v1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mLastRectTouched:Lcom/android/quickstep/OrientationRectF;

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    const-string v1, ", Mode / "

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    iget-object v1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mMode:Lcom/android/launcher3/util/C1;

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    const-string v1, "TaplEvents"

    .line 95
    .line 96
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    .line 98
    .line 99
    :cond_1
    iget-object p0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mLastRectTouched:Lcom/android/quickstep/OrientationRectF;

    .line 100
    .line 101
    if-eqz p0, :cond_2

    .line 102
    .line 103
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/OrientationRectF;->contains(FF)Z

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    return p0

    .line 108
    :cond_2
    const/4 p0, 0x0

    .line 109
    return p0
.end method

.method touchInValidSwipeRegionsWitYOffset(FF)Z
    .locals 2

    .line 1
    invoke-static {}, Lx1/O;->H0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mCachedDisplayInfo:Lcom/android/launcher3/util/window/a;

    .line 8
    .line 9
    iget v0, v0, Lcom/android/launcher3/util/window/a;->b:I

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const/4 v1, 0x2

    .line 14
    if-ne v0, v1, :cond_1

    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mResources:Landroid/content/res/Resources;

    .line 17
    .line 18
    const v1, 0x7f07037c

    .line 19
    .line 20
    .line 21
    :goto_0
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    goto :goto_1

    .line 26
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mResources:Landroid/content/res/Resources;

    .line 27
    .line 28
    const v1, 0x7f07037b

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :goto_1
    int-to-float v0, v0

    .line 33
    sub-float/2addr p2, v0

    .line 34
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/OrientationTouchTransformer;->touchInValidSwipeRegions(FF)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0
.end method

.method public transform(Landroid/view/MotionEvent;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_7

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    if-eq v0, v1, :cond_3

    .line 9
    .line 10
    const/4 v2, 0x2

    .line 11
    if-eq v0, v2, :cond_0

    .line 12
    .line 13
    const/4 v2, 0x3

    .line 14
    if-eq v0, v2, :cond_3

    .line 15
    .line 16
    const/4 v1, 0x5

    .line 17
    if-eq v0, v1, :cond_7

    .line 18
    .line 19
    goto/16 :goto_2

    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mLastRectTouched:Lcom/android/quickstep/OrientationRectF;

    .line 22
    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    goto/16 :goto_2

    .line 26
    .line 27
    :cond_1
    sget-boolean v2, Lcom/android/quickstep/TaskAnimationManager;->SHELL_TRANSITIONS_ROTATION:Z

    .line 28
    .line 29
    if-eqz v2, :cond_2

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSurfaceRotation()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iget v2, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mActiveTouchRotation:I

    .line 36
    .line 37
    if-eq v0, v2, :cond_e

    .line 38
    .line 39
    iget-object v0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mLastRectTouched:Lcom/android/quickstep/OrientationRectF;

    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSurfaceRotation()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    iget p0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mActiveTouchRotation:I

    .line 46
    .line 47
    invoke-static {v2, p0}, LQ1/d;->b(II)I

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    invoke-virtual {v0, p1, p0, v1}, Lcom/android/quickstep/OrientationRectF;->applyTransform(Landroid/view/MotionEvent;IZ)Z

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_2
    iget-object p0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mCachedDisplayInfo:Lcom/android/launcher3/util/window/a;

    .line 56
    .line 57
    iget p0, p0, Lcom/android/launcher3/util/window/a;->b:I

    .line 58
    .line 59
    invoke-virtual {v0, p1, p0, v1}, Lcom/android/quickstep/OrientationRectF;->applyTransformFromRotation(Landroid/view/MotionEvent;IZ)Z

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_3
    iget-object v0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mLastRectTouched:Lcom/android/quickstep/OrientationRectF;

    .line 64
    .line 65
    if-nez v0, :cond_4

    .line 66
    .line 67
    goto/16 :goto_2

    .line 68
    .line 69
    :cond_4
    sget-boolean v2, Lcom/android/quickstep/TaskAnimationManager;->SHELL_TRANSITIONS_ROTATION:Z

    .line 70
    .line 71
    if-eqz v2, :cond_5

    .line 72
    .line 73
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSurfaceRotation()I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    iget v2, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mActiveTouchRotation:I

    .line 78
    .line 79
    if-eq v0, v2, :cond_6

    .line 80
    .line 81
    iget-object v0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mLastRectTouched:Lcom/android/quickstep/OrientationRectF;

    .line 82
    .line 83
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSurfaceRotation()I

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    iget v3, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mActiveTouchRotation:I

    .line 88
    .line 89
    invoke-static {v2, v3}, LQ1/d;->b(II)I

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    invoke-virtual {v0, p1, v2, v1}, Lcom/android/quickstep/OrientationRectF;->applyTransform(Landroid/view/MotionEvent;IZ)Z

    .line 94
    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_5
    iget-object v2, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mCachedDisplayInfo:Lcom/android/launcher3/util/window/a;

    .line 98
    .line 99
    iget v2, v2, Lcom/android/launcher3/util/window/a;->b:I

    .line 100
    .line 101
    invoke-virtual {v0, p1, v2, v1}, Lcom/android/quickstep/OrientationRectF;->applyTransformFromRotation(Landroid/view/MotionEvent;IZ)Z

    .line 102
    .line 103
    .line 104
    :cond_6
    :goto_0
    const/4 p1, 0x0

    .line 105
    iput-object p1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mLastRectTouched:Lcom/android/quickstep/OrientationRectF;

    .line 106
    .line 107
    return-void

    .line 108
    :cond_7
    invoke-direct {p0}, Lcom/android/quickstep/OrientationTouchTransformer;->enableLog()Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    const-string v1, "OrientationTouchTransformer"

    .line 113
    .line 114
    if-eqz v0, :cond_8

    .line 115
    .line 116
    new-instance v0, Ljava/lang/StringBuilder;

    .line 117
    .line 118
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 119
    .line 120
    .line 121
    const-string v2, "ACTION_DOWN mLastRectTouched: "

    .line 122
    .line 123
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    iget-object v2, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mLastRectTouched:Lcom/android/quickstep/OrientationRectF;

    .line 127
    .line 128
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    .line 137
    .line 138
    :cond_8
    iget-object v0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mLastRectTouched:Lcom/android/quickstep/OrientationRectF;

    .line 139
    .line 140
    if-eqz v0, :cond_9

    .line 141
    .line 142
    goto/16 :goto_2

    .line 143
    .line 144
    :cond_9
    iget-object v0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mSwipeTouchRegions:Ljava/util/Map;

    .line 145
    .line 146
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    :cond_a
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 155
    .line 156
    .line 157
    move-result v2

    .line 158
    if-eqz v2, :cond_e

    .line 159
    .line 160
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v2

    .line 164
    check-cast v2, Lcom/android/quickstep/OrientationRectF;

    .line 165
    .line 166
    invoke-direct {p0}, Lcom/android/quickstep/OrientationTouchTransformer;->enableLog()Z

    .line 167
    .line 168
    .line 169
    move-result v3

    .line 170
    if-eqz v3, :cond_b

    .line 171
    .line 172
    new-instance v3, Ljava/lang/StringBuilder;

    .line 173
    .line 174
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 175
    .line 176
    .line 177
    const-string v4, "ACTION_DOWN rect: "

    .line 178
    .line 179
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v3

    .line 189
    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 190
    .line 191
    .line 192
    :cond_b
    if-nez v2, :cond_c

    .line 193
    .line 194
    goto :goto_1

    .line 195
    :cond_c
    iget-object v3, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mCachedDisplayInfo:Lcom/android/launcher3/util/window/a;

    .line 196
    .line 197
    iget v3, v3, Lcom/android/launcher3/util/window/a;->b:I

    .line 198
    .line 199
    const/4 v4, 0x0

    .line 200
    invoke-virtual {v2, p1, v3, v4}, Lcom/android/quickstep/OrientationRectF;->applyTransformFromRotation(Landroid/view/MotionEvent;IZ)Z

    .line 201
    .line 202
    .line 203
    move-result v3

    .line 204
    if-eqz v3, :cond_a

    .line 205
    .line 206
    iput-object v2, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mLastRectTouched:Lcom/android/quickstep/OrientationRectF;

    .line 207
    .line 208
    invoke-virtual {v2}, Lcom/android/quickstep/OrientationRectF;->getRotation()I

    .line 209
    .line 210
    .line 211
    move-result p1

    .line 212
    iput p1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mActiveTouchRotation:I

    .line 213
    .line 214
    iget-boolean v0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mEnableMultipleRegions:Z

    .line 215
    .line 216
    if-eqz v0, :cond_d

    .line 217
    .line 218
    iget-object v0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mCachedDisplayInfo:Lcom/android/launcher3/util/window/a;

    .line 219
    .line 220
    iget v0, v0, Lcom/android/launcher3/util/window/a;->b:I

    .line 221
    .line 222
    if-ne v0, p1, :cond_d

    .line 223
    .line 224
    iget-object p1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mLastRectTouched:Lcom/android/quickstep/OrientationRectF;

    .line 225
    .line 226
    invoke-virtual {p1}, Lcom/android/quickstep/OrientationRectF;->getRotation()I

    .line 227
    .line 228
    .line 229
    move-result p1

    .line 230
    iput p1, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mQuickStepStartingRotation:I

    .line 231
    .line 232
    invoke-direct {p0}, Lcom/android/quickstep/OrientationTouchTransformer;->resetSwipeRegions()V

    .line 233
    .line 234
    .line 235
    :cond_d
    invoke-direct {p0}, Lcom/android/quickstep/OrientationTouchTransformer;->enableLog()Z

    .line 236
    .line 237
    .line 238
    move-result p0

    .line 239
    if-eqz p0, :cond_e

    .line 240
    .line 241
    new-instance p0, Ljava/lang/StringBuilder;

    .line 242
    .line 243
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 244
    .line 245
    .line 246
    const-string p1, "set active region: "

    .line 247
    .line 248
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 249
    .line 250
    .line 251
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 252
    .line 253
    .line 254
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object p0

    .line 258
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 259
    .line 260
    .line 261
    :cond_e
    :goto_2
    return-void
.end method
