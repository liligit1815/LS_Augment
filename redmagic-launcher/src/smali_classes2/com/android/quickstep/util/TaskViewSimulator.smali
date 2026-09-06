.class public Lcom/android/quickstep/util/TaskViewSimulator;
.super Ljava/lang/Object;
.source "TaskViewSimulator.java"

# interfaces
.implements Lcom/android/quickstep/util/TransformParams$BuilderProxy;


# static fields
.field private static final DEBUG:Z = false

.field private static final TAG:Ljava/lang/String; = "TaskViewSimulator"


# instance fields
.field private final actualClipRectBeforeGestureEnd:Landroid/graphics/Rect;

.field private final actualMatrixBeforeGestureEnd:Landroid/graphics/Matrix;

.field private final adjustedWindowClipRect:Landroid/graphics/Rect;

.field private final adjustedWindowMatrix:Landroid/graphics/Matrix;

.field public final carouselScale:Lcom/android/launcher3/anim/d;

.field private currentProgressWhenApply:F

.field private currentProgressWhenNonApply:F

.field public final fullScreenProgress:Lcom/android/launcher3/anim/d;

.field public interruptAdjustProgress:F

.field private final mCarouselTaskSize:Landroid/graphics/Rect;

.field private final mContext:Landroid/content/Context;

.field private final mCurrentFullscreenParams:Lcom/android/quickstep/FullscreenDrawParams;

.field private mDesktopTaskIndex:I

.field private mDp:Lcom/android/launcher3/h0;

.field private mDrawsBelowRecents:Ljava/lang/Boolean;

.field private final mFullTaskSize:Landroid/graphics/Rect;

.field private final mInversePositionMatrix:Landroid/graphics/Matrix;

.field private mIsAnimatingToCarousel:Z

.field private final mIsDesktopTask:Z

.field private mIsGridTask:Z

.field private final mIsRecentsRtl:Z

.field private mLayoutValid:Z

.field private final mMatrix:Landroid/graphics/Matrix;

.field private final mMatrixTmp:Landroid/graphics/Matrix;

.field private mNewWidth:F

.field private mOrientationState:Lcom/android/quickstep/util/RecentsOrientedState;

.field private mOrientationStateId:I

.field private final mPivot:Landroid/graphics/PointF;

.field private mPivotOverride:Landroid/graphics/PointF;

.field private final mPositionHelper:Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;

.field private final mRunningTargetWindowPosition:Landroid/graphics/Point;

.field private final mSizeStrategy:Lcom/android/quickstep/BaseContainerInterface;

.field private mSplitBounds:Lcom/android/launcher3/util/y2$a;

.field private mStagePosition:I

.field private mStagedSplitBounds:Lcom/android/launcher3/util/y2$a;

.field private mStartFixScalePosition:F

.field private mStartScrollFullScreenToWindow:F

.field private final mTaskRect:Landroid/graphics/Rect;

.field private mTaskRectTransform:Landroid/graphics/Matrix;

.field private mTaskRectTranslationX:I

.field private mTaskRectTranslationY:I

.field private final mTempPoint:[F

.field private final mTempRectF:Landroid/graphics/RectF;

.field private final mThumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

.field public final mThumbnailPosition:Landroid/graphics/Rect;

.field private final mTmpCropRect:Landroid/graphics/Rect;

.field private final mTmpCropRectInterrupt:Landroid/graphics/RectF;

.field private needHideSurface:Z

.field public needUseRecordX:Z

.field private final nonDirectApplyMatrixBeforeGestureEnd:Landroid/graphics/Matrix;

.field public final recentsViewPrimaryTranslation:Lcom/android/launcher3/anim/d;

.field public final recentsViewScale:Lcom/android/launcher3/anim/d;

.field public final recentsViewScroll:Lcom/android/launcher3/anim/d;

.field private recentsViewSecondaryScale:F

.field public final recentsViewSecondaryTranslation:Lcom/android/launcher3/anim/d;

.field public final taskGridTranslationX:Lcom/android/launcher3/anim/d;

.field public final taskGridTranslationY:Lcom/android/launcher3/anim/d;

.field public final taskPrimaryTranslation:Lcom/android/launcher3/anim/d;

.field public final taskSecondaryTranslation:Lcom/android/launcher3/anim/d;

.field private final tempFloatArray:[F

.field private windowExpectedFinalMatrix:Landroid/graphics/Matrix;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/quickstep/BaseContainerInterface;ZI)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Rect;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTmpCropRect:Landroid/graphics/Rect;

    .line 10
    .line 11
    new-instance v0, Landroid/graphics/RectF;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTempRectF:Landroid/graphics/RectF;

    .line 17
    .line 18
    const/4 v0, 0x2

    .line 19
    new-array v0, v0, [F

    .line 20
    .line 21
    iput-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTempPoint:[F

    .line 22
    .line 23
    new-instance v0, Landroid/graphics/Rect;

    .line 24
    .line 25
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTaskRect:Landroid/graphics/Rect;

    .line 29
    .line 30
    new-instance v0, Landroid/graphics/Rect;

    .line 31
    .line 32
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mFullTaskSize:Landroid/graphics/Rect;

    .line 36
    .line 37
    new-instance v0, Landroid/graphics/Rect;

    .line 38
    .line 39
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mCarouselTaskSize:Landroid/graphics/Rect;

    .line 43
    .line 44
    const/4 v0, 0x0

    .line 45
    iput-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mPivotOverride:Landroid/graphics/PointF;

    .line 46
    .line 47
    new-instance v1, Landroid/graphics/PointF;

    .line 48
    .line 49
    invoke-direct {v1}, Landroid/graphics/PointF;-><init>()V

    .line 50
    .line 51
    .line 52
    iput-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mPivot:Landroid/graphics/PointF;

    .line 53
    .line 54
    const/4 v1, -0x1

    .line 55
    iput v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mStagePosition:I

    .line 56
    .line 57
    new-instance v1, Landroid/graphics/Matrix;

    .line 58
    .line 59
    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    .line 60
    .line 61
    .line 62
    iput-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mMatrix:Landroid/graphics/Matrix;

    .line 63
    .line 64
    new-instance v1, Landroid/graphics/Matrix;

    .line 65
    .line 66
    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    .line 67
    .line 68
    .line 69
    iput-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mMatrixTmp:Landroid/graphics/Matrix;

    .line 70
    .line 71
    new-instance v1, Landroid/graphics/Rect;

    .line 72
    .line 73
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 74
    .line 75
    .line 76
    iput-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mThumbnailPosition:Landroid/graphics/Rect;

    .line 77
    .line 78
    new-instance v1, Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 79
    .line 80
    invoke-direct {v1}, Lcom/android/systemui/shared/recents/model/ThumbnailData;-><init>()V

    .line 81
    .line 82
    .line 83
    iput-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mThumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 84
    .line 85
    new-instance v1, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;

    .line 86
    .line 87
    invoke-direct {v1}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;-><init>()V

    .line 88
    .line 89
    .line 90
    iput-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mPositionHelper:Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;

    .line 91
    .line 92
    new-instance v1, Landroid/graphics/Matrix;

    .line 93
    .line 94
    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    .line 95
    .line 96
    .line 97
    iput-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mInversePositionMatrix:Landroid/graphics/Matrix;

    .line 98
    .line 99
    new-instance v1, Lcom/android/launcher3/anim/d;

    .line 100
    .line 101
    invoke-direct {v1}, Lcom/android/launcher3/anim/d;-><init>()V

    .line 102
    .line 103
    .line 104
    iput-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->taskPrimaryTranslation:Lcom/android/launcher3/anim/d;

    .line 105
    .line 106
    new-instance v1, Lcom/android/launcher3/anim/d;

    .line 107
    .line 108
    invoke-direct {v1}, Lcom/android/launcher3/anim/d;-><init>()V

    .line 109
    .line 110
    .line 111
    iput-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->taskSecondaryTranslation:Lcom/android/launcher3/anim/d;

    .line 112
    .line 113
    new-instance v1, Lcom/android/launcher3/anim/d;

    .line 114
    .line 115
    invoke-direct {v1}, Lcom/android/launcher3/anim/d;-><init>()V

    .line 116
    .line 117
    .line 118
    iput-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->taskGridTranslationX:Lcom/android/launcher3/anim/d;

    .line 119
    .line 120
    new-instance v1, Lcom/android/launcher3/anim/d;

    .line 121
    .line 122
    invoke-direct {v1}, Lcom/android/launcher3/anim/d;-><init>()V

    .line 123
    .line 124
    .line 125
    iput-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->taskGridTranslationY:Lcom/android/launcher3/anim/d;

    .line 126
    .line 127
    new-instance v1, Lcom/android/launcher3/anim/d;

    .line 128
    .line 129
    invoke-direct {v1}, Lcom/android/launcher3/anim/d;-><init>()V

    .line 130
    .line 131
    .line 132
    iput-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->carouselScale:Lcom/android/launcher3/anim/d;

    .line 133
    .line 134
    new-instance v2, Lcom/android/launcher3/anim/d;

    .line 135
    .line 136
    invoke-direct {v2}, Lcom/android/launcher3/anim/d;-><init>()V

    .line 137
    .line 138
    .line 139
    iput-object v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->recentsViewScale:Lcom/android/launcher3/anim/d;

    .line 140
    .line 141
    new-instance v2, Lcom/android/launcher3/anim/d;

    .line 142
    .line 143
    invoke-direct {v2}, Lcom/android/launcher3/anim/d;-><init>()V

    .line 144
    .line 145
    .line 146
    iput-object v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->fullScreenProgress:Lcom/android/launcher3/anim/d;

    .line 147
    .line 148
    new-instance v2, Lcom/android/launcher3/anim/d;

    .line 149
    .line 150
    invoke-direct {v2}, Lcom/android/launcher3/anim/d;-><init>()V

    .line 151
    .line 152
    .line 153
    iput-object v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->recentsViewSecondaryTranslation:Lcom/android/launcher3/anim/d;

    .line 154
    .line 155
    new-instance v2, Lcom/android/launcher3/anim/d;

    .line 156
    .line 157
    invoke-direct {v2}, Lcom/android/launcher3/anim/d;-><init>()V

    .line 158
    .line 159
    .line 160
    iput-object v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->recentsViewPrimaryTranslation:Lcom/android/launcher3/anim/d;

    .line 161
    .line 162
    new-instance v2, Lcom/android/launcher3/anim/d;

    .line 163
    .line 164
    invoke-direct {v2}, Lcom/android/launcher3/anim/d;-><init>()V

    .line 165
    .line 166
    .line 167
    iput-object v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->recentsViewScroll:Lcom/android/launcher3/anim/d;

    .line 168
    .line 169
    const/4 v2, 0x0

    .line 170
    iput-boolean v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mLayoutValid:Z

    .line 171
    .line 172
    iput-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mDrawsBelowRecents:Ljava/lang/Boolean;

    .line 173
    .line 174
    iput-boolean v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mIsAnimatingToCarousel:Z

    .line 175
    .line 176
    iput v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mDesktopTaskIndex:I

    .line 177
    .line 178
    iput-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTaskRectTransform:Landroid/graphics/Matrix;

    .line 179
    .line 180
    new-instance v0, Landroid/graphics/Point;

    .line 181
    .line 182
    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 183
    .line 184
    .line 185
    iput-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mRunningTargetWindowPosition:Landroid/graphics/Point;

    .line 186
    .line 187
    const/4 v0, 0x0

    .line 188
    iput v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mStartFixScalePosition:F

    .line 189
    .line 190
    iput v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mNewWidth:F

    .line 191
    .line 192
    new-instance v0, Landroid/graphics/RectF;

    .line 193
    .line 194
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 195
    .line 196
    .line 197
    iput-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTmpCropRectInterrupt:Landroid/graphics/RectF;

    .line 198
    .line 199
    sget-object v0, Lcom/android/launcher3/util/Z;->r:Lcom/android/launcher3/util/I;

    .line 200
    .line 201
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    check-cast v0, Lcom/android/launcher3/util/Z;

    .line 206
    .line 207
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 208
    .line 209
    .line 210
    move-result-object v3

    .line 211
    invoke-static {p1, v3, v2}, Lx1/O;->D(Landroid/content/Context;Landroid/content/res/Resources;Z)V

    .line 212
    .line 213
    .line 214
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/Z;->v(Landroid/content/Context;)Landroid/content/Context;

    .line 215
    .line 216
    .line 217
    move-result-object p1

    .line 218
    iput-object p1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mContext:Landroid/content/Context;

    .line 219
    .line 220
    iput-object p2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mSizeStrategy:Lcom/android/quickstep/BaseContainerInterface;

    .line 221
    .line 222
    iput-boolean p3, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mIsDesktopTask:Z

    .line 223
    .line 224
    iput p4, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mDesktopTaskIndex:I

    .line 225
    .line 226
    new-instance p4, Lcom/android/quickstep/util/z1;

    .line 227
    .line 228
    invoke-direct {p4, p0, p2}, Lcom/android/quickstep/util/z1;-><init>(Lcom/android/quickstep/util/TaskViewSimulator;Lcom/android/quickstep/BaseContainerInterface;)V

    .line 229
    .line 230
    .line 231
    const-string p2, "TaskViewSimulator.init"

    .line 232
    .line 233
    invoke-static {p2, p4}, Lcom/android/launcher3/util/K2;->allowIpcs(Ljava/lang/String;Ljava/util/function/Supplier;)Ljava/lang/Object;

    .line 234
    .line 235
    .line 236
    move-result-object p2

    .line 237
    check-cast p2, Lcom/android/quickstep/util/RecentsOrientedState;

    .line 238
    .line 239
    iput-object p2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mOrientationState:Lcom/android/quickstep/util/RecentsOrientedState;

    .line 240
    .line 241
    const/4 p4, 0x1

    .line 242
    invoke-virtual {p2, p4}, Lcom/android/quickstep/util/RecentsOrientedState;->setGestureActive(Z)Z

    .line 243
    .line 244
    .line 245
    if-eqz p3, :cond_0

    .line 246
    .line 247
    new-instance p2, Lcom/android/quickstep/DesktopFullscreenDrawParams;

    .line 248
    .line 249
    invoke-direct {p2, p1}, Lcom/android/quickstep/DesktopFullscreenDrawParams;-><init>(Landroid/content/Context;)V

    .line 250
    .line 251
    .line 252
    goto :goto_0

    .line 253
    :cond_0
    new-instance p2, Lcom/android/quickstep/FullscreenDrawParams;

    .line 254
    .line 255
    invoke-direct {p2, p1}, Lcom/android/quickstep/FullscreenDrawParams;-><init>(Landroid/content/Context;)V

    .line 256
    .line 257
    .line 258
    :goto_0
    iput-object p2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mCurrentFullscreenParams:Lcom/android/quickstep/FullscreenDrawParams;

    .line 259
    .line 260
    iget-object p2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mOrientationState:Lcom/android/quickstep/util/RecentsOrientedState;

    .line 261
    .line 262
    invoke-virtual {p2}, Lcom/android/quickstep/util/RecentsOrientedState;->getStateId()I

    .line 263
    .line 264
    .line 265
    move-result p2

    .line 266
    iput p2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mOrientationStateId:I

    .line 267
    .line 268
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 269
    .line 270
    .line 271
    move-result-object p1

    .line 272
    iget-object p2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mOrientationState:Lcom/android/quickstep/util/RecentsOrientedState;

    .line 273
    .line 274
    invoke-virtual {p2}, Lcom/android/quickstep/util/RecentsOrientedState;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 275
    .line 276
    .line 277
    move-result-object p2

    .line 278
    invoke-interface {p2, p1}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getRecentsRtlSetting(Landroid/content/res/Resources;)Z

    .line 279
    .line 280
    .line 281
    move-result p1

    .line 282
    iput-boolean p1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mIsRecentsRtl:Z

    .line 283
    .line 284
    const/high16 p1, 0x3f800000    # 1.0f

    .line 285
    .line 286
    iput p1, v1, Lcom/android/launcher3/anim/d;->d:F

    .line 287
    .line 288
    new-instance p2, Landroid/graphics/Matrix;

    .line 289
    .line 290
    invoke-direct {p2}, Landroid/graphics/Matrix;-><init>()V

    .line 291
    .line 292
    .line 293
    iput-object p2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->nonDirectApplyMatrixBeforeGestureEnd:Landroid/graphics/Matrix;

    .line 294
    .line 295
    iput-boolean v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->needUseRecordX:Z

    .line 296
    .line 297
    new-instance p2, Landroid/graphics/Matrix;

    .line 298
    .line 299
    invoke-direct {p2}, Landroid/graphics/Matrix;-><init>()V

    .line 300
    .line 301
    .line 302
    iput-object p2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->adjustedWindowMatrix:Landroid/graphics/Matrix;

    .line 303
    .line 304
    new-instance p2, Landroid/graphics/Rect;

    .line 305
    .line 306
    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    .line 307
    .line 308
    .line 309
    iput-object p2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->adjustedWindowClipRect:Landroid/graphics/Rect;

    .line 310
    .line 311
    iput p1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->recentsViewSecondaryScale:F

    .line 312
    .line 313
    new-instance p1, Landroid/graphics/Matrix;

    .line 314
    .line 315
    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    .line 316
    .line 317
    .line 318
    iput-object p1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->actualMatrixBeforeGestureEnd:Landroid/graphics/Matrix;

    .line 319
    .line 320
    const/16 p1, 0x9

    .line 321
    .line 322
    new-array p1, p1, [F

    .line 323
    .line 324
    iput-object p1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->tempFloatArray:[F

    .line 325
    .line 326
    new-instance p1, Landroid/graphics/Rect;

    .line 327
    .line 328
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 329
    .line 330
    .line 331
    iput-object p1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->actualClipRectBeforeGestureEnd:Landroid/graphics/Rect;

    .line 332
    .line 333
    return-void
.end method

.method private adjustMatrixAndCrop()V
    .locals 14

    .line 1
    sget-object v0, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mContext:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/android/launcher3/anim/C;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lu2/e;->b()Landroid/animation/AnimatorSet;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/android/quickstep/util/TaskViewSimulator;->getCurrentRect()Landroid/graphics/RectF;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0}, Lu2/e;->c()Landroid/graphics/RectF;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    iget v3, p0, Lcom/android/quickstep/util/TaskViewSimulator;->interruptAdjustProgress:F

    .line 30
    .line 31
    invoke-virtual {v0}, Lu2/e;->a()Landroid/graphics/Rect;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    iget v4, v4, Landroid/graphics/Rect;->left:I

    .line 36
    .line 37
    int-to-float v6, v4

    .line 38
    iget-object v4, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTmpCropRect:Landroid/graphics/Rect;

    .line 39
    .line 40
    iget v4, v4, Landroid/graphics/Rect;->left:I

    .line 41
    .line 42
    int-to-float v7, v4

    .line 43
    sget-object v13, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 44
    .line 45
    const/4 v4, 0x0

    .line 46
    const/high16 v5, 0x3f800000    # 1.0f

    .line 47
    .line 48
    move-object v8, v13

    .line 49
    invoke-static/range {v3 .. v8}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    iget v8, p0, Lcom/android/quickstep/util/TaskViewSimulator;->interruptAdjustProgress:F

    .line 54
    .line 55
    invoke-virtual {v0}, Lu2/e;->a()Landroid/graphics/Rect;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    iget v4, v4, Landroid/graphics/Rect;->right:I

    .line 60
    .line 61
    int-to-float v11, v4

    .line 62
    iget-object v4, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTmpCropRect:Landroid/graphics/Rect;

    .line 63
    .line 64
    iget v4, v4, Landroid/graphics/Rect;->right:I

    .line 65
    .line 66
    int-to-float v12, v4

    .line 67
    const/4 v9, 0x0

    .line 68
    const/high16 v10, 0x3f800000    # 1.0f

    .line 69
    .line 70
    invoke-static/range {v8 .. v13}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 71
    .line 72
    .line 73
    move-result v4

    .line 74
    iget v8, p0, Lcom/android/quickstep/util/TaskViewSimulator;->interruptAdjustProgress:F

    .line 75
    .line 76
    invoke-virtual {v0}, Lu2/e;->a()Landroid/graphics/Rect;

    .line 77
    .line 78
    .line 79
    move-result-object v5

    .line 80
    iget v5, v5, Landroid/graphics/Rect;->top:I

    .line 81
    .line 82
    int-to-float v11, v5

    .line 83
    iget-object v5, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTmpCropRect:Landroid/graphics/Rect;

    .line 84
    .line 85
    iget v5, v5, Landroid/graphics/Rect;->top:I

    .line 86
    .line 87
    int-to-float v12, v5

    .line 88
    invoke-static/range {v8 .. v13}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 89
    .line 90
    .line 91
    move-result v5

    .line 92
    iget v8, p0, Lcom/android/quickstep/util/TaskViewSimulator;->interruptAdjustProgress:F

    .line 93
    .line 94
    invoke-virtual {v0}, Lu2/e;->a()Landroid/graphics/Rect;

    .line 95
    .line 96
    .line 97
    move-result-object v6

    .line 98
    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    .line 99
    .line 100
    int-to-float v11, v6

    .line 101
    iget-object v6, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTmpCropRect:Landroid/graphics/Rect;

    .line 102
    .line 103
    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    .line 104
    .line 105
    int-to-float v12, v6

    .line 106
    invoke-static/range {v8 .. v13}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 107
    .line 108
    .line 109
    move-result v6

    .line 110
    iget-object v7, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTmpCropRect:Landroid/graphics/Rect;

    .line 111
    .line 112
    float-to-int v3, v3

    .line 113
    float-to-int v5, v5

    .line 114
    float-to-int v4, v4

    .line 115
    float-to-int v6, v6

    .line 116
    invoke-virtual {v7, v3, v5, v4, v6}, Landroid/graphics/Rect;->set(IIII)V

    .line 117
    .line 118
    .line 119
    iget-object v3, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTmpCropRectInterrupt:Landroid/graphics/RectF;

    .line 120
    .line 121
    iget-object v4, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTmpCropRect:Landroid/graphics/Rect;

    .line 122
    .line 123
    invoke-virtual {v3, v4}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 124
    .line 125
    .line 126
    iget v8, p0, Lcom/android/quickstep/util/TaskViewSimulator;->interruptAdjustProgress:F

    .line 127
    .line 128
    iget v11, v2, Landroid/graphics/RectF;->left:F

    .line 129
    .line 130
    iget v12, v1, Landroid/graphics/RectF;->left:F

    .line 131
    .line 132
    invoke-static/range {v8 .. v13}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 133
    .line 134
    .line 135
    move-result v3

    .line 136
    iget v8, p0, Lcom/android/quickstep/util/TaskViewSimulator;->interruptAdjustProgress:F

    .line 137
    .line 138
    iget v11, v2, Landroid/graphics/RectF;->right:F

    .line 139
    .line 140
    iget v12, v1, Landroid/graphics/RectF;->right:F

    .line 141
    .line 142
    invoke-static/range {v8 .. v13}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 143
    .line 144
    .line 145
    move-result v4

    .line 146
    iget v8, p0, Lcom/android/quickstep/util/TaskViewSimulator;->interruptAdjustProgress:F

    .line 147
    .line 148
    iget v11, v2, Landroid/graphics/RectF;->top:F

    .line 149
    .line 150
    iget v12, v1, Landroid/graphics/RectF;->top:F

    .line 151
    .line 152
    invoke-static/range {v8 .. v13}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 153
    .line 154
    .line 155
    move-result v5

    .line 156
    iget v8, p0, Lcom/android/quickstep/util/TaskViewSimulator;->interruptAdjustProgress:F

    .line 157
    .line 158
    iget v11, v2, Landroid/graphics/RectF;->bottom:F

    .line 159
    .line 160
    iget v12, v1, Landroid/graphics/RectF;->bottom:F

    .line 161
    .line 162
    invoke-static/range {v8 .. v13}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 163
    .line 164
    .line 165
    move-result v2

    .line 166
    new-instance v6, Landroid/graphics/RectF;

    .line 167
    .line 168
    invoke-direct {v6, v3, v5, v4, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    .line 172
    .line 173
    .line 174
    move-result v2

    .line 175
    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    .line 176
    .line 177
    .line 178
    move-result v3

    .line 179
    div-float/2addr v2, v3

    .line 180
    invoke-virtual {v6}, Landroid/graphics/RectF;->height()F

    .line 181
    .line 182
    .line 183
    move-result v3

    .line 184
    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    .line 185
    .line 186
    .line 187
    move-result v4

    .line 188
    div-float/2addr v3, v4

    .line 189
    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    .line 190
    .line 191
    .line 192
    move-result v2

    .line 193
    const/high16 v3, 0x3f800000    # 1.0f

    .line 194
    .line 195
    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    .line 196
    .line 197
    .line 198
    move-result v2

    .line 199
    iget-object v3, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mMatrix:Landroid/graphics/Matrix;

    .line 200
    .line 201
    invoke-virtual {v1}, Landroid/graphics/RectF;->centerX()F

    .line 202
    .line 203
    .line 204
    move-result v4

    .line 205
    invoke-virtual {v1}, Landroid/graphics/RectF;->centerY()F

    .line 206
    .line 207
    .line 208
    move-result v1

    .line 209
    invoke-virtual {v3, v2, v2, v4, v1}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 210
    .line 211
    .line 212
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mMatrix:Landroid/graphics/Matrix;

    .line 213
    .line 214
    invoke-virtual {v6}, Landroid/graphics/RectF;->centerX()F

    .line 215
    .line 216
    .line 217
    move-result v2

    .line 218
    invoke-virtual {p0}, Lcom/android/quickstep/util/TaskViewSimulator;->getCurrentRectWithCurrentCrop()Landroid/graphics/RectF;

    .line 219
    .line 220
    .line 221
    move-result-object v3

    .line 222
    invoke-virtual {v3}, Landroid/graphics/RectF;->centerX()F

    .line 223
    .line 224
    .line 225
    move-result v3

    .line 226
    sub-float/2addr v2, v3

    .line 227
    invoke-virtual {v6}, Landroid/graphics/RectF;->centerY()F

    .line 228
    .line 229
    .line 230
    move-result v3

    .line 231
    invoke-virtual {p0}, Lcom/android/quickstep/util/TaskViewSimulator;->getCurrentRectWithCurrentCrop()Landroid/graphics/RectF;

    .line 232
    .line 233
    .line 234
    move-result-object v4

    .line 235
    invoke-virtual {v4}, Landroid/graphics/RectF;->centerY()F

    .line 236
    .line 237
    .line 238
    move-result v4

    .line 239
    sub-float/2addr v3, v4

    .line 240
    invoke-virtual {v1, v2, v3}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 241
    .line 242
    .line 243
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mCurrentFullscreenParams:Lcom/android/quickstep/FullscreenDrawParams;

    .line 244
    .line 245
    iget v8, p0, Lcom/android/quickstep/util/TaskViewSimulator;->interruptAdjustProgress:F

    .line 246
    .line 247
    invoke-virtual {v0}, Lu2/e;->f()F

    .line 248
    .line 249
    .line 250
    move-result v11

    .line 251
    iget-object p0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mCurrentFullscreenParams:Lcom/android/quickstep/FullscreenDrawParams;

    .line 252
    .line 253
    invoke-virtual {p0}, Lcom/android/quickstep/FullscreenDrawParams;->getCurrentCornerRadius()F

    .line 254
    .line 255
    .line 256
    move-result v12

    .line 257
    invoke-static/range {v8 .. v13}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 258
    .line 259
    .line 260
    move-result p0

    .line 261
    invoke-virtual {v1, p0}, Lcom/android/quickstep/FullscreenDrawParams;->setCurrentCornerRadius(F)V

    .line 262
    .line 263
    .line 264
    :cond_0
    return-void
.end method

.method public static synthetic c(Lcom/android/quickstep/util/TaskViewSimulator;Lcom/android/quickstep/BaseContainerInterface;)Lcom/android/quickstep/util/RecentsOrientedState;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/TaskViewSimulator;->lambda$new$1(Lcom/android/quickstep/BaseContainerInterface;)Lcom/android/quickstep/util/RecentsOrientedState;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private calculateDesktopTaskCropRect()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTempRectF:Landroid/graphics/RectF;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mThumbnailPosition:Landroid/graphics/Rect;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    int-to-float v1, v1

    .line 10
    iget-object v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mThumbnailPosition:Landroid/graphics/Rect;

    .line 11
    .line 12
    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    int-to-float v2, v2

    .line 17
    const/4 v3, 0x0

    .line 18
    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mMatrix:Landroid/graphics/Matrix;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTempRectF:Landroid/graphics/RectF;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTempRectF:Landroid/graphics/RectF;

    .line 29
    .line 30
    iget v1, v0, Landroid/graphics/RectF;->left:F

    .line 31
    .line 32
    iget v0, v0, Landroid/graphics/RectF;->top:F

    .line 33
    .line 34
    iget-object v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mThumbnailPosition:Landroid/graphics/Rect;

    .line 35
    .line 36
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    int-to-float v2, v2

    .line 41
    iget-object v3, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTempRectF:Landroid/graphics/RectF;

    .line 42
    .line 43
    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    div-float/2addr v2, v3

    .line 48
    iget-object v3, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTempRectF:Landroid/graphics/RectF;

    .line 49
    .line 50
    iget-object v4, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mFullTaskSize:Landroid/graphics/Rect;

    .line 51
    .line 52
    iget v5, v4, Landroid/graphics/Rect;->left:I

    .line 53
    .line 54
    int-to-float v5, v5

    .line 55
    iget v6, v4, Landroid/graphics/Rect;->top:I

    .line 56
    .line 57
    int-to-float v6, v6

    .line 58
    iget v7, v4, Landroid/graphics/Rect;->right:I

    .line 59
    .line 60
    int-to-float v7, v7

    .line 61
    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    .line 62
    .line 63
    int-to-float v4, v4

    .line 64
    invoke-virtual {v3, v5, v6, v7, v4}, Landroid/graphics/RectF;->intersect(FFFF)Z

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    if-eqz v3, :cond_0

    .line 69
    .line 70
    iget-object v3, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTempRectF:Landroid/graphics/RectF;

    .line 71
    .line 72
    neg-float v1, v1

    .line 73
    neg-float v0, v0

    .line 74
    invoke-virtual {v3, v1, v0}, Landroid/graphics/RectF;->offset(FF)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTempRectF:Landroid/graphics/RectF;

    .line 78
    .line 79
    invoke-virtual {v0, v2}, Landroid/graphics/RectF;->scale(F)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTempRectF:Landroid/graphics/RectF;

    .line 83
    .line 84
    iget-object p0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTmpCropRect:Landroid/graphics/Rect;

    .line 85
    .line 86
    invoke-virtual {v0, p0}, Landroid/graphics/RectF;->round(Landroid/graphics/Rect;)V

    .line 87
    .line 88
    .line 89
    :cond_0
    return-void
.end method

.method private calculateTaskSize()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mDp:Lcom/android/launcher3/h0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-boolean v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mIsGridTask:Z

    .line 7
    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mSizeStrategy:Lcom/android/quickstep/BaseContainerInterface;

    .line 11
    .line 12
    iget-object v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mContext:Landroid/content/Context;

    .line 13
    .line 14
    iget-object v3, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mFullTaskSize:Landroid/graphics/Rect;

    .line 15
    .line 16
    iget-object v4, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mOrientationState:Lcom/android/quickstep/util/RecentsOrientedState;

    .line 17
    .line 18
    invoke-virtual {v4}, Lcom/android/quickstep/util/RecentsOrientedState;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    invoke-virtual {v1, v2, v0, v3, v4}, Lcom/android/quickstep/BaseContainerInterface;->calculateGridTaskSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;)V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Lcom/android/launcher3/y0;->x()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mSizeStrategy:Lcom/android/quickstep/BaseContainerInterface;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mContext:Landroid/content/Context;

    .line 34
    .line 35
    iget-object v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mDp:Lcom/android/launcher3/h0;

    .line 36
    .line 37
    iget-object v3, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mCarouselTaskSize:Landroid/graphics/Rect;

    .line 38
    .line 39
    iget-object v4, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mOrientationState:Lcom/android/quickstep/util/RecentsOrientedState;

    .line 40
    .line 41
    invoke-virtual {v4}, Lcom/android/quickstep/util/RecentsOrientedState;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/android/quickstep/BaseContainerInterface;->calculateTaskSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mSizeStrategy:Lcom/android/quickstep/BaseContainerInterface;

    .line 50
    .line 51
    iget-object v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mContext:Landroid/content/Context;

    .line 52
    .line 53
    iget-object v3, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mFullTaskSize:Landroid/graphics/Rect;

    .line 54
    .line 55
    iget-object v4, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mOrientationState:Lcom/android/quickstep/util/RecentsOrientedState;

    .line 56
    .line 57
    invoke-virtual {v4}, Lcom/android/quickstep/util/RecentsOrientedState;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    invoke-virtual {v1, v2, v0, v3, v4}, Lcom/android/quickstep/BaseContainerInterface;->calculateTaskSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;)V

    .line 62
    .line 63
    .line 64
    invoke-static {}, Lcom/android/launcher3/y0;->x()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_2

    .line 69
    .line 70
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mCarouselTaskSize:Landroid/graphics/Rect;

    .line 71
    .line 72
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mFullTaskSize:Landroid/graphics/Rect;

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 75
    .line 76
    .line 77
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mSplitBounds:Lcom/android/launcher3/util/y2$a;

    .line 78
    .line 79
    if-eqz v0, :cond_3

    .line 80
    .line 81
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTaskRect:Landroid/graphics/Rect;

    .line 82
    .line 83
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mFullTaskSize:Landroid/graphics/Rect;

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mOrientationState:Lcom/android/quickstep/util/RecentsOrientedState;

    .line 89
    .line 90
    invoke-virtual {v0}, Lcom/android/quickstep/util/RecentsOrientedState;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mDp:Lcom/android/launcher3/h0;

    .line 95
    .line 96
    iget-object v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTaskRect:Landroid/graphics/Rect;

    .line 97
    .line 98
    iget-object v3, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mSplitBounds:Lcom/android/launcher3/util/y2$a;

    .line 99
    .line 100
    iget v4, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mStagePosition:I

    .line 101
    .line 102
    invoke-interface {v0, v1, v2, v3, v4}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->setSplitTaskSwipeRect(Lcom/android/launcher3/h0;Landroid/graphics/Rect;Lcom/android/launcher3/util/y2$a;I)V

    .line 103
    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_3
    iget-boolean v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mIsDesktopTask:Z

    .line 107
    .line 108
    if-eqz v0, :cond_5

    .line 109
    .line 110
    new-instance v0, Landroid/graphics/PointF;

    .line 111
    .line 112
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 113
    .line 114
    .line 115
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mContext:Landroid/content/Context;

    .line 116
    .line 117
    iget-object v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mDp:Lcom/android/launcher3/h0;

    .line 118
    .line 119
    invoke-static {v1, v2, v0}, Lcom/android/quickstep/BaseContainerInterface;->getTaskDimension(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/PointF;)V

    .line 120
    .line 121
    .line 122
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mFullTaskSize:Landroid/graphics/Rect;

    .line 123
    .line 124
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    int-to-float v1, v1

    .line 129
    iget v2, v0, Landroid/graphics/PointF;->x:F

    .line 130
    .line 131
    div-float/2addr v1, v2

    .line 132
    iget-object v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTaskRect:Landroid/graphics/Rect;

    .line 133
    .line 134
    iget-object v3, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mThumbnailPosition:Landroid/graphics/Rect;

    .line 135
    .line 136
    invoke-virtual {v2, v3}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 137
    .line 138
    .line 139
    iget-object v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTaskRect:Landroid/graphics/Rect;

    .line 140
    .line 141
    invoke-virtual {v2, v1}, Landroid/graphics/Rect;->scale(F)V

    .line 142
    .line 143
    .line 144
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTaskRect:Landroid/graphics/Rect;

    .line 145
    .line 146
    iget-object v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mFullTaskSize:Landroid/graphics/Rect;

    .line 147
    .line 148
    iget v3, v2, Landroid/graphics/Rect;->left:I

    .line 149
    .line 150
    iget v2, v2, Landroid/graphics/Rect;->top:I

    .line 151
    .line 152
    invoke-virtual {v1, v3, v2}, Landroid/graphics/Rect;->offset(II)V

    .line 153
    .line 154
    .line 155
    new-instance v1, Landroid/graphics/Rect;

    .line 156
    .line 157
    iget v2, v0, Landroid/graphics/PointF;->x:F

    .line 158
    .line 159
    float-to-int v2, v2

    .line 160
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 161
    .line 162
    float-to-int v0, v0

    .line 163
    const/4 v3, 0x0

    .line 164
    invoke-direct {v1, v3, v3, v2, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 165
    .line 166
    .line 167
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTmpCropRect:Landroid/graphics/Rect;

    .line 168
    .line 169
    iget-object v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mThumbnailPosition:Landroid/graphics/Rect;

    .line 170
    .line 171
    invoke-virtual {v0, v2}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 172
    .line 173
    .line 174
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTmpCropRect:Landroid/graphics/Rect;

    .line 175
    .line 176
    iget-object v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mThumbnailPosition:Landroid/graphics/Rect;

    .line 177
    .line 178
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Rect;->setIntersect(Landroid/graphics/Rect;Landroid/graphics/Rect;)Z

    .line 179
    .line 180
    .line 181
    move-result v0

    .line 182
    if-eqz v0, :cond_4

    .line 183
    .line 184
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTmpCropRect:Landroid/graphics/Rect;

    .line 185
    .line 186
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mThumbnailPosition:Landroid/graphics/Rect;

    .line 187
    .line 188
    iget v2, v1, Landroid/graphics/Rect;->left:I

    .line 189
    .line 190
    neg-int v2, v2

    .line 191
    iget v1, v1, Landroid/graphics/Rect;->top:I

    .line 192
    .line 193
    neg-int v1, v1

    .line 194
    invoke-virtual {v0, v2, v1}, Landroid/graphics/Rect;->offset(II)V

    .line 195
    .line 196
    .line 197
    goto :goto_1

    .line 198
    :cond_4
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTmpCropRect:Landroid/graphics/Rect;

    .line 199
    .line 200
    invoke-virtual {v0}, Landroid/graphics/Rect;->setEmpty()V

    .line 201
    .line 202
    .line 203
    goto :goto_1

    .line 204
    :cond_5
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTaskRect:Landroid/graphics/Rect;

    .line 205
    .line 206
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mFullTaskSize:Landroid/graphics/Rect;

    .line 207
    .line 208
    invoke-virtual {v0, v1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 209
    .line 210
    .line 211
    :goto_1
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTaskRect:Landroid/graphics/Rect;

    .line 212
    .line 213
    iget v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTaskRectTranslationX:I

    .line 214
    .line 215
    iget p0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTaskRectTranslationY:I

    .line 216
    .line 217
    invoke-virtual {v0, v1, p0}, Landroid/graphics/Rect;->offset(II)V

    .line 218
    .line 219
    .line 220
    return-void
.end method

.method public static synthetic d(I)V
    .locals 0

    .line 1
    return-void
.end method

.method private synthetic lambda$new$1(Lcom/android/quickstep/BaseContainerInterface;)Lcom/android/quickstep/util/RecentsOrientedState;
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/util/RecentsOrientedState;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mContext:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v1, Lcom/android/quickstep/util/A1;

    .line 10
    .line 11
    invoke-direct {v1}, Lcom/android/quickstep/util/A1;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-direct {v0, p0, p1, v1}, Lcom/android/quickstep/util/RecentsOrientedState;-><init>(Landroid/content/Context;Lcom/android/quickstep/BaseContainerInterface;Ljava/util/function/IntConsumer;)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method

.method private updateScaleForFullScreenToWindow()Z
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mOrientationState:Lcom/android/quickstep/util/RecentsOrientedState;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/util/RecentsOrientedState;->getRecentsActivityRotation()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mSizeStrategy:Lcom/android/quickstep/BaseContainerInterface;

    .line 8
    .line 9
    iget-boolean v2, v1, Lcom/android/quickstep/BaseContainerInterface;->mFullScreenToWindow:Z

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    if-eqz v2, :cond_6

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    if-eqz v1, :cond_6

    .line 19
    .line 20
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mSizeStrategy:Lcom/android/quickstep/BaseContainerInterface;

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-interface {v1}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lcom/android/quickstep/views/RecentsView;

    .line 31
    .line 32
    if-eqz v1, :cond_6

    .line 33
    .line 34
    iget v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mStartFixScalePosition:F

    .line 35
    .line 36
    const/4 v4, 0x0

    .line 37
    invoke-static {v4, v2}, Ljava/lang/Float;->compare(FF)I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_0

    .line 42
    .line 43
    iget-object v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->recentsViewScroll:Lcom/android/launcher3/anim/d;

    .line 44
    .line 45
    iget v2, v2, Lcom/android/launcher3/anim/d;->d:F

    .line 46
    .line 47
    iget v5, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mStartScrollFullScreenToWindow:F

    .line 48
    .line 49
    sub-float/2addr v2, v5

    .line 50
    cmpg-float v2, v2, v4

    .line 51
    .line 52
    if-gtz v2, :cond_1

    .line 53
    .line 54
    :cond_0
    iget-object v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->recentsViewScroll:Lcom/android/launcher3/anim/d;

    .line 55
    .line 56
    iget v2, v2, Lcom/android/launcher3/anim/d;->d:F

    .line 57
    .line 58
    iput v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mStartScrollFullScreenToWindow:F

    .line 59
    .line 60
    :cond_1
    iget-object v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTempRectF:Landroid/graphics/RectF;

    .line 61
    .line 62
    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    iget-object v5, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTempRectF:Landroid/graphics/RectF;

    .line 67
    .line 68
    invoke-virtual {v5}, Landroid/graphics/RectF;->height()F

    .line 69
    .line 70
    .line 71
    move-result v5

    .line 72
    div-float/2addr v5, v2

    .line 73
    iget-object v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mSizeStrategy:Lcom/android/quickstep/BaseContainerInterface;

    .line 74
    .line 75
    invoke-virtual {v2}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-interface {v2}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    iget v2, v2, Lcom/android/launcher3/h0;->Y0:F

    .line 84
    .line 85
    cmpl-float v2, v5, v2

    .line 86
    .line 87
    if-gez v2, :cond_2

    .line 88
    .line 89
    if-eqz v0, :cond_2

    .line 90
    .line 91
    const/4 v2, 0x2

    .line 92
    if-ne v0, v2, :cond_6

    .line 93
    .line 94
    :cond_2
    iget v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mStartFixScalePosition:F

    .line 95
    .line 96
    invoke-static {v4, v0}, Ljava/lang/Float;->compare(FF)I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-nez v0, :cond_3

    .line 101
    .line 102
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->recentsViewScroll:Lcom/android/launcher3/anim/d;

    .line 103
    .line 104
    iget v0, v0, Lcom/android/launcher3/anim/d;->d:F

    .line 105
    .line 106
    invoke-virtual {v1}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 107
    .line 108
    .line 109
    move-result v2

    .line 110
    int-to-float v2, v2

    .line 111
    div-float/2addr v0, v2

    .line 112
    iput v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mStartFixScalePosition:F

    .line 113
    .line 114
    :cond_3
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->recentsViewScroll:Lcom/android/launcher3/anim/d;

    .line 115
    .line 116
    iget v0, v0, Lcom/android/launcher3/anim/d;->d:F

    .line 117
    .line 118
    invoke-virtual {v1}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    int-to-float v1, v1

    .line 123
    div-float v5, v0, v1

    .line 124
    .line 125
    iget v6, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mStartFixScalePosition:F

    .line 126
    .line 127
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->recentsViewScale:Lcom/android/launcher3/anim/d;

    .line 128
    .line 129
    iget v8, v0, Lcom/android/launcher3/anim/d;->d:F

    .line 130
    .line 131
    const/high16 v9, 0x3f800000    # 1.0f

    .line 132
    .line 133
    sget-object v10, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 134
    .line 135
    const/high16 v7, 0x3f800000    # 1.0f

    .line 136
    .line 137
    invoke-static/range {v5 .. v10}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mSizeStrategy:Lcom/android/quickstep/BaseContainerInterface;

    .line 142
    .line 143
    const/high16 v2, 0x40200000    # 2.5f

    .line 144
    .line 145
    cmpg-float v2, v0, v2

    .line 146
    .line 147
    const/4 v5, 0x1

    .line 148
    if-gez v2, :cond_4

    .line 149
    .line 150
    move v3, v5

    .line 151
    :cond_4
    iput-boolean v3, v1, Lcom/android/quickstep/BaseContainerInterface;->mFullScreenToWindowSmallOrMini:Z

    .line 152
    .line 153
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mMatrix:Landroid/graphics/Matrix;

    .line 154
    .line 155
    iget-object v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mPivot:Landroid/graphics/PointF;

    .line 156
    .line 157
    iget v3, v2, Landroid/graphics/PointF;->x:F

    .line 158
    .line 159
    iget v2, v2, Landroid/graphics/PointF;->y:F

    .line 160
    .line 161
    invoke-virtual {v1, v0, v0, v3, v2}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 162
    .line 163
    .line 164
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->recentsViewScroll:Lcom/android/launcher3/anim/d;

    .line 165
    .line 166
    iget v0, v0, Lcom/android/launcher3/anim/d;->d:F

    .line 167
    .line 168
    iget v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mStartScrollFullScreenToWindow:F

    .line 169
    .line 170
    sub-float/2addr v0, v1

    .line 171
    cmpl-float v0, v0, v4

    .line 172
    .line 173
    if-ltz v0, :cond_5

    .line 174
    .line 175
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mOrientationState:Lcom/android/quickstep/util/RecentsOrientedState;

    .line 176
    .line 177
    invoke-virtual {v0}, Lcom/android/quickstep/util/RecentsOrientedState;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mMatrix:Landroid/graphics/Matrix;

    .line 182
    .line 183
    sget-object v2, Lcom/android/launcher3/touch/G;->e:Lcom/android/launcher3/touch/G$b;

    .line 184
    .line 185
    iget-object v3, p0, Lcom/android/quickstep/util/TaskViewSimulator;->recentsViewScroll:Lcom/android/launcher3/anim/d;

    .line 186
    .line 187
    iget v3, v3, Lcom/android/launcher3/anim/d;->d:F

    .line 188
    .line 189
    iget p0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mStartScrollFullScreenToWindow:F

    .line 190
    .line 191
    sub-float/2addr v3, p0

    .line 192
    invoke-interface {v0, v1, v2, v3}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->setPrimary(Ljava/lang/Object;Lcom/android/launcher3/touch/G$b;F)V

    .line 193
    .line 194
    .line 195
    :cond_5
    return v5

    .line 196
    :cond_6
    return v3
.end method

.method private updateTempRectFForFullScreenToWindow()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mOrientationState:Lcom/android/quickstep/util/RecentsOrientedState;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/util/RecentsOrientedState;->getRecentsActivityRotation()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mSizeStrategy:Lcom/android/quickstep/BaseContainerInterface;

    .line 8
    .line 9
    iget-boolean v2, v1, Lcom/android/quickstep/BaseContainerInterface;->mFullScreenToWindow:Z

    .line 10
    .line 11
    if-eqz v2, :cond_2

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    if-eqz v1, :cond_2

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    if-eq v0, v1, :cond_0

    .line 21
    .line 22
    const/4 v1, 0x3

    .line 23
    if-ne v0, v1, :cond_2

    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mSizeStrategy:Lcom/android/quickstep/BaseContainerInterface;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Lcom/android/quickstep/views/RecentsView;

    .line 36
    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    const/4 v1, 0x0

    .line 40
    iget v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mStartFixScalePosition:F

    .line 41
    .line 42
    invoke-static {v1, v2}, Ljava/lang/Float;->compare(FF)I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-nez v1, :cond_1

    .line 47
    .line 48
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->recentsViewScroll:Lcom/android/launcher3/anim/d;

    .line 49
    .line 50
    iget v1, v1, Lcom/android/launcher3/anim/d;->d:F

    .line 51
    .line 52
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    int-to-float v0, v0

    .line 57
    div-float v2, v1, v0

    .line 58
    .line 59
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTempRectF:Landroid/graphics/RectF;

    .line 60
    .line 61
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    .line 62
    .line 63
    .line 64
    move-result v5

    .line 65
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mSizeStrategy:Lcom/android/quickstep/BaseContainerInterface;

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    iget v6, v0, Lcom/android/launcher3/h0;->Y0:F

    .line 76
    .line 77
    sget-object v7, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 78
    .line 79
    const/4 v3, 0x0

    .line 80
    const/high16 v4, 0x3f000000    # 0.5f

    .line 81
    .line 82
    invoke-static/range {v2 .. v7}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    iput v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mNewWidth:F

    .line 87
    .line 88
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTempRectF:Landroid/graphics/RectF;

    .line 89
    .line 90
    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    iget v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mNewWidth:F

    .line 95
    .line 96
    const/high16 v3, 0x40000000    # 2.0f

    .line 97
    .line 98
    div-float/2addr v2, v3

    .line 99
    sub-float/2addr v1, v2

    .line 100
    iget-object v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTempRectF:Landroid/graphics/RectF;

    .line 101
    .line 102
    iget v4, v2, Landroid/graphics/RectF;->top:F

    .line 103
    .line 104
    invoke-virtual {v2}, Landroid/graphics/RectF;->centerX()F

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    iget v5, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mNewWidth:F

    .line 109
    .line 110
    div-float/2addr v5, v3

    .line 111
    add-float/2addr v2, v5

    .line 112
    iget-object p0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTempRectF:Landroid/graphics/RectF;

    .line 113
    .line 114
    iget p0, p0, Landroid/graphics/RectF;->bottom:F

    .line 115
    .line 116
    invoke-virtual {v0, v1, v4, v2, p0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 117
    .line 118
    .line 119
    :cond_2
    return-void
.end method


# virtual methods
.method public addAppToCarouselAnim(Lcom/android/launcher3/anim/V;Landroid/view/animation/Interpolator;)V
    .locals 9

    .line 1
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->fullScreenProgress:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    sget-object v2, Lcom/android/launcher3/anim/d;->e:Landroid/util/FloatProperty;

    .line 4
    .line 5
    const/high16 v3, 0x3f800000    # 1.0f

    .line 6
    .line 7
    const/4 v4, 0x0

    .line 8
    move-object v0, p1

    .line 9
    move-object v5, p2

    .line 10
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/anim/V;->r(Ljava/lang/Object;Landroid/util/FloatProperty;FFLandroid/animation/TimeInterpolator;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/android/launcher3/y0;->x()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mDp:Lcom/android/launcher3/h0;

    .line 20
    .line 21
    iget-boolean p2, p1, Lcom/android/launcher3/h0;->G0:Z

    .line 22
    .line 23
    if-eqz p2, :cond_0

    .line 24
    .line 25
    iget-boolean p1, p1, Lcom/android/launcher3/h0;->P0:Z

    .line 26
    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    const/4 p1, 0x1

    .line 30
    iput-boolean p1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mIsAnimatingToCarousel:Z

    .line 31
    .line 32
    iget-object p1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->carouselScale:Lcom/android/launcher3/anim/d;

    .line 33
    .line 34
    iget-object p2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mCarouselTaskSize:Landroid/graphics/Rect;

    .line 35
    .line 36
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    int-to-float p2, p2

    .line 41
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mFullTaskSize:Landroid/graphics/Rect;

    .line 42
    .line 43
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    int-to-float v1, v1

    .line 48
    div-float/2addr p2, v1

    .line 49
    iput p2, p1, Lcom/android/launcher3/anim/d;->d:F

    .line 50
    .line 51
    :cond_0
    iget-object p1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->carouselScale:Lcom/android/launcher3/anim/d;

    iget p2, p1, Lcom/android/launcher3/anim/d;->d:F

    iget-object v8, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mContext:Landroid/content/Context;

    invoke-static {v8, p2}, Lcom/android/quickstep/views/LsNativeStack;->getLiveCarouselScale(Landroid/content/Context;F)F

    move-result p2

    iput p2, p1, Lcom/android/launcher3/anim/d;->d:F

    iget-object v8, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/android/quickstep/util/TaskViewSimulator;->recentsViewScale:Lcom/android/launcher3/anim/d;

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/android/quickstep/util/TaskViewSimulator;->getFullScreenScale()F

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    const/high16 v6, 0x3f800000    # 1.0f

    invoke-static {v8, v6}, Lcom/android/quickstep/views/LsNativeStack;->getLiveRecentsScale(Landroid/content/Context;F)F

    move-result v6

    .line 58
    .line 59
    move-object v4, v2

    .line 60
    move-object v7, v5

    .line 61
    move v5, p0

    .line 62
    move-object v2, v0

    .line 63
    invoke-virtual/range {v2 .. v7}, Lcom/android/launcher3/anim/V;->r(Ljava/lang/Object;Landroid/util/FloatProperty;FFLandroid/animation/TimeInterpolator;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public addOverviewToAppAnim(Lcom/android/launcher3/anim/V;Landroid/animation/TimeInterpolator;)V
    .locals 9

    .line 1
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->fullScreenProgress:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    sget-object v2, Lcom/android/launcher3/anim/d;->e:Landroid/util/FloatProperty;

    .line 4
    .line 5
    const/4 v3, 0x0

    .line 6
    const/high16 v4, 0x3f800000    # 1.0f

    .line 7
    .line 8
    move-object v0, p1

    .line 9
    move-object v5, p2

    .line 10
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/anim/V;->r(Ljava/lang/Object;Landroid/util/FloatProperty;FFLandroid/animation/TimeInterpolator;)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->carouselScale:Lcom/android/launcher3/anim/d;

    iget p2, p1, Lcom/android/launcher3/anim/d;->d:F

    iget-object v8, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mContext:Landroid/content/Context;

    invoke-static {v8, p2}, Lcom/android/quickstep/views/LsNativeStack;->getLiveCarouselScale(Landroid/content/Context;F)F

    move-result p2

    iput p2, p1, Lcom/android/launcher3/anim/d;->d:F

    iget-object v3, p0, Lcom/android/quickstep/util/TaskViewSimulator;->recentsViewScale:Lcom/android/launcher3/anim/d;

    iget-object v8, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mContext:Landroid/content/Context;

    .line 14
    .line 15
    move-object v7, v5

    .line 16
    const/high16 v5, 0x3f800000    # 1.0f

    invoke-static {v8, v5}, Lcom/android/quickstep/views/LsNativeStack;->getLiveRecentsScale(Landroid/content/Context;F)F

    move-result v5

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/android/quickstep/util/TaskViewSimulator;->getFullScreenScale()F

    .line 19
    .line 20
    .line 21
    move-result v6

    .line 22
    move-object v4, v2

    .line 23
    move-object v2, v0

    .line 24
    invoke-virtual/range {v2 .. v7}, Lcom/android/launcher3/anim/V;->r(Ljava/lang/Object;Landroid/util/FloatProperty;FFLandroid/animation/TimeInterpolator;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public apply(Lcom/android/quickstep/util/TransformParams;)V
    .locals 1

    const/4 v0, 0x1

    .line 47
    invoke-virtual {p0, p1, v0}, Lcom/android/quickstep/util/TaskViewSimulator;->apply(Lcom/android/quickstep/util/TransformParams;Z)V

    return-void
.end method

.method public apply(Lcom/android/quickstep/util/TransformParams;Lcom/android/quickstep/util/SurfaceTransaction;Z)V
    .locals 10

    .line 2
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mDp:Lcom/android/launcher3/h0;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mThumbnailPosition:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_3

    .line 3
    :cond_0
    iget-boolean v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mLayoutValid:Z

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mOrientationStateId:I

    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mOrientationState:Lcom/android/quickstep/util/RecentsOrientedState;

    invoke-virtual {v1}, Lcom/android/quickstep/util/RecentsOrientedState;->getStateId()I

    move-result v1

    if-eq v0, v1, :cond_3

    :cond_1
    const/4 v0, 0x1

    .line 4
    iput-boolean v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mLayoutValid:Z

    .line 5
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mOrientationState:Lcom/android/quickstep/util/RecentsOrientedState;

    invoke-virtual {v1}, Lcom/android/quickstep/util/RecentsOrientedState;->getStateId()I

    move-result v1

    iput v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mOrientationStateId:I

    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/util/TaskViewSimulator;->getFullScreenScale()F

    .line 7
    sget-boolean v1, Lcom/android/quickstep/TaskAnimationManager;->SHELL_TRANSITIONS_ROTATION:Z

    if-eqz v1, :cond_2

    .line 8
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mThumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    iget-object v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mOrientationState:Lcom/android/quickstep/util/RecentsOrientedState;

    invoke-virtual {v2}, Lcom/android/quickstep/util/RecentsOrientedState;->getTouchRotation()I

    move-result v2

    iput v2, v1, Lcom/android/systemui/shared/recents/model/ThumbnailData;->rotation:I

    goto :goto_0

    .line 9
    :cond_2
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mThumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    iget-object v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mOrientationState:Lcom/android/quickstep/util/RecentsOrientedState;

    invoke-virtual {v2}, Lcom/android/quickstep/util/RecentsOrientedState;->getDisplayRotation()I

    move-result v2

    iput v2, v1, Lcom/android/systemui/shared/recents/model/ThumbnailData;->rotation:I

    .line 10
    :goto_0
    iget-boolean v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mIsRecentsRtl:Z

    xor-int/lit8 v9, v1, 0x1

    .line 11
    iget-object v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mPositionHelper:Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;

    iget-object v3, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mThumbnailPosition:Landroid/graphics/Rect;

    iget-object v4, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mThumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTaskRect:Landroid/graphics/Rect;

    .line 12
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v5

    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTaskRect:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v6

    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mDp:Lcom/android/launcher3/h0;

    iget-boolean v7, v0, Lcom/android/launcher3/h0;->G0:Z

    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mOrientationState:Lcom/android/quickstep/util/RecentsOrientedState;

    .line 13
    invoke-virtual {v0}, Lcom/android/quickstep/util/RecentsOrientedState;->getRecentsActivityRotation()I

    move-result v8

    .line 14
    invoke-virtual/range {v2 .. v9}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;->updateThumbnailMatrix(Landroid/graphics/Rect;Lcom/android/systemui/shared/recents/model/ThumbnailData;IIZIZ)V

    .line 15
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mPositionHelper:Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;

    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mInversePositionMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 16
    :cond_3
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->fullScreenProgress:Lcom/android/launcher3/anim/d;

    iget v0, v0, Lcom/android/launcher3/anim/d;->d:F

    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v0, v1, v2}, Lcom/android/launcher3/N5;->b(FFF)F

    move-result v0

    .line 17
    iget-object v3, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mCurrentFullscreenParams:Lcom/android/quickstep/FullscreenDrawParams;

    iget-object v4, p0, Lcom/android/quickstep/util/TaskViewSimulator;->recentsViewScale:Lcom/android/launcher3/anim/d;

    iget v4, v4, Lcom/android/launcher3/anim/d;->d:F

    iget-object v6, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mContext:Landroid/content/Context;

    invoke-static {v6, v4}, Lcom/android/quickstep/views/LsNativeStack;->normalizeLiveAppliedScale(Landroid/content/Context;F)F

    move-result v4

    iget-object v5, p0, Lcom/android/quickstep/util/TaskViewSimulator;->carouselScale:Lcom/android/launcher3/anim/d;

    iget v5, v5, Lcom/android/launcher3/anim/d;->d:F

    invoke-virtual {v3, v0, v4, v5}, Lcom/android/quickstep/FullscreenDrawParams;->setProgress(FFF)V

    .line 18
    iget-object v3, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTaskRect:Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    .line 19
    iget-object v4, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTaskRect:Landroid/graphics/Rect;

    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    move-result v4

    int-to-float v4, v4

    .line 20
    iget-object v5, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mMatrix:Landroid/graphics/Matrix;

    iget-object v6, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mPositionHelper:Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;

    invoke-virtual {v6}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 21
    iget-object v5, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mMatrix:Landroid/graphics/Matrix;

    iget-object v6, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTaskRect:Landroid/graphics/Rect;

    iget v7, v6, Landroid/graphics/Rect;->left:I

    int-to-float v7, v7

    iget v6, v6, Landroid/graphics/Rect;->top:I

    int-to-float v6, v6

    invoke-virtual {v5, v7, v6}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 22
    iget-object v5, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTaskRectTransform:Landroid/graphics/Matrix;

    if-eqz v5, :cond_4

    .line 23
    iget-object v6, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v6, v5}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 24
    iget-boolean v5, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mIsDesktopTask:Z

    if-eqz v5, :cond_4

    .line 25
    invoke-direct {p0}, Lcom/android/quickstep/util/TaskViewSimulator;->calculateDesktopTaskCropRect()V

    .line 26
    :cond_4
    iget-object v5, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mOrientationState:Lcom/android/quickstep/util/RecentsOrientedState;

    invoke-virtual {v5}, Lcom/android/quickstep/util/RecentsOrientedState;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    move-result-object v5

    iget-object v6, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mMatrix:Landroid/graphics/Matrix;

    sget-object v7, Lcom/android/launcher3/touch/G;->e:Lcom/android/launcher3/touch/G$b;

    iget-object v8, p0, Lcom/android/quickstep/util/TaskViewSimulator;->taskPrimaryTranslation:Lcom/android/launcher3/anim/d;

    iget v8, v8, Lcom/android/launcher3/anim/d;->d:F

    iget-object v9, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mSizeStrategy:Lcom/android/quickstep/BaseContainerInterface;

    iget v9, v9, Lcom/android/quickstep/BaseContainerInterface;->mTaskRectOffsetAnimPrimary:F

    sub-float/2addr v8, v9

    invoke-interface {v5, v6, v7, v8}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->setPrimary(Ljava/lang/Object;Lcom/android/launcher3/touch/G$b;F)V

    .line 27
    iget-object v5, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mOrientationState:Lcom/android/quickstep/util/RecentsOrientedState;

    invoke-virtual {v5}, Lcom/android/quickstep/util/RecentsOrientedState;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    move-result-object v5

    iget-object v6, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mMatrix:Landroid/graphics/Matrix;

    iget-object v8, p0, Lcom/android/quickstep/util/TaskViewSimulator;->taskSecondaryTranslation:Lcom/android/launcher3/anim/d;

    iget v8, v8, Lcom/android/launcher3/anim/d;->d:F

    iget-object v9, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mSizeStrategy:Lcom/android/quickstep/BaseContainerInterface;

    iget v9, v9, Lcom/android/quickstep/BaseContainerInterface;->mTaskRectOffsetAnimSecondary:F

    sub-float/2addr v8, v9

    invoke-interface {v5, v6, v7, v8}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->setSecondary(Ljava/lang/Object;Lcom/android/launcher3/touch/G$b;F)V

    .line 28
    iget-object v5, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mMatrix:Landroid/graphics/Matrix;

    iget-object v6, p0, Lcom/android/quickstep/util/TaskViewSimulator;->taskGridTranslationX:Lcom/android/launcher3/anim/d;

    iget v6, v6, Lcom/android/launcher3/anim/d;->d:F

    iget-object v8, p0, Lcom/android/quickstep/util/TaskViewSimulator;->taskGridTranslationY:Lcom/android/launcher3/anim/d;

    iget v8, v8, Lcom/android/launcher3/anim/d;->d:F

    invoke-virtual {v5, v6, v8}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 29
    iget-object v5, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mMatrix:Landroid/graphics/Matrix;

    iget-object v6, p0, Lcom/android/quickstep/util/TaskViewSimulator;->carouselScale:Lcom/android/launcher3/anim/d;

    iget v6, v6, Lcom/android/launcher3/anim/d;->d:F

    .line 30
    iget-boolean v8, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mIsRecentsRtl:Z

    if-eqz v8, :cond_5

    iget-object v8, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mCarouselTaskSize:Landroid/graphics/Rect;

    iget v8, v8, Landroid/graphics/Rect;->right:I

    :goto_1
    int-to-float v8, v8

    goto :goto_2

    :cond_5
    iget-object v8, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mCarouselTaskSize:Landroid/graphics/Rect;

    iget v8, v8, Landroid/graphics/Rect;->left:I

    goto :goto_1

    :goto_2
    iget-object v9, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mCarouselTaskSize:Landroid/graphics/Rect;

    iget v9, v9, Landroid/graphics/Rect;->top:I

    int-to-float v9, v9

    .line 31
    invoke-virtual {v5, v6, v6, v8, v9}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 32
    iget-object v5, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mSizeStrategy:Lcom/android/quickstep/BaseContainerInterface;

    iget-boolean v5, v5, Lcom/android/quickstep/BaseContainerInterface;->mFullScreenToWindow:Z

    if-nez v5, :cond_6

    .line 33
    iget-object v5, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mOrientationState:Lcom/android/quickstep/util/RecentsOrientedState;

    invoke-virtual {v5}, Lcom/android/quickstep/util/RecentsOrientedState;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    move-result-object v5

    iget-object v6, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mMatrix:Landroid/graphics/Matrix;

    iget-object v8, p0, Lcom/android/quickstep/util/TaskViewSimulator;->recentsViewScroll:Lcom/android/launcher3/anim/d;

    iget v8, v8, Lcom/android/launcher3/anim/d;->d:F

    invoke-static {v8}, Lcom/android/quickstep/views/LsNativeStack;->normalizeLiveEntryScroll(F)F

    move-result v8

    invoke-interface {v5, v6, v7, v8}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->setPrimary(Ljava/lang/Object;Lcom/android/launcher3/touch/G$b;F)V

    .line 34
    :cond_6
    iget-object v5, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTempRectF:Landroid/graphics/RectF;

    invoke-virtual {v5, v1, v1, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 35
    invoke-direct {p0}, Lcom/android/quickstep/util/TaskViewSimulator;->updateTempRectFForFullScreenToWindow()V

    .line 36
    invoke-direct {p0}, Lcom/android/quickstep/util/TaskViewSimulator;->updateScaleForFullScreenToWindow()Z

    move-result v1

    if-nez v1, :cond_7

    .line 37
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mMatrix:Landroid/graphics/Matrix;

    iget-object v3, p0, Lcom/android/quickstep/util/TaskViewSimulator;->recentsViewScale:Lcom/android/launcher3/anim/d;

    iget v3, v3, Lcom/android/launcher3/anim/d;->d:F

    iget-object v4, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mContext:Landroid/content/Context;

    invoke-static {v4, v3}, Lcom/android/quickstep/views/LsNativeStack;->normalizeLiveAppliedScale(Landroid/content/Context;F)F

    move-result v3

    iget-object v4, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mPivot:Landroid/graphics/PointF;

    iget v5, v4, Landroid/graphics/PointF;->x:F

    iget v4, v4, Landroid/graphics/PointF;->y:F

    invoke-virtual {v1, v3, v3, v5, v4}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 38
    :cond_7
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mOrientationState:Lcom/android/quickstep/util/RecentsOrientedState;

    invoke-virtual {v1}, Lcom/android/quickstep/util/RecentsOrientedState;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    move-result-object v1

    iget-object v3, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mMatrix:Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/android/quickstep/util/TaskViewSimulator;->recentsViewSecondaryTranslation:Lcom/android/launcher3/anim/d;

    iget v4, v4, Lcom/android/launcher3/anim/d;->d:F

    invoke-interface {v1, v3, v7, v4}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->setSecondary(Ljava/lang/Object;Lcom/android/launcher3/touch/G$b;F)V

    .line 39
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mOrientationState:Lcom/android/quickstep/util/RecentsOrientedState;

    invoke-virtual {v1}, Lcom/android/quickstep/util/RecentsOrientedState;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    move-result-object v1

    iget-object v3, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mMatrix:Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/android/quickstep/util/TaskViewSimulator;->recentsViewPrimaryTranslation:Lcom/android/launcher3/anim/d;

    iget v4, v4, Lcom/android/launcher3/anim/d;->d:F

    invoke-interface {v1, v3, v7, v4}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->setPrimary(Ljava/lang/Object;Lcom/android/launcher3/touch/G$b;F)V

    if-eqz p3, :cond_8

    .line 40
    iget-object p3, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0, p3}, Lcom/android/quickstep/util/TaskViewSimulator;->applyWindowToHomeRotation(Landroid/graphics/Matrix;)V

    .line 41
    :cond_8
    iget-boolean p3, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mIsDesktopTask:Z

    if-nez p3, :cond_9

    .line 42
    iget-object p3, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mInversePositionMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTempRectF:Landroid/graphics/RectF;

    invoke-virtual {p3, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 43
    iget-object p3, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTempRectF:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTmpCropRect:Landroid/graphics/Rect;

    invoke-virtual {p3, v1}, Landroid/graphics/RectF;->roundOut(Landroid/graphics/Rect;)V

    :cond_9
    if-nez p1, :cond_a

    goto :goto_3

    :cond_a
    sub-float/2addr v2, v0

    .line 44
    invoke-virtual {p1, v2}, Lcom/android/quickstep/util/TransformParams;->setProgress(F)Lcom/android/quickstep/util/TransformParams;

    if-nez p2, :cond_b

    .line 45
    invoke-virtual {p1, p0}, Lcom/android/quickstep/util/TransformParams;->createSurfaceParams(Lcom/android/quickstep/util/TransformParams$BuilderProxy;)Lcom/android/quickstep/util/SurfaceTransaction;

    move-result-object p2

    .line 46
    :cond_b
    invoke-virtual {p1, p2}, Lcom/android/quickstep/util/TransformParams;->applySurfaceParams(Lcom/android/quickstep/util/SurfaceTransaction;)V

    :cond_c
    :goto_3
    return-void
.end method

.method public apply(Lcom/android/quickstep/util/TransformParams;Z)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, p1, v0, p2}, Lcom/android/quickstep/util/TaskViewSimulator;->apply(Lcom/android/quickstep/util/TransformParams;Lcom/android/quickstep/util/SurfaceTransaction;Z)V

    return-void
.end method

.method public applyWindowToHomeRotation(Landroid/graphics/Matrix;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mDp:Lcom/android/launcher3/h0;

    .line 2
    .line 3
    iget v1, v0, Lcom/android/launcher3/h0;->R0:I

    .line 4
    .line 5
    int-to-float v1, v1

    .line 6
    iget v0, v0, Lcom/android/launcher3/h0;->S0:I

    .line 7
    .line 8
    int-to-float v0, v0

    .line 9
    invoke-virtual {p1, v1, v0}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mOrientationState:Lcom/android/quickstep/util/RecentsOrientedState;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/android/quickstep/util/RecentsOrientedState;->getRecentsActivityRotation()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mOrientationState:Lcom/android/quickstep/util/RecentsOrientedState;

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/android/quickstep/util/RecentsOrientedState;->getDisplayRotation()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-static {v0, v1}, LQ1/d;->b(II)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iget-object p0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mDp:Lcom/android/launcher3/h0;

    .line 29
    .line 30
    iget v1, p0, Lcom/android/launcher3/h0;->T0:I

    .line 31
    .line 32
    int-to-float v1, v1

    .line 33
    iget p0, p0, Lcom/android/launcher3/h0;->U0:I

    .line 34
    .line 35
    int-to-float p0, p0

    .line 36
    invoke-static {v0, v1, p0, p1}, Lcom/android/quickstep/util/RecentsOrientedState;->postDisplayRotation(IFFLandroid/graphics/Matrix;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public checkAndUpdateDeviceProfile(Lcom/android/launcher3/h0;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mDp:Lcom/android/launcher3/h0;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const-string v0, "TaskViewSimulator"

    .line 9
    .line 10
    const-string v1, "check and update device profile"

    .line 11
    .line 12
    invoke-static {v0, v1}, LM3/a;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/TaskViewSimulator;->setDp(Lcom/android/launcher3/h0;)V

    .line 16
    .line 17
    .line 18
    :cond_1
    :goto_0
    return-void
.end method

.method public final getActualClipRectBeforeGestureEnd()Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->actualClipRectBeforeGestureEnd:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getActualMatrixBeforeGestureEnd()Landroid/graphics/Matrix;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->actualMatrixBeforeGestureEnd:Landroid/graphics/Matrix;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getCurrentApplyRect()Landroid/graphics/RectF;
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {p0, v1}, Lcom/android/quickstep/util/TaskViewSimulator;->apply(Lcom/android/quickstep/util/TransformParams;)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mThumbnailPosition:Landroid/graphics/Rect;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mMatrix:Landroid/graphics/Matrix;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 18
    .line 19
    .line 20
    return-object v0
.end method

.method public getCurrentCornerRadius()F
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mCurrentFullscreenParams:Lcom/android/quickstep/FullscreenDrawParams;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/FullscreenDrawParams;->getCurrentCornerRadius()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTempPoint:[F

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    aput v0, v1, v2

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    const/4 v3, 0x1

    .line 14
    aput v0, v1, v3

    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mInversePositionMatrix:Landroid/graphics/Matrix;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapVectors([F)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTempPoint:[F

    .line 22
    .line 23
    aget v0, v0, v2

    .line 24
    .line 25
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iget-object p0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTempPoint:[F

    .line 30
    .line 31
    aget p0, p0, v3

    .line 32
    .line 33
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    invoke-static {v0, p0}, Ljava/lang/Math;->max(FF)F

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    return p0
.end method

.method public getCurrentCropRect()Landroid/graphics/RectF;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTempRectF:Landroid/graphics/RectF;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTaskRect:Landroid/graphics/Rect;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    int-to-float v1, v1

    .line 10
    iget-object v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTaskRect:Landroid/graphics/Rect;

    .line 11
    .line 12
    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    int-to-float v2, v2

    .line 17
    const/4 v3, 0x0

    .line 18
    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 19
    .line 20
    .line 21
    invoke-direct {p0}, Lcom/android/quickstep/util/TaskViewSimulator;->updateTempRectFForFullScreenToWindow()V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mInversePositionMatrix:Landroid/graphics/Matrix;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTempRectF:Landroid/graphics/RectF;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTempRectF:Landroid/graphics/RectF;

    .line 32
    .line 33
    return-object p0
.end method

.method public getCurrentCropRectInterrupt()Landroid/graphics/RectF;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTmpCropRectInterrupt:Landroid/graphics/RectF;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCurrentFullscreenParams()Lcom/android/quickstep/FullscreenDrawParams;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mCurrentFullscreenParams:Lcom/android/quickstep/FullscreenDrawParams;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCurrentInterrupt()Landroid/graphics/RectF;
    .locals 5

    .line 1
    invoke-static {}, Lx1/O;->Y2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance p0, Landroid/graphics/RectF;

    .line 8
    .line 9
    invoke-direct {p0}, Landroid/graphics/RectF;-><init>()V

    .line 10
    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTmpCropRectInterrupt:Landroid/graphics/RectF;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, 0x0

    .line 20
    cmpl-float v0, v0, v1

    .line 21
    .line 22
    if-eqz v0, :cond_4

    .line 23
    .line 24
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTmpCropRectInterrupt:Landroid/graphics/RectF;

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    cmpl-float v0, v0, v1

    .line 31
    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    new-instance v0, Landroid/graphics/RectF;

    .line 36
    .line 37
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTmpCropRectInterrupt:Landroid/graphics/RectF;

    .line 38
    .line 39
    invoke-direct {v0, v1}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mMatrixTmp:Landroid/graphics/Matrix;

    .line 43
    .line 44
    iget-object v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mMatrix:Landroid/graphics/Matrix;

    .line 45
    .line 46
    invoke-virtual {v1, v2}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mDp:Lcom/android/launcher3/h0;

    .line 50
    .line 51
    iget-boolean v1, v1, Lcom/android/launcher3/h0;->G0:Z

    .line 52
    .line 53
    if-eqz v1, :cond_2

    .line 54
    .line 55
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mOrientationState:Lcom/android/quickstep/util/RecentsOrientedState;

    .line 56
    .line 57
    invoke-virtual {v1}, Lcom/android/quickstep/util/RecentsOrientedState;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    sget-object v2, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->PORTRAIT:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 62
    .line 63
    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-nez v1, :cond_3

    .line 68
    .line 69
    :cond_2
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mOrientationState:Lcom/android/quickstep/util/RecentsOrientedState;

    .line 70
    .line 71
    invoke-virtual {v1}, Lcom/android/quickstep/util/RecentsOrientedState;->getDisplayRotation()I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    iget-object v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mDp:Lcom/android/launcher3/h0;

    .line 76
    .line 77
    iget v3, v2, Lcom/android/launcher3/h0;->T0:I

    .line 78
    .line 79
    int-to-float v3, v3

    .line 80
    iget v2, v2, Lcom/android/launcher3/h0;->U0:I

    .line 81
    .line 82
    int-to-float v2, v2

    .line 83
    iget-object v4, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mMatrixTmp:Landroid/graphics/Matrix;

    .line 84
    .line 85
    invoke-static {v1, v3, v2, v4}, Lcom/android/quickstep/util/RecentsOrientedState;->preDisplayRotation(IFFLandroid/graphics/Matrix;)V

    .line 86
    .line 87
    .line 88
    :cond_3
    iget-object p0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mMatrixTmp:Landroid/graphics/Matrix;

    .line 89
    .line 90
    invoke-virtual {p0, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 91
    .line 92
    .line 93
    return-object v0

    .line 94
    :cond_4
    :goto_0
    sget-object v0, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 95
    .line 96
    iget-object p0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mContext:Landroid/content/Context;

    .line 97
    .line 98
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    check-cast p0, Lcom/android/launcher3/anim/C;

    .line 103
    .line 104
    invoke-virtual {p0}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-virtual {p0}, Lu2/e;->c()Landroid/graphics/RectF;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    return-object p0
.end method

.method public getCurrentMatrix()Landroid/graphics/Matrix;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mMatrix:Landroid/graphics/Matrix;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCurrentRect()Landroid/graphics/RectF;
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/TaskViewSimulator;->getCurrentCropRect()Landroid/graphics/RectF;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mMatrixTmp:Landroid/graphics/Matrix;

    .line 6
    .line 7
    iget-object v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mMatrix:Landroid/graphics/Matrix;

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mDp:Lcom/android/launcher3/h0;

    .line 13
    .line 14
    iget-boolean v1, v1, Lcom/android/launcher3/h0;->G0:Z

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mOrientationState:Lcom/android/quickstep/util/RecentsOrientedState;

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/android/quickstep/util/RecentsOrientedState;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    sget-object v2, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->PORTRAIT:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-nez v1, :cond_1

    .line 31
    .line 32
    :cond_0
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mOrientationState:Lcom/android/quickstep/util/RecentsOrientedState;

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/android/quickstep/util/RecentsOrientedState;->getDisplayRotation()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    iget-object v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mDp:Lcom/android/launcher3/h0;

    .line 39
    .line 40
    iget v3, v2, Lcom/android/launcher3/h0;->T0:I

    .line 41
    .line 42
    int-to-float v3, v3

    .line 43
    iget v2, v2, Lcom/android/launcher3/h0;->U0:I

    .line 44
    .line 45
    int-to-float v2, v2

    .line 46
    iget-object v4, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mMatrixTmp:Landroid/graphics/Matrix;

    .line 47
    .line 48
    invoke-static {v1, v3, v2, v4}, Lcom/android/quickstep/util/RecentsOrientedState;->preDisplayRotation(IFFLandroid/graphics/Matrix;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    iget-object p0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mMatrixTmp:Landroid/graphics/Matrix;

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 54
    .line 55
    .line 56
    return-object v0
.end method

.method public getCurrentRectWithCurrentCrop()Landroid/graphics/RectF;
    .locals 5

    .line 1
    new-instance v0, Landroid/graphics/RectF;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTmpCropRect:Landroid/graphics/Rect;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mMatrixTmp:Landroid/graphics/Matrix;

    .line 9
    .line 10
    iget-object v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mMatrix:Landroid/graphics/Matrix;

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mDp:Lcom/android/launcher3/h0;

    .line 16
    .line 17
    iget-boolean v1, v1, Lcom/android/launcher3/h0;->G0:Z

    .line 18
    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mOrientationState:Lcom/android/quickstep/util/RecentsOrientedState;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/android/quickstep/util/RecentsOrientedState;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sget-object v2, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->PORTRAIT:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-nez v1, :cond_1

    .line 34
    .line 35
    :cond_0
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mOrientationState:Lcom/android/quickstep/util/RecentsOrientedState;

    .line 36
    .line 37
    invoke-virtual {v1}, Lcom/android/quickstep/util/RecentsOrientedState;->getDisplayRotation()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    iget-object v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mDp:Lcom/android/launcher3/h0;

    .line 42
    .line 43
    iget v3, v2, Lcom/android/launcher3/h0;->T0:I

    .line 44
    .line 45
    int-to-float v3, v3

    .line 46
    iget v2, v2, Lcom/android/launcher3/h0;->U0:I

    .line 47
    .line 48
    int-to-float v2, v2

    .line 49
    iget-object v4, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mMatrixTmp:Landroid/graphics/Matrix;

    .line 50
    .line 51
    invoke-static {v1, v3, v2, v4}, Lcom/android/quickstep/util/RecentsOrientedState;->preDisplayRotation(IFFLandroid/graphics/Matrix;)V

    .line 52
    .line 53
    .line 54
    :cond_1
    iget-object p0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mMatrixTmp:Landroid/graphics/Matrix;

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 57
    .line 58
    .line 59
    return-object v0
.end method

.method public getFullScreenScale()F
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mDp:Lcom/android/launcher3/h0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/high16 p0, 0x3f800000    # 1.0f

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    new-instance v0, Landroid/graphics/Rect;

    .line 9
    .line 10
    iget-boolean v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mIsAnimatingToCarousel:Z

    .line 11
    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mCarouselTaskSize:Landroid/graphics/Rect;

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mFullTaskSize:Landroid/graphics/Rect;

    .line 18
    .line 19
    :goto_0
    invoke-direct {v0, v1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 20
    .line 21
    .line 22
    iget v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTaskRectTranslationX:I

    .line 23
    .line 24
    iget v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTaskRectTranslationY:I

    .line 25
    .line 26
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Rect;->offset(II)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mOrientationState:Lcom/android/quickstep/util/RecentsOrientedState;

    .line 30
    .line 31
    iget-object v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mDp:Lcom/android/launcher3/h0;

    .line 32
    .line 33
    iget-object v3, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mPivot:Landroid/graphics/PointF;

    .line 34
    .line 35
    invoke-virtual {v1, v0, v2, v3}, Lcom/android/quickstep/util/RecentsOrientedState;->getFullScreenScaleAndPivot(Landroid/graphics/Rect;Lcom/android/launcher3/h0;Landroid/graphics/PointF;)F

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mPivotOverride:Landroid/graphics/PointF;

    .line 40
    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    iget-object p0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mPivot:Landroid/graphics/PointF;

    .line 44
    .line 45
    invoke-virtual {p0, v1}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 46
    .line 47
    .line 48
    :cond_2
    return v0
.end method

.method public final getMOrientationState()Lcom/android/quickstep/util/RecentsOrientedState;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mOrientationState:Lcom/android/quickstep/util/RecentsOrientedState;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getNonDirectApplyMatrixBeforeGestureEnd()Landroid/graphics/Matrix;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->nonDirectApplyMatrixBeforeGestureEnd:Landroid/graphics/Matrix;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOrientationState()Lcom/android/quickstep/util/RecentsOrientedState;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mOrientationState:Lcom/android/quickstep/util/RecentsOrientedState;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStagedSplitBounds()Lcom/android/launcher3/util/y2$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mStagedSplitBounds:Lcom/android/launcher3/util/y2$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public final onBuildTargetParams(Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;)V
    .locals 24

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 10
    const-string v2, "builder"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 11
    iget-boolean v2, v0, Lcom/android/quickstep/util/TaskViewSimulator;->needHideSurface:Z

    if-eqz v2, :cond_0

    const/4 v2, 0x0

    .line 12
    invoke-virtual {v1, v2}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setAlpha(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 13
    :cond_0
    iget-object v2, v0, Lcom/android/quickstep/util/TaskViewSimulator;->windowExpectedFinalMatrix:Landroid/graphics/Matrix;

    if-eqz v2, :cond_6

    .line 14
    iget-object v3, v0, Lcom/android/quickstep/util/TaskViewSimulator;->actualMatrixBeforeGestureEnd:Landroid/graphics/Matrix;

    iget-object v4, v0, Lcom/android/quickstep/util/TaskViewSimulator;->tempFloatArray:[F

    invoke-virtual {v3, v4}, Landroid/graphics/Matrix;->getValues([F)V

    .line 15
    iget-object v3, v0, Lcom/android/quickstep/util/TaskViewSimulator;->tempFloatArray:[F

    const/4 v4, 0x0

    .line 16
    aget v8, v3, v4

    const/4 v5, 0x2

    .line 17
    aget v12, v3, v5

    const/4 v6, 0x5

    .line 18
    aget v16, v3, v6

    .line 19
    iget-object v7, v0, Lcom/android/quickstep/util/TaskViewSimulator;->nonDirectApplyMatrixBeforeGestureEnd:Landroid/graphics/Matrix;

    invoke-virtual {v7, v3}, Landroid/graphics/Matrix;->getValues([F)V

    .line 20
    iget-object v3, v0, Lcom/android/quickstep/util/TaskViewSimulator;->tempFloatArray:[F

    move v7, v6

    .line 21
    aget v6, v3, v4

    .line 22
    aget v11, v3, v5

    .line 23
    aget v15, v3, v7

    .line 24
    invoke-virtual {v2, v3}, Landroid/graphics/Matrix;->getValues([F)V

    .line 25
    iget-object v3, v0, Lcom/android/quickstep/util/TaskViewSimulator;->tempFloatArray:[F

    move v9, v7

    .line 26
    aget v7, v3, v4

    move v13, v11

    .line 27
    aget v11, v3, v5

    move/from16 v17, v15

    .line 28
    aget v15, v3, v9

    .line 29
    iget-object v10, v0, Lcom/android/quickstep/util/TaskViewSimulator;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v10, v3}, Landroid/graphics/Matrix;->getValues([F)V

    .line 30
    iget-object v3, v0, Lcom/android/quickstep/util/TaskViewSimulator;->tempFloatArray:[F

    .line 31
    aget v4, v3, v4

    .line 32
    aget v14, v3, v5

    .line 33
    aget v3, v3, v9

    .line 34
    sget-object v23, LJ0/h;->q:Landroid/view/animation/Interpolator;

    move v9, v7

    move v5, v4

    move-object/from16 v10, v23

    .line 35
    invoke-static/range {v5 .. v10}, Lcom/android/launcher3/N5;->N(FFFFFLandroid/view/animation/Interpolator;)F

    move-result v4

    move v10, v13

    move v13, v11

    move v9, v14

    move-object/from16 v14, v23

    .line 36
    invoke-static/range {v9 .. v14}, Lcom/android/launcher3/N5;->N(FFFFFLandroid/view/animation/Interpolator;)F

    move-result v5

    move/from16 v14, v17

    move/from16 v17, v15

    move v13, v3

    move-object/from16 v18, v23

    .line 37
    invoke-static/range {v13 .. v18}, Lcom/android/launcher3/N5;->N(FFFFFLandroid/view/animation/Interpolator;)F

    move-result v3

    .line 38
    iget-object v6, v0, Lcom/android/quickstep/util/TaskViewSimulator;->adjustedWindowMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v6}, Landroid/graphics/Matrix;->reset()V

    .line 39
    iget-object v6, v0, Lcom/android/quickstep/util/TaskViewSimulator;->adjustedWindowMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v6, v4, v4}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 40
    iget-object v4, v0, Lcom/android/quickstep/util/TaskViewSimulator;->adjustedWindowMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v4, v5, v3}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 41
    iget-object v3, v0, Lcom/android/quickstep/util/TaskViewSimulator;->adjustedWindowClipRect:Landroid/graphics/Rect;

    iget-object v4, v0, Lcom/android/quickstep/util/TaskViewSimulator;->actualClipRectBeforeGestureEnd:Landroid/graphics/Rect;

    invoke-virtual {v3, v4}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 42
    iget-object v3, v0, Lcom/android/quickstep/util/TaskViewSimulator;->actualClipRectBeforeGestureEnd:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    .line 43
    iget-object v4, v0, Lcom/android/quickstep/util/TaskViewSimulator;->mThumbnailPosition:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    if-eq v3, v4, :cond_1

    .line 44
    iget-object v5, v0, Lcom/android/quickstep/util/TaskViewSimulator;->adjustedWindowClipRect:Landroid/graphics/Rect;

    iget v6, v0, Lcom/android/quickstep/util/TaskViewSimulator;->currentProgressWhenApply:F

    iget v7, v0, Lcom/android/quickstep/util/TaskViewSimulator;->currentProgressWhenNonApply:F

    int-to-float v3, v3

    int-to-float v4, v4

    const/high16 v20, 0x3f800000    # 1.0f

    move/from16 v21, v3

    move/from16 v22, v4

    move/from16 v18, v6

    move/from16 v19, v7

    invoke-static/range {v18 .. v23}, Lcom/android/launcher3/N5;->N(FFFFFLandroid/view/animation/Interpolator;)F

    move-result v3

    float-to-int v3, v3

    iput v3, v5, Landroid/graphics/Rect;->bottom:I

    .line 45
    :cond_1
    iget-object v3, v0, Lcom/android/quickstep/util/TaskViewSimulator;->actualClipRectBeforeGestureEnd:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->right:I

    .line 46
    iget-object v4, v0, Lcom/android/quickstep/util/TaskViewSimulator;->mThumbnailPosition:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->right:I

    if-eq v3, v4, :cond_2

    .line 47
    iget-object v5, v0, Lcom/android/quickstep/util/TaskViewSimulator;->adjustedWindowClipRect:Landroid/graphics/Rect;

    iget v6, v0, Lcom/android/quickstep/util/TaskViewSimulator;->currentProgressWhenApply:F

    iget v7, v0, Lcom/android/quickstep/util/TaskViewSimulator;->currentProgressWhenNonApply:F

    int-to-float v3, v3

    int-to-float v4, v4

    const/high16 v20, 0x3f800000    # 1.0f

    move/from16 v21, v3

    move/from16 v22, v4

    move/from16 v18, v6

    move/from16 v19, v7

    invoke-static/range {v18 .. v23}, Lcom/android/launcher3/N5;->N(FFFFFLandroid/view/animation/Interpolator;)F

    move-result v3

    float-to-int v3, v3

    iput v3, v5, Landroid/graphics/Rect;->right:I

    .line 48
    :cond_2
    iget-object v3, v0, Lcom/android/quickstep/util/TaskViewSimulator;->actualClipRectBeforeGestureEnd:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->left:I

    .line 49
    iget-object v4, v0, Lcom/android/quickstep/util/TaskViewSimulator;->mThumbnailPosition:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->left:I

    if-eq v3, v4, :cond_3

    .line 50
    iget-object v5, v0, Lcom/android/quickstep/util/TaskViewSimulator;->adjustedWindowClipRect:Landroid/graphics/Rect;

    iget v6, v0, Lcom/android/quickstep/util/TaskViewSimulator;->currentProgressWhenApply:F

    iget v7, v0, Lcom/android/quickstep/util/TaskViewSimulator;->currentProgressWhenNonApply:F

    int-to-float v3, v3

    int-to-float v4, v4

    const/high16 v20, 0x3f800000    # 1.0f

    move/from16 v21, v3

    move/from16 v22, v4

    move/from16 v18, v6

    move/from16 v19, v7

    invoke-static/range {v18 .. v23}, Lcom/android/launcher3/N5;->N(FFFFFLandroid/view/animation/Interpolator;)F

    move-result v3

    float-to-int v3, v3

    iput v3, v5, Landroid/graphics/Rect;->left:I

    .line 51
    :cond_3
    iget-object v3, v0, Lcom/android/quickstep/util/TaskViewSimulator;->actualClipRectBeforeGestureEnd:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->top:I

    .line 52
    iget-object v4, v0, Lcom/android/quickstep/util/TaskViewSimulator;->mThumbnailPosition:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->top:I

    if-eq v3, v4, :cond_4

    .line 53
    iget-object v5, v0, Lcom/android/quickstep/util/TaskViewSimulator;->adjustedWindowClipRect:Landroid/graphics/Rect;

    iget v6, v0, Lcom/android/quickstep/util/TaskViewSimulator;->currentProgressWhenApply:F

    iget v7, v0, Lcom/android/quickstep/util/TaskViewSimulator;->currentProgressWhenNonApply:F

    int-to-float v3, v3

    int-to-float v4, v4

    const/high16 v20, 0x3f800000    # 1.0f

    move/from16 v21, v3

    move/from16 v22, v4

    move/from16 v18, v6

    move/from16 v19, v7

    invoke-static/range {v18 .. v23}, Lcom/android/launcher3/N5;->N(FFFFFLandroid/view/animation/Interpolator;)F

    move-result v3

    float-to-int v3, v3

    iput v3, v5, Landroid/graphics/Rect;->top:I

    .line 54
    :cond_4
    invoke-static {}, LM3/a;->f()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 55
    const-string v3, "TAG"

    const-string v4, "TaskViewSimulator"

    invoke-static {v4, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 56
    iget-object v3, v0, Lcom/android/quickstep/util/TaskViewSimulator;->actualMatrixBeforeGestureEnd:Landroid/graphics/Matrix;

    .line 57
    iget-object v5, v0, Lcom/android/quickstep/util/TaskViewSimulator;->nonDirectApplyMatrixBeforeGestureEnd:Landroid/graphics/Matrix;

    .line 58
    iget-object v6, v0, Lcom/android/quickstep/util/TaskViewSimulator;->mMatrix:Landroid/graphics/Matrix;

    .line 59
    iget-object v7, v0, Lcom/android/quickstep/util/TaskViewSimulator;->adjustedWindowMatrix:Landroid/graphics/Matrix;

    .line 60
    iget-object v8, v0, Lcom/android/quickstep/util/TaskViewSimulator;->actualClipRectBeforeGestureEnd:Landroid/graphics/Rect;

    .line 61
    iget v9, v0, Lcom/android/quickstep/util/TaskViewSimulator;->currentProgressWhenApply:F

    .line 62
    iget v10, v0, Lcom/android/quickstep/util/TaskViewSimulator;->currentProgressWhenNonApply:F

    .line 63
    iget-object v11, v0, Lcom/android/quickstep/util/TaskViewSimulator;->adjustedWindowClipRect:Landroid/graphics/Rect;

    .line 64
    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "actualMatrixBeforeGestureEnd:"

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 65
    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 66
    const-string v3, "; nonDirectApplyMatrixBeforeGestureEnd:"

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 68
    const-string v3, "; windowExpectedFinalMatrix:"

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 70
    const-string v2, "; mMatrix:"

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 72
    const-string v2, "; adjustMatrix:"

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 74
    const-string v2, "; actualClipRectBeforeGestureEnd:"

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 76
    const-string v2, "; currentProgressWhenApply:"

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 78
    const-string v2, "; currentProgressWhenNonApply:"

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 80
    const-string v2, "; adjustedWindowClipRect:"

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 82
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v2}, LM3/a;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    :cond_5
    iget-object v2, v0, Lcom/android/quickstep/util/TaskViewSimulator;->adjustedWindowMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1, v2}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setMatrix(Landroid/graphics/Matrix;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    move-result-object v1

    iget-object v0, v0, Lcom/android/quickstep/util/TaskViewSimulator;->adjustedWindowClipRect:Landroid/graphics/Rect;

    invoke-virtual {v1, v0}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setWindowCrop(Landroid/graphics/Rect;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    :cond_6
    return-void
.end method

.method public onBuildTargetParams(Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;Landroid/view/RemoteAnimationTarget;Lcom/android/quickstep/util/TransformParams;)V
    .locals 2

    iget-object p3, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mContext:Landroid/content/Context;

    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTmpCropRect:Landroid/graphics/Rect;

    invoke-static {p3, v0, v1}, Lcom/android/quickstep/views/LsNativeStack;->normalizeLiveEntryMatrix(Landroid/content/Context;Landroid/graphics/Matrix;Landroid/graphics/Rect;)V

    .line 1
    iget-object p3, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, p3}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setMatrix(Landroid/graphics/Matrix;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    move-result-object p3

    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTmpCropRect:Landroid/graphics/Rect;

    .line 2
    invoke-virtual {p3, v0}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setWindowCrop(Landroid/graphics/Rect;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    move-result-object p3

    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/util/TaskViewSimulator;->getCurrentCornerRadius()F

    move-result v0

    invoke-virtual {p3, v0}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setCornerRadius(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 4
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/TaskViewSimulator;->onBuildTargetParams(Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;)V

    .line 5
    iget-object p3, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mDrawsBelowRecents:Ljava/lang/Boolean;

    if-eqz p3, :cond_1

    sget-object p3, Lf1/a;->J:Lf1/a$a;

    invoke-virtual {p3}, Lf1/a$a;->c()Z

    move-result p3

    if-eqz p3, :cond_1

    .line 6
    iget-object p3, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mDrawsBelowRecents:Ljava/lang/Boolean;

    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p3

    if-eqz p3, :cond_0

    const p3, -0x7ffffc18

    .line 7
    iget p2, p2, Landroid/view/RemoteAnimationTarget;->prefixOrderIndex:I

    add-int/2addr p2, p3

    iget p0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mDesktopTaskIndex:I

    :goto_0
    sub-int/2addr p2, p0

    goto :goto_1

    :cond_0
    const p3, 0x7ffffc17

    .line 8
    iget p2, p2, Landroid/view/RemoteAnimationTarget;->prefixOrderIndex:I

    add-int/2addr p2, p3

    iget p0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mDesktopTaskIndex:I

    goto :goto_0

    .line 9
    :goto_1
    invoke-virtual {p1, p2}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setLayer(I)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    :cond_1
    return-void
.end method

.method public final setCurrentProgressWhenApply(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->currentProgressWhenApply:F

    .line 2
    .line 3
    return-void
.end method

.method public final setCurrentProgressWhenNonApply(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->currentProgressWhenNonApply:F

    .line 2
    .line 3
    return-void
.end method

.method public setDp(Lcom/android/launcher3/h0;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mDp:Lcom/android/launcher3/h0;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mLayoutValid:Z

    .line 5
    .line 6
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mOrientationState:Lcom/android/quickstep/util/RecentsOrientedState;

    .line 7
    .line 8
    invoke-virtual {v1, p1}, Lcom/android/quickstep/util/RecentsOrientedState;->setDeviceProfile(Lcom/android/launcher3/h0;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lcom/android/launcher3/y0;->x()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    iget-boolean p1, p1, Lcom/android/launcher3/h0;->G0:Z

    .line 18
    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-boolean p1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mIsDesktopTask:Z

    .line 22
    .line 23
    if-nez p1, :cond_0

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    :cond_0
    iget-object v1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mContext:Landroid/content/Context;

    invoke-static {v1, v0}, Lcom/android/quickstep/views/LsNativeStack;->normalizeLiveGridTask(Landroid/content/Context;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mIsGridTask:Z

    .line 27
    .line 28
    :cond_1
    invoke-direct {p0}, Lcom/android/quickstep/util/TaskViewSimulator;->calculateTaskSize()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public setDrawsBelowRecents(Z)V
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mDrawsBelowRecents:Ljava/lang/Boolean;

    .line 6
    .line 7
    return-void
.end method

.method public setIsGridTask(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mIsGridTask:Z

    .line 2
    .line 3
    return-void
.end method

.method public setLayoutRotation(II)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/TaskViewSimulator;->getMOrientationState()Lcom/android/quickstep/util/RecentsOrientedState;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1, p2}, Lcom/android/quickstep/util/RecentsOrientedState;->update(II)Z

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mLayoutValid:Z

    .line 10
    .line 11
    return-void
.end method

.method public setOrientationState(Lcom/android/quickstep/util/RecentsOrientedState;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mOrientationState:Lcom/android/quickstep/util/RecentsOrientedState;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-boolean p1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mLayoutValid:Z

    .line 5
    .line 6
    return-void
.end method

.method public setPivotOverride(Landroid/graphics/PointF;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mPivotOverride:Landroid/graphics/PointF;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/util/TaskViewSimulator;->getFullScreenScale()F

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setPreview(Landroid/view/RemoteAnimationTarget;)V
    .locals 1

    .line 1
    iget-object v0, p1, Landroid/view/RemoteAnimationTarget;->startBounds:Landroid/graphics/Rect;

    if-nez v0, :cond_0

    .line 2
    iget-object v0, p1, Landroid/view/RemoteAnimationTarget;->screenSpaceBounds:Landroid/graphics/Rect;

    :cond_0
    iget-object p1, p1, Landroid/view/RemoteAnimationTarget;->contentInsets:Landroid/graphics/Rect;

    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/android/quickstep/util/TaskViewSimulator;->setPreviewBounds(Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    return-void
.end method

.method public setPreview(Landroid/view/RemoteAnimationTarget;Lcom/android/launcher3/util/y2$a;)V
    .locals 0

    .line 4
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/TaskViewSimulator;->setPreview(Landroid/view/RemoteAnimationTarget;)V

    .line 5
    iput-object p2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mSplitBounds:Lcom/android/launcher3/util/y2$a;

    if-nez p2, :cond_0

    const/4 p1, -0x1

    .line 6
    iput p1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mStagePosition:I

    goto :goto_1

    .line 7
    :cond_0
    iget p1, p1, Landroid/view/RemoteAnimationTarget;->taskId:I

    iget p2, p2, Lcom/android/launcher3/util/y2$a;->k:I

    if-ne p1, p2, :cond_1

    const/4 p1, 0x0

    goto :goto_0

    :cond_1
    const/4 p1, 0x1

    .line 8
    :goto_0
    iput p1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mStagePosition:I

    .line 9
    :goto_1
    invoke-direct {p0}, Lcom/android/quickstep/util/TaskViewSimulator;->calculateTaskSize()V

    return-void
.end method

.method public setPreviewBounds(Landroid/graphics/Rect;Landroid/graphics/Rect;)V
    .locals 5

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    iget v1, p2, Landroid/graphics/Rect;->left:I

    .line 7
    .line 8
    iget v2, p2, Landroid/graphics/Rect;->top:I

    .line 9
    .line 10
    iget v3, p2, Landroid/graphics/Rect;->right:I

    .line 11
    .line 12
    iget v4, p2, Landroid/graphics/Rect;->bottom:I

    .line 13
    .line 14
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Rect;->inset(IIII)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    const/4 v2, 0x0

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    int-to-float v1, v1

    .line 35
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    int-to-float v3, v3

    .line 40
    div-float/2addr v1, v3

    .line 41
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    int-to-float v3, v3

    .line 46
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    int-to-float v0, v0

    .line 51
    div-float/2addr v3, v0

    .line 52
    const v0, 0x3dcccccd    # 0.1f

    .line 53
    .line 54
    .line 55
    invoke-static {v1, v3, v0}, Lcom/android/systemui/shared/recents/utilities/Utilities;->isRelativePercentDifferenceGreaterThan(FFF)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_0

    .line 60
    .line 61
    new-instance v0, Landroid/graphics/Rect;

    .line 62
    .line 63
    iget v1, p2, Landroid/graphics/Rect;->top:I

    .line 64
    .line 65
    iget p2, p2, Landroid/graphics/Rect;->bottom:I

    .line 66
    .line 67
    invoke-direct {v0, v2, v1, v2, p2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 68
    .line 69
    .line 70
    move-object p2, v0

    .line 71
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mThumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 72
    .line 73
    iget-object v0, v0, Lcom/android/systemui/shared/recents/model/ThumbnailData;->insets:Landroid/graphics/Rect;

    .line 74
    .line 75
    invoke-virtual {v0, p2}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 76
    .line 77
    .line 78
    iget-object p2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mThumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 79
    .line 80
    const/4 v0, 0x1

    .line 81
    iput v0, p2, Lcom/android/systemui/shared/recents/model/ThumbnailData;->windowingMode:I

    .line 82
    .line 83
    iget-object p2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mThumbnailPosition:Landroid/graphics/Rect;

    .line 84
    .line 85
    invoke-virtual {p2, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 86
    .line 87
    .line 88
    iput-boolean v2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mLayoutValid:Z

    .line 89
    .line 90
    return-void
.end method

.method public final setRecentsViewSecondaryScale(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->recentsViewSecondaryScale:F

    .line 2
    .line 3
    return-void
.end method

.method public setScroll(F)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mSizeStrategy:Lcom/android/quickstep/BaseContainerInterface;

    .line 2
    .line 3
    iget-boolean v1, v0, Lcom/android/quickstep/BaseContainerInterface;->mFullScreenToWindow:Z

    .line 4
    .line 5
    if-eqz v1, :cond_1

    .line 6
    .line 7
    iget-boolean v0, v0, Lcom/android/quickstep/BaseContainerInterface;->mIfRunningTaskSupportMiniWindow:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    return-void

    .line 13
    :cond_1
    :goto_0
    invoke-static {p1}, Lcom/android/quickstep/views/LsNativeStack;->normalizeLiveEntryScroll(F)F

    move-result p1

    iget-object p0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->recentsViewScroll:Lcom/android/launcher3/anim/d;

    .line 14
    .line 15
    iput p1, p0, Lcom/android/launcher3/anim/d;->d:F

    .line 16
    .line 17
    return-void
.end method

.method public setTaskRectTransform(Landroid/graphics/Matrix;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTaskRectTransform:Landroid/graphics/Matrix;

    .line 2
    .line 3
    return-void
.end method

.method public setTaskRectTranslation(II)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTaskRectTranslationX:I

    .line 2
    .line 3
    iput p2, p0, Lcom/android/quickstep/util/TaskViewSimulator;->mTaskRectTranslationY:I

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/quickstep/util/TaskViewSimulator;->calculateTaskSize()V

    .line 6
    .line 7
    .line 8
    return-void
.end method
