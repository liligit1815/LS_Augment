.class public final Lcom/android/quickstep/views/FloatingFullscreenAppPairBackground;
.super Lcom/android/quickstep/views/FloatingAppPairBackground;
.source "FloatingFullscreenAppPairBackground.kt"


# instance fields
.field private final iconToLaunch:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/quickstep/views/FloatingAppPairView;Landroid/graphics/drawable/Drawable;I)V
    .locals 7

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
    const-string v0, "iconToLaunch"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/4 v5, 0x0

    .line 17
    move-object v1, p0

    .line 18
    move-object v2, p1

    .line 19
    move-object v3, p2

    .line 20
    move-object v4, p3

    .line 21
    move v6, p4

    .line 22
    invoke-direct/range {v1 .. v6}, Lcom/android/quickstep/views/FloatingAppPairBackground;-><init>(Landroid/content/Context;Lcom/android/quickstep/views/FloatingAppPairView;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;I)V

    .line 23
    .line 24
    .line 25
    iput-object v4, v1, Lcom/android/quickstep/views/FloatingFullscreenAppPairBackground;->iconToLaunch:Landroid/graphics/drawable/Drawable;

    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 10

    .line 1
    const-string v0, "canvas"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/views/FloatingAppPairBackground;->getFloatingView()Lcom/android/quickstep/views/FloatingAppPairView;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Lcom/android/quickstep/views/FloatingAppPairView;->getProgress()F

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-virtual {p0}, Lcom/android/quickstep/views/FloatingAppPairBackground;->getFloatingView()Lcom/android/quickstep/views/FloatingAppPairView;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getScaleX()F

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-virtual {p0}, Lcom/android/quickstep/views/FloatingAppPairBackground;->getFloatingView()Lcom/android/quickstep/views/FloatingAppPairView;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getScaleY()F

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    int-to-float v3, v3

    .line 39
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    int-to-float v4, v4

    .line 48
    invoke-virtual {p0}, Lcom/android/quickstep/views/FloatingAppPairBackground;->getDeviceCornerRadius()F

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    div-float/2addr v5, v1

    .line 53
    invoke-virtual {p0}, Lcom/android/quickstep/views/FloatingAppPairBackground;->getDeviceCornerRadius()F

    .line 54
    .line 55
    .line 56
    move-result v6

    .line 57
    div-float/2addr v6, v2

    .line 58
    new-instance v7, Landroid/graphics/RectF;

    .line 59
    .line 60
    const/4 v8, 0x0

    .line 61
    invoke-direct {v7, v8, v8, v3, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 62
    .line 63
    .line 64
    const/16 v8, 0x8

    .line 65
    .line 66
    new-array v8, v8, [F

    .line 67
    .line 68
    const/4 v9, 0x0

    .line 69
    aput v5, v8, v9

    .line 70
    .line 71
    const/4 v9, 0x1

    .line 72
    aput v6, v8, v9

    .line 73
    .line 74
    const/4 v9, 0x2

    .line 75
    aput v5, v8, v9

    .line 76
    .line 77
    const/4 v9, 0x3

    .line 78
    aput v6, v8, v9

    .line 79
    .line 80
    const/4 v9, 0x4

    .line 81
    aput v5, v8, v9

    .line 82
    .line 83
    const/4 v9, 0x5

    .line 84
    aput v6, v8, v9

    .line 85
    .line 86
    const/4 v9, 0x6

    .line 87
    aput v5, v8, v9

    .line 88
    .line 89
    const/4 v5, 0x7

    .line 90
    aput v6, v8, v5

    .line 91
    .line 92
    invoke-virtual {p0, p1, v7, v8}, Lcom/android/quickstep/views/FloatingAppPairBackground;->drawCustomRoundedRect(Landroid/graphics/Canvas;Landroid/graphics/RectF;[F)V

    .line 93
    .line 94
    .line 95
    sget-object v5, Lcom/android/quickstep/views/FloatingAppPairBackground;->Companion:Lcom/android/quickstep/views/FloatingAppPairBackground$Companion;

    .line 96
    .line 97
    invoke-virtual {v5}, Lcom/android/quickstep/views/FloatingAppPairBackground$Companion;->getSTARTING_ICON_SIZE_PX$Launcher_aospWithQuickstepInternalMiFavorRelease()I

    .line 98
    .line 99
    .line 100
    move-result v6

    .line 101
    int-to-float v6, v6

    .line 102
    invoke-virtual {v5}, Lcom/android/quickstep/views/FloatingAppPairBackground$Companion;->getENDING_ICON_SIZE_PX$Launcher_aospWithQuickstepInternalMiFavorRelease()I

    .line 103
    .line 104
    .line 105
    move-result v7

    .line 106
    invoke-virtual {v5}, Lcom/android/quickstep/views/FloatingAppPairBackground$Companion;->getSTARTING_ICON_SIZE_PX$Launcher_aospWithQuickstepInternalMiFavorRelease()I

    .line 107
    .line 108
    .line 109
    move-result v8

    .line 110
    sub-int/2addr v7, v8

    .line 111
    int-to-float v7, v7

    .line 112
    invoke-virtual {p0}, Lcom/android/quickstep/views/FloatingAppPairBackground;->getExpandXInterpolator()Landroid/view/animation/Interpolator;

    .line 113
    .line 114
    .line 115
    move-result-object v8

    .line 116
    invoke-interface {v8, v0}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 117
    .line 118
    .line 119
    move-result v8

    .line 120
    mul-float/2addr v7, v8

    .line 121
    add-float/2addr v6, v7

    .line 122
    div-float/2addr v6, v1

    .line 123
    invoke-virtual {v5}, Lcom/android/quickstep/views/FloatingAppPairBackground$Companion;->getSTARTING_ICON_SIZE_PX$Launcher_aospWithQuickstepInternalMiFavorRelease()I

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    int-to-float v1, v1

    .line 128
    invoke-virtual {v5}, Lcom/android/quickstep/views/FloatingAppPairBackground$Companion;->getENDING_ICON_SIZE_PX$Launcher_aospWithQuickstepInternalMiFavorRelease()I

    .line 129
    .line 130
    .line 131
    move-result v7

    .line 132
    invoke-virtual {v5}, Lcom/android/quickstep/views/FloatingAppPairBackground$Companion;->getSTARTING_ICON_SIZE_PX$Launcher_aospWithQuickstepInternalMiFavorRelease()I

    .line 133
    .line 134
    .line 135
    move-result v5

    .line 136
    sub-int/2addr v7, v5

    .line 137
    int-to-float v5, v7

    .line 138
    invoke-virtual {p0}, Lcom/android/quickstep/views/FloatingAppPairBackground;->getExpandYInterpolator()Landroid/view/animation/Interpolator;

    .line 139
    .line 140
    .line 141
    move-result-object v7

    .line 142
    invoke-interface {v7, v0}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 143
    .line 144
    .line 145
    move-result v7

    .line 146
    mul-float/2addr v5, v7

    .line 147
    add-float/2addr v1, v5

    .line 148
    div-float/2addr v1, v2

    .line 149
    const/high16 v2, 0x40000000    # 2.0f

    .line 150
    .line 151
    div-float/2addr v3, v2

    .line 152
    div-float v5, v6, v2

    .line 153
    .line 154
    sub-float/2addr v3, v5

    .line 155
    div-float/2addr v4, v2

    .line 156
    div-float v2, v1, v2

    .line 157
    .line 158
    sub-float/2addr v4, v2

    .line 159
    iget-object v2, p0, Lcom/android/quickstep/views/FloatingFullscreenAppPairBackground;->iconToLaunch:Landroid/graphics/drawable/Drawable;

    .line 160
    .line 161
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 162
    .line 163
    .line 164
    move-result-object v2

    .line 165
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    .line 166
    .line 167
    .line 168
    move-result v2

    .line 169
    int-to-float v2, v2

    .line 170
    div-float/2addr v6, v2

    .line 171
    iget-object v2, p0, Lcom/android/quickstep/views/FloatingFullscreenAppPairBackground;->iconToLaunch:Landroid/graphics/drawable/Drawable;

    .line 172
    .line 173
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 174
    .line 175
    .line 176
    move-result-object v2

    .line 177
    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    .line 178
    .line 179
    .line 180
    move-result v2

    .line 181
    int-to-float v2, v2

    .line 182
    div-float/2addr v1, v2

    .line 183
    const/16 v2, 0xff

    .line 184
    .line 185
    int-to-float v2, v2

    .line 186
    invoke-virtual {p0}, Lcom/android/quickstep/views/FloatingAppPairBackground;->getIconFadeInterpolator()Landroid/view/animation/Interpolator;

    .line 187
    .line 188
    .line 189
    move-result-object v5

    .line 190
    invoke-interface {v5, v0}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 191
    .line 192
    .line 193
    move-result v0

    .line 194
    mul-float/2addr v0, v2

    .line 195
    sub-float/2addr v2, v0

    .line 196
    float-to-int v0, v2

    .line 197
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 198
    .line 199
    .line 200
    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->translate(FF)V

    .line 201
    .line 202
    .line 203
    invoke-virtual {p1, v6, v1}, Landroid/graphics/Canvas;->scale(FF)V

    .line 204
    .line 205
    .line 206
    iget-object v1, p0, Lcom/android/quickstep/views/FloatingFullscreenAppPairBackground;->iconToLaunch:Landroid/graphics/drawable/Drawable;

    .line 207
    .line 208
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 209
    .line 210
    .line 211
    iget-object p0, p0, Lcom/android/quickstep/views/FloatingFullscreenAppPairBackground;->iconToLaunch:Landroid/graphics/drawable/Drawable;

    .line 212
    .line 213
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 214
    .line 215
    .line 216
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 217
    .line 218
    .line 219
    return-void
.end method
