.class public final Lcom/android/launcher3/anim/P;
.super Lcom/android/launcher3/anim/N;
.source "MFVLauncherAppTransitionHelper.java"


# static fields
.field public static final j:Landroid/view/animation/Interpolator;


# instance fields
.field private f:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

.field private g:Lcom/android/launcher3/h0;

.field private h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

.field private final i:F


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 1
    new-instance v0, Lcom/android/quickstep/util/animation/OSpringInterpolator;

    .line 2
    .line 3
    const-wide/16 v5, 0x0

    .line 4
    .line 5
    const/high16 v7, 0x3f800000    # 1.0f

    .line 6
    .line 7
    const-wide v1, 0x4072c00000000000L    # 300.0

    .line 8
    .line 9
    .line 10
    .line 11
    .line 12
    const-wide/high16 v3, 0x3ff0000000000000L    # 1.0

    .line 13
    .line 14
    invoke-direct/range {v0 .. v7}, Lcom/android/quickstep/util/animation/OSpringInterpolator;-><init>(DDDF)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lcom/android/launcher3/anim/P;->j:Landroid/view/animation/Interpolator;

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/launcher3/h0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/anim/N;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/launcher3/h0;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/anim/P;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/anim/P;->g:Lcom/android/launcher3/h0;

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    const p2, 0x7f0706d1

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    int-to-float p1, p1

    .line 20
    iput p1, p0, Lcom/android/launcher3/anim/P;->i:F

    .line 21
    .line 22
    return-void
.end method

.method static bridge synthetic k(Lcom/android/launcher3/anim/P;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/anim/P;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    return-object p0
.end method

.method private l([Lu2/s;)Z
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    const/4 v0, 0x0

    .line 3
    :goto_0
    array-length v1, p1

    .line 4
    if-ge v0, v1, :cond_2

    .line 5
    .line 6
    aget-object v1, p1, v0

    .line 7
    .line 8
    iget v2, v1, Lu2/s;->m:I

    .line 9
    .line 10
    if-nez v2, :cond_0

    .line 11
    .line 12
    iget-boolean v1, v1, Lu2/s;->g:Z

    .line 13
    .line 14
    and-int/2addr p0, v1

    .line 15
    :cond_0
    if-nez p0, :cond_1

    .line 16
    .line 17
    return p0

    .line 18
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_2
    return p0
.end method

.method private m(Landroid/view/View;Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of p1, p0, Lcom/android/launcher3/model/data/y;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    check-cast p0, Lcom/android/launcher3/model/data/y;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    :goto_0
    if-eqz p0, :cond_3

    .line 14
    .line 15
    iget p1, p0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    if-gt p1, v0, :cond_1

    .line 19
    .line 20
    iget p1, p0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 21
    .line 22
    if-le p1, v0, :cond_3

    .line 23
    .line 24
    :cond_1
    iget p0, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 25
    .line 26
    const/4 p1, 0x5

    .line 27
    if-eq p0, p1, :cond_2

    .line 28
    .line 29
    const/16 p1, 0x63

    .line 30
    .line 31
    if-eq p0, p1, :cond_2

    .line 32
    .line 33
    const/16 p1, 0x64

    .line 34
    .line 35
    if-ne p0, p1, :cond_3

    .line 36
    .line 37
    :cond_2
    invoke-virtual {p2, v0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setMLimitRadioFlag(Z)V

    .line 38
    .line 39
    .line 40
    :cond_3
    return-void
.end method

.method private n(ZLandroid/view/View;ZLandroid/graphics/RectF;ZZZ)Lcom/android/launcher3/views/FloatingIconView;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "releaseIconSurfaceAndGetFIV: isMultiInterruptOpen: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p7

    .line 18
    const-string v0, "MFVLauncherAppTransitionHelper"

    .line 19
    .line 20
    invoke-static {v0, p7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    invoke-virtual/range {p0 .. p6}, Lcom/android/launcher3/anim/N;->d(ZLandroid/view/View;ZLandroid/graphics/RectF;ZZ)Lcom/android/launcher3/views/FloatingIconView;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public static o(Lcom/android/launcher3/anim/P;ZLandroid/view/View;ZLandroid/graphics/RectF;ZZZILjava/lang/Object;)Lcom/android/launcher3/views/FloatingIconView;
    .locals 1

    .line 1
    and-int/lit8 p9, p8, 0x20

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p9, :cond_0

    .line 5
    .line 6
    move p6, v0

    .line 7
    :cond_0
    and-int/lit8 p8, p8, 0x40

    .line 8
    .line 9
    if-eqz p8, :cond_1

    .line 10
    .line 11
    move p7, v0

    .line 12
    :cond_1
    invoke-direct/range {p0 .. p7}, Lcom/android/launcher3/anim/P;->n(ZLandroid/view/View;ZLandroid/graphics/RectF;ZZZ)Lcom/android/launcher3/views/FloatingIconView;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static q(Ljava/util/concurrent/atomic/AtomicBoolean;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "$getIconImmediately"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static r(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->skipToEnd()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public p([Lu2/s;[Lu2/s;[Lu2/s;Landroid/graphics/RectF;Landroid/view/View;Lcom/android/quickstep/util/animation/MultiAnimatorSet;Lcom/android/launcher3/M2$a;Landroid/graphics/RectF;F)V
    .locals 36

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v12, p1

    .line 4
    .line 5
    move-object/from16 v2, p5

    .line 6
    .line 7
    move-object/from16 v10, p6

    .line 8
    .line 9
    new-instance v11, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 10
    .line 11
    const/4 v13, 0x0

    .line 12
    invoke-direct {v11, v13}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 13
    .line 14
    .line 15
    iget-object v1, v0, Lcom/android/launcher3/anim/P;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iput-object v1, v0, Lcom/android/launcher3/anim/P;->g:Lcom/android/launcher3/h0;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/android/launcher3/anim/N;->e()LU0/a;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-interface {v1, v2}, LU0/a;->b(Landroid/view/View;)Z

    .line 28
    .line 29
    .line 30
    move-result v6

    .line 31
    iget-object v1, v0, Lcom/android/launcher3/anim/P;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 32
    .line 33
    invoke-static {v1}, Lcom/android/systemui/shared/system/QuickStepContract;->getWindowCornerRadius(Landroid/content/Context;)F

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    new-instance v14, Landroid/graphics/RectF;

    .line 38
    .line 39
    if-nez p8, :cond_0

    .line 40
    .line 41
    move-object/from16 v3, p4

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    move-object/from16 v3, p8

    .line 45
    .line 46
    :goto_0
    invoke-direct {v14, v3}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 47
    .line 48
    .line 49
    if-eqz p8, :cond_1

    .line 50
    .line 51
    invoke-virtual/range {p8 .. p8}, Landroid/graphics/RectF;->width()F

    .line 52
    .line 53
    .line 54
    invoke-virtual/range {p4 .. p4}, Landroid/graphics/RectF;->width()F

    .line 55
    .line 56
    .line 57
    :cond_1
    new-instance v4, Landroid/graphics/RectF;

    .line 58
    .line 59
    invoke-direct {v4}, Landroid/graphics/RectF;-><init>()V

    .line 60
    .line 61
    .line 62
    instance-of v3, v2, Lcom/android/launcher3/widget/T;

    .line 63
    .line 64
    if-nez v3, :cond_2

    .line 65
    .line 66
    iget-object v5, v0, Lcom/android/launcher3/anim/P;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 67
    .line 68
    new-instance v7, Landroid/graphics/Rect;

    .line 69
    .line 70
    invoke-direct {v7}, Landroid/graphics/Rect;-><init>()V

    .line 71
    .line 72
    .line 73
    invoke-static {v5, v2, v13, v4, v7}, Lcom/android/launcher3/views/FloatingIconView;->y(Lcom/android/launcher3/C2;Landroid/view/View;ZLandroid/graphics/RectF;Landroid/graphics/Rect;)V

    .line 74
    .line 75
    .line 76
    :cond_2
    const/4 v7, 0x1

    .line 77
    const/16 v22, 0x0

    .line 78
    .line 79
    if-eqz v3, :cond_6

    .line 80
    .line 81
    new-instance v8, Landroid/graphics/RectF;

    .line 82
    .line 83
    invoke-direct {v8}, Landroid/graphics/RectF;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-static {v12}, Lu2/s;->i([Lu2/s;)[Landroid/view/RemoteAnimationTarget;

    .line 87
    .line 88
    .line 89
    move-result-object v8

    .line 90
    array-length v9, v8

    .line 91
    move v15, v13

    .line 92
    :goto_1
    if-ge v15, v9, :cond_4

    .line 93
    .line 94
    aget-object v5, v8, v15

    .line 95
    .line 96
    iget v13, v5, Landroid/view/RemoteAnimationTarget;->mode:I

    .line 97
    .line 98
    if-ne v13, v7, :cond_3

    .line 99
    .line 100
    iget-boolean v8, v5, Landroid/view/RemoteAnimationTarget;->isTranslucent:Z

    .line 101
    .line 102
    move/from16 v20, v8

    .line 103
    .line 104
    goto :goto_2

    .line 105
    :cond_3
    add-int/lit8 v15, v15, 0x1

    .line 106
    .line 107
    const/4 v13, 0x0

    .line 108
    goto :goto_1

    .line 109
    :cond_4
    move-object/from16 v5, v22

    .line 110
    .line 111
    const/16 v20, 0x0

    .line 112
    .line 113
    :goto_2
    new-instance v8, Landroid/util/Size;

    .line 114
    .line 115
    iget-object v9, v0, Lcom/android/launcher3/anim/P;->g:Lcom/android/launcher3/h0;

    .line 116
    .line 117
    iget v13, v9, Lcom/android/launcher3/h0;->V0:I

    .line 118
    .line 119
    iget v9, v9, Lcom/android/launcher3/h0;->W0:I

    .line 120
    .line 121
    invoke-direct {v8, v13, v9}, Landroid/util/Size;-><init>(II)V

    .line 122
    .line 123
    .line 124
    iget-object v9, v0, Lcom/android/launcher3/anim/P;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 125
    .line 126
    invoke-static {v9, v5}, Lcom/android/quickstep/views/FloatingWidgetView;->getDefaultBackgroundColor(Landroid/content/Context;Landroid/view/RemoteAnimationTarget;)I

    .line 127
    .line 128
    .line 129
    move-result v21

    .line 130
    iget-object v15, v0, Lcom/android/launcher3/anim/P;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 131
    .line 132
    move-object/from16 v16, v2

    .line 133
    .line 134
    check-cast v16, Lcom/android/launcher3/widget/T;

    .line 135
    .line 136
    iget-object v5, v0, Lcom/android/launcher3/anim/P;->g:Lcom/android/launcher3/h0;

    .line 137
    .line 138
    iget-boolean v5, v5, Lcom/android/launcher3/h0;->O0:Z

    .line 139
    .line 140
    if-eqz v5, :cond_5

    .line 141
    .line 142
    const/16 v19, 0x0

    .line 143
    .line 144
    :goto_3
    move-object/from16 v17, v4

    .line 145
    .line 146
    move-object/from16 v18, v8

    .line 147
    .line 148
    goto :goto_4

    .line 149
    :cond_5
    invoke-static {v15}, Lcom/android/systemui/shared/system/QuickStepContract;->getWindowCornerRadius(Landroid/content/Context;)F

    .line 150
    .line 151
    .line 152
    move-result v5

    .line 153
    move/from16 v19, v5

    .line 154
    .line 155
    goto :goto_3

    .line 156
    :goto_4
    invoke-static/range {v15 .. v21}, Lcom/android/quickstep/views/FloatingWidgetView;->getFloatingWidgetView(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/launcher3/widget/T;Landroid/graphics/RectF;Landroid/util/Size;FZI)Lcom/android/quickstep/views/FloatingWidgetView;

    .line 157
    .line 158
    .line 159
    move-result-object v4

    .line 160
    move-object v5, v4

    .line 161
    move-object/from16 v4, v17

    .line 162
    .line 163
    move-object v13, v5

    .line 164
    goto :goto_5

    .line 165
    :cond_6
    move-object/from16 v13, v22

    .line 166
    .line 167
    const/16 v20, 0x0

    .line 168
    .line 169
    :goto_5
    sget-object v5, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 170
    .line 171
    iget-object v8, v0, Lcom/android/launcher3/anim/P;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 172
    .line 173
    invoke-virtual {v8}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 174
    .line 175
    .line 176
    move-result-object v8

    .line 177
    invoke-virtual {v5, v8}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 178
    .line 179
    .line 180
    move-result-object v5

    .line 181
    move-object v15, v5

    .line 182
    check-cast v15, Lcom/android/launcher3/anim/C;

    .line 183
    .line 184
    invoke-virtual {v15}, Lcom/android/launcher3/anim/C;->T()I

    .line 185
    .line 186
    .line 187
    move-result v5

    .line 188
    int-to-float v5, v5

    .line 189
    instance-of v8, v2, Lcom/android/launcher3/BubbleTextView;

    .line 190
    .line 191
    if-eqz v8, :cond_7

    .line 192
    .line 193
    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    .line 194
    .line 195
    .line 196
    move-result v9

    .line 197
    iget-object v7, v0, Lcom/android/launcher3/anim/P;->g:Lcom/android/launcher3/h0;

    .line 198
    .line 199
    iget v7, v7, Lcom/android/launcher3/h0;->B1:I

    .line 200
    .line 201
    int-to-float v7, v7

    .line 202
    div-float/2addr v9, v7

    .line 203
    mul-float/2addr v5, v9

    .line 204
    invoke-virtual {v4, v5, v5}, Landroid/graphics/RectF;->inset(FF)V

    .line 205
    .line 206
    .line 207
    :cond_7
    iget-object v7, v0, Lcom/android/launcher3/anim/P;->g:Lcom/android/launcher3/h0;

    .line 208
    .line 209
    iget-boolean v7, v7, Lcom/android/launcher3/h0;->N0:Z

    .line 210
    .line 211
    if-eqz v7, :cond_8

    .line 212
    .line 213
    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    .line 214
    .line 215
    .line 216
    goto :goto_6

    .line 217
    :cond_8
    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    .line 218
    .line 219
    .line 220
    :goto_6
    iget-object v7, v0, Lcom/android/launcher3/anim/P;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 221
    .line 222
    invoke-virtual {v7}, Landroid/app/Activity;->isInMultiWindowMode()Z

    .line 223
    .line 224
    .line 225
    move-result v7

    .line 226
    if-nez v7, :cond_a

    .line 227
    .line 228
    iget-object v7, v0, Lcom/android/launcher3/anim/P;->g:Lcom/android/launcher3/h0;

    .line 229
    .line 230
    iget-boolean v7, v7, Lcom/android/launcher3/h0;->G0:Z

    .line 231
    .line 232
    if-eqz v7, :cond_9

    .line 233
    .line 234
    goto :goto_7

    .line 235
    :cond_9
    const/16 v17, 0x0

    .line 236
    .line 237
    goto :goto_8

    .line 238
    :cond_a
    :goto_7
    move/from16 v17, v1

    .line 239
    .line 240
    :goto_8
    new-instance v1, Lcom/android/quickstep/util/TaskViewSimulator;

    .line 241
    .line 242
    iget-object v7, v0, Lcom/android/launcher3/anim/P;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 243
    .line 244
    invoke-virtual {v7}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 245
    .line 246
    .line 247
    move-result-object v9

    .line 248
    check-cast v9, Lcom/android/quickstep/views/RecentsView;

    .line 249
    .line 250
    invoke-virtual {v9}, Lcom/android/quickstep/views/RecentsView;->getSizeStrategy()Lcom/android/quickstep/BaseContainerInterface;

    .line 251
    .line 252
    .line 253
    move-result-object v9

    .line 254
    move/from16 v18, v3

    .line 255
    .line 256
    const/4 v3, 0x0

    .line 257
    invoke-direct {v1, v7, v9, v3, v3}, Lcom/android/quickstep/util/TaskViewSimulator;-><init>(Landroid/content/Context;Lcom/android/quickstep/BaseContainerInterface;ZI)V

    .line 258
    .line 259
    .line 260
    iget-object v3, v0, Lcom/android/launcher3/anim/P;->g:Lcom/android/launcher3/h0;

    .line 261
    .line 262
    invoke-virtual {v1, v3}, Lcom/android/quickstep/util/TaskViewSimulator;->setDp(Lcom/android/launcher3/h0;)V

    .line 263
    .line 264
    .line 265
    sget-object v3, Lcom/android/launcher3/util/Z;->r:Lcom/android/launcher3/util/I;

    .line 266
    .line 267
    iget-object v7, v0, Lcom/android/launcher3/anim/P;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 268
    .line 269
    invoke-virtual {v3, v7}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 270
    .line 271
    .line 272
    move-result-object v3

    .line 273
    check-cast v3, Lcom/android/launcher3/util/Z;

    .line 274
    .line 275
    invoke-virtual {v3}, Lcom/android/launcher3/util/Z;->w()Lcom/android/launcher3/util/Z$c;

    .line 276
    .line 277
    .line 278
    move-result-object v3

    .line 279
    iget v3, v3, Lcom/android/launcher3/util/Z$c;->b:I

    .line 280
    .line 281
    invoke-virtual {v1, v3, v3}, Lcom/android/quickstep/util/TaskViewSimulator;->setLayoutRotation(II)V

    .line 282
    .line 283
    .line 284
    new-instance v3, Landroid/graphics/Matrix;

    .line 285
    .line 286
    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    .line 287
    .line 288
    .line 289
    new-instance v7, Landroid/graphics/Matrix;

    .line 290
    .line 291
    invoke-direct {v7}, Landroid/graphics/Matrix;-><init>()V

    .line 292
    .line 293
    .line 294
    invoke-virtual {v1, v3}, Lcom/android/quickstep/util/TaskViewSimulator;->applyWindowToHomeRotation(Landroid/graphics/Matrix;)V

    .line 295
    .line 296
    .line 297
    invoke-virtual {v3, v7}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 298
    .line 299
    .line 300
    invoke-virtual {v7, v14}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 301
    .line 302
    .line 303
    invoke-static {v2}, Lp1/f;->t(Landroid/view/View;)Z

    .line 304
    .line 305
    .line 306
    move-result v19

    .line 307
    iget-object v1, v0, Lcom/android/launcher3/anim/P;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 308
    .line 309
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 310
    .line 311
    .line 312
    move-result-object v1

    .line 313
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getScrollX()I

    .line 314
    .line 315
    .line 316
    iget-object v1, v0, Lcom/android/launcher3/anim/P;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 317
    .line 318
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 319
    .line 320
    .line 321
    move-result-object v1

    .line 322
    invoke-virtual {v1}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 323
    .line 324
    .line 325
    new-instance v1, Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 326
    .line 327
    invoke-direct {v1, v10, v12, v2}, Lcom/android/quickstep/util/animation/AnimationRecord;-><init>(Lcom/android/quickstep/util/animation/MultiAnimatorSet;[Lu2/s;Landroid/view/View;)V

    .line 328
    .line 329
    .line 330
    invoke-virtual {v0, v1}, Lcom/android/launcher3/anim/N;->i(Lcom/android/quickstep/util/animation/AnimationRecord;)V

    .line 331
    .line 332
    .line 333
    iget-object v1, v0, Lcom/android/launcher3/anim/P;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 334
    .line 335
    invoke-virtual {v1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->r5()Lcom/android/launcher3/q5;

    .line 336
    .line 337
    .line 338
    move-result-object v1

    .line 339
    if-eqz v1, :cond_b

    .line 340
    .line 341
    iget-object v1, v0, Lcom/android/launcher3/anim/P;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 342
    .line 343
    invoke-virtual {v1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->r5()Lcom/android/launcher3/q5;

    .line 344
    .line 345
    .line 346
    move-result-object v1

    .line 347
    invoke-virtual {v1, v10}, Lcom/android/launcher3/q5;->Q0(Lcom/android/quickstep/util/animation/MultiAnimatorSet;)V

    .line 348
    .line 349
    .line 350
    :cond_b
    invoke-virtual {v0}, Lcom/android/launcher3/anim/N;->f()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 351
    .line 352
    .line 353
    move-result-object v1

    .line 354
    invoke-virtual {v0}, Lcom/android/launcher3/anim/N;->g()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 355
    .line 356
    .line 357
    move-result-object v7

    .line 358
    iget-object v9, v0, Lcom/android/launcher3/anim/P;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 359
    .line 360
    const/4 v0, 0x0

    .line 361
    invoke-virtual {v1, v7, v4, v0, v9}, Lcom/android/quickstep/util/animation/AnimationRecord;->tryConnectExistingAnim(Lcom/android/quickstep/util/animation/AnimationRecord;Landroid/graphics/RectF;FLcom/android/launcher3/C2;)Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 362
    .line 363
    .line 364
    move-result-object v1

    .line 365
    new-instance v7, Ljava/lang/StringBuilder;

    .line 366
    .line 367
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 368
    .line 369
    .line 370
    const-string v9, "startAppCloseWindowAnim: tryConnectExistingAnim: "

    .line 371
    .line 372
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 373
    .line 374
    .line 375
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 376
    .line 377
    .line 378
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 379
    .line 380
    .line 381
    move-result-object v7

    .line 382
    const-string v9, "MFVLauncherAppTransitionHelper"

    .line 383
    .line 384
    invoke-static {v9, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 385
    .line 386
    .line 387
    const/high16 v7, 0x3f800000    # 1.0f

    .line 388
    .line 389
    if-nez v1, :cond_14

    .line 390
    .line 391
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher3/anim/N;->e()LU0/a;

    .line 392
    .line 393
    .line 394
    move-result-object v1

    .line 395
    invoke-interface {v1, v2}, LU0/a;->d(Landroid/view/View;)I

    .line 396
    .line 397
    .line 398
    move-result v21

    .line 399
    if-nez v18, :cond_c

    .line 400
    .line 401
    move v1, v8

    .line 402
    const/16 v8, 0x40

    .line 403
    .line 404
    const/4 v9, 0x0

    .line 405
    move/from16 v23, v1

    .line 406
    .line 407
    const/4 v1, 0x1

    .line 408
    move-object/from16 v24, v3

    .line 409
    .line 410
    const/4 v3, 0x1

    .line 411
    move/from16 v25, v5

    .line 412
    .line 413
    const/4 v5, 0x0

    .line 414
    move/from16 v26, v7

    .line 415
    .line 416
    const/4 v7, 0x0

    .line 417
    const/16 v16, 0x1

    .line 418
    .line 419
    move-object/from16 v0, p0

    .line 420
    .line 421
    move-object/from16 v27, v11

    .line 422
    .line 423
    move-object/from16 v28, v24

    .line 424
    .line 425
    move/from16 v11, v25

    .line 426
    .line 427
    move/from16 v12, v26

    .line 428
    .line 429
    invoke-static/range {v0 .. v9}, Lcom/android/launcher3/anim/P;->o(Lcom/android/launcher3/anim/P;ZLandroid/view/View;ZLandroid/graphics/RectF;ZZZILjava/lang/Object;)Lcom/android/launcher3/views/FloatingIconView;

    .line 430
    .line 431
    .line 432
    move-result-object v1

    .line 433
    move-object v8, v0

    .line 434
    :goto_9
    move v9, v6

    .line 435
    goto :goto_a

    .line 436
    :cond_c
    move-object/from16 v28, v3

    .line 437
    .line 438
    move v12, v7

    .line 439
    move/from16 v23, v8

    .line 440
    .line 441
    move-object/from16 v27, v11

    .line 442
    .line 443
    const/16 v16, 0x1

    .line 444
    .line 445
    move-object/from16 v8, p0

    .line 446
    .line 447
    move v11, v5

    .line 448
    move-object/from16 v1, v22

    .line 449
    .line 450
    goto :goto_9

    .line 451
    :goto_a
    iget-object v0, v8, Lcom/android/launcher3/anim/P;->g:Lcom/android/launcher3/h0;

    .line 452
    .line 453
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->G0:Z

    .line 454
    .line 455
    if-eqz v0, :cond_d

    .line 456
    .line 457
    invoke-virtual {v14}, Landroid/graphics/RectF;->width()F

    .line 458
    .line 459
    .line 460
    move-result v0

    .line 461
    invoke-virtual {v14}, Landroid/graphics/RectF;->height()F

    .line 462
    .line 463
    .line 464
    move-result v2

    .line 465
    cmpl-float v0, v0, v2

    .line 466
    .line 467
    if-lez v0, :cond_d

    .line 468
    .line 469
    move/from16 v7, v16

    .line 470
    .line 471
    goto :goto_b

    .line 472
    :cond_d
    const/4 v7, 0x0

    .line 473
    :goto_b
    new-instance v0, LU0/c;

    .line 474
    .line 475
    iget-object v2, v8, Lcom/android/launcher3/anim/P;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 476
    .line 477
    iget-object v3, v8, Lcom/android/launcher3/anim/P;->g:Lcom/android/launcher3/h0;

    .line 478
    .line 479
    invoke-direct {v0, v2, v3}, LU0/c;-><init>(Lcom/android/launcher3/C2;Lcom/android/launcher3/h0;)V

    .line 480
    .line 481
    .line 482
    if-nez v18, :cond_e

    .line 483
    .line 484
    xor-int/lit8 v3, v7, 0x1

    .line 485
    .line 486
    const/16 v6, 0x10

    .line 487
    .line 488
    const/4 v7, 0x0

    .line 489
    const/4 v5, 0x0

    .line 490
    move-object/from16 v2, p5

    .line 491
    .line 492
    move-object v12, v4

    .line 493
    move/from16 v4, v21

    .line 494
    .line 495
    invoke-static/range {v0 .. v7}, LU0/c;->j(LU0/c;Lcom/android/launcher3/views/FloatingIconView;Landroid/view/View;ZIZILjava/lang/Object;)V

    .line 496
    .line 497
    .line 498
    goto :goto_c

    .line 499
    :cond_e
    move-object/from16 v2, p5

    .line 500
    .line 501
    move-object v12, v4

    .line 502
    :goto_c
    invoke-virtual {v8}, Lcom/android/launcher3/anim/N;->f()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 503
    .line 504
    .line 505
    move-result-object v3

    .line 506
    invoke-virtual {v3, v0}, Lcom/android/quickstep/util/animation/AnimationRecord;->setIconLayerHolder(LU0/c;)V

    .line 507
    .line 508
    .line 509
    if-eqz v23, :cond_f

    .line 510
    .line 511
    invoke-virtual {v12, v11, v11}, Landroid/graphics/RectF;->inset(FF)V

    .line 512
    .line 513
    .line 514
    :cond_f
    new-instance v0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 515
    .line 516
    new-instance v3, Landroid/graphics/PointF;

    .line 517
    .line 518
    const/4 v4, 0x0

    .line 519
    const/high16 v5, 0x3f800000    # 1.0f

    .line 520
    .line 521
    invoke-direct {v3, v5, v4}, Landroid/graphics/PointF;-><init>(FF)V

    .line 522
    .line 523
    .line 524
    invoke-direct {v0, v14, v12, v3, v9}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;-><init>(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/PointF;Z)V

    .line 525
    .line 526
    .line 527
    const/high16 v3, -0x40800000    # -1.0f

    .line 528
    .line 529
    cmpl-float v3, p9, v3

    .line 530
    .line 531
    if-lez v3, :cond_10

    .line 532
    .line 533
    goto :goto_d

    .line 534
    :cond_10
    if-nez v3, :cond_11

    .line 535
    .line 536
    move/from16 v3, v17

    .line 537
    .line 538
    goto :goto_e

    .line 539
    :cond_11
    :goto_d
    move/from16 v3, p9

    .line 540
    .line 541
    :goto_e
    invoke-virtual {v0, v3}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setStartRadius(F)V

    .line 542
    .line 543
    .line 544
    sget-boolean v3, Lx1/O;->T:Z

    .line 545
    .line 546
    if-eqz v3, :cond_13

    .line 547
    .line 548
    if-nez v19, :cond_12

    .line 549
    .line 550
    invoke-static {v2}, Lp1/f;->y(Landroid/view/View;)Z

    .line 551
    .line 552
    .line 553
    move-result v3

    .line 554
    if-eqz v3, :cond_13

    .line 555
    .line 556
    :cond_12
    const/4 v3, 0x2

    .line 557
    goto :goto_f

    .line 558
    :cond_13
    sget-object v3, Lcom/android/quickstep/util/animation/RectTransformHelper;->INSTANCE:Lcom/android/quickstep/util/animation/RectTransformHelper$Companion;

    .line 559
    .line 560
    iget-object v6, v8, Lcom/android/launcher3/anim/P;->g:Lcom/android/launcher3/h0;

    .line 561
    .line 562
    iget v6, v6, Lcom/android/launcher3/h0;->U0:I

    .line 563
    .line 564
    invoke-virtual {v3, v6, v12}, Lcom/android/quickstep/util/animation/RectTransformHelper$Companion;->getTracking(ILandroid/graphics/RectF;)I

    .line 565
    .line 566
    .line 567
    move-result v3

    .line 568
    :goto_f
    invoke-virtual {v0, v3}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setTracking(I)V

    .line 569
    .line 570
    .line 571
    move-object/from16 v29, v0

    .line 572
    .line 573
    move/from16 v21, v4

    .line 574
    .line 575
    move/from16 v26, v5

    .line 576
    .line 577
    move/from16 v24, v9

    .line 578
    .line 579
    move-object v9, v12

    .line 580
    goto/16 :goto_15

    .line 581
    .line 582
    :cond_14
    move-object/from16 v28, v3

    .line 583
    .line 584
    move-object v12, v4

    .line 585
    move/from16 v23, v8

    .line 586
    .line 587
    move-object/from16 v27, v11

    .line 588
    .line 589
    const/16 v16, 0x1

    .line 590
    .line 591
    move-object/from16 v8, p0

    .line 592
    .line 593
    move v4, v0

    .line 594
    move v11, v5

    .line 595
    move v5, v7

    .line 596
    invoke-virtual {v8}, Lcom/android/launcher3/anim/N;->f()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 597
    .line 598
    .line 599
    move-result-object v0

    .line 600
    if-nez v18, :cond_15

    .line 601
    .line 602
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/AnimationRecord;->getMIconLayerHolder()LU0/c;

    .line 603
    .line 604
    .line 605
    move-result-object v0

    .line 606
    invoke-virtual {v0}, LU0/c;->c()Lcom/android/launcher3/views/FloatingIconView;

    .line 607
    .line 608
    .line 609
    move-result-object v0

    .line 610
    goto :goto_10

    .line 611
    :cond_15
    move-object/from16 v0, v22

    .line 612
    .line 613
    :goto_10
    invoke-virtual {v8}, Lcom/android/launcher3/anim/N;->e()LU0/a;

    .line 614
    .line 615
    .line 616
    move-result-object v3

    .line 617
    invoke-interface {v3, v2}, LU0/a;->d(Landroid/view/View;)I

    .line 618
    .line 619
    .line 620
    move-result v17

    .line 621
    if-eqz v0, :cond_16

    .line 622
    .line 623
    invoke-virtual {v0}, Lcom/android/launcher3/views/FloatingIconView;->fastFinish()V

    .line 624
    .line 625
    .line 626
    :cond_16
    new-instance v3, Ljava/lang/StringBuilder;

    .line 627
    .line 628
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 629
    .line 630
    .line 631
    const-string v7, "startAppCloseWindowAnim start "

    .line 632
    .line 633
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 634
    .line 635
    .line 636
    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 637
    .line 638
    .line 639
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 640
    .line 641
    .line 642
    move-result-object v3

    .line 643
    invoke-static {v9, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 644
    .line 645
    .line 646
    if-nez v18, :cond_17

    .line 647
    .line 648
    const/16 v8, 0x40

    .line 649
    .line 650
    const/4 v9, 0x0

    .line 651
    move-object v0, v1

    .line 652
    const/4 v1, 0x1

    .line 653
    const/4 v3, 0x1

    .line 654
    move/from16 v26, v5

    .line 655
    .line 656
    const/4 v5, 0x0

    .line 657
    const/4 v7, 0x0

    .line 658
    move/from16 v21, v4

    .line 659
    .line 660
    move-object v4, v12

    .line 661
    move-object v12, v0

    .line 662
    move-object/from16 v0, p0

    .line 663
    .line 664
    invoke-static/range {v0 .. v9}, Lcom/android/launcher3/anim/P;->o(Lcom/android/launcher3/anim/P;ZLandroid/view/View;ZLandroid/graphics/RectF;ZZZILjava/lang/Object;)Lcom/android/launcher3/views/FloatingIconView;

    .line 665
    .line 666
    .line 667
    move-result-object v1

    .line 668
    move-object v8, v0

    .line 669
    move-object v9, v4

    .line 670
    :goto_11
    move/from16 v24, v6

    .line 671
    .line 672
    goto :goto_12

    .line 673
    :cond_17
    move/from16 v21, v4

    .line 674
    .line 675
    move/from16 v26, v5

    .line 676
    .line 677
    move-object v9, v12

    .line 678
    move-object v12, v1

    .line 679
    move-object v1, v0

    .line 680
    goto :goto_11

    .line 681
    :goto_12
    if-eqz v23, :cond_18

    .line 682
    .line 683
    invoke-virtual {v9, v11, v11}, Landroid/graphics/RectF;->inset(FF)V

    .line 684
    .line 685
    .line 686
    :cond_18
    iget-object v0, v8, Lcom/android/launcher3/anim/P;->g:Lcom/android/launcher3/h0;

    .line 687
    .line 688
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->G0:Z

    .line 689
    .line 690
    if-eqz v0, :cond_19

    .line 691
    .line 692
    invoke-virtual {v14}, Landroid/graphics/RectF;->width()F

    .line 693
    .line 694
    .line 695
    move-result v0

    .line 696
    invoke-virtual {v14}, Landroid/graphics/RectF;->height()F

    .line 697
    .line 698
    .line 699
    move-result v2

    .line 700
    cmpl-float v0, v0, v2

    .line 701
    .line 702
    if-lez v0, :cond_19

    .line 703
    .line 704
    move/from16 v7, v16

    .line 705
    .line 706
    goto :goto_13

    .line 707
    :cond_19
    const/4 v7, 0x0

    .line 708
    :goto_13
    iget-object v0, v8, Lcom/android/launcher3/anim/P;->g:Lcom/android/launcher3/h0;

    .line 709
    .line 710
    const-string v2, "mLauncher.deviceProfile"

    .line 711
    .line 712
    invoke-static {v0, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 713
    .line 714
    .line 715
    new-instance v0, LU0/c;

    .line 716
    .line 717
    iget-object v2, v8, Lcom/android/launcher3/anim/P;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 718
    .line 719
    iget-object v3, v8, Lcom/android/launcher3/anim/P;->g:Lcom/android/launcher3/h0;

    .line 720
    .line 721
    invoke-direct {v0, v2, v3}, LU0/c;-><init>(Lcom/android/launcher3/C2;Lcom/android/launcher3/h0;)V

    .line 722
    .line 723
    .line 724
    if-nez v18, :cond_1a

    .line 725
    .line 726
    xor-int/lit8 v3, v7, 0x1

    .line 727
    .line 728
    const/16 v6, 0x10

    .line 729
    .line 730
    const/4 v7, 0x0

    .line 731
    const/4 v5, 0x0

    .line 732
    move-object/from16 v2, p5

    .line 733
    .line 734
    move/from16 v4, v17

    .line 735
    .line 736
    invoke-static/range {v0 .. v7}, LU0/c;->j(LU0/c;Lcom/android/launcher3/views/FloatingIconView;Landroid/view/View;ZIZILjava/lang/Object;)V

    .line 737
    .line 738
    .line 739
    goto :goto_14

    .line 740
    :cond_1a
    move-object/from16 v2, p5

    .line 741
    .line 742
    :goto_14
    invoke-virtual {v8}, Lcom/android/launcher3/anim/N;->f()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 743
    .line 744
    .line 745
    move-result-object v3

    .line 746
    invoke-static {v3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 747
    .line 748
    .line 749
    invoke-virtual {v3, v0}, Lcom/android/quickstep/util/animation/AnimationRecord;->setIconLayerHolder(LU0/c;)V

    .line 750
    .line 751
    .line 752
    move-object/from16 v29, v12

    .line 753
    .line 754
    :goto_15
    invoke-virtual {v8}, Lcom/android/launcher3/anim/N;->f()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 755
    .line 756
    .line 757
    move-result-object v0

    .line 758
    if-eqz v0, :cond_1b

    .line 759
    .line 760
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/AnimationRecord;->getMIconLayerHolder()LU0/c;

    .line 761
    .line 762
    .line 763
    move-result-object v0

    .line 764
    if-eqz v0, :cond_1b

    .line 765
    .line 766
    const/4 v3, 0x0

    .line 767
    invoke-virtual {v0, v2, v3}, LU0/c;->k(Landroid/view/View;Z)V

    .line 768
    .line 769
    .line 770
    :cond_1b
    const/16 v33, 0x0

    .line 771
    .line 772
    const/16 v34, 0x0

    .line 773
    .line 774
    const/16 v30, 0x0

    .line 775
    .line 776
    const/16 v31, 0x0

    .line 777
    .line 778
    const/16 v32, 0x0

    .line 779
    .line 780
    invoke-virtual/range {v29 .. v34}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setVelocity(FFFFF)V

    .line 781
    .line 782
    .line 783
    move-object/from16 v0, v29

    .line 784
    .line 785
    iget-object v3, v8, Lcom/android/launcher3/anim/P;->g:Lcom/android/launcher3/h0;

    .line 786
    .line 787
    iget-boolean v3, v3, Lcom/android/launcher3/h0;->O0:Z

    .line 788
    .line 789
    if-eqz v3, :cond_1c

    .line 790
    .line 791
    move/from16 v5, v21

    .line 792
    .line 793
    goto :goto_16

    .line 794
    :cond_1c
    iget-object v3, v8, Lcom/android/launcher3/anim/P;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 795
    .line 796
    invoke-static {v3}, Lcom/android/systemui/shared/system/QuickStepContract;->getWindowCornerRadius(Landroid/content/Context;)F

    .line 797
    .line 798
    .line 799
    move-result v5

    .line 800
    :goto_16
    if-eqz v18, :cond_1e

    .line 801
    .line 802
    if-eqz v13, :cond_1d

    .line 803
    .line 804
    invoke-virtual {v13}, Lcom/android/quickstep/views/FloatingWidgetView;->getInitialCornerRadius()F

    .line 805
    .line 806
    .line 807
    move-result v3

    .line 808
    const/4 v4, 0x0

    .line 809
    goto :goto_18

    .line 810
    :cond_1d
    invoke-virtual {v9}, Landroid/graphics/RectF;->width()F

    .line 811
    .line 812
    .line 813
    move-result v3

    .line 814
    const/4 v4, 0x0

    .line 815
    invoke-virtual {v15, v2, v4}, Lcom/android/launcher3/anim/C;->P(Landroid/view/View;Z)F

    .line 816
    .line 817
    .line 818
    move-result v6

    .line 819
    goto :goto_17

    .line 820
    :cond_1e
    const/4 v4, 0x0

    .line 821
    invoke-virtual {v9}, Landroid/graphics/RectF;->width()F

    .line 822
    .line 823
    .line 824
    move-result v3

    .line 825
    invoke-virtual {v15, v2, v4}, Lcom/android/launcher3/anim/C;->P(Landroid/view/View;Z)F

    .line 826
    .line 827
    .line 828
    move-result v6

    .line 829
    :goto_17
    mul-float/2addr v3, v6

    .line 830
    :goto_18
    invoke-virtual {v0, v5}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setStartRadius(F)V

    .line 831
    .line 832
    .line 833
    invoke-virtual {v0, v3}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setEndRadius(F)V

    .line 834
    .line 835
    .line 836
    if-eqz v1, :cond_1f

    .line 837
    .line 838
    new-instance v3, Lcom/android/launcher3/anim/P$a;

    .line 839
    .line 840
    invoke-direct {v3, v8, v0}, Lcom/android/launcher3/anim/P$a;-><init>(Lcom/android/launcher3/anim/P;Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V

    .line 841
    .line 842
    .line 843
    invoke-virtual {v1, v3}, Lcom/android/launcher3/views/FloatingIconView;->setFastFinishRunnable(Ljava/lang/Runnable;)V

    .line 844
    .line 845
    .line 846
    move/from16 v3, v16

    .line 847
    .line 848
    invoke-virtual {v1, v3}, Lcom/android/launcher3/views/FloatingIconView;->t(Z)Lcom/android/launcher3/anim/U;

    .line 849
    .line 850
    .line 851
    move-result-object v4

    .line 852
    invoke-virtual {v0, v4}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->addAnimatorListener(Lcom/android/launcher3/anim/T;)V

    .line 853
    .line 854
    .line 855
    :cond_1f
    if-eqz v13, :cond_20

    .line 856
    .line 857
    new-instance v3, Lcom/android/launcher3/anim/P$b;

    .line 858
    .line 859
    invoke-direct {v3, v8, v0}, Lcom/android/launcher3/anim/P$b;-><init>(Lcom/android/launcher3/anim/P;Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V

    .line 860
    .line 861
    .line 862
    invoke-virtual {v13, v3}, Lcom/android/quickstep/views/FloatingWidgetView;->setFastFinishRunnable(Ljava/lang/Runnable;)V

    .line 863
    .line 864
    .line 865
    invoke-virtual {v0, v13}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->addAnimatorListener(Lcom/android/launcher3/anim/T;)V

    .line 866
    .line 867
    .line 868
    invoke-virtual {v13}, Lcom/android/quickstep/views/FloatingWidgetView;->isAlreadySetDelayedFinishRunnable()Z

    .line 869
    .line 870
    .line 871
    move-result v3

    .line 872
    if-nez v3, :cond_20

    .line 873
    .line 874
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setNeedDelayedAnimation()V

    .line 875
    .line 876
    .line 877
    new-instance v3, Lcom/android/launcher3/anim/O;

    .line 878
    .line 879
    invoke-direct {v3, v0}, Lcom/android/launcher3/anim/O;-><init>(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V

    .line 880
    .line 881
    .line 882
    invoke-virtual {v13, v3, v10}, Lcom/android/quickstep/views/FloatingWidgetView;->setDelayedFinishRunnable(Ljava/lang/Runnable;Lcom/android/quickstep/util/animation/MultiAnimatorSet;)V

    .line 883
    .line 884
    .line 885
    :cond_20
    new-instance v14, Landroid/graphics/RectF;

    .line 886
    .line 887
    invoke-direct {v14}, Landroid/graphics/RectF;-><init>()V

    .line 888
    .line 889
    .line 890
    new-instance v3, Lcom/android/quickstep/RemoteAnimationTargets;

    .line 891
    .line 892
    move-object/from16 v12, p1

    .line 893
    .line 894
    move-object/from16 v4, p2

    .line 895
    .line 896
    move-object/from16 v5, p3

    .line 897
    .line 898
    const/4 v6, 0x1

    .line 899
    invoke-direct {v3, v12, v4, v5, v6}, Lcom/android/quickstep/RemoteAnimationTargets;-><init>([Lu2/s;[Lu2/s;[Lu2/s;I)V

    .line 900
    .line 901
    .line 902
    new-instance v4, Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 903
    .line 904
    iget-object v5, v8, Lcom/android/launcher3/anim/P;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 905
    .line 906
    invoke-virtual {v5}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 907
    .line 908
    .line 909
    move-result-object v5

    .line 910
    invoke-direct {v4, v5}, Lcom/android/quickstep/util/SurfaceTransactionApplier;-><init>(Landroid/view/View;)V

    .line 911
    .line 912
    .line 913
    invoke-virtual {v3, v4}, Lcom/android/quickstep/RemoteAnimationTargets;->addReleaseCheck(Lcom/android/quickstep/RemoteAnimationTargets$ReleaseCheck;)V

    .line 914
    .line 915
    .line 916
    iget-object v5, v8, Lcom/android/launcher3/anim/P;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 917
    .line 918
    invoke-virtual {v5}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 919
    .line 920
    .line 921
    move-result-object v5

    .line 922
    invoke-virtual {v5}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 923
    .line 924
    .line 925
    move-result-object v5

    .line 926
    check-cast v5, Lcom/android/launcher3/V3;

    .line 927
    .line 928
    new-instance v6, Landroid/graphics/RectF;

    .line 929
    .line 930
    invoke-direct {v6}, Landroid/graphics/RectF;-><init>()V

    .line 931
    .line 932
    .line 933
    new-instance v5, Lcom/android/quickstep/util/animation/RectTransformHelper;

    .line 934
    .line 935
    sget-object v7, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;->REMOTE_CLOSE_TO_HOME:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 936
    .line 937
    move-object/from16 v11, p4

    .line 938
    .line 939
    invoke-direct {v5, v11, v11, v7}, Lcom/android/quickstep/util/animation/RectTransformHelper;-><init>(Landroid/graphics/RectF;Landroid/graphics/RectF;Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;)V

    .line 940
    .line 941
    .line 942
    new-instance v10, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;

    .line 943
    .line 944
    invoke-direct {v10}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;-><init>()V

    .line 945
    .line 946
    .line 947
    invoke-virtual {v9}, Landroid/graphics/RectF;->width()F

    .line 948
    .line 949
    .line 950
    move-result v7

    .line 951
    invoke-virtual {v10, v7}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->setOriginWidth(F)V

    .line 952
    .line 953
    .line 954
    invoke-virtual {v9}, Landroid/graphics/RectF;->height()F

    .line 955
    .line 956
    .line 957
    move-result v7

    .line 958
    invoke-virtual {v10, v7}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->setOriginHeight(F)V

    .line 959
    .line 960
    .line 961
    invoke-virtual {v10, v4}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->setSurfaceTransactionApplier(Lcom/android/quickstep/util/SurfaceTransactionApplier;)V

    .line 962
    .line 963
    .line 964
    move/from16 v11, v18

    .line 965
    .line 966
    const/4 v7, 0x0

    .line 967
    invoke-virtual {v5, v10, v9, v7, v11}, Lcom/android/quickstep/util/animation/RectTransformHelper;->getWindowCropStrategy(Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;Landroid/graphics/RectF;IZ)V

    .line 968
    .line 969
    .line 970
    invoke-virtual {v8}, Lcom/android/launcher3/anim/N;->f()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 971
    .line 972
    .line 973
    move-result-object v7

    .line 974
    if-eqz v7, :cond_21

    .line 975
    .line 976
    invoke-virtual {v10}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->getIsVerticalClip()Z

    .line 977
    .line 978
    .line 979
    move-result v15

    .line 980
    invoke-virtual {v7, v15}, Lcom/android/quickstep/util/animation/AnimationRecord;->setMIsVerticalClip(Z)V

    .line 981
    .line 982
    .line 983
    invoke-virtual {v10}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->getIsClipFromLeftOrTop()Z

    .line 984
    .line 985
    .line 986
    move-result v15

    .line 987
    invoke-virtual {v7, v15}, Lcom/android/quickstep/util/animation/AnimationRecord;->setMIsClipFromLeftOrTop(Z)V

    .line 988
    .line 989
    .line 990
    :cond_21
    new-instance v7, Lcom/android/quickstep/utils/CreateTransactionHelper;

    .line 991
    .line 992
    invoke-direct {v7}, Lcom/android/quickstep/utils/CreateTransactionHelper;-><init>()V

    .line 993
    .line 994
    .line 995
    invoke-direct {v8, v2, v0}, Lcom/android/launcher3/anim/P;->m(Landroid/view/View;Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V

    .line 996
    .line 997
    .line 998
    if-eqz p7, :cond_22

    .line 999
    .line 1000
    invoke-virtual/range {p7 .. p7}, Lcom/android/launcher3/M2$a;->r2()Lu2/s$a;

    .line 1001
    .line 1002
    .line 1003
    move-result-object v22

    .line 1004
    :cond_22
    move-object/from16 p8, v1

    .line 1005
    .line 1006
    move-object/from16 v15, v22

    .line 1007
    .line 1008
    move-object/from16 v1, v28

    .line 1009
    .line 1010
    invoke-virtual {v0, v15, v5, v1, v10}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->initFirstFrameForBreakScene(Lu2/s$a;Lcom/android/quickstep/util/animation/RectTransformHelper;Landroid/graphics/Matrix;Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;)V

    .line 1011
    .line 1012
    .line 1013
    if-eqz v20, :cond_23

    .line 1014
    .line 1015
    move/from16 v17, v21

    .line 1016
    .line 1017
    goto :goto_19

    .line 1018
    :cond_23
    move/from16 v17, v26

    .line 1019
    .line 1020
    :goto_19
    iget-object v15, v8, Lcom/android/launcher3/anim/P;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 1021
    .line 1022
    invoke-virtual {v15}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 1023
    .line 1024
    .line 1025
    move-result-object v15

    .line 1026
    invoke-virtual {v15}, Landroid/view/ViewGroup;->getScrollX()I

    .line 1027
    .line 1028
    .line 1029
    move-result v15

    .line 1030
    int-to-float v15, v15

    .line 1031
    move-object/from16 v29, v0

    .line 1032
    .line 1033
    new-instance v0, Lcom/android/launcher3/anim/P$c;

    .line 1034
    .line 1035
    move-object/from16 v16, v5

    .line 1036
    .line 1037
    move-object v5, v1

    .line 1038
    move-object v1, v8

    .line 1039
    move v8, v11

    .line 1040
    move-object v11, v9

    .line 1041
    move-object/from16 v9, v16

    .line 1042
    .line 1043
    move-object/from16 v18, v2

    .line 1044
    .line 1045
    move-object/from16 v20, v4

    .line 1046
    .line 1047
    move-object/from16 v16, v13

    .line 1048
    .line 1049
    move/from16 v2, v19

    .line 1050
    .line 1051
    move-object/from16 v4, v27

    .line 1052
    .line 1053
    move-object/from16 v35, v29

    .line 1054
    .line 1055
    move-object/from16 v13, p7

    .line 1056
    .line 1057
    move-object/from16 v19, v3

    .line 1058
    .line 1059
    move v3, v15

    .line 1060
    move-object/from16 v15, p8

    .line 1061
    .line 1062
    invoke-direct/range {v0 .. v18}, Lcom/android/launcher3/anim/P$c;-><init>(Lcom/android/launcher3/anim/P;ZFLjava/util/concurrent/atomic/AtomicBoolean;Landroid/graphics/Matrix;Landroid/graphics/RectF;Lcom/android/quickstep/utils/CreateTransactionHelper;ZLcom/android/quickstep/util/animation/RectTransformHelper;Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;Landroid/graphics/RectF;[Lu2/s;Lcom/android/launcher3/M2$a;Landroid/graphics/RectF;Lcom/android/launcher3/views/FloatingIconView;Lcom/android/quickstep/views/FloatingWidgetView;FLandroid/view/View;)V

    .line 1063
    .line 1064
    .line 1065
    move-object v7, v1

    .line 1066
    move-object v1, v0

    .line 1067
    move-object v0, v7

    .line 1068
    move-object/from16 v7, v18

    .line 1069
    .line 1070
    move-object/from16 v12, v35

    .line 1071
    .line 1072
    invoke-virtual {v12, v1}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->addOnUpdateListener(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$OnAnimUpdateListener;)V

    .line 1073
    .line 1074
    .line 1075
    new-instance v6, Lcom/android/launcher3/anim/P$d;

    .line 1076
    .line 1077
    invoke-direct {v6, v0, v15}, Lcom/android/launcher3/anim/P$d;-><init>(Lcom/android/launcher3/anim/P;Lcom/android/launcher3/views/FloatingIconView;)V

    .line 1078
    .line 1079
    .line 1080
    const/4 v5, 0x0

    .line 1081
    move-object/from16 v1, p1

    .line 1082
    .line 1083
    move-object/from16 v3, v19

    .line 1084
    .line 1085
    move-object/from16 v2, v20

    .line 1086
    .line 1087
    move/from16 v4, v24

    .line 1088
    .line 1089
    invoke-virtual/range {v0 .. v6}, Lcom/android/launcher3/anim/N;->c([Lu2/s;Lcom/android/quickstep/util/SurfaceTransactionApplier;Lcom/android/quickstep/RemoteAnimationTargets;ZLu4/a;Lu4/l;)Lcom/android/launcher3/anim/U;

    .line 1090
    .line 1091
    .line 1092
    move-result-object v1

    .line 1093
    invoke-virtual {v12, v1}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->addAnimatorListener(Lcom/android/launcher3/anim/T;)V

    .line 1094
    .line 1095
    .line 1096
    new-instance v1, Lcom/android/launcher3/anim/P$e;

    .line 1097
    .line 1098
    invoke-direct {v1, v0, v7}, Lcom/android/launcher3/anim/P$e;-><init>(Lcom/android/launcher3/anim/P;Landroid/view/View;)V

    .line 1099
    .line 1100
    .line 1101
    move-object/from16 v10, p6

    .line 1102
    .line 1103
    invoke-virtual {v10, v1}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->addListener(Lcom/android/launcher3/anim/T;)V

    .line 1104
    .line 1105
    .line 1106
    invoke-virtual {v10, v12}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->play(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V

    .line 1107
    .line 1108
    .line 1109
    iput-object v12, v0, Lcom/android/launcher3/anim/P;->f:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 1110
    .line 1111
    return-void
.end method

.method public s(Landroid/view/View;[Lu2/s;[Lu2/s;[Lu2/s;Landroid/graphics/Rect;ZILcom/android/quickstep/util/animation/MultiAnimatorSet;Lcom/android/launcher3/M2$a;)V
    .locals 34

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v7, p1

    .line 4
    .line 5
    move-object/from16 v14, p2

    .line 6
    .line 7
    move-object/from16 v8, p8

    .line 8
    .line 9
    new-instance v1, Lkotlin/jvm/internal/z;

    .line 10
    .line 11
    invoke-direct {v1}, Lkotlin/jvm/internal/z;-><init>()V

    .line 12
    .line 13
    .line 14
    iget-object v1, v0, Lcom/android/launcher3/anim/P;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 15
    .line 16
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iput-object v1, v0, Lcom/android/launcher3/anim/P;->g:Lcom/android/launcher3/h0;

    .line 21
    .line 22
    iget-object v1, v0, Lcom/android/launcher3/anim/P;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 23
    .line 24
    invoke-static {v1}, Lcom/android/systemui/shared/system/QuickStepContract;->getWindowCornerRadius(Landroid/content/Context;)F

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    const/4 v10, 0x1

    .line 29
    if-eqz v7, :cond_0

    .line 30
    .line 31
    instance-of v2, v7, Lcom/android/launcher3/shortcuts/DeepShortcutView;

    .line 32
    .line 33
    if-nez v2, :cond_0

    .line 34
    .line 35
    move v2, v1

    .line 36
    move v1, v10

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    move v2, v1

    .line 39
    const/4 v1, 0x0

    .line 40
    :goto_0
    instance-of v11, v7, Lcom/android/launcher3/widget/T;

    .line 41
    .line 42
    new-instance v3, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 45
    .line 46
    .line 47
    const-string v4, "findClickedView = "

    .line 48
    .line 49
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string v4, ", null = "

    .line 56
    .line 57
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    if-nez v7, :cond_1

    .line 61
    .line 62
    move v4, v10

    .line 63
    goto :goto_1

    .line 64
    :cond_1
    const/4 v4, 0x0

    .line 65
    :goto_1
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    const-string v4, "MFVLauncherAppTransitionHelper"

    .line 73
    .line 74
    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    .line 76
    .line 77
    sget-object v12, Lcom/android/quickstep/utils/MFVAnimManager;->INSTANCE:Lcom/android/quickstep/utils/MFVAnimManager;

    .line 78
    .line 79
    invoke-virtual {v12}, Lcom/android/quickstep/utils/MFVAnimManager;->getAnimController()Lcom/android/quickstep/utils/DefaultAnimationController;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    invoke-virtual {v3}, Lcom/android/quickstep/utils/DefaultAnimationController;->getAnimState()Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 84
    .line 85
    .line 86
    move-result-object v13

    .line 87
    new-instance v4, Landroid/graphics/RectF;

    .line 88
    .line 89
    invoke-direct {v4}, Landroid/graphics/RectF;-><init>()V

    .line 90
    .line 91
    .line 92
    new-instance v3, Landroid/graphics/RectF;

    .line 93
    .line 94
    invoke-direct {v3}, Landroid/graphics/RectF;-><init>()V

    .line 95
    .line 96
    .line 97
    if-eqz v1, :cond_2

    .line 98
    .line 99
    move-object v6, v7

    .line 100
    goto :goto_2

    .line 101
    :cond_2
    const/4 v6, 0x0

    .line 102
    :goto_2
    invoke-virtual {v0}, Lcom/android/launcher3/anim/N;->e()LU0/a;

    .line 103
    .line 104
    .line 105
    move-result-object v15

    .line 106
    invoke-interface {v15, v6}, LU0/a;->d(Landroid/view/View;)I

    .line 107
    .line 108
    .line 109
    move-result v22

    .line 110
    invoke-virtual {v0}, Lcom/android/launcher3/anim/N;->e()LU0/a;

    .line 111
    .line 112
    .line 113
    move-result-object v15

    .line 114
    invoke-interface {v15, v6}, LU0/a;->b(Landroid/view/View;)Z

    .line 115
    .line 116
    .line 117
    move-result v23

    .line 118
    invoke-virtual {v12}, Lcom/android/quickstep/utils/MFVAnimManager;->supportInterruption()Z

    .line 119
    .line 120
    .line 121
    move-result v15

    .line 122
    if-eqz v15, :cond_3

    .line 123
    .line 124
    sget-object v15, Lcom/android/quickstep/utils/AnimationController$AnimationState;->NONE:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 125
    .line 126
    if-eq v13, v15, :cond_3

    .line 127
    .line 128
    move/from16 v24, v10

    .line 129
    .line 130
    goto :goto_3

    .line 131
    :cond_3
    const/16 v24, 0x0

    .line 132
    .line 133
    :goto_3
    if-eqz v1, :cond_4

    .line 134
    .line 135
    if-nez v11, :cond_5

    .line 136
    .line 137
    iget-object v15, v0, Lcom/android/launcher3/anim/P;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 138
    .line 139
    new-instance v5, Landroid/graphics/Rect;

    .line 140
    .line 141
    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    .line 142
    .line 143
    .line 144
    invoke-static {v15, v7, v10, v4, v5}, Lcom/android/launcher3/views/FloatingIconView;->y(Lcom/android/launcher3/C2;Landroid/view/View;ZLandroid/graphics/RectF;Landroid/graphics/Rect;)V

    .line 145
    .line 146
    .line 147
    goto :goto_4

    .line 148
    :cond_4
    invoke-virtual {v0}, Lcom/android/launcher3/anim/N;->b()Landroid/graphics/RectF;

    .line 149
    .line 150
    .line 151
    move-result-object v5

    .line 152
    invoke-virtual {v3, v5}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {v0}, Lcom/android/launcher3/anim/N;->b()Landroid/graphics/RectF;

    .line 156
    .line 157
    .line 158
    move-result-object v5

    .line 159
    invoke-virtual {v4, v5}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 160
    .line 161
    .line 162
    :cond_5
    :goto_4
    new-instance v5, Landroid/graphics/RectF;

    .line 163
    .line 164
    move-object/from16 v15, p5

    .line 165
    .line 166
    invoke-direct {v5, v15}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 167
    .line 168
    .line 169
    move/from16 v25, v10

    .line 170
    .line 171
    sget-object v10, Lcom/android/launcher3/util/window/d;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 172
    .line 173
    iget-object v9, v0, Lcom/android/launcher3/anim/P;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 174
    .line 175
    invoke-virtual {v10, v9}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    move-result-object v9

    .line 179
    check-cast v9, Lcom/android/launcher3/util/window/d;

    .line 180
    .line 181
    iget-object v10, v0, Lcom/android/launcher3/anim/P;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 182
    .line 183
    invoke-virtual {v9, v10}, Lcom/android/launcher3/util/window/d;->getRotation(Landroid/content/Context;)I

    .line 184
    .line 185
    .line 186
    move-result v9

    .line 187
    new-instance v10, Lcom/android/quickstep/util/TaskViewSimulator;

    .line 188
    .line 189
    move/from16 v16, v1

    .line 190
    .line 191
    iget-object v1, v0, Lcom/android/launcher3/anim/P;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 192
    .line 193
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 194
    .line 195
    .line 196
    move-result-object v17

    .line 197
    check-cast v17, Lcom/android/quickstep/views/RecentsView;

    .line 198
    .line 199
    move/from16 v18, v2

    .line 200
    .line 201
    invoke-virtual/range {v17 .. v17}, Lcom/android/quickstep/views/RecentsView;->getSizeStrategy()Lcom/android/quickstep/BaseContainerInterface;

    .line 202
    .line 203
    .line 204
    move-result-object v2

    .line 205
    move-object/from16 v17, v3

    .line 206
    .line 207
    const/4 v3, 0x0

    .line 208
    invoke-direct {v10, v1, v2, v3, v3}, Lcom/android/quickstep/util/TaskViewSimulator;-><init>(Landroid/content/Context;Lcom/android/quickstep/BaseContainerInterface;ZI)V

    .line 209
    .line 210
    .line 211
    iget-object v1, v0, Lcom/android/launcher3/anim/P;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 212
    .line 213
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 214
    .line 215
    .line 216
    move-result-object v1

    .line 217
    invoke-virtual {v10, v1}, Lcom/android/quickstep/util/TaskViewSimulator;->setDp(Lcom/android/launcher3/h0;)V

    .line 218
    .line 219
    .line 220
    new-instance v1, Landroid/graphics/Matrix;

    .line 221
    .line 222
    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    .line 223
    .line 224
    .line 225
    new-instance v2, Landroid/graphics/Matrix;

    .line 226
    .line 227
    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    .line 228
    .line 229
    .line 230
    invoke-virtual {v10, v1}, Lcom/android/quickstep/util/TaskViewSimulator;->applyWindowToHomeRotation(Landroid/graphics/Matrix;)V

    .line 231
    .line 232
    .line 233
    invoke-virtual {v1, v2}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 234
    .line 235
    .line 236
    new-instance v10, Landroid/graphics/RectF;

    .line 237
    .line 238
    invoke-direct {v10, v5}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 239
    .line 240
    .line 241
    invoke-virtual {v2, v10}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 242
    .line 243
    .line 244
    new-instance v26, Landroid/graphics/RectF;

    .line 245
    .line 246
    invoke-direct/range {v26 .. v26}, Landroid/graphics/RectF;-><init>()V

    .line 247
    .line 248
    .line 249
    iget-object v2, v0, Lcom/android/launcher3/anim/P;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 250
    .line 251
    invoke-virtual {v2}, Landroid/app/Activity;->isInMultiWindowMode()Z

    .line 252
    .line 253
    .line 254
    move-result v2

    .line 255
    if-nez v2, :cond_7

    .line 256
    .line 257
    iget-object v2, v0, Lcom/android/launcher3/anim/P;->g:Lcom/android/launcher3/h0;

    .line 258
    .line 259
    iget-boolean v2, v2, Lcom/android/launcher3/h0;->G0:Z

    .line 260
    .line 261
    if-eqz v2, :cond_6

    .line 262
    .line 263
    goto :goto_5

    .line 264
    :cond_6
    const/4 v2, 0x0

    .line 265
    goto :goto_6

    .line 266
    :cond_7
    :goto_5
    move/from16 v2, v18

    .line 267
    .line 268
    :goto_6
    new-instance v5, Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 269
    .line 270
    invoke-direct {v5, v8, v14, v7}, Lcom/android/quickstep/util/animation/AnimationRecord;-><init>(Lcom/android/quickstep/util/animation/MultiAnimatorSet;[Lu2/s;Landroid/view/View;)V

    .line 271
    .line 272
    .line 273
    invoke-virtual {v0, v5}, Lcom/android/launcher3/anim/N;->j(Lcom/android/quickstep/util/animation/AnimationRecord;)V

    .line 274
    .line 275
    .line 276
    iget-object v5, v0, Lcom/android/launcher3/anim/P;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 277
    .line 278
    invoke-virtual {v5}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->r5()Lcom/android/launcher3/q5;

    .line 279
    .line 280
    .line 281
    move-result-object v5

    .line 282
    if-eqz v5, :cond_8

    .line 283
    .line 284
    iget-object v5, v0, Lcom/android/launcher3/anim/P;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 285
    .line 286
    invoke-virtual {v5}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->r5()Lcom/android/launcher3/q5;

    .line 287
    .line 288
    .line 289
    move-result-object v5

    .line 290
    invoke-virtual {v5, v8}, Lcom/android/launcher3/q5;->Q0(Lcom/android/quickstep/util/animation/MultiAnimatorSet;)V

    .line 291
    .line 292
    .line 293
    :cond_8
    sget-object v5, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 294
    .line 295
    iget-object v3, v0, Lcom/android/launcher3/anim/P;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 296
    .line 297
    invoke-virtual {v3}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 298
    .line 299
    .line 300
    move-result-object v3

    .line 301
    invoke-virtual {v5, v3}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 302
    .line 303
    .line 304
    move-result-object v3

    .line 305
    check-cast v3, Lcom/android/launcher3/anim/C;

    .line 306
    .line 307
    new-instance v5, Landroid/graphics/RectF;

    .line 308
    .line 309
    invoke-direct {v5}, Landroid/graphics/RectF;-><init>()V

    .line 310
    .line 311
    .line 312
    move-object/from16 v28, v1

    .line 313
    .line 314
    if-nez v11, :cond_9

    .line 315
    .line 316
    invoke-virtual {v3}, Lcom/android/launcher3/anim/C;->T()I

    .line 317
    .line 318
    .line 319
    move-result v1

    .line 320
    int-to-float v1, v1

    .line 321
    invoke-virtual {v5, v4}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 322
    .line 323
    .line 324
    move/from16 v18, v1

    .line 325
    .line 326
    instance-of v1, v7, Lcom/android/launcher3/BubbleTextView;

    .line 327
    .line 328
    if-eqz v1, :cond_9

    .line 329
    .line 330
    invoke-virtual {v5}, Landroid/graphics/RectF;->width()F

    .line 331
    .line 332
    .line 333
    move-result v1

    .line 334
    move/from16 v19, v1

    .line 335
    .line 336
    iget-object v1, v0, Lcom/android/launcher3/anim/P;->g:Lcom/android/launcher3/h0;

    .line 337
    .line 338
    iget v1, v1, Lcom/android/launcher3/h0;->B1:I

    .line 339
    .line 340
    int-to-float v1, v1

    .line 341
    div-float v1, v19, v1

    .line 342
    .line 343
    mul-float v1, v1, v18

    .line 344
    .line 345
    invoke-virtual {v5, v1, v1}, Landroid/graphics/RectF;->inset(FF)V

    .line 346
    .line 347
    .line 348
    :cond_9
    invoke-virtual {v0}, Lcom/android/launcher3/anim/N;->g()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 349
    .line 350
    .line 351
    move-result-object v1

    .line 352
    move/from16 v29, v2

    .line 353
    .line 354
    invoke-virtual {v0}, Lcom/android/launcher3/anim/N;->f()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 355
    .line 356
    .line 357
    move-result-object v2

    .line 358
    move-object/from16 v30, v3

    .line 359
    .line 360
    iget-object v3, v0, Lcom/android/launcher3/anim/P;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 361
    .line 362
    move-object/from16 v31, v5

    .line 363
    .line 364
    const/high16 v5, 0x3f800000    # 1.0f

    .line 365
    .line 366
    invoke-virtual {v1, v2, v10, v5, v3}, Lcom/android/quickstep/util/animation/AnimationRecord;->tryConnectExistingAnim(Lcom/android/quickstep/util/animation/AnimationRecord;Landroid/graphics/RectF;FLcom/android/launcher3/C2;)Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 367
    .line 368
    .line 369
    move-result-object v32

    .line 370
    if-nez v32, :cond_13

    .line 371
    .line 372
    if-eqz v11, :cond_e

    .line 373
    .line 374
    new-instance v1, Landroid/util/Size;

    .line 375
    .line 376
    iget-object v2, v0, Lcom/android/launcher3/anim/P;->g:Lcom/android/launcher3/h0;

    .line 377
    .line 378
    iget v3, v2, Lcom/android/launcher3/h0;->V0:I

    .line 379
    .line 380
    iget v2, v2, Lcom/android/launcher3/h0;->W0:I

    .line 381
    .line 382
    invoke-direct {v1, v3, v2}, Landroid/util/Size;-><init>(II)V

    .line 383
    .line 384
    .line 385
    invoke-static {v14}, Lu2/s;->i([Lu2/s;)[Landroid/view/RemoteAnimationTarget;

    .line 386
    .line 387
    .line 388
    move-result-object v2

    .line 389
    array-length v3, v2

    .line 390
    move/from16 v4, v25

    .line 391
    .line 392
    const/4 v5, 0x0

    .line 393
    :goto_7
    move-object/from16 v18, v1

    .line 394
    .line 395
    if-ge v5, v3, :cond_b

    .line 396
    .line 397
    aget-object v1, v2, v5

    .line 398
    .line 399
    move-object/from16 p6, v2

    .line 400
    .line 401
    iget v2, v1, Landroid/view/RemoteAnimationTarget;->mode:I

    .line 402
    .line 403
    if-nez v2, :cond_a

    .line 404
    .line 405
    iget-boolean v1, v1, Landroid/view/RemoteAnimationTarget;->isTranslucent:Z

    .line 406
    .line 407
    and-int/2addr v1, v4

    .line 408
    move v4, v1

    .line 409
    :cond_a
    if-nez v4, :cond_c

    .line 410
    .line 411
    :cond_b
    move/from16 v20, v4

    .line 412
    .line 413
    goto :goto_8

    .line 414
    :cond_c
    add-int/lit8 v5, v5, 0x1

    .line 415
    .line 416
    move-object/from16 v2, p6

    .line 417
    .line 418
    move-object/from16 v1, v18

    .line 419
    .line 420
    goto :goto_7

    .line 421
    :goto_8
    iget-object v1, v0, Lcom/android/launcher3/anim/P;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 422
    .line 423
    const/4 v2, 0x0

    .line 424
    invoke-static {v1, v2}, Lcom/android/quickstep/views/FloatingWidgetView;->getDefaultBackgroundColor(Landroid/content/Context;Landroid/view/RemoteAnimationTarget;)I

    .line 425
    .line 426
    .line 427
    move-result v21

    .line 428
    iget-object v15, v0, Lcom/android/launcher3/anim/P;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 429
    .line 430
    move-object/from16 v16, v6

    .line 431
    .line 432
    check-cast v16, Lcom/android/launcher3/widget/T;

    .line 433
    .line 434
    iget-object v1, v0, Lcom/android/launcher3/anim/P;->g:Lcom/android/launcher3/h0;

    .line 435
    .line 436
    iget-boolean v1, v1, Lcom/android/launcher3/h0;->O0:Z

    .line 437
    .line 438
    if-eqz v1, :cond_d

    .line 439
    .line 440
    const/16 v19, 0x0

    .line 441
    .line 442
    goto :goto_9

    .line 443
    :cond_d
    invoke-static {v15}, Lcom/android/systemui/shared/system/QuickStepContract;->getWindowCornerRadius(Landroid/content/Context;)F

    .line 444
    .line 445
    .line 446
    move-result v1

    .line 447
    move/from16 v19, v1

    .line 448
    .line 449
    :goto_9
    invoke-static/range {v15 .. v21}, Lcom/android/quickstep/views/FloatingWidgetView;->getFloatingWidgetView(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/launcher3/widget/T;Landroid/graphics/RectF;Landroid/util/Size;FZI)Lcom/android/quickstep/views/FloatingWidgetView;

    .line 450
    .line 451
    .line 452
    move-result-object v1

    .line 453
    move-object v5, v2

    .line 454
    move-object v15, v5

    .line 455
    move/from16 v21, v11

    .line 456
    .line 457
    move-object/from16 p7, v12

    .line 458
    .line 459
    move-object/from16 v16, v17

    .line 460
    .line 461
    move/from16 v11, v29

    .line 462
    .line 463
    move-object/from16 v8, v31

    .line 464
    .line 465
    const/high16 v12, 0x3f800000    # 1.0f

    .line 466
    .line 467
    const/16 v27, 0x0

    .line 468
    .line 469
    move-object v2, v1

    .line 470
    move-object/from16 v17, v6

    .line 471
    .line 472
    move/from16 v6, v23

    .line 473
    .line 474
    move/from16 v1, v24

    .line 475
    .line 476
    goto :goto_a

    .line 477
    :cond_e
    const/4 v2, 0x0

    .line 478
    const/4 v5, 0x1

    .line 479
    move/from16 v3, p6

    .line 480
    .line 481
    move-object v15, v2

    .line 482
    move-object v2, v7

    .line 483
    move/from16 v21, v11

    .line 484
    .line 485
    move-object/from16 p7, v12

    .line 486
    .line 487
    move/from16 v1, v16

    .line 488
    .line 489
    move-object/from16 v16, v17

    .line 490
    .line 491
    move/from16 v7, v24

    .line 492
    .line 493
    move/from16 v11, v29

    .line 494
    .line 495
    move-object/from16 v8, v31

    .line 496
    .line 497
    const/high16 v12, 0x3f800000    # 1.0f

    .line 498
    .line 499
    const/16 v27, 0x0

    .line 500
    .line 501
    move-object/from16 v17, v6

    .line 502
    .line 503
    move/from16 v6, v23

    .line 504
    .line 505
    invoke-direct/range {v0 .. v7}, Lcom/android/launcher3/anim/P;->n(ZLandroid/view/View;ZLandroid/graphics/RectF;ZZZ)Lcom/android/launcher3/views/FloatingIconView;

    .line 506
    .line 507
    .line 508
    move-result-object v5

    .line 509
    move v1, v7

    .line 510
    move-object v7, v2

    .line 511
    move-object v2, v15

    .line 512
    :goto_a
    iget-object v3, v0, Lcom/android/launcher3/anim/P;->g:Lcom/android/launcher3/h0;

    .line 513
    .line 514
    iget-boolean v3, v3, Lcom/android/launcher3/h0;->N0:Z

    .line 515
    .line 516
    if-eqz v3, :cond_f

    .line 517
    .line 518
    invoke-virtual/range {p5 .. p5}, Landroid/graphics/Rect;->width()I

    .line 519
    .line 520
    .line 521
    move-result v3

    .line 522
    invoke-virtual/range {p5 .. p5}, Landroid/graphics/Rect;->height()I

    .line 523
    .line 524
    .line 525
    move-result v4

    .line 526
    if-le v3, v4, :cond_f

    .line 527
    .line 528
    move/from16 v3, v25

    .line 529
    .line 530
    :goto_b
    move-object v4, v15

    .line 531
    goto :goto_c

    .line 532
    :cond_f
    const/4 v3, 0x0

    .line 533
    goto :goto_b

    .line 534
    :goto_c
    new-instance v15, LU0/c;

    .line 535
    .line 536
    iget-object v4, v0, Lcom/android/launcher3/anim/P;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 537
    .line 538
    iget-object v12, v0, Lcom/android/launcher3/anim/P;->g:Lcom/android/launcher3/h0;

    .line 539
    .line 540
    invoke-direct {v15, v4, v12}, LU0/c;-><init>(Lcom/android/launcher3/C2;Lcom/android/launcher3/h0;)V

    .line 541
    .line 542
    .line 543
    xor-int/lit8 v18, v3, 0x1

    .line 544
    .line 545
    if-nez v21, :cond_12

    .line 546
    .line 547
    xor-int/lit8 v20, v1, 0x1

    .line 548
    .line 549
    move-object/from16 v1, v16

    .line 550
    .line 551
    move/from16 v19, v22

    .line 552
    .line 553
    move/from16 v3, v27

    .line 554
    .line 555
    const/4 v4, 0x0

    .line 556
    move-object/from16 v16, v5

    .line 557
    .line 558
    invoke-virtual/range {v15 .. v20}, LU0/c;->i(Lcom/android/launcher3/views/FloatingIconView;Landroid/view/View;ZIZ)V

    .line 559
    .line 560
    .line 561
    invoke-virtual {v0}, Lcom/android/launcher3/anim/N;->g()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 562
    .line 563
    .line 564
    move-result-object v5

    .line 565
    invoke-virtual {v5, v15}, Lcom/android/quickstep/util/animation/AnimationRecord;->setIconLayerHolder(LU0/c;)V

    .line 566
    .line 567
    .line 568
    new-instance v5, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 569
    .line 570
    new-instance v12, Landroid/graphics/PointF;

    .line 571
    .line 572
    const/high16 v15, 0x3f800000    # 1.0f

    .line 573
    .line 574
    invoke-direct {v12, v3, v15}, Landroid/graphics/PointF;-><init>(FF)V

    .line 575
    .line 576
    .line 577
    invoke-direct {v5, v8, v10, v12, v6}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;-><init>(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/PointF;Z)V

    .line 578
    .line 579
    .line 580
    invoke-virtual {v5, v11}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setStartRadius(F)V

    .line 581
    .line 582
    .line 583
    sget-boolean v11, Lx1/O;->T:Z

    .line 584
    .line 585
    if-eqz v11, :cond_11

    .line 586
    .line 587
    invoke-static {v7}, Lp1/f;->t(Landroid/view/View;)Z

    .line 588
    .line 589
    .line 590
    move-result v11

    .line 591
    if-nez v11, :cond_10

    .line 592
    .line 593
    invoke-static {v7}, Lp1/f;->y(Landroid/view/View;)Z

    .line 594
    .line 595
    .line 596
    move-result v11

    .line 597
    if-eqz v11, :cond_11

    .line 598
    .line 599
    :cond_10
    const/4 v11, 0x2

    .line 600
    goto :goto_d

    .line 601
    :cond_11
    sget-object v11, Lcom/android/quickstep/util/animation/RectTransformHelper;->INSTANCE:Lcom/android/quickstep/util/animation/RectTransformHelper$Companion;

    .line 602
    .line 603
    iget-object v12, v0, Lcom/android/launcher3/anim/P;->g:Lcom/android/launcher3/h0;

    .line 604
    .line 605
    iget v12, v12, Lcom/android/launcher3/h0;->U0:I

    .line 606
    .line 607
    invoke-virtual {v11, v12, v8}, Lcom/android/quickstep/util/animation/RectTransformHelper$Companion;->getTracking(ILandroid/graphics/RectF;)I

    .line 608
    .line 609
    .line 610
    move-result v11

    .line 611
    :goto_d
    invoke-virtual {v5, v11}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setTracking(I)V

    .line 612
    .line 613
    .line 614
    goto :goto_e

    .line 615
    :cond_12
    move-object/from16 v1, v16

    .line 616
    .line 617
    move/from16 v3, v27

    .line 618
    .line 619
    const/4 v4, 0x0

    .line 620
    move-object/from16 v16, v5

    .line 621
    .line 622
    new-instance v5, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 623
    .line 624
    new-instance v12, Landroid/graphics/PointF;

    .line 625
    .line 626
    const/high16 v15, 0x3f800000    # 1.0f

    .line 627
    .line 628
    invoke-direct {v12, v3, v15}, Landroid/graphics/PointF;-><init>(FF)V

    .line 629
    .line 630
    .line 631
    invoke-direct {v5, v1, v10, v12, v6}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;-><init>(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/PointF;Z)V

    .line 632
    .line 633
    .line 634
    invoke-virtual {v5, v11}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setStartRadius(F)V

    .line 635
    .line 636
    .line 637
    sget-object v11, Lcom/android/quickstep/util/animation/RectTransformHelper;->INSTANCE:Lcom/android/quickstep/util/animation/RectTransformHelper$Companion;

    .line 638
    .line 639
    iget-object v12, v0, Lcom/android/launcher3/anim/P;->g:Lcom/android/launcher3/h0;

    .line 640
    .line 641
    iget v12, v12, Lcom/android/launcher3/h0;->U0:I

    .line 642
    .line 643
    invoke-virtual {v11, v12, v1}, Lcom/android/quickstep/util/animation/RectTransformHelper$Companion;->getTracking(ILandroid/graphics/RectF;)I

    .line 644
    .line 645
    .line 646
    move-result v11

    .line 647
    invoke-virtual {v5, v11}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setTracking(I)V

    .line 648
    .line 649
    .line 650
    :goto_e
    move-object v11, v2

    .line 651
    move-object v2, v5

    .line 652
    move-object/from16 v5, v16

    .line 653
    .line 654
    goto :goto_10

    .line 655
    :cond_13
    move/from16 v21, v11

    .line 656
    .line 657
    move-object/from16 p7, v12

    .line 658
    .line 659
    move-object/from16 v1, v17

    .line 660
    .line 661
    move/from16 v6, v23

    .line 662
    .line 663
    move-object/from16 v8, v31

    .line 664
    .line 665
    const/4 v3, 0x0

    .line 666
    const/4 v4, 0x0

    .line 667
    invoke-virtual {v0}, Lcom/android/launcher3/anim/N;->g()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 668
    .line 669
    .line 670
    move-result-object v2

    .line 671
    invoke-virtual {v2}, Lcom/android/quickstep/util/animation/AnimationRecord;->getMIconLayerHolder()LU0/c;

    .line 672
    .line 673
    .line 674
    move-result-object v2

    .line 675
    if-eqz v2, :cond_14

    .line 676
    .line 677
    invoke-virtual {v2}, LU0/c;->c()Lcom/android/launcher3/views/FloatingIconView;

    .line 678
    .line 679
    .line 680
    move-result-object v5

    .line 681
    goto :goto_f

    .line 682
    :cond_14
    move-object v5, v4

    .line 683
    :goto_f
    if-eqz v5, :cond_15

    .line 684
    .line 685
    invoke-virtual {v5, v4}, Lcom/android/launcher3/views/FloatingIconView;->setFastFinishRunnable(Ljava/lang/Runnable;)V

    .line 686
    .line 687
    .line 688
    :cond_15
    move-object v11, v4

    .line 689
    move-object/from16 v2, v32

    .line 690
    .line 691
    :goto_10
    if-eqz v21, :cond_17

    .line 692
    .line 693
    move/from16 v12, v25

    .line 694
    .line 695
    if-eqz v11, :cond_16

    .line 696
    .line 697
    invoke-virtual {v11, v12}, Lcom/android/quickstep/views/FloatingWidgetView;->getAnimatorListener(Z)Lcom/android/launcher3/anim/U;

    .line 698
    .line 699
    .line 700
    move-result-object v15

    .line 701
    goto :goto_11

    .line 702
    :cond_16
    move-object v15, v4

    .line 703
    :goto_11
    invoke-virtual {v2, v15}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->addAnimatorListener(Lcom/android/launcher3/anim/T;)V

    .line 704
    .line 705
    .line 706
    goto :goto_13

    .line 707
    :cond_17
    move/from16 v12, v25

    .line 708
    .line 709
    if-eqz v5, :cond_18

    .line 710
    .line 711
    invoke-virtual {v5, v12}, Lcom/android/launcher3/views/FloatingIconView;->t(Z)Lcom/android/launcher3/anim/U;

    .line 712
    .line 713
    .line 714
    move-result-object v15

    .line 715
    goto :goto_12

    .line 716
    :cond_18
    move-object v15, v4

    .line 717
    :goto_12
    invoke-virtual {v2, v15}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->addAnimatorListener(Lcom/android/launcher3/anim/T;)V

    .line 718
    .line 719
    .line 720
    :goto_13
    new-instance v12, Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 721
    .line 722
    iget-object v15, v0, Lcom/android/launcher3/anim/P;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 723
    .line 724
    invoke-virtual {v15}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 725
    .line 726
    .line 727
    move-result-object v15

    .line 728
    invoke-direct {v12, v15}, Lcom/android/quickstep/util/SurfaceTransactionApplier;-><init>(Landroid/view/View;)V

    .line 729
    .line 730
    .line 731
    new-instance v15, Lcom/android/quickstep/RemoteAnimationTargets;

    .line 732
    .line 733
    move-object/from16 v4, p3

    .line 734
    .line 735
    move-object/from16 v3, p4

    .line 736
    .line 737
    move-object/from16 v18, v5

    .line 738
    .line 739
    const/4 v5, 0x0

    .line 740
    invoke-direct {v15, v14, v4, v3, v5}, Lcom/android/quickstep/RemoteAnimationTargets;-><init>([Lu2/s;[Lu2/s;[Lu2/s;I)V

    .line 741
    .line 742
    .line 743
    invoke-virtual {v15, v12}, Lcom/android/quickstep/RemoteAnimationTargets;->addReleaseCheck(Lcom/android/quickstep/RemoteAnimationTargets$ReleaseCheck;)V

    .line 744
    .line 745
    .line 746
    sget-object v3, Lcom/android/quickstep/utils/AnimationController$AnimationState;->NONE:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 747
    .line 748
    if-ne v13, v3, :cond_19

    .line 749
    .line 750
    invoke-virtual/range {p7 .. p7}, Lcom/android/quickstep/utils/MFVAnimManager;->getAppOpenAnimMergeHelper()Lcom/android/quickstep/utils/DefaultAppOpenAnimMergeHelper;

    .line 751
    .line 752
    .line 753
    move-result-object v3

    .line 754
    invoke-virtual {v3, v15}, Lcom/android/quickstep/utils/DefaultAppOpenAnimMergeHelper;->setAppOpenRemoteTargets(Lcom/android/quickstep/RemoteAnimationTargets;)V

    .line 755
    .line 756
    .line 757
    :cond_19
    new-instance v5, Lcom/android/quickstep/util/animation/RectTransformHelper;

    .line 758
    .line 759
    sget-object v3, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;->OPEN_FROM_HOME:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 760
    .line 761
    invoke-direct {v5, v10, v10, v3}, Lcom/android/quickstep/util/animation/RectTransformHelper;-><init>(Landroid/graphics/RectF;Landroid/graphics/RectF;Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;)V

    .line 762
    .line 763
    .line 764
    move v4, v6

    .line 765
    new-instance v6, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;

    .line 766
    .line 767
    invoke-direct {v6}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;-><init>()V

    .line 768
    .line 769
    .line 770
    if-eqz v21, :cond_1a

    .line 771
    .line 772
    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    .line 773
    .line 774
    .line 775
    move-result v3

    .line 776
    invoke-virtual {v6, v3}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->setOriginWidth(F)V

    .line 777
    .line 778
    .line 779
    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    .line 780
    .line 781
    .line 782
    move-result v3

    .line 783
    invoke-virtual {v6, v3}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->setOriginHeight(F)V

    .line 784
    .line 785
    .line 786
    const/4 v3, 0x1

    .line 787
    invoke-virtual {v5, v6, v1, v9, v3}, Lcom/android/quickstep/util/animation/RectTransformHelper;->getWindowCropStrategy(Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;Landroid/graphics/RectF;IZ)V

    .line 788
    .line 789
    .line 790
    goto :goto_14

    .line 791
    :cond_1a
    invoke-virtual {v8}, Landroid/graphics/RectF;->width()F

    .line 792
    .line 793
    .line 794
    move-result v3

    .line 795
    invoke-virtual {v6, v3}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->setOriginWidth(F)V

    .line 796
    .line 797
    .line 798
    invoke-virtual {v8}, Landroid/graphics/RectF;->height()F

    .line 799
    .line 800
    .line 801
    move-result v3

    .line 802
    invoke-virtual {v6, v3}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->setOriginHeight(F)V

    .line 803
    .line 804
    .line 805
    const/4 v3, 0x0

    .line 806
    invoke-virtual {v5, v6, v8, v9, v3}, Lcom/android/quickstep/util/animation/RectTransformHelper;->getWindowCropStrategy(Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;Landroid/graphics/RectF;IZ)V

    .line 807
    .line 808
    .line 809
    :goto_14
    invoke-virtual {v0}, Lcom/android/launcher3/anim/N;->g()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 810
    .line 811
    .line 812
    move-result-object v3

    .line 813
    if-eqz v3, :cond_1b

    .line 814
    .line 815
    invoke-virtual {v6}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->getIsVerticalClip()Z

    .line 816
    .line 817
    .line 818
    move-result v9

    .line 819
    invoke-virtual {v3, v9}, Lcom/android/quickstep/util/animation/AnimationRecord;->setMIsVerticalClip(Z)V

    .line 820
    .line 821
    .line 822
    invoke-virtual {v6}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->getIsClipFromLeftOrTop()Z

    .line 823
    .line 824
    .line 825
    move-result v9

    .line 826
    invoke-virtual {v3, v9}, Lcom/android/quickstep/util/animation/AnimationRecord;->setMIsClipFromLeftOrTop(Z)V

    .line 827
    .line 828
    .line 829
    :cond_1b
    iget-object v3, v0, Lcom/android/launcher3/anim/P;->g:Lcom/android/launcher3/h0;

    .line 830
    .line 831
    iget-boolean v3, v3, Lcom/android/launcher3/h0;->O0:Z

    .line 832
    .line 833
    if-eqz v3, :cond_1c

    .line 834
    .line 835
    const/4 v3, 0x0

    .line 836
    goto :goto_15

    .line 837
    :cond_1c
    iget-object v3, v0, Lcom/android/launcher3/anim/P;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 838
    .line 839
    invoke-static {v3}, Lcom/android/systemui/shared/system/QuickStepContract;->getWindowCornerRadius(Landroid/content/Context;)F

    .line 840
    .line 841
    .line 842
    move-result v3

    .line 843
    :goto_15
    invoke-direct {v0, v14}, Lcom/android/launcher3/anim/P;->l([Lu2/s;)Z

    .line 844
    .line 845
    .line 846
    if-eqz v21, :cond_1e

    .line 847
    .line 848
    if-eqz v11, :cond_1d

    .line 849
    .line 850
    invoke-virtual {v11}, Lcom/android/quickstep/views/FloatingWidgetView;->getInitialCornerRadius()F

    .line 851
    .line 852
    .line 853
    move-result v9

    .line 854
    goto :goto_17

    .line 855
    :cond_1d
    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    .line 856
    .line 857
    .line 858
    move-result v9

    .line 859
    move-object/from16 v13, v30

    .line 860
    .line 861
    const/4 v10, 0x1

    .line 862
    invoke-virtual {v13, v7, v10}, Lcom/android/launcher3/anim/C;->P(Landroid/view/View;Z)F

    .line 863
    .line 864
    .line 865
    move-result v10

    .line 866
    goto :goto_16

    .line 867
    :cond_1e
    move-object/from16 v13, v30

    .line 868
    .line 869
    const/4 v10, 0x1

    .line 870
    invoke-virtual {v8}, Landroid/graphics/RectF;->width()F

    .line 871
    .line 872
    .line 873
    move-result v9

    .line 874
    invoke-virtual {v13, v7, v10}, Lcom/android/launcher3/anim/C;->P(Landroid/view/View;Z)F

    .line 875
    .line 876
    .line 877
    move-result v10

    .line 878
    :goto_16
    mul-float/2addr v9, v10

    .line 879
    :goto_17
    invoke-virtual {v2, v9}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setStartRadius(F)V

    .line 880
    .line 881
    .line 882
    invoke-virtual {v2, v3}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setEndRadius(F)V

    .line 883
    .line 884
    .line 885
    new-instance v3, Lkotlin/jvm/internal/C;

    .line 886
    .line 887
    invoke-direct {v3}, Lkotlin/jvm/internal/C;-><init>()V

    .line 888
    .line 889
    .line 890
    if-eqz v4, :cond_1f

    .line 891
    .line 892
    invoke-virtual {v6, v12}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->setSurfaceTransactionApplier(Lcom/android/quickstep/util/SurfaceTransactionApplier;)V

    .line 893
    .line 894
    .line 895
    goto :goto_18

    .line 896
    :cond_1f
    invoke-virtual {v6, v12}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->setSurfaceTransactionApplier(Lcom/android/quickstep/util/SurfaceTransactionApplier;)V

    .line 897
    .line 898
    .line 899
    :goto_18
    new-instance v3, Landroid/graphics/RectF;

    .line 900
    .line 901
    invoke-direct {v3}, Landroid/graphics/RectF;-><init>()V

    .line 902
    .line 903
    .line 904
    move-object v9, v12

    .line 905
    move v12, v4

    .line 906
    new-instance v4, Lcom/android/quickstep/utils/CreateTransactionHelper;

    .line 907
    .line 908
    invoke-direct {v4}, Lcom/android/quickstep/utils/CreateTransactionHelper;-><init>()V

    .line 909
    .line 910
    .line 911
    new-instance v10, Lcom/android/launcher3/anim/S;

    .line 912
    .line 913
    invoke-direct {v10}, Lcom/android/launcher3/anim/S;-><init>()V

    .line 914
    .line 915
    .line 916
    move-object/from16 v17, v11

    .line 917
    .line 918
    new-instance v11, Landroid/graphics/RectF;

    .line 919
    .line 920
    iget-object v10, v0, Lcom/android/launcher3/anim/P;->g:Lcom/android/launcher3/h0;

    .line 921
    .line 922
    iget v13, v10, Lcom/android/launcher3/h0;->T0:I

    .line 923
    .line 924
    int-to-float v13, v13

    .line 925
    iget v10, v10, Lcom/android/launcher3/h0;->U0:I

    .line 926
    .line 927
    int-to-float v10, v10

    .line 928
    const/4 v0, 0x0

    .line 929
    invoke-direct {v11, v0, v0, v13, v10}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 930
    .line 931
    .line 932
    if-eqz p9, :cond_20

    .line 933
    .line 934
    invoke-virtual/range {p9 .. p9}, Lcom/android/launcher3/M2$a;->r2()Lu2/s$a;

    .line 935
    .line 936
    .line 937
    move-result-object v0

    .line 938
    :goto_19
    move-object/from16 v10, v28

    .line 939
    .line 940
    goto :goto_1a

    .line 941
    :cond_20
    const/4 v0, 0x0

    .line 942
    goto :goto_19

    .line 943
    :goto_1a
    invoke-virtual {v2, v0, v5, v10, v6}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->initFirstFrameForBreakScene(Lu2/s$a;Lcom/android/quickstep/util/animation/RectTransformHelper;Landroid/graphics/Matrix;Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;)V

    .line 944
    .line 945
    .line 946
    if-eqz v21, :cond_21

    .line 947
    .line 948
    move-object v8, v1

    .line 949
    :cond_21
    new-instance v0, Lcom/android/launcher3/anim/P$f;

    .line 950
    .line 951
    move-object v1, v9

    .line 952
    const/4 v9, 0x0

    .line 953
    move-object/from16 v13, p9

    .line 954
    .line 955
    move-object/from16 v19, v1

    .line 956
    .line 957
    move-object/from16 v33, v2

    .line 958
    .line 959
    move-object v2, v10

    .line 960
    move-object/from16 v20, v15

    .line 961
    .line 962
    move/from16 v16, v21

    .line 963
    .line 964
    move-object/from16 v15, v26

    .line 965
    .line 966
    move-object/from16 v10, v32

    .line 967
    .line 968
    move-object/from16 v1, p0

    .line 969
    .line 970
    invoke-direct/range {v0 .. v18}, Lcom/android/launcher3/anim/P$f;-><init>(Lcom/android/launcher3/anim/P;Landroid/graphics/Matrix;Landroid/graphics/RectF;Lcom/android/quickstep/utils/CreateTransactionHelper;Lcom/android/quickstep/util/animation/RectTransformHelper;Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;Landroid/view/View;Landroid/graphics/RectF;Landroid/view/View;Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;Landroid/graphics/RectF;ZLcom/android/launcher3/M2$a;[Lu2/s;Landroid/graphics/RectF;ZLcom/android/quickstep/views/FloatingWidgetView;Lcom/android/launcher3/views/FloatingIconView;)V

    .line 971
    .line 972
    .line 973
    move-object v6, v1

    .line 974
    move-object v1, v0

    .line 975
    move-object v0, v6

    .line 976
    move v6, v12

    .line 977
    move-object/from16 v7, v33

    .line 978
    .line 979
    invoke-virtual {v7, v1}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->addOnUpdateListener(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$OnAnimUpdateListener;)V

    .line 980
    .line 981
    .line 982
    new-instance v6, Lcom/android/launcher3/anim/P$g;

    .line 983
    .line 984
    invoke-direct {v6, v0}, Lcom/android/launcher3/anim/P$g;-><init>(Lcom/android/launcher3/anim/P;)V

    .line 985
    .line 986
    .line 987
    const/4 v5, 0x0

    .line 988
    move-object/from16 v1, p2

    .line 989
    .line 990
    move v4, v12

    .line 991
    move-object/from16 v2, v19

    .line 992
    .line 993
    move-object/from16 v3, v20

    .line 994
    .line 995
    invoke-virtual/range {v0 .. v6}, Lcom/android/launcher3/anim/N;->h([Lu2/s;Lcom/android/quickstep/util/SurfaceTransactionApplier;Lcom/android/quickstep/RemoteAnimationTargets;ZLu4/a;Lu4/a;)Lcom/android/launcher3/anim/U;

    .line 996
    .line 997
    .line 998
    move-result-object v1

    .line 999
    invoke-virtual {v7, v1}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->addAnimatorListener(Lcom/android/launcher3/anim/T;)V

    .line 1000
    .line 1001
    .line 1002
    move-object/from16 v8, p8

    .line 1003
    .line 1004
    invoke-virtual {v8, v7}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->play(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V

    .line 1005
    .line 1006
    .line 1007
    iput-object v7, v0, Lcom/android/launcher3/anim/P;->f:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 1008
    .line 1009
    new-instance v1, Lcom/android/launcher3/anim/P$h;

    .line 1010
    .line 1011
    invoke-direct {v1, v0}, Lcom/android/launcher3/anim/P$h;-><init>(Lcom/android/launcher3/anim/P;)V

    .line 1012
    .line 1013
    .line 1014
    invoke-virtual {v8, v1}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->addListener(Lcom/android/launcher3/anim/T;)V

    .line 1015
    .line 1016
    .line 1017
    return-void
.end method
