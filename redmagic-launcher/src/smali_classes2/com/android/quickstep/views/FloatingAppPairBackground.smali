.class public Lcom/android/quickstep/views/FloatingAppPairBackground;
.super Landroid/graphics/drawable/Drawable;
.source "FloatingAppPairBackground.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/views/FloatingAppPairBackground$Companion;
    }
.end annotation


# static fields
.field private static final ARRAY_OF_ZEROES:[F

.field public static final Companion:Lcom/android/quickstep/views/FloatingAppPairBackground$Companion;

.field private static final EMPTY_RECT:Landroid/graphics/RectF;

.field private static final ENDING_ICON_SIZE_PX:I

.field private static final STARTING_ICON_SIZE_PX:I


# instance fields
.field private final appIcon1:Landroid/graphics/drawable/Drawable;

.field private final appIcon2:Landroid/graphics/drawable/Drawable;

.field private final backgroundPaint:Landroid/graphics/Paint;

.field private final cellSplitInterpolator:Landroid/view/animation/Interpolator;

.field private final container:Lcom/android/quickstep/views/RecentsViewContainer;

.field private final desiredSplitRatio:F

.field private final deviceCornerRadius:F

.field private final deviceHalfDividerSize:F

.field private final dividerPaint:Landroid/graphics/Paint;

.field private final expandXInterpolator:Landroid/view/animation/Interpolator;

.field private final expandYInterpolator:Landroid/view/animation/Interpolator;

.field private final floatingView:Lcom/android/quickstep/views/FloatingAppPairView;

.field private final iconFadeInterpolator:Landroid/view/animation/Interpolator;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/views/FloatingAppPairBackground$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/views/FloatingAppPairBackground$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->Companion:Lcom/android/quickstep/views/FloatingAppPairBackground$Companion;

    .line 8
    .line 9
    const/high16 v0, 0x41b00000    # 22.0f

    .line 10
    .line 11
    invoke-static {v0}, Lcom/android/launcher3/N5;->i(F)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    sput v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->STARTING_ICON_SIZE_PX:I

    .line 16
    .line 17
    const/high16 v0, 0x42840000    # 66.0f

    .line 18
    .line 19
    invoke-static {v0}, Lcom/android/launcher3/N5;->i(F)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    sput v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->ENDING_ICON_SIZE_PX:I

    .line 24
    .line 25
    new-instance v0, Landroid/graphics/RectF;

    .line 26
    .line 27
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 28
    .line 29
    .line 30
    sput-object v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->EMPTY_RECT:Landroid/graphics/RectF;

    .line 31
    .line 32
    const/16 v0, 0x8

    .line 33
    .line 34
    new-array v0, v0, [F

    .line 35
    .line 36
    sput-object v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->ARRAY_OF_ZEROES:[F

    .line 37
    .line 38
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/quickstep/views/FloatingAppPairView;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;I)V
    .locals 4

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "floatingView"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "appIcon1"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p2, p0, Lcom/android/quickstep/views/FloatingAppPairBackground;->floatingView:Lcom/android/quickstep/views/FloatingAppPairView;

    .line 20
    .line 21
    iput-object p3, p0, Lcom/android/quickstep/views/FloatingAppPairBackground;->appIcon1:Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    iput-object p4, p0, Lcom/android/quickstep/views/FloatingAppPairBackground;->appIcon2:Landroid/graphics/drawable/Drawable;

    .line 24
    .line 25
    new-instance p2, Landroid/graphics/Paint;

    .line 26
    .line 27
    const/4 p3, 0x1

    .line 28
    invoke-direct {p2, p3}, Landroid/graphics/Paint;-><init>(I)V

    .line 29
    .line 30
    .line 31
    iput-object p2, p0, Lcom/android/quickstep/views/FloatingAppPairBackground;->backgroundPaint:Landroid/graphics/Paint;

    .line 32
    .line 33
    new-instance p4, Landroid/graphics/Paint;

    .line 34
    .line 35
    invoke-direct {p4, p3}, Landroid/graphics/Paint;-><init>(I)V

    .line 36
    .line 37
    .line 38
    iput-object p4, p0, Lcom/android/quickstep/views/FloatingAppPairBackground;->dividerPaint:Landroid/graphics/Paint;

    .line 39
    .line 40
    invoke-static {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->containerFromContext(Landroid/content/Context;)Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 45
    .line 46
    iput-object v0, p0, Lcom/android/quickstep/views/FloatingAppPairBackground;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 47
    .line 48
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    sget-object v3, Lcom/android/launcher3/x5;->F0:[I

    .line 57
    .line 58
    invoke-virtual {v2, v3}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    const-string v3, "obtainStyledAttributes(...)"

    .line 63
    .line 64
    invoke-static {v2, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 68
    .line 69
    invoke-virtual {p2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 70
    .line 71
    .line 72
    const/4 v3, 0x0

    .line 73
    invoke-virtual {v2, p3, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 74
    .line 75
    .line 76
    move-result p3

    .line 77
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setColor(I)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    .line 81
    .line 82
    .line 83
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    iget-boolean p2, p2, Lcom/android/launcher3/h0;->G0:Z

    .line 88
    .line 89
    invoke-static {p2}, Lcom/android/quickstep/util/AnimUtils;->getDeviceAppPairLaunchTimings(Z)Lcom/android/quickstep/util/SplitAnimationTimings;

    .line 90
    .line 91
    .line 92
    move-result-object p2

    .line 93
    invoke-interface {p2}, Lcom/android/quickstep/util/SplitAnimationTimings;->getStagedRectScaleXInterpolator()Landroid/view/animation/Interpolator;

    .line 94
    .line 95
    .line 96
    move-result-object p3

    .line 97
    invoke-interface {p2}, Lcom/android/quickstep/util/SplitAnimationTimings;->getStagedRectSlideStartOffset()F

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    invoke-interface {p2}, Lcom/android/quickstep/util/SplitAnimationTimings;->getStagedRectSlideEndOffset()F

    .line 102
    .line 103
    .line 104
    move-result v2

    .line 105
    invoke-static {p3, v0, v2}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 106
    .line 107
    .line 108
    move-result-object p3

    .line 109
    iput-object p3, p0, Lcom/android/quickstep/views/FloatingAppPairBackground;->expandXInterpolator:Landroid/view/animation/Interpolator;

    .line 110
    .line 111
    invoke-interface {p2}, Lcom/android/quickstep/util/SplitAnimationTimings;->getStagedRectScaleYInterpolator()Landroid/view/animation/Interpolator;

    .line 112
    .line 113
    .line 114
    move-result-object p3

    .line 115
    invoke-interface {p2}, Lcom/android/quickstep/util/SplitAnimationTimings;->getStagedRectSlideStartOffset()F

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    invoke-interface {p2}, Lcom/android/quickstep/util/SplitAnimationTimings;->getStagedRectSlideEndOffset()F

    .line 120
    .line 121
    .line 122
    move-result v2

    .line 123
    invoke-static {p3, v0, v2}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 124
    .line 125
    .line 126
    move-result-object p3

    .line 127
    iput-object p3, p0, Lcom/android/quickstep/views/FloatingAppPairBackground;->expandYInterpolator:Landroid/view/animation/Interpolator;

    .line 128
    .line 129
    invoke-interface {p2}, Lcom/android/quickstep/util/SplitAnimationTimings;->getCellSplitInterpolator()Landroid/view/animation/Interpolator;

    .line 130
    .line 131
    .line 132
    move-result-object p3

    .line 133
    invoke-interface {p2}, Lcom/android/quickstep/util/SplitAnimationTimings;->getCellSplitStartOffset()F

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    invoke-interface {p2}, Lcom/android/quickstep/util/SplitAnimationTimings;->getCellSplitEndOffset()F

    .line 138
    .line 139
    .line 140
    move-result v2

    .line 141
    invoke-static {p3, v0, v2}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 142
    .line 143
    .line 144
    move-result-object p3

    .line 145
    iput-object p3, p0, Lcom/android/quickstep/views/FloatingAppPairBackground;->cellSplitInterpolator:Landroid/view/animation/Interpolator;

    .line 146
    .line 147
    invoke-interface {p2}, Lcom/android/quickstep/util/SplitAnimationTimings;->getIconFadeInterpolator()Landroid/view/animation/Interpolator;

    .line 148
    .line 149
    .line 150
    move-result-object p3

    .line 151
    invoke-interface {p2}, Lcom/android/quickstep/util/SplitAnimationTimings;->getIconFadeStartOffset()F

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    invoke-interface {p2}, Lcom/android/quickstep/util/SplitAnimationTimings;->getIconFadeEndOffset()F

    .line 156
    .line 157
    .line 158
    move-result p2

    .line 159
    invoke-static {p3, v0, p2}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 160
    .line 161
    .line 162
    move-result-object p2

    .line 163
    iput-object p2, p0, Lcom/android/quickstep/views/FloatingAppPairBackground;->iconFadeInterpolator:Landroid/view/animation/Interpolator;

    .line 164
    .line 165
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 166
    .line 167
    .line 168
    move-result-object p2

    .line 169
    invoke-static {p1}, Lcom/android/systemui/shared/system/QuickStepContract;->getWindowCornerRadius(Landroid/content/Context;)F

    .line 170
    .line 171
    .line 172
    move-result p1

    .line 173
    iput p1, p0, Lcom/android/quickstep/views/FloatingAppPairBackground;->deviceCornerRadius:F

    .line 174
    .line 175
    const p1, 0x7f070922

    .line 176
    .line 177
    .line 178
    invoke-virtual {p2, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 179
    .line 180
    .line 181
    move-result p1

    .line 182
    int-to-float p1, p1

    .line 183
    const/high16 p3, 0x40000000    # 2.0f

    .line 184
    .line 185
    div-float/2addr p1, p3

    .line 186
    iput p1, p0, Lcom/android/quickstep/views/FloatingAppPairBackground;->deviceHalfDividerSize:F

    .line 187
    .line 188
    int-to-float p3, p5

    .line 189
    add-float/2addr p3, p1

    .line 190
    iget-boolean p1, v1, Lcom/android/launcher3/h0;->Q0:Z

    .line 191
    .line 192
    if-eqz p1, :cond_0

    .line 193
    .line 194
    iget p1, v1, Lcom/android/launcher3/h0;->T0:I

    .line 195
    .line 196
    :goto_0
    int-to-float p1, p1

    .line 197
    div-float/2addr p3, p1

    .line 198
    goto :goto_1

    .line 199
    :cond_0
    iget p1, v1, Lcom/android/launcher3/h0;->U0:I

    .line 200
    .line 201
    goto :goto_0

    .line 202
    :goto_1
    iput p3, p0, Lcom/android/quickstep/views/FloatingAppPairBackground;->desiredSplitRatio:F

    .line 203
    .line 204
    const p0, 0x7f0607e3

    .line 205
    .line 206
    .line 207
    const/4 p1, 0x0

    .line 208
    invoke-virtual {p2, p0, p1}, Landroid/content/res/Resources;->getColor(ILandroid/content/res/Resources$Theme;)I

    .line 209
    .line 210
    .line 211
    move-result p0

    .line 212
    invoke-virtual {p4, p0}, Landroid/graphics/Paint;->setColor(I)V

    .line 213
    .line 214
    .line 215
    return-void
.end method

.method public static final synthetic access$getENDING_ICON_SIZE_PX$cp()I
    .locals 1

    .line 1
    sget v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->ENDING_ICON_SIZE_PX:I

    .line 2
    .line 3
    return v0
.end method

.method public static final synthetic access$getSTARTING_ICON_SIZE_PX$cp()I
    .locals 1

    .line 1
    sget v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->STARTING_ICON_SIZE_PX:I

    .line 2
    .line 3
    return v0
.end method

.method private final drawLeftRightSplit(Landroid/graphics/Canvas;)V
    .locals 24

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->floatingView:Lcom/android/quickstep/views/FloatingAppPairView;

    .line 6
    .line 7
    invoke-virtual {v2}, Lcom/android/quickstep/views/FloatingAppPairView;->getProgress()F

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    iget-object v3, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->floatingView:Lcom/android/quickstep/views/FloatingAppPairView;

    .line 12
    .line 13
    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getScaleX()F

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    iget-object v4, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->floatingView:Lcom/android/quickstep/views/FloatingAppPairView;

    .line 18
    .line 19
    invoke-virtual {v4}, Landroid/widget/FrameLayout;->getScaleY()F

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    .line 28
    .line 29
    .line 30
    move-result v5

    .line 31
    int-to-float v5, v5

    .line 32
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 33
    .line 34
    .line 35
    move-result-object v6

    .line 36
    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    .line 37
    .line 38
    .line 39
    move-result v6

    .line 40
    int-to-float v6, v6

    .line 41
    iget v7, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->deviceCornerRadius:F

    .line 42
    .line 43
    div-float v8, v7, v3

    .line 44
    .line 45
    div-float/2addr v7, v4

    .line 46
    iget v9, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->deviceHalfDividerSize:F

    .line 47
    .line 48
    div-float/2addr v9, v3

    .line 49
    const/high16 v10, 0x3f800000    # 1.0f

    .line 50
    .line 51
    div-float/2addr v10, v3

    .line 52
    iget-object v11, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->cellSplitInterpolator:Landroid/view/animation/Interpolator;

    .line 53
    .line 54
    invoke-interface {v11, v2}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 55
    .line 56
    .line 57
    move-result v11

    .line 58
    mul-float/2addr v11, v9

    .line 59
    sub-float/2addr v11, v10

    .line 60
    iget-object v10, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->cellSplitInterpolator:Landroid/view/animation/Interpolator;

    .line 61
    .line 62
    invoke-interface {v10, v2}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 63
    .line 64
    .line 65
    move-result v10

    .line 66
    mul-float/2addr v10, v8

    .line 67
    iget-object v12, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->cellSplitInterpolator:Landroid/view/animation/Interpolator;

    .line 68
    .line 69
    invoke-interface {v12, v2}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 70
    .line 71
    .line 72
    move-result v12

    .line 73
    mul-float/2addr v12, v7

    .line 74
    iget v13, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->desiredSplitRatio:F

    .line 75
    .line 76
    mul-float/2addr v13, v5

    .line 77
    new-instance v14, Landroid/graphics/RectF;

    .line 78
    .line 79
    sub-float v15, v13, v11

    .line 80
    .line 81
    move/from16 v16, v3

    .line 82
    .line 83
    const/4 v3, 0x0

    .line 84
    invoke-direct {v14, v3, v3, v15, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 85
    .line 86
    .line 87
    new-instance v15, Landroid/graphics/RectF;

    .line 88
    .line 89
    add-float/2addr v13, v11

    .line 90
    invoke-direct {v15, v13, v3, v5, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 91
    .line 92
    .line 93
    new-instance v11, Landroid/graphics/RectF;

    .line 94
    .line 95
    iget v13, v14, Landroid/graphics/RectF;->right:F

    .line 96
    .line 97
    iget v3, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->deviceHalfDividerSize:F

    .line 98
    .line 99
    sub-float/2addr v13, v3

    .line 100
    move/from16 v18, v3

    .line 101
    .line 102
    iget v3, v15, Landroid/graphics/RectF;->left:F

    .line 103
    .line 104
    add-float v3, v3, v18

    .line 105
    .line 106
    move/from16 v18, v4

    .line 107
    .line 108
    const/4 v4, 0x0

    .line 109
    invoke-direct {v11, v13, v4, v3, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 110
    .line 111
    .line 112
    iget-object v3, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->dividerPaint:Landroid/graphics/Paint;

    .line 113
    .line 114
    invoke-virtual {v1, v11, v3}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 115
    .line 116
    .line 117
    const/16 v3, 0x8

    .line 118
    .line 119
    new-array v4, v3, [F

    .line 120
    .line 121
    const/4 v11, 0x0

    .line 122
    aput v8, v4, v11

    .line 123
    .line 124
    const/4 v13, 0x1

    .line 125
    aput v7, v4, v13

    .line 126
    .line 127
    const/16 v17, 0x2

    .line 128
    .line 129
    aput v10, v4, v17

    .line 130
    .line 131
    const/16 v19, 0x3

    .line 132
    .line 133
    aput v12, v4, v19

    .line 134
    .line 135
    const/16 v20, 0x4

    .line 136
    .line 137
    aput v10, v4, v20

    .line 138
    .line 139
    const/16 v21, 0x5

    .line 140
    .line 141
    aput v12, v4, v21

    .line 142
    .line 143
    const/16 v22, 0x6

    .line 144
    .line 145
    aput v8, v4, v22

    .line 146
    .line 147
    const/16 v23, 0x7

    .line 148
    .line 149
    aput v7, v4, v23

    .line 150
    .line 151
    invoke-virtual {v0, v1, v14, v4}, Lcom/android/quickstep/views/FloatingAppPairBackground;->drawCustomRoundedRect(Landroid/graphics/Canvas;Landroid/graphics/RectF;[F)V

    .line 152
    .line 153
    .line 154
    new-array v3, v3, [F

    .line 155
    .line 156
    aput v10, v3, v11

    .line 157
    .line 158
    aput v12, v3, v13

    .line 159
    .line 160
    aput v8, v3, v17

    .line 161
    .line 162
    aput v7, v3, v19

    .line 163
    .line 164
    aput v8, v3, v20

    .line 165
    .line 166
    aput v7, v3, v21

    .line 167
    .line 168
    aput v10, v3, v22

    .line 169
    .line 170
    aput v12, v3, v23

    .line 171
    .line 172
    invoke-virtual {v0, v1, v15, v3}, Lcom/android/quickstep/views/FloatingAppPairBackground;->drawCustomRoundedRect(Landroid/graphics/Canvas;Landroid/graphics/RectF;[F)V

    .line 173
    .line 174
    .line 175
    sget v3, Lcom/android/quickstep/views/FloatingAppPairBackground;->STARTING_ICON_SIZE_PX:I

    .line 176
    .line 177
    int-to-float v4, v3

    .line 178
    sget v7, Lcom/android/quickstep/views/FloatingAppPairBackground;->ENDING_ICON_SIZE_PX:I

    .line 179
    .line 180
    sub-int v8, v7, v3

    .line 181
    .line 182
    int-to-float v8, v8

    .line 183
    iget-object v10, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->expandXInterpolator:Landroid/view/animation/Interpolator;

    .line 184
    .line 185
    invoke-interface {v10, v2}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 186
    .line 187
    .line 188
    move-result v10

    .line 189
    mul-float/2addr v8, v10

    .line 190
    add-float/2addr v4, v8

    .line 191
    div-float v4, v4, v16

    .line 192
    .line 193
    int-to-float v8, v3

    .line 194
    sub-int/2addr v7, v3

    .line 195
    int-to-float v3, v7

    .line 196
    iget-object v7, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->expandYInterpolator:Landroid/view/animation/Interpolator;

    .line 197
    .line 198
    invoke-interface {v7, v2}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 199
    .line 200
    .line 201
    move-result v7

    .line 202
    mul-float/2addr v3, v7

    .line 203
    add-float/2addr v8, v3

    .line 204
    div-float v8, v8, v18

    .line 205
    .line 206
    const/high16 v3, 0x40000000    # 2.0f

    .line 207
    .line 208
    div-float v7, v5, v3

    .line 209
    .line 210
    sub-float/2addr v7, v9

    .line 211
    div-float/2addr v7, v3

    .line 212
    div-float v9, v4, v3

    .line 213
    .line 214
    sub-float v10, v7, v9

    .line 215
    .line 216
    sub-float/2addr v5, v7

    .line 217
    sub-float/2addr v5, v9

    .line 218
    div-float/2addr v6, v3

    .line 219
    div-float v3, v8, v3

    .line 220
    .line 221
    sub-float/2addr v6, v3

    .line 222
    iget-object v3, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->appIcon1:Landroid/graphics/drawable/Drawable;

    .line 223
    .line 224
    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 225
    .line 226
    .line 227
    move-result-object v3

    .line 228
    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    .line 229
    .line 230
    .line 231
    move-result v3

    .line 232
    int-to-float v3, v3

    .line 233
    div-float/2addr v4, v3

    .line 234
    iget-object v3, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->appIcon1:Landroid/graphics/drawable/Drawable;

    .line 235
    .line 236
    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 237
    .line 238
    .line 239
    move-result-object v3

    .line 240
    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    .line 241
    .line 242
    .line 243
    move-result v3

    .line 244
    int-to-float v3, v3

    .line 245
    div-float/2addr v8, v3

    .line 246
    const/16 v3, 0xff

    .line 247
    .line 248
    int-to-float v3, v3

    .line 249
    iget-object v7, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->iconFadeInterpolator:Landroid/view/animation/Interpolator;

    .line 250
    .line 251
    invoke-interface {v7, v2}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 252
    .line 253
    .line 254
    move-result v2

    .line 255
    mul-float/2addr v2, v3

    .line 256
    sub-float/2addr v3, v2

    .line 257
    float-to-int v2, v3

    .line 258
    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    .line 259
    .line 260
    .line 261
    invoke-virtual {v1, v10, v6}, Landroid/graphics/Canvas;->translate(FF)V

    .line 262
    .line 263
    .line 264
    invoke-virtual {v1, v4, v8}, Landroid/graphics/Canvas;->scale(FF)V

    .line 265
    .line 266
    .line 267
    iget-object v3, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->appIcon1:Landroid/graphics/drawable/Drawable;

    .line 268
    .line 269
    invoke-virtual {v3, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 270
    .line 271
    .line 272
    iget-object v3, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->appIcon1:Landroid/graphics/drawable/Drawable;

    .line 273
    .line 274
    invoke-virtual {v3, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 275
    .line 276
    .line 277
    invoke-virtual {v1}, Landroid/graphics/Canvas;->restore()V

    .line 278
    .line 279
    .line 280
    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    .line 281
    .line 282
    .line 283
    invoke-virtual {v1, v5, v6}, Landroid/graphics/Canvas;->translate(FF)V

    .line 284
    .line 285
    .line 286
    invoke-virtual {v1, v4, v8}, Landroid/graphics/Canvas;->scale(FF)V

    .line 287
    .line 288
    .line 289
    iget-object v3, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->appIcon2:Landroid/graphics/drawable/Drawable;

    .line 290
    .line 291
    invoke-static {v3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 292
    .line 293
    .line 294
    invoke-virtual {v3, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 295
    .line 296
    .line 297
    iget-object v0, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->appIcon2:Landroid/graphics/drawable/Drawable;

    .line 298
    .line 299
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 300
    .line 301
    .line 302
    invoke-virtual {v1}, Landroid/graphics/Canvas;->restore()V

    .line 303
    .line 304
    .line 305
    return-void
.end method

.method private final drawTopBottomSplit(Landroid/graphics/Canvas;)V
    .locals 24

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->floatingView:Lcom/android/quickstep/views/FloatingAppPairView;

    .line 6
    .line 7
    invoke-virtual {v2}, Lcom/android/quickstep/views/FloatingAppPairView;->getProgress()F

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    iget-object v3, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->floatingView:Lcom/android/quickstep/views/FloatingAppPairView;

    .line 12
    .line 13
    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getScaleX()F

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    iget-object v4, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->floatingView:Lcom/android/quickstep/views/FloatingAppPairView;

    .line 18
    .line 19
    invoke-virtual {v4}, Landroid/widget/FrameLayout;->getScaleY()F

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    .line 28
    .line 29
    .line 30
    move-result v5

    .line 31
    int-to-float v5, v5

    .line 32
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 33
    .line 34
    .line 35
    move-result-object v6

    .line 36
    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    .line 37
    .line 38
    .line 39
    move-result v6

    .line 40
    int-to-float v6, v6

    .line 41
    iget v7, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->deviceCornerRadius:F

    .line 42
    .line 43
    div-float v8, v7, v3

    .line 44
    .line 45
    div-float/2addr v7, v4

    .line 46
    iget v9, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->deviceHalfDividerSize:F

    .line 47
    .line 48
    div-float/2addr v9, v4

    .line 49
    const/high16 v10, 0x3f800000    # 1.0f

    .line 50
    .line 51
    div-float/2addr v10, v4

    .line 52
    iget-object v11, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->cellSplitInterpolator:Landroid/view/animation/Interpolator;

    .line 53
    .line 54
    invoke-interface {v11, v2}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 55
    .line 56
    .line 57
    move-result v11

    .line 58
    mul-float/2addr v11, v9

    .line 59
    sub-float/2addr v11, v10

    .line 60
    iget-object v10, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->cellSplitInterpolator:Landroid/view/animation/Interpolator;

    .line 61
    .line 62
    invoke-interface {v10, v2}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 63
    .line 64
    .line 65
    move-result v10

    .line 66
    mul-float/2addr v10, v8

    .line 67
    iget-object v12, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->cellSplitInterpolator:Landroid/view/animation/Interpolator;

    .line 68
    .line 69
    invoke-interface {v12, v2}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 70
    .line 71
    .line 72
    move-result v12

    .line 73
    mul-float/2addr v12, v7

    .line 74
    iget v13, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->desiredSplitRatio:F

    .line 75
    .line 76
    mul-float/2addr v13, v6

    .line 77
    new-instance v14, Landroid/graphics/RectF;

    .line 78
    .line 79
    sub-float v15, v13, v11

    .line 80
    .line 81
    move/from16 v16, v3

    .line 82
    .line 83
    const/4 v3, 0x0

    .line 84
    invoke-direct {v14, v3, v3, v5, v15}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 85
    .line 86
    .line 87
    new-instance v15, Landroid/graphics/RectF;

    .line 88
    .line 89
    add-float/2addr v13, v11

    .line 90
    invoke-direct {v15, v3, v13, v5, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 91
    .line 92
    .line 93
    new-instance v11, Landroid/graphics/RectF;

    .line 94
    .line 95
    iget v13, v14, Landroid/graphics/RectF;->bottom:F

    .line 96
    .line 97
    iget v3, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->deviceHalfDividerSize:F

    .line 98
    .line 99
    sub-float/2addr v13, v3

    .line 100
    move/from16 v18, v3

    .line 101
    .line 102
    iget v3, v15, Landroid/graphics/RectF;->top:F

    .line 103
    .line 104
    add-float v3, v3, v18

    .line 105
    .line 106
    move/from16 v18, v4

    .line 107
    .line 108
    const/4 v4, 0x0

    .line 109
    invoke-direct {v11, v4, v13, v5, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 110
    .line 111
    .line 112
    iget-object v3, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->dividerPaint:Landroid/graphics/Paint;

    .line 113
    .line 114
    invoke-virtual {v1, v11, v3}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 115
    .line 116
    .line 117
    const/16 v3, 0x8

    .line 118
    .line 119
    new-array v4, v3, [F

    .line 120
    .line 121
    const/4 v11, 0x0

    .line 122
    aput v8, v4, v11

    .line 123
    .line 124
    const/4 v13, 0x1

    .line 125
    aput v7, v4, v13

    .line 126
    .line 127
    const/16 v17, 0x2

    .line 128
    .line 129
    aput v8, v4, v17

    .line 130
    .line 131
    const/16 v19, 0x3

    .line 132
    .line 133
    aput v7, v4, v19

    .line 134
    .line 135
    const/16 v20, 0x4

    .line 136
    .line 137
    aput v10, v4, v20

    .line 138
    .line 139
    const/16 v21, 0x5

    .line 140
    .line 141
    aput v12, v4, v21

    .line 142
    .line 143
    const/16 v22, 0x6

    .line 144
    .line 145
    aput v10, v4, v22

    .line 146
    .line 147
    const/16 v23, 0x7

    .line 148
    .line 149
    aput v12, v4, v23

    .line 150
    .line 151
    invoke-virtual {v0, v1, v14, v4}, Lcom/android/quickstep/views/FloatingAppPairBackground;->drawCustomRoundedRect(Landroid/graphics/Canvas;Landroid/graphics/RectF;[F)V

    .line 152
    .line 153
    .line 154
    new-array v3, v3, [F

    .line 155
    .line 156
    aput v10, v3, v11

    .line 157
    .line 158
    aput v12, v3, v13

    .line 159
    .line 160
    aput v10, v3, v17

    .line 161
    .line 162
    aput v12, v3, v19

    .line 163
    .line 164
    aput v8, v3, v20

    .line 165
    .line 166
    aput v7, v3, v21

    .line 167
    .line 168
    aput v8, v3, v22

    .line 169
    .line 170
    aput v7, v3, v23

    .line 171
    .line 172
    invoke-virtual {v0, v1, v15, v3}, Lcom/android/quickstep/views/FloatingAppPairBackground;->drawCustomRoundedRect(Landroid/graphics/Canvas;Landroid/graphics/RectF;[F)V

    .line 173
    .line 174
    .line 175
    sget v3, Lcom/android/quickstep/views/FloatingAppPairBackground;->STARTING_ICON_SIZE_PX:I

    .line 176
    .line 177
    int-to-float v4, v3

    .line 178
    sget v7, Lcom/android/quickstep/views/FloatingAppPairBackground;->ENDING_ICON_SIZE_PX:I

    .line 179
    .line 180
    sub-int v8, v7, v3

    .line 181
    .line 182
    int-to-float v8, v8

    .line 183
    iget-object v10, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->expandXInterpolator:Landroid/view/animation/Interpolator;

    .line 184
    .line 185
    invoke-interface {v10, v2}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 186
    .line 187
    .line 188
    move-result v10

    .line 189
    mul-float/2addr v8, v10

    .line 190
    add-float/2addr v4, v8

    .line 191
    div-float v4, v4, v16

    .line 192
    .line 193
    int-to-float v8, v3

    .line 194
    sub-int/2addr v7, v3

    .line 195
    int-to-float v3, v7

    .line 196
    iget-object v7, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->expandYInterpolator:Landroid/view/animation/Interpolator;

    .line 197
    .line 198
    invoke-interface {v7, v2}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 199
    .line 200
    .line 201
    move-result v7

    .line 202
    mul-float/2addr v3, v7

    .line 203
    add-float/2addr v8, v3

    .line 204
    div-float v8, v8, v18

    .line 205
    .line 206
    const/high16 v3, 0x40000000    # 2.0f

    .line 207
    .line 208
    div-float/2addr v5, v3

    .line 209
    div-float v7, v4, v3

    .line 210
    .line 211
    sub-float/2addr v5, v7

    .line 212
    div-float v7, v6, v3

    .line 213
    .line 214
    sub-float/2addr v7, v9

    .line 215
    div-float/2addr v7, v3

    .line 216
    div-float v3, v8, v3

    .line 217
    .line 218
    sub-float v9, v7, v3

    .line 219
    .line 220
    sub-float/2addr v6, v7

    .line 221
    sub-float/2addr v6, v3

    .line 222
    iget-object v3, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->appIcon1:Landroid/graphics/drawable/Drawable;

    .line 223
    .line 224
    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 225
    .line 226
    .line 227
    move-result-object v3

    .line 228
    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    .line 229
    .line 230
    .line 231
    move-result v3

    .line 232
    int-to-float v3, v3

    .line 233
    div-float/2addr v4, v3

    .line 234
    iget-object v3, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->appIcon1:Landroid/graphics/drawable/Drawable;

    .line 235
    .line 236
    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 237
    .line 238
    .line 239
    move-result-object v3

    .line 240
    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    .line 241
    .line 242
    .line 243
    move-result v3

    .line 244
    int-to-float v3, v3

    .line 245
    div-float/2addr v8, v3

    .line 246
    const/16 v3, 0xff

    .line 247
    .line 248
    int-to-float v3, v3

    .line 249
    iget-object v7, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->iconFadeInterpolator:Landroid/view/animation/Interpolator;

    .line 250
    .line 251
    invoke-interface {v7, v2}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 252
    .line 253
    .line 254
    move-result v2

    .line 255
    mul-float/2addr v2, v3

    .line 256
    sub-float/2addr v3, v2

    .line 257
    float-to-int v2, v3

    .line 258
    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    .line 259
    .line 260
    .line 261
    invoke-virtual {v1, v5, v9}, Landroid/graphics/Canvas;->translate(FF)V

    .line 262
    .line 263
    .line 264
    invoke-virtual {v1, v4, v8}, Landroid/graphics/Canvas;->scale(FF)V

    .line 265
    .line 266
    .line 267
    iget-object v3, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->appIcon1:Landroid/graphics/drawable/Drawable;

    .line 268
    .line 269
    invoke-virtual {v3, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 270
    .line 271
    .line 272
    iget-object v3, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->appIcon1:Landroid/graphics/drawable/Drawable;

    .line 273
    .line 274
    invoke-virtual {v3, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 275
    .line 276
    .line 277
    invoke-virtual {v1}, Landroid/graphics/Canvas;->restore()V

    .line 278
    .line 279
    .line 280
    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    .line 281
    .line 282
    .line 283
    invoke-virtual {v1, v5, v6}, Landroid/graphics/Canvas;->translate(FF)V

    .line 284
    .line 285
    .line 286
    invoke-virtual {v1, v4, v8}, Landroid/graphics/Canvas;->scale(FF)V

    .line 287
    .line 288
    .line 289
    iget-object v3, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->appIcon2:Landroid/graphics/drawable/Drawable;

    .line 290
    .line 291
    invoke-static {v3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 292
    .line 293
    .line 294
    invoke-virtual {v3, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 295
    .line 296
    .line 297
    iget-object v0, v0, Lcom/android/quickstep/views/FloatingAppPairBackground;->appIcon2:Landroid/graphics/drawable/Drawable;

    .line 298
    .line 299
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 300
    .line 301
    .line 302
    invoke-virtual {v1}, Landroid/graphics/Canvas;->restore()V

    .line 303
    .line 304
    .line 305
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    const-string v0, "canvas"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingAppPairBackground;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 7
    .line 8
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->Q0:Z

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/FloatingAppPairBackground;->drawLeftRightSplit(Landroid/graphics/Canvas;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/FloatingAppPairBackground;->drawTopBottomSplit(Landroid/graphics/Canvas;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method protected final drawCustomRoundedRect(Landroid/graphics/Canvas;Landroid/graphics/RectF;[F)V
    .locals 7

    .line 1
    const-string v0, "c"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "rect"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "radii"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    sget-object v4, Lcom/android/quickstep/views/FloatingAppPairBackground;->EMPTY_RECT:Landroid/graphics/RectF;

    .line 17
    .line 18
    sget-object v5, Lcom/android/quickstep/views/FloatingAppPairBackground;->ARRAY_OF_ZEROES:[F

    .line 19
    .line 20
    iget-object v6, p0, Lcom/android/quickstep/views/FloatingAppPairBackground;->backgroundPaint:Landroid/graphics/Paint;

    .line 21
    .line 22
    move-object v1, p1

    .line 23
    move-object v2, p2

    .line 24
    move-object v3, p3

    .line 25
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawDoubleRoundRect(Landroid/graphics/RectF;[FLandroid/graphics/RectF;[FLandroid/graphics/Paint;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method protected final getDeviceCornerRadius()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/FloatingAppPairBackground;->deviceCornerRadius:F

    .line 2
    .line 3
    return p0
.end method

.method protected final getExpandXInterpolator()Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/FloatingAppPairBackground;->expandXInterpolator:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    return-object p0
.end method

.method protected final getExpandYInterpolator()Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/FloatingAppPairBackground;->expandYInterpolator:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    return-object p0
.end method

.method protected final getFloatingView()Lcom/android/quickstep/views/FloatingAppPairView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/FloatingAppPairBackground;->floatingView:Lcom/android/quickstep/views/FloatingAppPairView;

    .line 2
    .line 3
    return-object p0
.end method

.method protected final getIconFadeInterpolator()Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/FloatingAppPairBackground;->iconFadeInterpolator:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOpacity()I
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    return p0
.end method

.method public setAlpha(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    .line 1
    return-void
.end method
